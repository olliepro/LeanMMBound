module

public import FKLBridge.IndexTable
public import SplitData
public import GibbsData

/-! Dense packed row tables and their generic soundness lemmas.

Layout. Rows are grouped eight to a chunk; chunk `k` of a tree holds rows `8k … 8k+7`.
Inside a chunk `d`:
* bits `[0,16)`: the stride `st` (lanes reserved per row);
* bits `[16, 16+64m)`: `m` metadata fields of 8 bits per row (row `s`, field `f` is 8-bit lane `m*s+f`);
* the body (from bit `16+64m`): row `s` occupies lanes `[st*s, st*s+st)` of width `L`.

Kernel checks walk an original row list once, in lockstep with the explicit list of the part's chunk
constants (no tree descent per row), and separately compare each listed chunk with the tree. -/

@[expose] public section

namespace FKLBridge.Rows

open MatrixBounds.Numeric
open scoped BigOperators

/-! ### Layout accessors -/

/-- Lanes reserved per row in a chunk. -/
def stride (d : ℕ) : ℕ := Nat.land d 65535

/-- Metadata field `f` of row slot `s` (8-bit lanes, `m` fields per row). -/
def metaAt (d m s f : ℕ) : ℕ := FKL.lane (Nat.shiftRight d 16) 8 (Nat.add (Nat.mul m s) f)

/-- The packed row body of a chunk with `m` metadata fields per row. -/
def bodyOf (d m : ℕ) : ℕ := Nat.shiftRight d (Nat.add 16 (Nat.mul 64 m))

/-- Lane `c` (width `L`) of row slot `s`. -/
def cellAt (d m L s c : ℕ) : ℕ := FKL.lane (bodyOf d m) L (Nat.add (Nat.mul (stride d) s) c)

/-- The whole packed region of row slot `s`. -/
def regionAt (d m L s : ℕ) : ℕ := FKL.lane (bodyOf d m) (Nat.mul L (stride d)) s

theorem cellAt_eq_lane_region (d m L s c : ℕ) (hc : c < stride d) :
    cellAt d m L s c = FKL.lane (regionAt d m L s) L c := by
  unfold cellAt regionAt
  rw [FKL.raw_add, FKL.raw_mul, FKL.raw_mul]
  exact (lane_lane _ _ _ _ _ hc).symm
where
  lane_lane (B L st s c : ℕ) (hc : c < st) :
      FKL.lane (FKL.lane B (L * st) s) L c = FKL.lane B L (st * s + c) := by
    rw [FKL.lane_eq, FKL.lane_eq, FKL.lane_eq]
    have hle : L * c + L ≤ L * st := by
      have := Nat.mul_le_mul_left L (show c + 1 ≤ st by omega)
      rw [Nat.mul_add, Nat.mul_one] at this; exact this
    have h1 : 2 ^ (L * st) = 2 ^ (L * c) * 2 ^ (L * st - L * c) := by
      rw [← pow_add]; congr 1; omega
    rw [h1, Nat.mod_mul_right_div_self, Nat.div_div_eq_div_mul, ← pow_add,
      Nat.mod_mod_of_dvd _ (pow_dvd_pow 2 (show L ≤ L * st - L * c by omega))]
    rw [show L * (st * s + c) = L * st * s + L * c by ring]

/-! ### Digit sums -/

/-- Lane `c` of a digit sum with digits below `2^L` is digit `c`. -/
theorem lane_sum (L : ℕ) : ∀ (W : ℕ) (a : ℕ → ℕ), (∀ j, a j < 2 ^ L) → ∀ c < W,
    FKL.lane (∑ j ∈ Finset.range W, a j * 2 ^ (L * j)) L c = a c := by
  intro W
  induction W with
  | zero => intro a _ c hc; omega
  | succ W ih =>
    intro a ha c hc
    rw [Finset.sum_range_succ']
    have shift : ∑ j ∈ Finset.range W, a (j + 1) * 2 ^ (L * (j + 1)) =
        2 ^ L * ∑ j ∈ Finset.range W, a (j + 1) * 2 ^ (L * j) := by
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j _
      rw [Nat.mul_add, Nat.mul_one, pow_add]
      ring
    rw [shift, Nat.mul_zero, pow_zero, Nat.mul_one]
    have hpos : 0 < 2 ^ L := Nat.two_pow_pos L
    rcases c with _ | c
    · rw [FKL.lane_eq, Nat.mul_zero, pow_zero, Nat.div_one, Nat.mul_add_mod, Nat.mod_eq_of_lt (ha 0)]
    · have := ih (fun j => a (j + 1)) (fun j => ha _) c (by omega)
      rw [FKL.lane_eq] at this ⊢
      rw [Nat.mul_add, Nat.mul_one, pow_add, Nat.mul_comm (2 ^ (L * c)), ← Nat.div_div_eq_div_mul,
        Nat.mul_add_div hpos, Nat.div_eq_of_lt (ha 0), Nat.add_zero]
      exact this

/-! ### Sparse scatter -/

/-- Raw scatter of sparse `(column, value)` entries into lanes of width `L`. -/
def scatter (L : ℕ) (es : List (ℕ × ℕ)) : ℕ :=
  List.rec (motive := fun _ => ℕ) 0 (fun e _ acc => Nat.add (Nat.shiftLeft e.2 (Nat.mul L e.1)) acc) es

theorem scatter_eq (L W : ℕ) : ∀ (es : List (ℕ × ℕ)), (∀ e ∈ es, e.1 < W) →
    scatter L es = ∑ j ∈ Finset.range W, (es.map (fun entry => if entry.1 = j then entry.2 else 0)).sum * 2 ^ (L * j) := by
  intro es
  induction es with
  | nil => intro _; simp [scatter]
  | cons e es ih =>
    intro h
    have he : e.1 < W := h e List.mem_cons_self
    have hrest := ih (fun x hx => h x (List.mem_cons_of_mem _ hx))
    change Nat.add (Nat.shiftLeft e.2 (Nat.mul L e.1)) (scatter L es) = _
    rw [hrest, FKL.raw_add, FKL.raw_shiftLeft, FKL.raw_mul, Nat.shiftLeft_eq]
    simp only [List.map_cons, List.sum_cons, add_mul, Finset.sum_add_distrib]
    congr 1
    simp only [ite_mul, zero_mul]
    rw [Finset.sum_ite_eq (Finset.range W) e.1 (fun j => e.2 * 2 ^ (L * j))]
    simp [Finset.mem_range.mpr he]

theorem atColumn_le_mass (row : DyadicRow) (c : ℕ) : row.atColumn c ≤ row.mass := by
  rcases row with ⟨w, es⟩
  simp only [DyadicRow.atColumn, DyadicRow.mass]
  induction es with
  | nil => simp
  | cons e es ih =>
    simp only [List.map_cons, List.sum_cons]
    split_ifs <;> omega

/-! ### One-digit shifts -/

theorem stride_lt (d : ℕ) : stride d < 65536 := by
  unfold stride
  rw [FKL.raw_land, show (65535 : ℕ) = 2 ^ 16 - 1 by rfl, Nat.and_two_pow_sub_one_eq_mod]
  exact Nat.mod_lt _ (by norm_num)

theorem lane_cons_zero (L x S : ℕ) (hx : x < 2 ^ L) : FKL.lane (x + S * 2 ^ L) L 0 = x := by
  rw [FKL.lane_eq, Nat.mul_zero, pow_zero, Nat.div_one, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hx]

theorem lane_cons_succ (L x S : ℕ) (hx : x < 2 ^ L) (c : ℕ) :
    FKL.lane (x + S * 2 ^ L) L (c + 1) = FKL.lane S L c := by
  rw [FKL.lane_eq, FKL.lane_eq, Nat.mul_add, Nat.mul_one, Nat.add_comm (L * c) L, pow_add,
    ← Nat.div_div_eq_div_mul]
  congr 2
  rw [Nat.add_mul_div_right _ _ (Nat.two_pow_pos L), Nat.div_eq_of_lt hx, Nat.zero_add]

theorem raw_cons (L x S : ℕ) : Nat.add x (Nat.shiftLeft S L) = x + S * 2 ^ L := by
  rw [FKL.raw_add, FKL.raw_shiftLeft, Nat.shiftLeft_eq]

/-! ### Dyadic rows: region lanes `[width, column 0, column 1, …]` (48 bits, no metadata header) -/

/-- Lane `c` of the scatter of an accepted row is its numerator at column `c`. -/
theorem lane_scatter (row : DyadicRow) (hchk : row.check 17592186044416 = true) (c : ℕ) (hc : c < row.width) :
    FKL.lane (scatter 48 row.entries) 48 c = row.atColumn c := by
  obtain ⟨hsupp, hmass⟩ := DyadicRow.check_sound hchk
  rw [scatter_eq 48 row.width row.entries hsupp]
  exact lane_sum 48 row.width (fun j => row.atColumn j)
    (fun j => lt_of_le_of_lt ((atColumn_le_mass row j).trans hmass.le) (by norm_num)) c hc

/-- Executable dyadic row test. -/
def dyOk (d s : ℕ) (row : DyadicRow) : Bool :=
  Bool.and (Nat.beq (regionAt d 0 48 s) (Nat.add row.width (Nat.shiftLeft (scatter 48 row.entries) 48)))
    (Nat.blt row.width (stride d))

theorem dyOk_sound (d s : ℕ) (row : DyadicRow) (hchk : row.check 17592186044416 = true)
    (hok : dyOk d s row = true) :
    cellAt d 0 48 s 0 = row.width ∧ ∀ c < row.width, cellAt d 0 48 s (Nat.add c 1) = row.atColumn c := by
  simp only [dyOk, Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq] at hok
  obtain ⟨hreg, hw⟩ := hok
  have hw16 : row.width < 2 ^ 48 := lt_of_lt_of_le (hw.trans (stride_lt d)) (by norm_num)
  rw [raw_cons] at hreg
  refine ⟨?_, fun c hc => ?_⟩
  · rw [cellAt_eq_lane_region d 0 48 s 0 (by omega), hreg, lane_cons_zero 48 _ _ hw16]
  · rw [FKL.raw_add, cellAt_eq_lane_region d 0 48 s _ (by omega), hreg, lane_cons_succ 48 _ _ hw16,
      lane_scatter row hchk c hc]

/-! ### Split rows: region lanes `[parent.x, parent.y, parent.z, childTotal, width, column 0, …]` -/

/-- Executable split row test. -/
def splitOk (d s : ℕ) (row : SplitRow) : Bool :=
  Bool.and (Nat.beq (regionAt d 0 48 s)
      (Nat.add row.parent.x (Nat.shiftLeft (Nat.add row.parent.y (Nat.shiftLeft (Nat.add row.parent.z
        (Nat.shiftLeft (Nat.add row.childTotal (Nat.shiftLeft (Nat.add row.row.width
          (Nat.shiftLeft (scatter 48 row.row.entries) 48)) 48)) 48)) 48)) 48)))
    (Bool.and (Nat.blt (Nat.add (Nat.add row.parent.x row.parent.y) (Nat.add row.parent.z row.childTotal)) 65536)
      (Nat.blt (Nat.add row.row.width 4) (stride d)))

theorem splitOk_sound (d s : ℕ) (row : SplitRow) (hchk : row.check 17592186044416 = true)
    (hok : splitOk d s row = true) :
    cellAt d 0 48 s 0 = row.parent.x ∧ cellAt d 0 48 s 1 = row.parent.y ∧ cellAt d 0 48 s 2 = row.parent.z ∧
      cellAt d 0 48 s 3 = row.childTotal ∧ cellAt d 0 48 s 4 = row.row.width ∧
      ∀ c < row.row.width, cellAt d 0 48 s (Nat.add c 5) = row.row.atColumn c := by
  simp only [splitOk, Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq] at hok
  obtain ⟨hreg, hb, hw⟩ := hok
  simp only [raw_cons] at hreg
  simp only [FKL.raw_add] at hb hw
  have hst := stride_lt d
  have b48 : ∀ x, x < 65536 → x < 2 ^ 48 := fun x hx => lt_of_lt_of_le hx (by norm_num)
  have hx := b48 row.parent.x (by omega)
  have hy := b48 row.parent.y (by omega)
  have hz := b48 row.parent.z (by omega)
  have ht := b48 row.childTotal (by omega)
  have hwb := b48 row.row.width (by omega)
  have reg : ∀ c, c < stride d → cellAt d 0 48 s c = FKL.lane (regionAt d 0 48 s) 48 c :=
    fun c hc => cellAt_eq_lane_region d 0 48 s c hc
  refine ⟨?_, ?_, ?_, ?_, ?_, fun c hc => ?_⟩
  · rw [reg 0 (by omega), hreg, lane_cons_zero 48 _ _ hx]
  · rw [reg 1 (by omega), hreg, lane_cons_succ 48 _ _ hx, lane_cons_zero 48 _ _ hy]
  · rw [reg 2 (by omega), hreg, lane_cons_succ 48 _ _ hx, lane_cons_succ 48 _ _ hy, lane_cons_zero 48 _ _ hz]
  · rw [reg 3 (by omega), hreg, lane_cons_succ 48 _ _ hx, lane_cons_succ 48 _ _ hy, lane_cons_succ 48 _ _ hz,
      lane_cons_zero 48 _ _ ht]
  · rw [reg 4 (by omega), hreg, lane_cons_succ 48 _ _ hx, lane_cons_succ 48 _ _ hy, lane_cons_succ 48 _ _ hz,
      lane_cons_succ 48 _ _ ht, lane_cons_zero 48 _ _ hwb]
  · rw [FKL.raw_add, reg _ (by omega), hreg, show c + 5 = c + 1 + 1 + 1 + 1 + 1 by omega,
      lane_cons_succ 48 _ _ hx, lane_cons_succ 48 _ _ hy, lane_cons_succ 48 _ _ hz, lane_cons_succ 48 _ _ ht,
      lane_cons_succ 48 _ _ hwb, lane_scatter row.row (SplitRow.check_sound hchk).1 c hc]

/-! ### Gibbs rows: metadata field `length`, region lanes `[num 0, exp 0, num 1, exp 1, …]` (64 bits) -/

/-- Raw length of a list. -/
def lenR {α : Type} (l : List α) : ℕ := List.rec (motive := fun _ => ℕ) 0 (fun _ _ n => Nat.succ n) l

theorem lenR_eq {α : Type} (l : List α) : lenR l = l.length := by
  induction l with
  | nil => rfl
  | cons x xs ih => change Nat.succ (lenR xs) = _; rw [ih]; rfl

/-- Interleaved numerators and exponents. -/
def flatG (es : List BinaryRational) : List ℕ :=
  List.rec (motive := fun _ => List ℕ) [] (fun e _ acc => e.numerator :: e.denominatorPower :: acc) es

theorem flatG_length (es : List BinaryRational) : (flatG es).length = 2 * es.length := by
  induction es with
  | nil => rfl
  | cons e es ih =>
    change (e.numerator :: e.denominatorPower :: flatG es).length = _
    simp only [List.length_cons, ih]; ring

theorem flatG_get (es : List BinaryRational) : ∀ i (hi : i < es.length),
    (flatG es)[2 * i]? = some es[i].numerator ∧ (flatG es)[2 * i + 1]? = some es[i].denominatorPower := by
  induction es with
  | nil => intro i hi; simp at hi
  | cons e es ih =>
    intro i hi
    have hf : flatG (e :: es) = e.numerator :: e.denominatorPower :: flatG es := rfl
    rw [hf]
    rcases i with _ | i
    · exact ⟨rfl, rfl⟩
    · have := ih i (by simpa using hi)
      rw [show 2 * (i + 1) = 2 * i + 1 + 1 by ring]
      simp only [List.getElem?_cons_succ]
      exact this

/-- The packed interleaved row, in one raw fold. -/
def gibbsV (es : List BinaryRational) : ℕ :=
  List.rec (motive := fun _ => ℕ) 0
    (fun e _ acc => Nat.add e.numerator (Nat.shiftLeft (Nat.add e.denominatorPower (Nat.shiftLeft acc 64)) 64)) es

theorem gibbsV_eq (es : List BinaryRational) : gibbsV es = FKL.pack 64 (flatG es) := by
  induction es with
  | nil => rfl
  | cons e es ih =>
    change Nat.add e.numerator (Nat.shiftLeft (Nat.add e.denominatorPower (Nat.shiftLeft (gibbsV es) 64)) 64) =
      FKL.pack 64 (e.numerator :: e.denominatorPower :: flatG es)
    rw [raw_cons, raw_cons, ih]
    rfl

/-- Plain sum of all fields; below `2^64` it bounds every field. -/
def sumF (es : List BinaryRational) : ℕ :=
  List.rec (motive := fun _ => ℕ) 0 (fun e _ acc => Nat.add (Nat.add e.numerator e.denominatorPower) acc) es

theorem sumF_bound (es : List BinaryRational) (h : sumF es < 2 ^ 64) : ∀ x ∈ flatG es, x < 2 ^ 64 := by
  induction es with
  | nil => simp [flatG]
  | cons e es ih =>
    change Nat.add (Nat.add e.numerator e.denominatorPower) (sumF es) < 2 ^ 64 at h
    simp only [FKL.raw_add] at h
    intro x hx
    change x ∈ e.numerator :: e.denominatorPower :: flatG es at hx
    rcases List.mem_cons.mp hx with rfl | hx
    · omega
    rcases List.mem_cons.mp hx with rfl | hx
    · omega
    · exact ih (by omega) x hx

/-- Executable Gibbs row test. -/
def gibbsOk (d s : ℕ) (row : GibbsRow) : Bool :=
  Bool.and (Nat.beq (regionAt d 1 64 s) (gibbsV row.entries))
    (Bool.and (Nat.blt (sumF row.entries) 18446744073709551616)
      (Bool.and (Nat.beq (lenR row.entries) (metaAt d 1 s 0)) (Nat.ble (Nat.mul 2 (metaAt d 1 s 0)) (stride d))))

theorem metaAt_lt (d m s f : ℕ) : metaAt d m s f < 256 := by
  unfold metaAt; rw [FKL.lane_eq]; exact Nat.mod_lt _ (by norm_num)

theorem gibbsOk_sound (d s : ℕ) (row : GibbsRow) (hok : gibbsOk d s row = true) :
    metaAt d 1 s 0 = row.entries.length ∧ ∀ i (hi : i < row.entries.length),
      cellAt d 1 64 s (2 * i) = row.entries[i].numerator ∧
      cellAt d 1 64 s (2 * i + 1) = row.entries[i].denominatorPower := by
  simp only [gibbsOk, Bool.and_eq_true, Nat.beq_eq, Nat.ble_eq, Nat.blt_eq, FKL.raw_mul] at hok
  obtain ⟨hreg, hsum, hlen, hw⟩ := hok
  have hfit := sumF_bound row.entries (lt_of_lt_of_le hsum (by norm_num))
  have hlen' : metaAt d 1 s 0 = row.entries.length := by rw [← hlen, lenR_eq]
  refine ⟨hlen', fun i hi => ?_⟩
  have hfl := flatG_length row.entries
  obtain ⟨h0, h1⟩ := flatG_get row.entries i hi
  obtain ⟨_, h0'⟩ := List.getElem?_eq_some_iff.mp h0
  obtain ⟨_, h1'⟩ := List.getElem?_eq_some_iff.mp h1
  rw [gibbsV_eq] at hreg
  rw [cellAt_eq_lane_region d 1 64 s _ (by omega), cellAt_eq_lane_region d 1 64 s _ (by omega), hreg,
    FKL.lane_pack 64 _ hfit _ (by omega), FKL.lane_pack 64 _ hfit _ (by omega)]
  exact ⟨h0', h1'⟩

/-! ### Walking a part in lockstep with its chunks -/

/-- Head of a chunk list (`0` if empty). -/
def headD (cs : List ℕ) : ℕ := List.rec (motive := fun _ => ℕ) 0 (fun h _ _ => h) cs

/-- Tail of a chunk list. -/
def tailL (cs : List ℕ) : List ℕ := List.rec (motive := fun _ => List ℕ) [] (fun _ t _ => t) cs

/-- Nonempty test. -/
def consB (cs : List ℕ) : Bool := List.rec (motive := fun _ => Bool) false (fun _ _ _ => true) cs

/-- Check every row against slot `s` of the current chunk, advancing to the next chunk after slot 7,
and check the total row count `cnt`. -/
def rowsOk {α : Type} (ok : ℕ → ℕ → α → Bool) (rows : List α) : List ℕ → ℕ → ℕ → ℕ → Bool :=
  List.rec (motive := fun _ => List ℕ → ℕ → ℕ → ℕ → Bool) (fun _ _ n cnt => Nat.beq n cnt)
    (fun row _ rec cs s n cnt =>
      Bool.and (Bool.and (consB cs) (ok (headD cs) s row))
        (rec (cond (Nat.beq s 7) (tailL cs) cs) (cond (Nat.beq s 7) 0 (Nat.succ s)) (Nat.succ n) cnt)) rows

theorem rowsOk_sound {α : Type} (ok : ℕ → ℕ → α → Bool) : ∀ (rows : List α) (cs : List ℕ) (s n cnt : ℕ),
    s < 8 → rowsOk ok rows cs s n cnt = true →
    n + rows.length = cnt ∧ ∀ j (hj : j < rows.length),
      (s + j) / 8 < cs.length ∧ ok (cs.getD ((s + j) / 8) 0) ((s + j) % 8) rows[j] = true := by
  intro rows
  induction rows with
  | nil =>
    intro cs s n cnt _ h
    simp only [rowsOk, Nat.beq_eq] at h
    exact ⟨by simpa using h, fun j hj => absurd hj (Nat.not_lt_zero _)⟩
  | cons row rest ih =>
    intro cs s n cnt hs h
    change Bool.and (Bool.and (consB cs) (ok (headD cs) s row))
      (rowsOk ok rest (cond (Nat.beq s 7) (tailL cs) cs) (cond (Nat.beq s 7) 0 (Nat.succ s)) (Nat.succ n) cnt) = true at h
    simp only [Bool.and_eq_true] at h
    obtain ⟨⟨hcons, hrow⟩, hrest⟩ := h
    rcases cs with _ | ⟨c0, ct⟩
    · simp [consB] at hcons
    have hhead : headD (c0 :: ct) = c0 := rfl
    have htail : tailL (c0 :: ct) = ct := rfl
    rw [hhead] at hrow
    by_cases h7 : s = 7
    · subst h7
      have e1 : Nat.beq 7 7 = true := rfl
      rw [e1, Bool.cond_true, Bool.cond_true, htail] at hrest
      obtain ⟨hlen, hall⟩ := ih ct 0 (Nat.succ n) cnt (by omega) hrest
      refine ⟨by simp only [List.length_cons]; omega, fun j hj => ?_⟩
      rcases j with _ | j
      · exact ⟨by simp, by simpa using hrow⟩
      · have := hall j (by simpa using hj)
        have hd : (7 + (j + 1)) / 8 = j / 8 + 1 := by omega
        have hm : (7 + (j + 1)) % 8 = j % 8 := by omega
        rw [hd, hm]
        simp only [Nat.zero_add] at this
        refine ⟨by simp only [List.length_cons]; omega, ?_⟩
        simpa using this.2
    · have e1 : Nat.beq s 7 = false := by
        rw [Bool.eq_false_iff]; intro hb; exact h7 (Nat.eq_of_beq_eq_true hb)
      rw [e1, Bool.cond_false, Bool.cond_false] at hrest
      obtain ⟨hlen, hall⟩ := ih (c0 :: ct) (Nat.succ s) (Nat.succ n) cnt (by omega) hrest
      refine ⟨by simp only [List.length_cons]; omega, fun j hj => ?_⟩
      rcases j with _ | j
      · refine ⟨?_, ?_⟩
        · simp only [List.length_cons]; omega
        · have hd : (s + 0) / 8 = 0 := by omega
          have hm : (s + 0) % 8 = s := by omega
          rw [hd, hm]; simpa using hrow
      · have := hall j (by simpa using hj)
        have e2 : Nat.succ s + j = s + (j + 1) := by omega
        rw [e2] at this
        simpa using this

/-- Compare listed chunk constants with tree chunks `b, b+1, …`. -/
noncomputable def chunksMatch (t : FKL.Tree) (cs : List ℕ) : ℕ → Bool :=
  List.rec (motive := fun _ => ℕ → Bool) (fun _ => true)
    (fun c _ rec i => Bool.and (Nat.beq (t.get i) c) (rec (Nat.succ i))) cs

theorem chunksMatch_sound (t : FKL.Tree) : ∀ (cs : List ℕ) (b : ℕ), chunksMatch t cs b = true →
    ∀ i < cs.length, t.get (b + i) = cs.getD i 0 := by
  intro cs
  induction cs with
  | nil => intro b _ i hi; simp at hi
  | cons c cs ih =>
    intro b h i hi
    change Bool.and (Nat.beq (t.get b) c) (chunksMatch t cs (Nat.succ b)) = true at h
    simp only [Bool.and_eq_true, Nat.beq_eq] at h
    rcases i with _ | i
    · simpa using h.1
    · have := ih (Nat.succ b) h.2 i (by simpa using hi)
      rw [show b + (i + 1) = Nat.succ b + i by omega, this]
      simp

/-- The part check: listed chunks are the tree's chunks `b …`, and the rows match them in order. -/
noncomputable def partOk {α : Type} (t : FKL.Tree) (ok : ℕ → ℕ → α → Bool) (rows : List α) (cs : List ℕ)
    (b cnt : ℕ) : Bool :=
  Bool.and (chunksMatch t cs b) (rowsOk ok rows cs 0 0 cnt)

theorem partOk_sound {α : Type} (t : FKL.Tree) (ok : ℕ → ℕ → α → Bool) (rows : List α) (cs : List ℕ)
    (b cnt R : ℕ) (hR : 8 * b = R) (h : partOk t ok rows cs b cnt = true) :
    rows.length = cnt ∧ ∀ j (hj : j < rows.length),
      ok (t.get (Nat.shiftRight (R + j) 3)) (Nat.land (R + j) 7) rows[j] = true := by
  subst hR
  simp only [partOk, Bool.and_eq_true] at h
  obtain ⟨hm, hr⟩ := h
  obtain ⟨hlen, hall⟩ := rowsOk_sound ok rows cs 0 0 cnt (by omega) hr
  refine ⟨by omega, fun j hj => ?_⟩
  obtain ⟨hlt, hok⟩ := hall j hj
  have hsh : Nat.shiftRight (8 * b + j) 3 = b + j / 8 := by
    rw [FKL.raw_shiftRight, Nat.shiftRight_eq_div_pow]; omega
  have hland : Nat.land (8 * b + j) 7 = j % 8 := by
    rw [FKL.raw_land, show (7 : ℕ) = 2 ^ 3 - 1 by rfl, Nat.and_two_pow_sub_one_eq_mod]; omega
  rw [hsh, hland, chunksMatch_sound t cs b hm (j / 8) (by simpa using hlt)]
  simpa using hok

/-- Equal in-range indices select equal list entries. -/
theorem getElem_idx {α : Type} (l : List α) (a b : ℕ) (ha : a < l.length) (hb : b < l.length) (h : a = b) :
    l[a] = l[b] := by
  subst h; rfl

/-! ### Cheap index arithmetic for the dispatch lemmas (proved once, instantiated with literals) -/

theorem divmod_of_range (i S k O E : ℕ) (hO : O = k * S) (hlo : ¬ i < O) (hhi : i < E) (hE : E ≤ O + S) :
    i / S = k ∧ i % S = i - O := by
  have hS : 0 < S := by omega
  have h2 : S * k = O := by rw [hO, Nat.mul_comm]
  have hi : i = (i - O) + S * k := by omega
  have hlt : i - O < S := by omega
  constructor
  · conv_lhs => rw [hi]
    rw [Nat.add_mul_div_left _ _ hS, Nat.div_eq_of_lt hlt, Nat.zero_add]
  · conv_lhs => rw [hi]
    rw [Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hlt]

theorem divmod_part (j S k Og R : ℕ) (hR : R = Og + k * S) (hj : j < S) :
    (R + j - Og) / S = k ∧ (R + j - Og) % S = j := by
  have h2 : S * k = k * S := Nat.mul_comm S k
  have e : R + j - Og = j + S * k := by omega
  have hS : 0 < S := by omega
  rw [e]
  exact ⟨by rw [Nat.add_mul_div_left _ _ hS, Nat.div_eq_of_lt hj, Nat.zero_add],
    by rw [Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hj]⟩

theorem sub_lt_of_part (R j cnt Og NG : ℕ) (hc : j < cnt) (hle : R + cnt ≤ Og + NG) (hge : Og ≤ R) :
    R + j - Og < NG := by omega

theorem lt_of_part (R j cnt B : ℕ) (hc : j < cnt) (hle : R + cnt ≤ B) : R + j < B := by omega

theorem not_lt_of_part (R j B : ℕ) (hge : B ≤ R) : ¬ (R + j < B) := by omega

theorem not_lt_sub_of_part (R j Og b : ℕ) (hge : b + Og ≤ R) : ¬ (R + j - Og < b) := by omega

theorem lt_sub_of_part (R j cnt Og b : ℕ) (hc : j < cnt) (hle : R + cnt ≤ b + Og) (hge : Og ≤ R) :
    R + j - Og < b := by omega

theorem sub_sub_part (R j Og O : ℕ) (hR : R = Og + O) : R + j - Og - O = j := by omega

/-- An accepted list entry is the list's optional entry at its index (no unfolding of the list). -/
theorem cle {A : Type} (check : A → Bool) (rows : List A) (acc : rows.all check = true) (idx : Fin rows.length) :
    some (checkedListEntry check rows acc idx).val = rows[idx.val]? :=
  (List.getElem?_eq_getElem idx.isLt).symm

theorem idx_lt_len {α : Type} (rows : List α) (cnt i O b : ℕ) (L : rows.length = cnt) (hk : i < b)
    (hb : b ≤ O + cnt) (hob : O < b) : i - O < rows.length := by omega

/-- The value of a dependent `if` on its positive branch, read off without instantiating that branch:
`ht` is closed by `rfl`, a definitional check, so the branch's internal proofs are never re-checked. -/
theorem dite_val {α : Type} {P : α → Prop} {c : Prop} {inst : Decidable c} {t : c → {r // P r}} {e : ¬c → {r // P r}}
    (v : α) (hv : (@dite _ c inst t e).val = v) (hc : c) (rows : List α) (x : ℕ) (q : x < rows.length)
    (ht : ∀ h, (t h).val = rows[x]'q) : some v = rows[x]? := by
  rw [dif_pos hc] at hv
  rw [← hv, ht hc]
  exact (List.getElem?_eq_getElem q).symm

/-- The same on the final (unconditional) branch. -/
theorem last_val {α : Type} {P : α → Prop} {u : {r // P r}} (v : α) (hv : u.val = v) (rows : List α) (x : ℕ)
    (q : x < rows.length) (ht : u.val = rows[x]'q) : some v = rows[x]? := by
  rw [← hv, ht]
  exact (List.getElem?_eq_getElem q).symm

/-- Ranges compose: a property of `[0,a)` and of `[a,a+b)` gives one of `[0,c)` for `c = a+b`. -/
theorem range_step {P : ℕ → Prop} (a b c : ℕ) (hc : a + b = c) (h1 : ∀ r < a, P r)
    (h2 : ∀ j < b, P (a + j)) : ∀ r < c, P r := by
  intro r hr
  by_cases h : r < a
  · exact h1 r h
  · have := h2 (r - a) (by omega)
    rwa [show a + (r - a) = r by omega] at this

theorem range_zero {P : ℕ → Prop} : ∀ r < 0, P r := fun r hr => absurd hr (Nat.not_lt_zero r)

end FKLBridge.Rows
