module

public import FKLHier4.Static
public import FKLHier3.ParAll
public import FKLHier3.LeafAll
public import FKLFine3.Par3
public import FKLFine3.Weight3
public import FKLBridge.Idx.NodeLookup
public import FKLBridge.Idx.DyadicZero3
public import RootFineCachedParent4
public import SuppliedRootFineParent3IntegerValidity
public import FKLFine3.Bounds3
public import FKL.Pack
public import FKL.Range

/-! Level-four child numerators (`RootFineCachedParent4.child` at denominator `2^178`) computed from the
verified level-three parent table, the node lookup and the zero-coordinate rows. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL FKLHier3 FKLFine3 Tensor Tensor.CW
open scoped BigOperators

theorem beq_false {a b : ℕ} (h : a ≠ b) : Nat.beq a b = false := by
  cases hb : Nat.beq a b
  · rfl
  · exact absurd (Nat.eq_of_beq_eq_true hb) h

theorem ble_false {a b : ℕ} (h : ¬ a ≤ b) : Nat.ble a b = false := by
  cases hb : Nat.ble a b
  · rfl
  · exact absurd (Nat.ble_eq.mp hb) h

/-- Raw conjunction `f 0 && … && f (n-1)`. -/
def allN (n : ℕ) (f : ℕ → Bool) : Bool := Nat.rec (motive := fun _ => Bool) true (fun i acc => Bool.and acc (f i)) n

theorem allN_sound (f : ℕ → Bool) : ∀ n, allN n f = true → ∀ i < n, f i = true := by
  intro n
  induction n with
  | zero => intro _ i hi; omega
  | succ n ih =>
    intro h i hi
    have h' : allN n f = true ∧ f n = true := by simpa [allN] using h
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
    · exact ih h'.1 i hlt
    · exact h'.2

theorem packN_lt (W : ℕ) : ∀ (m : ℕ) (f : ℕ → ℕ), (∀ o < m, f o < 2 ^ W) → packN W m f < 2 ^ (W * m) := by
  intro m
  induction m with
  | zero => intro f _; simp [packN_eq]
  | succ m ih =>
    intro f hf
    have h1 := ih f (fun o ho => hf o (by omega))
    have h2 := hf m (by omega)
    rw [packN_eq] at h1 ⊢
    rw [Finset.sum_range_succ]
    calc (∑ i ∈ Finset.range m, f i * 2 ^ (W * i)) + f m * 2 ^ (W * m)
        < 2 ^ (W * m) + f m * 2 ^ (W * m) := by omega
      _ = (f m + 1) * 2 ^ (W * m) := by ring
      _ ≤ 2 ^ W * 2 ^ (W * m) := Nat.mul_le_mul_right _ h2
      _ = 2 ^ (W * (m + 1)) := by rw [← pow_add]; ring_nf

/-- `packN W 231 f` built as `11 × 21` nested packs (linear instead of quadratic intermediate sizes). -/
noncomputable def packN2 (W : ℕ) (f : ℕ → ℕ) : ℕ :=
  packN (Nat.mul 21 W) 11 (fun i => packN W 21 (fun j => f (Nat.add (Nat.mul 21 i) j)))

theorem packN2_eq (W : ℕ) (f : ℕ → ℕ) : packN2 W f = packN W 231 f := by
  unfold packN2
  simp only [packN_eq, raw_add, raw_mul]
  rw [show (231 : ℕ) = 11 * 21 from rfl, sum_range_mul]
  apply Finset.sum_congr rfl; intro i _
  rw [Finset.sum_mul]
  apply Finset.sum_congr rfl; intro j _
  rw [show i * 21 + j = 21 * i + j by ring, mul_assoc, ← pow_add]
  congr 2; ring

/-- Hierarchy grid code of parent `p` and child column `c` (0 absent, `1…945` positive, `946…` zero). -/
noncomputable def code (p c : ℕ) : ℕ := ptGet FKLBridge.Idx.NodeLookup.tree 7 11 (Nat.add (Nat.mul p 45) c)

/-- Zero-coordinate level-three numerator `(zero3 z).numerator o`. -/
noncomputable def fZ3 (z o : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicZero3.tree 7 14 z) o

/-- Strategy mixture of the level-three parent table at node `n`. -/
noncomputable def fMix (n a o : ℕ) : ℕ :=
  sumN 6 (fun s => Nat.mul (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s) (parT n s a o))

/-- Oriented zero-coordinate child numerator. -/
noncomputable def fZero (z c a o : ℕ) : ℕ :=
  cond (Nat.beq a (zAx8 c)) (cond (Nat.beq o 0) 383123885216472214589586756787577295904684780545900544 0)
    (cond (Nat.beq a (pAx8 c)) (Nat.mul (fZ3 z o) 21778071482940061661655974875633165533184)
      (Nat.mul (fZ3 z (comp3 o)) 21778071482940061661655974875633165533184))

/-- Child numerator of parent `p`, column `c`, axis `a`, orbit `o`, at denominator `2^178`. -/
noncomputable def fChild (p c a o : ℕ) : ℕ :=
  (fun k => cond (Nat.beq k 0) 0
    (cond (Nat.ble k 945) (fMix (Nat.sub k 1) a o) (fZero (Nat.sub k 946) c a o))) (code p c)

theorem code_eq (p : Fin 105) (c : Fin 45) :
    code p c = (SuppliedNodeLookup.table.get (finProdFinEquiv (p, c))).val := by
  unfold code
  rw [FKLBridge.Idx.NodeLookup.get_eq]
  congr 1
  simp only [finProdFinEquiv_apply_val, raw_add, raw_mul]
  ring

theorem fZ3_eq (z : Fin 840) (o : Fin 21) : fZ3 z o = (SuppliedTypedParameters.zero3 z).numerator o := by
  have hw := (SuppliedTypedParameters.zero3 z).width_eq
  unfold fZ3
  rw [← FKLBridge.Idx.DyadicZero3.get_eq]
  rw [FKLBridge.Dyadic.cell_eq _ o (by
    change o.val < (SuppliedTypedParameters.zero3 z).row.width; rw [hw]; exact o.isLt)]
  rfl

theorem fMix_eq (n : Fin 945) (a : Fin 3) (o : Fin 21) :
    ((fMix n a o : ℕ) : ℤ) = SuppliedRootFineChild3Integers.mixed n a o := by
  unfold fMix SuppliedRootFineChild3Integers.mixed integerMixtureNumerator
  rw [sumN_eq, Nat.cast_sum, Finset.sum_range]
  apply Finset.sum_congr rfl
  intro s _
  rw [a3_eq n s, parT_eq n (leaf_all n n.isLt) (par_all n n.isLt) s a o, raw_mul, Nat.cast_mul, fPar_eq]

theorem fZero_eq (z : Fin 840) (c : Fin 45) (a : Fin 3) (o : Fin 21) :
    ((fZero z c a o : ℕ) : ℤ) = SuppliedRootFineChild3Integers.zero z (shape8 c) a o := by
  unfold fZero SuppliedRootFineChild3Integers.zero
  rw [zAx8_eq c, pAx8_eq c]
  simp only [cond_beq, raw_mul]
  by_cases h1 : a = SuppliedLeafLaws.zeroAxis (shape8 c)
  · have : a.val = (SuppliedLeafLaws.zeroAxis (shape8 c)).val := by rw [h1]
    simp only [this, ite_true, h1]
    by_cases h0 : o = 0
    · subst h0; norm_num
    · have : o.val ≠ 0 := fun h => h0 (Fin.ext h)
      simp [this, h0]
  · have : a.val ≠ (SuppliedLeafLaws.zeroAxis (shape8 c)).val := fun h => h1 (Fin.ext h)
    simp only [this, ite_false, h1]
    by_cases h2 : a = SuppliedLeafLaws.positiveAxis (shape8 c)
    · have : a.val = (SuppliedLeafLaws.positiveAxis (shape8 c)).val := by rw [h2]
      simp only [this, ite_true, h2]
      rw [fZ3_eq z o]; push_cast; norm_num
    · have : a.val ≠ (SuppliedLeafLaws.positiveAxis (shape8 c)).val := fun h => h2 (Fin.ext h)
      simp only [this, ite_false, h2]
      rw [comp3_eq o, fZ3_eq z (OrbitLevel3.complement o)]; push_cast; norm_num

theorem fChild_eq (p : Fin 105) (c : Fin 45) (a : Fin 3) (o : Fin 21) :
    ((fChild p c a o : ℕ) : ℤ) = RootFineCachedParent4.child SuppliedRootFineParent3Integers.numerator p c a o := by
  have hk := code_eq p c
  unfold fChild RootFineCachedParent4.child SuppliedNodeLookup.lookup SuppliedNodeLookup.decode
  rw [hk]
  generalize SuppliedNodeLookup.table.get (finProdFinEquiv (p, c)) = k
  beta_reduce
  by_cases h0 : k.val = 0
  · rw [dif_pos h0, h0]; rfl
  · have hb0 : Nat.beq k.val 0 = false := beq_false h0
    by_cases h1 : k.val ≤ 945
    · rw [dif_neg h0, dif_pos h1]
      have hb1 : Nat.ble k.val 945 = true := Nat.ble_eq.mpr h1
      rw [hb0, hb1, Bool.cond_false, Bool.cond_true]
      dsimp only
      rw [RootFineCachedParent4.mixed_eq _ (fun _ _ _ _ => rfl)]
      exact fMix_eq ⟨k.val - 1, by omega⟩ a o
    · rw [dif_neg h0, dif_neg h1]
      have hb1 : Nat.ble k.val 945 = false := ble_false h1
      rw [hb0, hb1, Bool.cond_false, Bool.cond_false]
      dsimp only
      rw [show (shapes 8)[c.val] = shape8 c from rfl, raw_sub]
      have hlt : k.val - 946 < 840 := by have := k.isLt; omega
      have e := fZero_eq ⟨k.val - 946, hlt⟩ c a o
      exact e

/-! ### The packed child table -/

/-- Packed child vector of parent `p` (lanes of 180 bits, index `(a*45+c)*21+o`). -/
noncomputable def childPack (p : ℕ) : ℕ :=
  packN 170100 3 (fun a => packN 3780 45 (fun c => packN 180 21 (fun o => fChild p c a o)))

/-! ### Bounds: every child numerator is at most `2^178` -/

theorem fPar_le (n : Fin 945) (s : Fin 6) (p : Fin 3) (o : Fin 21) : fPar n s p o ≤ 2 ^ 134 := by
  have h := fPar_eq n s p o
  rw [← SuppliedRootFineParent3Columns.numerator_eq] at h
  have hsum := SuppliedRootFineParent3Columns.numerator_normalized n s p
  have hle : SuppliedRootFineParent3Columns.numerator n s p o ≤ 2 ^ 134 := by
    rw [← hsum]
    exact Finset.single_le_sum (fun i _ => SuppliedRootFineParent3Columns.numerator_nonnegative n s p i)
      (Finset.mem_univ o)
  rw [← h] at hle
  exact_mod_cast hle

theorem fMix_le (n : Fin 945) (a : Fin 3) (o : Fin 21) : fMix n a o ≤ 2 ^ 178 := by
  unfold fMix
  rw [sumN_eq]
  have htot := (SuppliedTypedParameters.strategies n).numerator_total
  calc (∑ s ∈ Finset.range 6, Nat.mul (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s) (parT n s a o))
      ≤ ∑ s ∈ Finset.range 6, FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s * 2 ^ 134 := by
        apply Finset.sum_le_sum; intro s hs
        have hs' := Finset.mem_range.mp hs
        rw [raw_mul, parT_eq n (leaf_all n n.isLt) (par_all n n.isLt) ⟨s, hs'⟩ a o]
        exact Nat.mul_le_mul_left _ (fPar_le n ⟨s, hs'⟩ a o)
    _ = 17592186044416 * 2 ^ 134 := by
        rw [← Finset.sum_mul, Finset.sum_range (fun s => FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s)]
        simp only [a3_eq n]
        rw [htot]
    _ = 2 ^ 178 := by norm_num

theorem fZ3_le (z : Fin 840) (o : Fin 21) : fZ3 z o ≤ 17592186044416 := by
  rw [fZ3_eq]
  exact row_cell_le _ (SuppliedTypedParameters.zero3 z).accepted o

theorem fZero_le (z : Fin 840) (c a o : ℕ) (ho : o < 21) : fZero z c a o ≤ 2 ^ 178 := by
  have hoc : comp3 o < 21 := by rw [comp3_eq ⟨o, ho⟩]; exact (OrbitLevel3.complement ⟨o, ho⟩).isLt
  have e1 := fZ3_le z ⟨o, ho⟩
  have e2 := fZ3_le z ⟨comp3 o, hoc⟩
  unfold fZero
  simp only [cond_beq, raw_mul]
  split_ifs
  · norm_num
  · exact Nat.zero_le _
  · calc fZ3 z o * 21778071482940061661655974875633165533184 ≤ 17592186044416 * 21778071482940061661655974875633165533184 :=
          Nat.mul_le_mul_right _ e1
      _ = 2 ^ 178 := by norm_num
  · calc fZ3 z (comp3 o) * 21778071482940061661655974875633165533184 ≤ 17592186044416 * 21778071482940061661655974875633165533184 :=
          Nat.mul_le_mul_right _ e2
      _ = 2 ^ 178 := by norm_num

theorem fChild_le (p : Fin 105) (c : Fin 45) (a : ℕ) (ha : a < 3) (o : ℕ) (ho : o < 21) :
    fChild p c a o ≤ 2 ^ 178 := by
  have hk := code_eq p c
  unfold fChild
  rw [hk]
  generalize SuppliedNodeLookup.table.get (finProdFinEquiv (p, c)) = k
  beta_reduce
  by_cases h0 : k.val = 0
  · rw [h0]; exact Nat.zero_le _
  · rw [beq_false h0, Bool.cond_false]
    by_cases h1 : k.val ≤ 945
    · rw [Nat.ble_eq.mpr h1, Bool.cond_true]
      exact fMix_le ⟨k.val - 1, by omega⟩ ⟨a, ha⟩ ⟨o, ho⟩
    · rw [ble_false h1, Bool.cond_false, raw_sub]
      have hlt : k.val - 946 < 840 := by have := k.isLt; omega
      have e := fZero_le ⟨k.val - 946, hlt⟩ c a o ho
      exact e

end MatrixBounds.Numeric.FKLHier4
