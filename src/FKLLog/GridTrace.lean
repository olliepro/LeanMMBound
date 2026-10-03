module

public import FKLLog.Basic
public import ScaledLogTrace

/-! Nat-only kernel checks for the rational logarithm-series certificates of `LogGridData`.

A `ScaledLogTrace` with exponent `0` whose power trace has dyadic endpoints `L_k/2^80, U_k/2^80`
(`0 ≤ L_k ≤ U_k`) is checked by decoding each rational once (`Rat.num`, `Rat.den`) and comparing
cross-multiplied naturals. The harmonic sums are computed as integers at scale `M·2^80` with
`M = lcm(1, …, 40)`. `gridCheck_sound` turns one evaluation into `trace.check input 40 = true`,
`bounds.encloses (trace.bounds 40) = true` and the width bound `bounds.upper - bounds.lower ≤ 1/10^12`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLLog

noncomputable section

/-- `2^80`. -/
def S80 : Nat := 1208925819614629174706176
/-- `2^60`. -/
def S60 : Nat := 1152921504606846976
/-- `lcm(1, …, 40)`. -/
def M40 : Nat := 5342931457063200
/-- `3^40`. -/
def E40 : Nat := 12157665459056928801

/-- Magnitude of `q` at scale `S` (exact when `qOK S q`). -/
def qMag (S : Nat) (q : ℚ) : Nat := Nat.mul (iVal q.num) (Nat.div S q.den)
/-- `q` is a multiple of `1/S`. -/
def qOK (S : Nat) (q : ℚ) : Bool := Nat.beq (Nat.mod S q.den) 0
/-- `q < 0`. -/
def qNeg (q : ℚ) : Bool := iNeg q.num

/-- A nonnegative dyadic interval at scale `2^80` with ordered endpoints. -/
def entOK (p : Interval) : Bool :=
  band (band (qOK S80 p.lower) (qOK S80 p.upper))
    (band (band (Bool.rec true false (qNeg p.lower)) (Bool.rec true false (qNeg p.upper)))
      (Nat.ble (qMag S80 p.lower) (qMag S80 p.upper)))

/-- Decoded endpoints of the `k`-th power. -/
def eL (t : PowerTrace) (k : Nat) : Nat := qMag S80 (t.at k).lower
def eU (t : PowerTrace) (k : Nat) : Nat := qMag S80 (t.at k).upper

/-- `∀ i < n, f i`. -/
def allBelow (f : Nat → Bool) (n : Nat) : Bool := Nat.rec true (fun i r => band (f i) r) n

/-- One rounded power multiplication `p_{i+1} ⊇ p_i · [a, b]/2^80`. -/
def stepOK (t : PowerTrace) (a b i : Nat) : Bool :=
  band (entOK (t.at (Nat.add i 1)))
    (band (Nat.ble (Nat.mul (eL t (Nat.add i 1)) S80) (Nat.mul (eL t i) a))
      (Nat.ble (Nat.mul (eU t i) b) (Nat.mul (eU t (Nat.add i 1)) S80)))

/-- The complete power trace check for a nonnegative base `[a, b]/2^80`. -/
def powOK (t : PowerTrace) (a b n : Nat) : Bool :=
  band (entOK (t.at 0)) (band (Nat.ble (eL t 0) S80) (band (Nat.ble S80 (eU t 0)) (allBelow (stepOK t a b) n)))

/-- `Σ_{i<n} (M/(i+1)) f(i+1)`. -/
def hsum (f : Nat → Nat) (n : Nat) : Nat :=
  Nat.rec 0 (fun i r => Nat.add r (Nat.mul (Nat.div M40 (Nat.add i 1)) (f (Nat.add i 1)))) n

def isOdd (k : Nat) : Bool := Nat.beq (Nat.mod k 2) 1

/-- Contributions to the series lower endpoint (positive and negative parts). -/
def fA (t : PowerTrace) (k : Nat) : Nat := Nat.add (eL t k) (sel (isOdd k) (eL t k) 0)
def fAn (t : PowerTrace) (k : Nat) : Nat := sel (isOdd k) 0 (eU t k)
/-- Contributions to the series upper endpoint. -/
def fB (t : PowerTrace) (k : Nat) : Nat := Nat.add (eU t k) (sel (isOdd k) (eU t k) 0)
def fBn (t : PowerTrace) (k : Nat) : Nat := sel (isOdd k) 0 (eL t k)

/-- Signed comparison `P - N ≥ 0` written as `N ≤ P`. -/
def finalOK (A An B Bn : Nat) (lneg : Bool) (lm : Nat) (hneg : Bool) (hm : Nat) : Bool :=
  band
    (Nat.ble (Nat.add (Nat.add (Nat.mul An E40) 6459207790874913946727221046419862323200)
        (sel lneg 0 (Nat.mul lm 68112952302654953778508821647561274163200)))
      (Nat.add (Nat.mul A E40) (sel lneg (Nat.mul lm 68112952302654953778508821647561274163200) 0)))
    (Nat.ble (Nat.add (Nat.add (Nat.mul B E40) 6459207790874913946727221046419862323200)
        (sel hneg (Nat.mul hm 68112952302654953778508821647561274163200) 0))
      (Nat.add (Nat.mul Bn E40) (sel hneg 0 (Nat.mul hm 68112952302654953778508821647561274163200))))

/-- Width at most `10^-12`: `(hi - lo)·10^12 ≤ 2^60`. -/
def tightOK (lneg : Bool) (lm : Nat) (hneg : Bool) (hm : Nat) : Bool :=
  Nat.ble (Nat.mul (Nat.add (sel hneg 0 hm) (sel lneg lm 0)) 1000000000000)
    (Nat.add S60 (Nat.mul (Nat.add (sel hneg hm 0) (sel lneg 0 lm)) 1000000000000))

/-- Input, normalization and parameter checks. -/
def headOK (input : ℚ) (tr : ScaledLogTrace) : Bool :=
  band (Nat.beq (iVal tr.exponent) 0)
   (band (band (Nat.beq (iVal input.num) (iVal tr.normalized.num))
      (band (Bool.rec (Bool.rec true false (iNeg tr.normalized.num)) (iNeg tr.normalized.num) (iNeg input.num))
        (Nat.beq input.den tr.normalized.den)))
    (band (Bool.rec true false (qNeg tr.normalized))
     (band (Nat.ble tr.normalized.den (iVal tr.normalized.num))
      (band (Nat.ble (iVal tr.normalized.num) (Nat.mul 2 tr.normalized.den))
       (band (entOK tr.series.parameter)
        (band (Nat.ble (Nat.mul (qMag S80 tr.series.parameter.lower) (Nat.add (iVal tr.normalized.num) tr.normalized.den))
                (Nat.mul (Nat.sub (iVal tr.normalized.num) tr.normalized.den) S80))
              (Nat.ble (Nat.mul (Nat.sub (iVal tr.normalized.num) tr.normalized.den) S80)
                (Nat.mul (qMag S80 tr.series.parameter.upper) (Nat.add (iVal tr.normalized.num) tr.normalized.den)))))))))

/-- The complete fast check of one grid point. -/
def gridCheck (input : ℚ) (tr : ScaledLogTrace) (bd : Interval) : Bool :=
  band (headOK input tr)
   (band (powOK tr.series.positivePowers (qMag S80 tr.series.parameter.lower) (qMag S80 tr.series.parameter.upper) 40)
    (band (band (qOK S60 bd.lower) (qOK S60 bd.upper))
     (band (finalOK (hsum (fA tr.series.positivePowers) 40) (hsum (fAn tr.series.positivePowers) 40)
        (hsum (fB tr.series.positivePowers) 40) (hsum (fBn tr.series.positivePowers) 40)
        (qNeg bd.lower) (qMag S60 bd.lower) (qNeg bd.upper) (qMag S60 bd.upper))
      (tightOK (qNeg bd.lower) (qMag S60 bd.lower) (qNeg bd.upper) (qMag S60 bd.upper)))))

/-! ### Soundness -/

theorem raw_mod_eq (a b : Nat) : Nat.mod a b = a % b := (rfl : Nat.mod a b = Nat.mod a b).trans rfl

theorem brec_not (b : Bool) : (Bool.rec true false b : Bool) = !b := by cases b <;> rfl

theorem qdec (S : Nat) (hS : 0 < S) (q : ℚ) (hok : qOK S q = true) :
    q = (cond (qNeg q) (-(qMag S q : ℚ)) (qMag S q : ℚ)) / S := by
  have hd : q.den ∣ S := Nat.dvd_of_mod_eq_zero (Nat.eq_of_beq_eq_true hok)
  obtain ⟨k, hk⟩ := hd
  have hden : 0 < q.den := q.den_pos
  have hk0 : 0 < k := by
    rcases Nat.eq_zero_or_pos k with h | h
    · subst h; omega
    · exact h
  have hdiv : S / q.den = k := by rw [hk]; exact Nat.mul_div_cancel_left k hden
  have e := Rat.num_div_den q
  unfold qMag qNeg
  rw [raw_mul, raw_div, hdiv]
  conv_lhs => rw [← e]
  have hSq : (S : ℚ) = (q.den : ℚ) * k := by rw [hk]; push_cast; ring
  rw [hSq]
  have h1 : (q.den : ℚ) ≠ 0 := by exact_mod_cast hden.ne'
  have h2 : (k : ℚ) ≠ 0 := by exact_mod_cast hk0.ne'
  cases hn : q.num with
  | ofNat n =>
    simp only [iNeg_ofNat, iVal_ofNat, Bool.cond_false]
    simp only [Int.ofNat_eq_natCast, Int.cast_natCast]
    push_cast; field_simp
  | negSucc n =>
    simp only [iNeg_negSucc, iVal_negSucc, Bool.cond_true, Int.cast_negSucc]
    push_cast; field_simp

theorem qdec_pos (S : Nat) (hS : 0 < S) (q : ℚ) (hok : qOK S q = true) (hn : qNeg q = false) :
    q = (qMag S q : ℚ) / S := by
  have := qdec S hS q hok; rw [hn] at this; simpa using this

theorem S80_pos : 0 < S80 := by unfold S80; norm_num
theorem S60_pos : 0 < S60 := by unfold S60; norm_num

theorem entOK_dec (p : Interval) (h : entOK p = true) :
    p = ⟨(qMag S80 p.lower : ℚ) / S80, (qMag S80 p.upper : ℚ) / S80⟩ ∧ qMag S80 p.lower ≤ qMag S80 p.upper := by
  simp only [entOK, band_eq, brec_not, Bool.and_eq_true, Bool.not_eq_true', Nat.ble_eq] at h
  obtain ⟨⟨h1, h2⟩, ⟨h3, h4⟩, h5⟩ := h
  refine ⟨?_, h5⟩
  obtain ⟨l, u⟩ := p
  simp only at h1 h2 h3 h4 ⊢
  rw [← qdec_pos _ S80_pos _ h1 h3, ← qdec_pos _ S80_pos _ h2 h4]

theorem allBelow_sound (f : Nat → Bool) (n : Nat) (h : allBelow f n = true) : ∀ i < n, f i = true := by
  induction n with
  | zero => intro i hi; omega
  | succ n ih =>
    have h' : band (f n) (allBelow f n) = true := h
    rw [band_eq, Bool.and_eq_true] at h'
    intro i hi
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hi | rfl
    · exact ih h'.2 i hi
    · exact h'.1

theorem mul_nn (l u l' u' : ℚ) (h0 : 0 ≤ l) (h1 : l ≤ u) (h0' : 0 ≤ l') (h1' : l' ≤ u') :
    (⟨l, u⟩ : Interval).mul ⟨l', u'⟩ = ⟨l * l', u * u'⟩ := by
  have hab : l * l' ≤ l * u' := mul_le_mul_of_nonneg_left h1' h0
  have hcd : u * l' ≤ u * u' := mul_le_mul_of_nonneg_left h1' (h0.trans h1)
  have hac : l * l' ≤ u * l' := mul_le_mul_of_nonneg_right h1 h0'
  have hbd : l * u' ≤ u * u' := mul_le_mul_of_nonneg_right h1 (h0'.trans h1')
  simp only [Interval.mul, min_eq_left hab, min_eq_left hcd, min_eq_left hac, max_eq_right hab,
    max_eq_right hcd, max_eq_right hbd]

theorem scale_le (c l u : ℚ) (hc : 0 ≤ c) (h : l ≤ u) :
    Interval.scale c ⟨l, u⟩ = ⟨c * l, c * u⟩ := by
  have : c * l ≤ c * u := mul_le_mul_of_nonneg_left h hc
  simp only [Interval.scale, Interval.point, Interval.mul, min_self, max_self, min_eq_left this,
    max_eq_right this]

theorem Interval.neg_neg' (X : Interval) : X.neg.neg = X := by
  cases X; simp [Interval.neg]

theorem mul_neg_right' (X Y : Interval) : X.mul Y.neg = (X.mul Y).neg := by
  obtain ⟨l, u⟩ := X; obtain ⟨l', u'⟩ := Y
  simp only [Interval.mul, Interval.neg, mul_neg, min_neg_neg, max_neg_neg, Interval.mk.injEq]
  constructor
  · rw [max_comm (l * u'), max_comm (u * u')]
  · rw [min_comm (l * u'), min_comm (u * u')]

theorem mul_neg_left' (X Y : Interval) : X.neg.mul Y = (X.mul Y).neg := by
  obtain ⟨l, u⟩ := X; obtain ⟨l', u'⟩ := Y
  simp only [Interval.mul, Interval.neg, neg_mul, min_neg_neg, max_neg_neg, Interval.mk.injEq]
  constructor
  · rw [max_comm (max (u * l') _)]
  · rw [min_comm (min (u * l') _)]

theorem encloses_neg (A B : Interval) : A.neg.encloses B.neg = A.encloses B := by
  obtain ⟨l, u⟩ := A; obtain ⟨l', u'⟩ := B
  simp only [Interval.encloses, Interval.neg, neg_le_neg_iff]
  rw [Bool.eq_iff_iff]; simp only [decide_eq_true_eq]; exact and_comm

theorem negateBase_at (t : PowerTrace) (k : Nat) :
    t.negateBase.at k = if k % 2 = 0 then t.at k else (t.at k).neg := by
  unfold PowerTrace.at PowerTrace.negateBase
  rw [Array.getElem?_mapIdx]
  cases t.powers[k]? with
  | none => split <;> simp [Interval.point, Interval.neg]
  | some x => simp

theorem negate_check (t : PowerTrace) (base : Interval) (n : Nat) :
    t.negateBase.check base.neg n = t.check base n := by
  have key : ∀ i : Fin n, ((t.negateBase.at (i.val + 1)).encloses ((t.negateBase.at i.val).mul base.neg) = true) ↔
      ((t.at (i.val + 1)).encloses ((t.at i.val).mul base) = true) := by
    intro i
    rw [negateBase_at, negateBase_at]
    rcases Nat.mod_two_eq_zero_or_one i.val with h | h
    · have h' : (i.val + 1) % 2 = 1 := by omega
      simp only [h, h', if_true, show (1 : Nat) ≠ 0 from by decide, if_false, mul_neg_right', encloses_neg]
    · have h' : (i.val + 1) % 2 = 0 := by omega
      simp only [h, h', if_true, show (1 : Nat) ≠ 0 from by decide, if_false, mul_neg_left', mul_neg_right',
        Interval.neg_neg']
  have h0 : t.negateBase.at 0 = t.at 0 := by rw [negateBase_at]; simp
  unfold PowerTrace.check
  rw [h0]
  simp only [key]

theorem powOK_ent (t : PowerTrace) (a b n : Nat) (h : powOK t a b n = true) :
    ∀ k ≤ n, entOK (t.at k) = true := by
  simp only [powOK, band_eq, Bool.and_eq_true] at h
  obtain ⟨h0, -, -, hs⟩ := h
  have hs' := allBelow_sound _ _ hs
  intro k hk
  rcases k with _ | k
  · exact h0
  · have := hs' k (by omega)
    simp only [stepOK, band_eq, Bool.and_eq_true] at this
    exact this.1

theorem powOK_sound (t : PowerTrace) (a b n : Nat) (hab : a ≤ b) (h : powOK t a b n = true) :
    t.check ⟨(a : ℚ) / S80, (b : ℚ) / S80⟩ n = true := by
  have hent := powOK_ent t a b n h
  simp only [powOK, band_eq, Bool.and_eq_true, Nat.ble_eq] at h
  obtain ⟨h0, hl0, hu0, hs⟩ := h
  have hs' := allBelow_sound _ _ hs
  have hSq : (0 : ℚ) < S80 := by exact_mod_cast S80_pos
  unfold PowerTrace.check
  rw [Bool.and_eq_true]
  constructor
  · obtain ⟨e0, -⟩ := entOK_dec _ h0
    rw [e0]
    simp only [Interval.encloses, Interval.point]
    apply decide_eq_true
    constructor
    · rw [div_le_one hSq]; exact_mod_cast hl0
    · rw [one_le_div hSq]; exact_mod_cast hu0
  · apply decide_eq_true
    intro i
    have hi := hs' i.val i.isLt
    simp only [stepOK, band_eq, Bool.and_eq_true, Nat.ble_eq, raw_mul, raw_add] at hi
    obtain ⟨-, hlo, hhi⟩ := hi
    obtain ⟨ei, hLUi⟩ := entOK_dec _ (hent i.val (by omega))
    obtain ⟨ej, -⟩ := entOK_dec _ (hent (i.val + 1) (by omega))
    have hL : ((qMag S80 (t.at i.val).lower : ℚ)) / S80 ≤ (qMag S80 (t.at i.val).upper : ℚ) / S80 :=
      div_le_div_of_nonneg_right (by exact_mod_cast hLUi) hSq.le
    have hB : (a : ℚ) / S80 ≤ (b : ℚ) / S80 := div_le_div_of_nonneg_right (by exact_mod_cast hab) hSq.le
    rw [ei, ej, mul_nn _ _ _ _ (by positivity) hL (by positivity) hB]
    simp only [Interval.encloses]
    apply decide_eq_true
    simp only [eL, eU] at hlo hhi
    constructor
    · rw [div_mul_div_comm, div_le_div_iff₀ hSq (by positivity)]
      have : ((qMag S80 (t.at (i.val + 1)).lower * S80 : Nat) : ℚ) ≤ ((qMag S80 (t.at i.val).lower * a : Nat) : ℚ) := by
        exact_mod_cast hlo
      push_cast at this
      nlinarith
    · rw [div_mul_div_comm, div_le_div_iff₀ (by positivity) hSq]
      have : ((qMag S80 (t.at i.val).upper * b : Nat) : ℚ) ≤ ((qMag S80 (t.at (i.val + 1)).upper * S80 : Nat) : ℚ) := by
        exact_mod_cast hhi
      push_cast at this
      nlinarith

theorem dvdM : ∀ i < 40, (i + 1) ∣ M40 := by unfold M40; decide

theorem hsum_cast (f : Nat → Nat) (n : Nat) (hn : n ≤ 40) :
    (hsum f n : ℚ) = (M40 : ℚ) * ∑ i ∈ Finset.range n, (f (i + 1) : ℚ) / ((i : ℚ) + 1) := by
  induction n with
  | zero => simp [hsum]
  | succ n ih =>
    have hs : hsum f (n + 1) = hsum f n + M40 / (n + 1) * f (n + 1) := rfl
    obtain ⟨q, hq⟩ := dvdM n (by omega)
    have hqd : M40 / (n + 1) = q := by rw [hq]; exact Nat.mul_div_cancel_left q (by omega)
    have hqq : (q : ℚ) = (M40 : ℚ) / ((n : ℚ) + 1) := by
      rw [hq]; push_cast; field_simp
    rw [hs, Finset.sum_range_succ, mul_add, ← ih (by omega), hqd]
    push_cast
    rw [hqq]
    field_simp

theorem scale_ent (t : PowerTrace) (k : Nat) (hk : entOK (t.at k) = true) (c : ℚ) (hc : 0 ≤ c) :
    Interval.scale c (t.at k) = ⟨c * ((eL t k : ℚ) / S80), c * ((eU t k : ℚ) / S80)⟩ := by
  obtain ⟨e, hle⟩ := entOK_dec _ hk
  have hSq : (0 : ℚ) < S80 := by exact_mod_cast S80_pos
  rw [e, scale_le _ _ _ hc (div_le_div_of_nonneg_right (by exact_mod_cast hle) hSq.le)]
  rfl

theorem scale_ent_neg (t : PowerTrace) (k : Nat) (hk : entOK (t.at k) = true) (c : ℚ) (hc : 0 ≤ c) :
    Interval.scale c (t.negateBase.at k) =
      ⟨c * ((if k % 2 = 0 then (eL t k : ℚ) else -(eU t k : ℚ)) / S80),
       c * ((if k % 2 = 0 then (eU t k : ℚ) else -(eL t k : ℚ)) / S80)⟩ := by
  obtain ⟨e, hle⟩ := entOK_dec _ hk
  have hSq : (0 : ℚ) < S80 := by exact_mod_cast S80_pos
  have hle' : (eL t k : ℚ) / S80 ≤ (eU t k : ℚ) / S80 :=
    div_le_div_of_nonneg_right (by exact_mod_cast hle) hSq.le
  rw [negateBase_at]
  split
  · rw [scale_ent t k hk c hc]
  · rw [e]
    simp only [Interval.neg]
    rw [scale_le _ _ _ hc (by unfold eL eU at hle'; linarith)]
    simp only [eL, eU, Interval.mk.injEq]
    constructor <;> ring

theorem fA_cast (t : PowerTrace) (k : Nat) :
    (fA t k : ℚ) - fAn t k = (eL t k : ℚ) - (if k % 2 = 0 then (eU t k : ℚ) else -(eL t k : ℚ)) := by
  unfold fA fAn isOdd
  rcases Nat.mod_two_eq_zero_or_one k with h | h
  · have : Nat.beq (Nat.mod k 2) 1 = false := by rw [raw_mod_eq, h]; rfl
    simp only [this, sel_eq, Bool.cond_false, raw_add, h, if_true]; push_cast; ring
  · have : Nat.beq (Nat.mod k 2) 1 = true := by rw [raw_mod_eq, h]; rfl
    simp only [this, sel_eq, Bool.cond_true, raw_add, h, show (1 : Nat) ≠ 0 from by decide, if_false]
    push_cast; ring

theorem fB_cast (t : PowerTrace) (k : Nat) :
    (fB t k : ℚ) - fBn t k = (eU t k : ℚ) - (if k % 2 = 0 then (eL t k : ℚ) else -(eU t k : ℚ)) := by
  unfold fB fBn isOdd
  rcases Nat.mod_two_eq_zero_or_one k with h | h
  · have : Nat.beq (Nat.mod k 2) 1 = false := by rw [raw_mod_eq, h]; rfl
    simp only [this, sel_eq, Bool.cond_false, raw_add, h, if_true]; push_cast; ring
  · have : Nat.beq (Nat.mod k 2) 1 = true := by rw [raw_mod_eq, h]; rfl
    simp only [this, sel_eq, Bool.cond_true, raw_add, h, show (1 : Nat) ≠ 0 from by decide, if_false]
    push_cast; ring

/-- The normalized series bounds as exact integer quotients. -/
theorem series_bounds (tr : NormalizedLogTrace) (hneg : tr.negativePowers = tr.positivePowers.negateBase)
    (hent : ∀ k ≤ 40, entOK (tr.positivePowers.at k) = true) :
    tr.bounds 40 =
      ⟨((hsum (fA tr.positivePowers) 40 : ℚ) - hsum (fAn tr.positivePowers) 40) / ((M40 : ℚ) * S80) - 1 / E40,
       ((hsum (fB tr.positivePowers) 40 : ℚ) - hsum (fBn tr.positivePowers) 40) / ((M40 : ℚ) * S80) + 1 / E40⟩ := by
  set t := tr.positivePowers
  have hc : ∀ i : Nat, (0 : ℚ) ≤ 1 / ((i : ℚ) + 1) := fun i => by positivity
  have hM : (M40 : ℚ) ≠ 0 := by unfold M40; norm_num
  have hS : (S80 : ℚ) ≠ 0 := by unfold S80; norm_num
  have err : uniformLogError 40 = 1 / E40 := by unfold uniformLogError E40; norm_num
  unfold NormalizedLogTrace.bounds PowerTrace.harmonicSum
  rw [hneg, err]
  simp only [Interval.sub, Interval.add, Interval.neg, Interval.sumRange, Interval.mk.injEq]
  rw [hsum_cast _ _ le_rfl, hsum_cast _ _ le_rfl, hsum_cast _ _ le_rfl, hsum_cast _ _ le_rfl]
  have hsl : ∀ i ∈ Finset.range 40, (Interval.scale (1 / ((i : ℚ) + 1)) (t.at (i + 1))).lower -
      (Interval.scale (1 / ((i : ℚ) + 1)) (t.negateBase.at (i + 1))).upper =
      ((fA t (i + 1) : ℚ) - fAn t (i + 1)) / ((i : ℚ) + 1) / S80 := by
    intro i hi
    have hk := hent (i + 1) (by simp at hi; omega)
    rw [scale_ent t _ hk _ (hc i), scale_ent_neg t _ hk _ (hc i), fA_cast]
    simp only; field_simp; try ring
  have hsu : ∀ i ∈ Finset.range 40, (Interval.scale (1 / ((i : ℚ) + 1)) (t.at (i + 1))).upper -
      (Interval.scale (1 / ((i : ℚ) + 1)) (t.negateBase.at (i + 1))).lower =
      ((fB t (i + 1) : ℚ) - fBn t (i + 1)) / ((i : ℚ) + 1) / S80 := by
    intro i hi
    have hk := hent (i + 1) (by simp at hi; omega)
    rw [scale_ent t _ hk _ (hc i), scale_ent_neg t _ hk _ (hc i), fB_cast]
    simp only; field_simp; try ring
  have L1 : ∑ x ∈ Finset.range 40, (Interval.scale (1 / ((x : ℚ) + 1)) (t.at (x + 1))).lower +
      -∑ x ∈ Finset.range 40, (Interval.scale (1 / ((x : ℚ) + 1)) (t.negateBase.at (x + 1))).upper =
      ∑ x ∈ Finset.range 40, ((Interval.scale (1 / ((x : ℚ) + 1)) (t.at (x + 1))).lower -
        (Interval.scale (1 / ((x : ℚ) + 1)) (t.negateBase.at (x + 1))).upper) := by
    rw [Finset.sum_sub_distrib]; ring
  have L2 : ∑ x ∈ Finset.range 40, (Interval.scale (1 / ((x : ℚ) + 1)) (t.at (x + 1))).upper +
      -∑ x ∈ Finset.range 40, (Interval.scale (1 / ((x : ℚ) + 1)) (t.negateBase.at (x + 1))).lower =
      ∑ x ∈ Finset.range 40, ((Interval.scale (1 / ((x : ℚ) + 1)) (t.at (x + 1))).upper -
        (Interval.scale (1 / ((x : ℚ) + 1)) (t.negateBase.at (x + 1))).lower) := by
    rw [Finset.sum_sub_distrib]; ring
  constructor
  · rw [L1, Finset.sum_congr rfl hsl, ← mul_sub, mul_div_mul_left _ _ hM, ← Finset.sum_sub_distrib,
      Finset.sum_div, Finset.sum_congr rfl (fun i _ => (by ring : (((fA t (i + 1) : ℚ)) - fAn t (i + 1)) / ((i : ℚ) + 1) / S80 =
        (((fA t (i + 1) : ℚ)) / ((i : ℚ) + 1) - (fAn t (i + 1) : ℚ) / ((i : ℚ) + 1)) / S80))]
    try ring
  · rw [L2, Finset.sum_congr rfl hsu, ← mul_sub, mul_div_mul_left _ _ hM, ← Finset.sum_sub_distrib,
      Finset.sum_div, Finset.sum_congr rfl (fun i _ => (by ring : (((fB t (i + 1) : ℚ)) - fBn t (i + 1)) / ((i : ℚ) + 1) / S80 =
        (((fB t (i + 1) : ℚ)) / ((i : ℚ) + 1) - (fBn t (i + 1) : ℚ) / ((i : ℚ) + 1)) / S80))]
    try ring

theorem int_eq_of (z w : ℤ) (h1 : iVal z = iVal w) (h2 : iNeg z = iNeg w) : z = w := by
  cases z with
  | ofNat a =>
    cases w with
    | ofNat b => rw [iVal_ofNat, iVal_ofNat] at h1; rw [h1]
    | negSucc b => rw [iNeg_ofNat, iNeg_negSucc] at h2; exact absurd h2 (by decide)
  | negSucc a =>
    cases w with
    | ofNat b => rw [iNeg_ofNat, iNeg_negSucc] at h2; exact absurd h2 (by decide)
    | negSucc b => rw [iVal_negSucc, iVal_negSucc] at h1; rw [show a = b by omega]

theorem headOK_sound (input : ℚ) (tr : ScaledLogTrace) (hneg : tr.series.negativePowers = tr.series.positivePowers.negateBase)
    (hh : headOK input tr = true)
    (hp : powOK tr.series.positivePowers (qMag S80 tr.series.parameter.lower) (qMag S80 tr.series.parameter.upper) 40 = true) :
    tr.check input 40 = true ∧ tr.exponent = 0 := by
  simp only [headOK, band_eq, Bool.and_eq_true, Nat.beq_eq, Nat.ble_eq, brec_not, raw_mul, raw_add, raw_sub,
    Bool.not_eq_true'] at hh
  obtain ⟨he, ⟨hnum, hsg, hden⟩, hxneg, hx1, hx2, hpar, hlo, hhi⟩ := hh
  have he0 : tr.exponent = 0 := by
    cases h : tr.exponent with
    | ofNat n => rw [h, iVal_ofNat] at he; simp [he]
    | negSucc n => rw [h, iVal_negSucc] at he; omega
  refine ⟨?_, he0⟩
  unfold ScaledLogTrace.check NormalizedLogTrace.check
  simp only [Bool.and_eq_true, decide_eq_true_eq]
  set x := tr.normalized
  have hsgn : iNeg input.num = iNeg x.num := by
    revert hsg; cases iNeg input.num <;> cases iNeg x.num <;> simp
  have hinx : input = x := Rat.ext (int_eq_of _ _ hnum hsgn) hden
  -- x = xn / xd
  have hxn : x.num = (iVal x.num : ℤ) := by
    unfold qNeg at hxneg
    cases h : x.num with
    | ofNat n => rfl
    | negSucc n => rw [h, iNeg_negSucc] at hxneg; exact absurd hxneg (by decide)
  have hxq : x = (iVal x.num : ℚ) / x.den := by
    conv_lhs => rw [← Rat.num_div_den x]
    rw [hxn]; push_cast; rfl
  have hden0 : (0 : ℚ) < x.den := by exact_mod_cast x.den_pos
  clear_value x
  generalize iVal x.num = xn at *
  generalize x.den = xd at *
  obtain ⟨epar, hab⟩ := entOK_dec _ hpar
  have hSq : (0 : ℚ) < S80 := by exact_mod_cast S80_pos
  refine ⟨?_, ⟨⟨⟨?_, ?_⟩, ?_⟩, ?_⟩⟩
  · rw [he0, hinx]; simp
  · rw [hxq, le_div_iff₀ hden0, one_mul, div_le_iff₀ hden0]
    exact ⟨by exact_mod_cast hx1, by exact_mod_cast hx2⟩
  · rw [epar]
    simp only [Interval.encloses, Interval.point]
    apply decide_eq_true
    have hsum0 : (0 : ℚ) < (xn : ℚ) + xd := by positivity
    have hv : (x - 1) / (x + 1) = ((xn - xd : ℕ) : ℚ) / ((xn : ℚ) + xd) := by
      rw [hxq, Nat.cast_sub hx1]; field_simp
    rw [hv]
    constructor
    · rw [div_le_div_iff₀ hSq hsum0]
      have := (show ((qMag S80 tr.series.parameter.lower * (xn + xd) : ℕ) : ℚ) ≤
        (((xn - xd) * S80 : ℕ) : ℚ) by exact_mod_cast hlo)
      push_cast at this ⊢; linarith
    · rw [div_le_div_iff₀ hsum0 hSq]
      have := (show ((((xn - xd) * S80 : ℕ)) : ℚ) ≤
        ((qMag S80 tr.series.parameter.upper * (xn + xd) : ℕ) : ℚ) by exact_mod_cast hhi)
      push_cast at this ⊢; linarith
  · rw [epar]; exact powOK_sound _ _ _ _ hab hp
  · rw [hneg, epar]
    have := negate_check tr.series.positivePowers ⟨(qMag S80 tr.series.parameter.lower : ℚ) / S80,
      (qMag S80 tr.series.parameter.upper : ℚ) / S80⟩ 40
    rw [this]; exact powOK_sound _ _ _ _ hab hp

theorem bd_dec (bd : Interval) (h1 : qOK S60 bd.lower = true) (h2 : qOK S60 bd.upper = true) :
    bd = ⟨(cond (qNeg bd.lower) (-(qMag S60 bd.lower : ℚ)) (qMag S60 bd.lower : ℚ)) / S60,
      (cond (qNeg bd.upper) (-(qMag S60 bd.upper : ℚ)) (qMag S60 bd.upper : ℚ)) / S60⟩ := by
  obtain ⟨l, u⟩ := bd
  simp only at h1 h2 ⊢
  rw [← qdec _ S60_pos _ h1, ← qdec _ S60_pos _ h2]

theorem final_sound (A An B Bn : Nat) (lneg : Bool) (lm : Nat) (hneg : Bool) (hm : Nat)
    (h : finalOK A An B Bn lneg lm hneg hm = true) :
    (cond lneg (-(lm : ℚ)) (lm : ℚ)) / S60 ≤ ((A : ℚ) - An) / ((M40 : ℚ) * S80) - 1 / E40 ∧
    ((B : ℚ) - Bn) / ((M40 : ℚ) * S80) + 1 / E40 ≤ (cond hneg (-(hm : ℚ)) (hm : ℚ)) / S60 := by
  simp only [finalOK, band_eq, Bool.and_eq_true, Nat.ble_eq, sel_eq, raw_add, raw_mul] at h
  obtain ⟨h1, h2⟩ := h
  unfold S60 M40 S80 E40 at *
  constructor
  · cases lneg <;> simp only [Bool.cond_true, Bool.cond_false] at h1 ⊢ <;>
    · have := (show ((_ : Nat) : ℚ) ≤ ((_ : Nat) : ℚ) from by exact_mod_cast h1)
      push_cast at this; linarith
  · cases hneg <;> simp only [Bool.cond_true, Bool.cond_false] at h2 ⊢ <;>
    · have := (show ((_ : Nat) : ℚ) ≤ ((_ : Nat) : ℚ) from by exact_mod_cast h2)
      push_cast at this; linarith

theorem tight_sound (lneg : Bool) (lm : Nat) (hneg : Bool) (hm : Nat) (h : tightOK lneg lm hneg hm = true) :
    (cond hneg (-(hm : ℚ)) (hm : ℚ)) / S60 - (cond lneg (-(lm : ℚ)) (lm : ℚ)) / S60 ≤ (1 : ℚ) / 10 ^ 12 := by
  simp only [tightOK, Nat.ble_eq, sel_eq, raw_add, raw_mul] at h
  unfold S60 at *
  cases lneg <;> cases hneg <;> simp only [Bool.cond_true, Bool.cond_false] at h ⊢ <;>
  · have := (show ((_ : Nat) : ℚ) ≤ ((_ : Nat) : ℚ) from by exact_mod_cast h)
    push_cast at this; norm_num; linarith

/-- One fast evaluation certifies the three checks of a `LogGridData` point. -/
theorem gridCheck_sound (input : ℚ) (tr : ScaledLogTrace) (bd : Interval)
    (hneg : tr.series.negativePowers = tr.series.positivePowers.negateBase) (h : gridCheck input tr bd = true) :
    tr.check input 40 = true ∧ bd.encloses (tr.bounds 40) = true ∧ bd.upper - bd.lower ≤ (1 : ℚ) / 10 ^ 12 := by
  simp only [gridCheck, band_eq, Bool.and_eq_true] at h
  obtain ⟨hh, hp, ⟨hb1, hb2⟩, hf, ht⟩ := h
  obtain ⟨hc, he0⟩ := headOK_sound input tr hneg hh hp
  have hent := powOK_ent _ _ _ _ hp
  refine ⟨hc, ?_, ?_⟩
  · have hsb := series_bounds tr.series hneg hent
    have fs := final_sound _ _ _ _ _ _ _ _ hf
    unfold ScaledLogTrace.bounds
    rw [hsb, he0, bd_dec bd hb1 hb2]
    simp only [Interval.encloses, Interval.add, Interval.scale, Interval.point, Interval.mul, Int.cast_zero,
      zero_mul, min_self, max_self, add_zero]
    apply decide_eq_true
    exact fs
  · rw [bd_dec bd hb1 hb2]
    exact tight_sound _ _ _ _ ht

/-! ### Packed decoding: every power endpoint is decoded once into an 88-bit lane table. -/

/-- `2^88 - 1`. -/
def MASK88 : Nat := 309485009821345068724781055

/-- Lane `i` (88 bits) of `d`. -/
def lane88 (d i : Nat) : Nat := Nat.land (Nat.shiftRight d (Nat.mul 88 i)) MASK88

/-- Endpoints `L_0, U_0, L_1, U_1, …` packed little-endian in 88-bit lanes. -/
def packDec (l : List Interval) : Nat :=
  List.rec (motive := fun _ => Nat) 0
    (fun q _ r => Nat.add (qMag S80 q.lower) (Nat.shiftLeft (Nat.add (qMag S80 q.upper) (Nat.shiftLeft r 88)) 88)) l

/-- Every entry is a valid nonnegative dyadic interval whose endpoints fit in a lane. -/
def okAll (l : List Interval) : Bool :=
  List.rec (motive := fun _ => Bool) true
    (fun q _ r => band (entOK q) (band (Nat.ble (qMag S80 q.upper) MASK88) r)) l

/-- Raw list length. -/
def lenR (l : List Interval) : Nat := List.rec (motive := fun _ => Nat) 0 (fun _ _ r => Nat.add r 1) l

def rLo (P k : Nat) : Nat := lane88 P (Nat.mul 2 k)
def rHi (P k : Nat) : Nat := lane88 P (Nat.add (Nat.mul 2 k) 1)

def stepOK2 (P a b i : Nat) : Bool :=
  band (Nat.ble (Nat.mul (rLo P (Nat.add i 1)) S80) (Nat.mul (rLo P i) a))
    (Nat.ble (Nat.mul (rHi P i) b) (Nat.mul (rHi P (Nat.add i 1)) S80))

def powOK2 (P a b n : Nat) : Bool :=
  band (Nat.ble (rLo P 0) S80) (band (Nat.ble S80 (rHi P 0)) (allBelow (stepOK2 P a b) n))

def gA (P k : Nat) : Nat := Nat.add (rLo P k) (sel (isOdd k) (rLo P k) 0)
def gAn (P k : Nat) : Nat := sel (isOdd k) 0 (rHi P k)
def gB (P k : Nat) : Nat := Nat.add (rHi P k) (sel (isOdd k) (rHi P k) 0)
def gBn (P k : Nat) : Nat := sel (isOdd k) 0 (rLo P k)

def gridCheckP (input : ℚ) (tr : ScaledLogTrace) (bd : Interval) (P : Nat) : Bool :=
  band (headOK input tr)
   (band (band (okAll tr.series.positivePowers.powers.toList)
       (Nat.beq (lenR tr.series.positivePowers.powers.toList) 41))
    (band (powOK2 P (qMag S80 tr.series.parameter.lower) (qMag S80 tr.series.parameter.upper) 40)
     (band (band (qOK S60 bd.lower) (qOK S60 bd.upper))
      (band (finalOK (hsum (gA P) 40) (hsum (gAn P) 40) (hsum (gB P) 40) (hsum (gBn P) 40)
         (qNeg bd.lower) (qMag S60 bd.lower) (qNeg bd.upper) (qMag S60 bd.upper))
       (tightOK (qNeg bd.lower) (qMag S60 bd.lower) (qNeg bd.upper) (qMag S60 bd.upper))))))

/-- The fast check of one grid point (power endpoints decoded once). -/
def gridCheck2 (input : ℚ) (tr : ScaledLogTrace) (bd : Interval) : Bool :=
  gridCheckP input tr bd (packDec tr.series.positivePowers.powers.toList)

theorem raw_shl (a b : Nat) : Nat.shiftLeft a b = a * 2 ^ b := Nat.shiftLeft_eq a b

theorem lane88_eq (d i : Nat) : lane88 d i = d / 2 ^ (88 * i) % 2 ^ 88 := by
  unfold lane88 MASK88
  rw [raw_mul, show (309485009821345068724781055 : Nat) = 2 ^ 88 - 1 by norm_num]
  show (d >>> (88 * i)) &&& (2 ^ 88 - 1) = _
  rw [Nat.shiftRight_eq_div_pow, Nat.and_two_pow_sub_one_eq_mod]

theorem packDec_cons (q : Interval) (l : List Interval) :
    packDec (q :: l) = qMag S80 q.lower + qMag S80 q.upper * 2 ^ 88 + packDec l * 2 ^ 176 := by
  have e : packDec (q :: l) = Nat.add (qMag S80 q.lower)
      (Nat.shiftLeft (Nat.add (qMag S80 q.upper) (Nat.shiftLeft (packDec l) 88)) 88) := rfl
  rw [e, raw_add, raw_add, raw_shl, raw_shl]
  ring

theorem lane_packDec (l : List Interval) (h : okAll l = true) :
    ∀ k (hk : k < l.length), lane88 (packDec l) (2 * k) = qMag S80 l[k].lower ∧
      lane88 (packDec l) (2 * k + 1) = qMag S80 l[k].upper := by
  induction l with
  | nil => intro k hk; simp at hk
  | cons q l ih =>
    have h' : band (entOK q) (band (Nat.ble (qMag S80 q.upper) MASK88) (okAll l)) = true := h
    simp only [band_eq, Bool.and_eq_true, Nat.ble_eq] at h'
    obtain ⟨hq, hfit, hl⟩ := h'
    obtain ⟨-, hLU⟩ := entOK_dec q hq
    have hU : qMag S80 q.upper < 2 ^ 88 := by unfold MASK88 at hfit; omega
    have hL : qMag S80 q.lower < 2 ^ 88 := lt_of_le_of_lt hLU hU
    intro k hk
    rw [packDec_cons, lane88_eq, lane88_eq]
    rcases k with _ | k
    · simp only [Nat.mul_zero, pow_zero, Nat.div_one, Nat.zero_add, List.getElem_cons_zero, Nat.mul_one]
      constructor
      · rw [show qMag S80 q.lower + qMag S80 q.upper * 2 ^ 88 + packDec l * 2 ^ 176 =
          qMag S80 q.lower + (qMag S80 q.upper + packDec l * 2 ^ 88) * 2 ^ 88 by ring,
          Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hL]
      · rw [show qMag S80 q.lower + qMag S80 q.upper * 2 ^ 88 + packDec l * 2 ^ 176 =
          qMag S80 q.lower + (qMag S80 q.upper + packDec l * 2 ^ 88) * 2 ^ 88 by ring,
          Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt hL, Nat.zero_add,
          Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hU]
    · have ihk := ih hl k (by simp at hk; omega)
      rw [lane88_eq, lane88_eq] at ihk
      simp only [List.getElem_cons_succ]
      have e1 : 88 * (2 * (k + 1)) = 176 + 88 * (2 * k) := by ring
      have e2 : 88 * (2 * (k + 1) + 1) = 176 + 88 * (2 * k + 1) := by ring
      have hlow : qMag S80 q.lower + qMag S80 q.upper * 2 ^ 88 < 2 ^ 176 := by
        have : qMag S80 q.upper * 2 ^ 88 ≤ (2 ^ 88 - 1) * 2 ^ 88 := Nat.mul_le_mul_right _ (by omega)
        have h176 : (2 : Nat) ^ 176 = 2 ^ 88 * 2 ^ 88 := by rw [← pow_add]
        rw [h176]
        have : (2 ^ 88 - 1) * 2 ^ 88 + 2 ^ 88 = 2 ^ 88 * 2 ^ 88 := by
          rw [Nat.sub_mul, one_mul]; have : 2 ^ 88 ≤ 2 ^ 88 * 2 ^ 88 := Nat.le_mul_of_pos_left _ (by positivity); omega
        omega
      have hdiv : (qMag S80 q.lower + qMag S80 q.upper * 2 ^ 88 + packDec l * 2 ^ 176) / 2 ^ 176 = packDec l := by
        rw [Nat.add_mul_div_right _ _ (by positivity), Nat.div_eq_of_lt hlow, Nat.zero_add]
      rw [e1, e2, pow_add, pow_add, ← Nat.div_div_eq_div_mul, ← Nat.div_div_eq_div_mul, hdiv]
      exact ihk

theorem lenR_eq (l : List Interval) : lenR l = l.length := by
  induction l with
  | nil => rfl
  | cons q l ih => show Nat.add (lenR l) 1 = _; rw [raw_add, ih]; rfl

theorem at_eq (t : PowerTrace) (k : Nat) (hk : k < t.powers.toList.length) :
    t.at k = t.powers.toList[k] := by
  unfold PowerTrace.at
  rw [← Array.getElem?_toList, List.getElem?_eq_getElem hk]
  rfl

theorem okAll_ent (l : List Interval) (h : okAll l = true) : ∀ k (hk : k < l.length), entOK l[k] = true := by
  induction l with
  | nil => intro k hk; simp at hk
  | cons q l ih =>
    have h' : band (entOK q) (band (Nat.ble (qMag S80 q.upper) MASK88) (okAll l)) = true := h
    simp only [band_eq, Bool.and_eq_true] at h'
    intro k hk
    rcases k with _ | k
    · exact h'.1
    · exact ih h'.2.2 k (by simp at hk; omega)

theorem allBelow_congr (f g : Nat → Bool) (n : Nat) (h : ∀ i < n, f i = g i) : allBelow f n = allBelow g n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show band (f n) (allBelow f n) = band (g n) (allBelow g n)
    rw [h n (by omega), ih (fun i hi => h i (by omega))]

theorem hsum_congr (f g : Nat → Nat) (n : Nat) (h : ∀ k, 1 ≤ k → k ≤ n → f k = g k) : hsum f n = hsum g n := by
  induction n with
  | zero => rfl
  | succ n ih =>
    show Nat.add (hsum f n) (Nat.mul (Nat.div M40 (Nat.add n 1)) (f (Nat.add n 1))) =
      Nat.add (hsum g n) (Nat.mul (Nat.div M40 (Nat.add n 1)) (g (Nat.add n 1)))
    rw [h (Nat.add n 1) (by show 1 ≤ n + 1; omega) (by show n + 1 ≤ n + 1; omega), ih (fun k h1 h2 => h k h1 (by omega))]

theorem gridCheck2_sound (input : ℚ) (tr : ScaledLogTrace) (bd : Interval)
    (hneg : tr.series.negativePowers = tr.series.positivePowers.negateBase) (h : gridCheck2 input tr bd = true) :
    tr.check input 40 = true ∧ bd.encloses (tr.bounds 40) = true ∧ bd.upper - bd.lower ≤ (1 : ℚ) / 10 ^ 12 := by
  apply gridCheck_sound input tr bd hneg
  unfold gridCheck2 gridCheckP at h
  simp only [band_eq, Bool.and_eq_true, Nat.beq_eq] at h
  obtain ⟨hh, ⟨hok, hlen⟩, hp, hb, hf, ht⟩ := h
  set t := tr.series.positivePowers
  set P := packDec t.powers.toList
  rw [lenR_eq] at hlen
  have hrd : ∀ k ≤ 40, rLo P k = eL t k ∧ rHi P k = eU t k ∧ entOK (t.at k) = true := by
    intro k hk
    have hk' : k < t.powers.toList.length := by omega
    obtain ⟨h1, h2⟩ := lane_packDec _ hok k hk'
    refine ⟨?_, ?_, ?_⟩
    · unfold rLo eL; rw [raw_mul, h1, at_eq t k hk']
    · unfold rHi eU; rw [raw_mul, raw_add, h2, at_eq t k hk']
    · rw [at_eq t k hk']; exact okAll_ent _ hok k hk'
  have hpow : powOK t (qMag S80 tr.series.parameter.lower) (qMag S80 tr.series.parameter.upper) 40 = true := by
    unfold powOK2 at hp
    unfold powOK
    obtain ⟨r1, r2, r3⟩ := hrd 0 (by omega)
    rw [r3, ← r1, ← r2]
    rw [allBelow_congr (stepOK t _ _) (stepOK2 P _ _) 40]
    · simpa [band_eq] using hp
    · intro i hi
      obtain ⟨a1, a2, a3⟩ := hrd i (by omega)
      obtain ⟨b1, b2, b3⟩ := hrd (i + 1) (by omega)
      unfold stepOK stepOK2
      rw [raw_add, b3, ← a1, ← a2, ← b1, ← b2]
      simp [band_eq]
  have hsA : ∀ (f : PowerTrace → Nat → Nat) (g : Nat → Nat → Nat),
      (∀ k ≤ 40, f t k = g P k) → hsum (f t) 40 = hsum (g P) 40 := fun f g hfg =>
    hsum_congr _ _ _ (fun k _ hk => hfg k hk)
  simp only [gridCheck, band_eq, Bool.and_eq_true]
  refine ⟨hh, hpow, hb, ?_, ht⟩
  rw [hsA fA gA (fun k hk => by obtain ⟨r1, r2, -⟩ := hrd k hk; unfold fA gA; rw [r1]),
    hsA fAn gAn (fun k hk => by obtain ⟨r1, r2, -⟩ := hrd k hk; unfold fAn gAn; rw [r2]),
    hsA fB gB (fun k hk => by obtain ⟨r1, r2, -⟩ := hrd k hk; unfold fB gB; rw [r2]),
    hsA fBn gBn (fun k hk => by obtain ⟨r1, r2, -⟩ := hrd k hk; unfold fBn gBn; rw [r1])]
  exact hf

/-! ### Grid-index checks (`CertifiedLogGrid.input_correct`, `FixedLogGrid.interval_correct`) -/

/-- `k mod 256` as a grid index. -/
def finOf (k : Nat) : Fin 256 := ⟨k % 256, Nat.mod_lt _ (by decide)⟩

theorem finOf_val (i : Fin 256) : finOf i.val = i := Fin.ext (Nat.mod_eq_of_lt i.isLt)

/-- `q = 1 + k/256`, by `q.num · 256 = (256 + k) · q.den`. -/
def inputOK (q : ℚ) (k : Nat) : Bool :=
  band (Bool.rec true false (iNeg q.num)) (Nat.beq (Nat.mul (iVal q.num) 256) (Nat.mul (Nat.add 256 k) q.den))

theorem inputOK_sound (q : ℚ) (k : Nat) (h : inputOK q k = true) : q = 1 + (k : ℚ) / 256 := by
  simp only [inputOK, band_eq, brec_not, Bool.and_eq_true, Bool.not_eq_true', Nat.beq_eq, raw_mul, raw_add] at h
  obtain ⟨hn, he⟩ := h
  have hnum : q.num = (iVal q.num : ℤ) := by
    cases h : q.num with
    | ofNat n => rfl
    | negSucc n => rw [h, iNeg_negSucc] at hn; exact absurd hn (by decide)
  have hden : (0 : ℚ) < q.den := by exact_mod_cast q.den_pos
  conv_lhs => rw [← Rat.num_div_den q]
  rw [hnum]
  have : ((iVal q.num * 256 : Nat) : ℚ) = (((256 + k) * q.den : Nat) : ℚ) := by exact_mod_cast he
  push_cast at this ⊢
  rw [div_eq_iff hden.ne']
  linarith

/-- Every grid index passes a Boolean test. -/
theorem forall_fin_of_allBelow (p : Fin 256 → Prop) (f : Nat → Bool) (h : allBelow f 256 = true)
    (hf : ∀ i : Fin 256, f i.val = true → p i) : ∀ i : Fin 256, p i :=
  fun i => hf i (allBelow_sound f 256 h i.val i.isLt)

/-- `(z : ℚ)/2^60 = q`, checked by decoding `q` at scale `2^60`. -/
def intOK (z : ℤ) (q : ℚ) : Bool :=
  band (qOK S60 q)
    (Int.rec (fun n => band (Bool.rec true false (qNeg q)) (Nat.beq n (qMag S60 q)))
      (fun n => band (qNeg q) (Nat.beq (Nat.add n 1) (qMag S60 q))) z)

theorem intOK_sound (z : ℤ) (q : ℚ) (h : intOK z q = true) : (z : ℚ) / ((2 ^ 60 : Nat) : ℚ) = q := by
  unfold intOK at h
  rw [band_eq, Bool.and_eq_true] at h
  obtain ⟨hok, hz⟩ := h
  have hq := qdec S60 S60_pos q hok
  have h60 : ((2 ^ 60 : Nat) : ℚ) = (S60 : ℚ) := by unfold S60; norm_num
  rw [h60, hq]
  cases z with
  | ofNat n =>
    have hz' : band (Bool.rec true false (qNeg q)) (Nat.beq n (qMag S60 q)) = true := hz
    simp only [band_eq, brec_not, Bool.and_eq_true, Bool.not_eq_true', Nat.beq_eq] at hz'
    rw [hz'.1, hz'.2]; simp
  | negSucc n =>
    have hz' : band (qNeg q) (Nat.beq (Nat.add n 1) (qMag S60 q)) = true := hz
    simp only [band_eq, Bool.and_eq_true, Nat.beq_eq, raw_add] at hz'
    rw [hz'.1, ← hz'.2]; simp [Int.negSucc_eq]

end

end MatrixBounds.Numeric.FKLLog
