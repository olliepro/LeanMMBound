module

public import FKL.Table
public import CheckedIndexTable

/-! Generic links between `CheckedIndexTable` lookups and packed FKL tables.

`Reads T f off` says that every lookup of `T` agrees with the fast function `f`, shifted by `off`.
Leaves are linked by one packed-literal comparison (`FKL.packedEq`), appends by offset arithmetic,
so a whole table is linked by following its exact append tree. -/

@[expose] public section

namespace FKLBridge

open MatrixBounds.Numeric

/-- Every lookup of `T` equals the fast function `f` at offset `off`. -/
def Reads {n b : ℕ} (T : CheckedIndexTable n b) (f : ℕ → ℕ) (off : ℕ) : Prop :=
  ∀ i : Fin n, (T.get i).val = f (off + i.val)

/-- A packed constant equal to a table's entries links every lookup to its lanes. -/
theorem reads_of_entries {n b : ℕ} (T : CheckedIndexTable n b) (f : ℕ → ℕ) (off w d : ℕ)
    (h : FKL.packedEq w d T.entries = true) (hf : ∀ j < n, f (off + j) = FKL.lane d w j) :
    Reads T f off := by
  intro i
  rw [CheckedIndexTable.get_val, hf i.val i.isLt,
    FKL.lane_of_packedEq w d T.entries h i.val (by rw [T.length_eq]; exact i.isLt)]

/-- Links of two adjacent tables give the link of their concatenation. -/
theorem reads_append {l r b : ℕ} (A : CheckedIndexTable l b) (B : CheckedIndexTable r b)
    (f : ℕ → ℕ) (off off2 : ℕ) (hoff : off + l = off2) (hA : Reads A f off) (hB : Reads B f off2) :
    Reads (A.append B) f off := by
  intro i
  by_cases hi : i.val < l
  · have h := CheckedIndexTable.get_append_left A B ⟨i.val, hi⟩
    have e : (Fin.castAdd r ⟨i.val, hi⟩ : Fin (l + r)) = i := Fin.ext rfl
    rw [e] at h
    rw [h]
    exact hA _
  · have hj : i.val - l < r := by omega
    have h := CheckedIndexTable.get_append_right A B ⟨i.val - l, hj⟩
    have e : (Fin.natAdd l ⟨i.val - l, hj⟩ : Fin (l + r)) = i := Fin.ext (by simp only [Fin.val_natAdd]; omega)
    rw [e] at h
    rw [h, hB]
    congr 1
    simp only
    omega

/-- Lean lane-by-lane comparison of a packed constant with a list; `m` is the literal mask `2^w-1`.
A matching masked lane is automatically below `2^w`, so no separate bound test is needed. -/
def lanesEq (w m : ℕ) (l : List ℕ) : ℕ → Bool :=
  List.rec (motive := fun _ => ℕ → Bool) (fun d => Nat.beq d 0)
    (fun x _ rec d => Bool.and (Nat.beq (Nat.land d m) x) (rec (Nat.shiftRight d w))) l

theorem lanesEq_cons (w m x : ℕ) (xs : List ℕ) (d : ℕ) :
    lanesEq w m (x :: xs) d = Bool.and (Nat.beq (Nat.land d m) x) (lanesEq w m xs (Nat.shiftRight d w)) := rfl

theorem lanesEq_sound (w : ℕ) (l : List ℕ) : ∀ d, lanesEq w (2 ^ w - 1) l d = true →
    d = FKL.pack w l ∧ ∀ x ∈ l, x < 2 ^ w := by
  induction l with
  | nil => intro d h; simpa [lanesEq, FKL.pack] using h
  | cons x xs ih =>
    intro d h
    rw [lanesEq_cons] at h
    simp only [Bool.and_eq_true, Nat.beq_eq, FKL.raw_land] at h
    obtain ⟨hx, hrest⟩ := h
    obtain ⟨hd, hfit⟩ := ih _ hrest
    have hmod : d % 2 ^ w = x := by rw [← hx, Nat.and_two_pow_sub_one_eq_mod]
    refine ⟨?_, ?_⟩
    · rw [FKL.pack, ← hd, FKL.raw_shiftRight, Nat.shiftRight_eq_div_pow, ← hmod]
      exact (Nat.mod_add_div' d (2 ^ w)).symm
    · intro y hy
      rcases List.mem_cons.mp hy with rfl | hy
      · rw [← hmod]; exact Nat.mod_lt _ (Nat.two_pow_pos w)
      · exact hfit y hy

/-- A checked packed constant reads back every entry of its list. -/
theorem lane_of_lanesEq (w m d : ℕ) (l : List ℕ) (hm : m = 2 ^ w - 1) (h : lanesEq w m l d = true)
    (i : ℕ) (hi : i < l.length) : FKL.lane d w i = l[i] := by
  subst hm
  obtain ⟨hd, hfit⟩ := lanesEq_sound w l d h
  rw [hd]
  exact FKL.lane_pack w l hfit i hi

/-- Chunk `k` of a tree with `2^c`-lane chunks holds lanes `k*2^c …` of the fast table. -/
theorem ptGet_chunk (t : FKL.Tree) (c w k j : ℕ) (hj : j < 2 ^ c) :
    FKL.ptGet t c w (k * 2 ^ c + j) = FKL.lane (t.get k) w j := by
  rw [FKL.ptGet_eq]
  have hc : 0 < 2 ^ c := Nat.two_pow_pos c
  have hdiv : (k * 2 ^ c + j) / 2 ^ c = k := by
    rw [Nat.add_comm, Nat.add_mul_div_right _ _ hc, Nat.div_eq_of_lt hj, Nat.zero_add]
  have hmod : (k * 2 ^ c + j) % 2 ^ c = j := by
    rw [Nat.add_comm, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hj]
  rw [hdiv, hmod]

/-- One leaf checked by `FKL.packedEq`, stored as chunk `k` of the fast table. -/
theorem reads_chunk_packedEq (t : FKL.Tree) (c w k : ℕ) {n b : ℕ} (T : CheckedIndexTable n b) (off : ℕ)
    (hoff : off = k * 2 ^ c) (hn : n ≤ 2 ^ c) (h : FKL.packedEq w (t.get k) T.entries = true) :
    Reads T (FKL.ptGet t c w) off :=
  reads_of_entries T _ off w (t.get k) h (fun j hj => by
    rw [hoff]; exact ptGet_chunk t c w k j (by omega))

/-- One leaf checked by `lanesEq` (mask literal `m = 2^w-1`), stored as chunk `k` of the fast table. -/
theorem reads_chunk (t : FKL.Tree) (c w m k : ℕ) {n b : ℕ} (T : CheckedIndexTable n b) (off : ℕ)
    (hoff : off = k * 2 ^ c) (hn : n ≤ 2 ^ c) (hm : m = 2 ^ w - 1)
    (h : lanesEq w m T.entries (t.get k) = true) : Reads T (FKL.ptGet t c w) off := by
  intro i
  rw [CheckedIndexTable.get_val, hoff, ptGet_chunk t c w k i.val (by have := i.isLt; omega),
    lane_of_lanesEq w m (t.get k) T.entries hm h i.val (by rw [T.length_eq]; exact i.isLt)]

/-- Lane-by-lane test that the first `n` lanes all equal `x` and nothing follows (no list is built). -/
def lanesRep (w m x : ℕ) : ℕ → ℕ → Bool :=
  fun n => Nat.rec (motive := fun _ => ℕ → Bool) (fun d => Nat.beq d 0)
    (fun _ rec d => Bool.and (Nat.beq (Nat.land d m) x) (rec (Nat.shiftRight d w))) n

theorem lanesRep_eq (w m x : ℕ) : ∀ n d, lanesRep w m x n d = lanesEq w m (List.replicate n x) d := by
  intro n
  induction n with
  | zero => intro d; rfl
  | succ n ih =>
    intro d
    rw [List.replicate_succ, lanesEq_cons, ← ih]
    rfl

/-- A link at offset zero is the pointwise equality of lookups. -/
theorem reads_get {n b : ℕ} {T : CheckedIndexTable n b} {f : ℕ → ℕ} (h : Reads T f 0) (i : Fin n) :
    (T.get i).val = f i.val := by
  rw [h i, Nat.zero_add]

end FKLBridge
