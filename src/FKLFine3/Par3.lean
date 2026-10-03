module

public import FKLFine3.Leaf
public import FKLFine3.Split3
public import FKL.Build

/-! Fast level-three parent numerators by the exact sparse convolution of split weights and leaves. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- Parent numerator at denominator `2^134`. -/
noncomputable def fPar (n s p o : ℕ) : ℕ :=
  Nat.mul (sz3 o) (sumN 15 (fun c => (fun w => cond (Nat.beq w 0) 0
    (Nat.mul (Nat.mul w (Nat.mul (fLeaf n s c p (col1 o)) (wsc (col1 o))))
      (Nat.mul (fLeaf n s (fComp n s c) p (col2 o)) (wsc (col2 o))))) (fW n s c)))

theorem fPar_eq (n : Fin 945) (s : Fin 6) (p : Fin 3) (o : Fin 21) :
    ((fPar n s p o : ℕ) : ℤ) = SuppliedRootFineParent3Integers.numerator n s p o := by
  rw [← SuppliedRootFineParent3Columns.numerator_eq]
  unfold SuppliedRootFineParent3Columns.numerator SuppliedRootFineParent3Integers.sparseIntegerParent fPar
  obtain ⟨h1, h2⟩ := cols_eq o
  rw [raw_mul, sumN_eq, Nat.cast_mul, Nat.cast_sum, Finset.sum_range, sz3_eq o]
  congr 1
  apply Finset.sum_congr rfl
  intro c _
  rw [fW_eq n s c]
  by_cases hw : SuppliedRootFineParent3Columns.weight n s c = 0
  · simp [hw]
  · have hb : Nat.beq (SuppliedRootFineParent3Columns.weight n s c) 0 = false := by
      cases h : Nat.beq (SuppliedRootFineParent3Columns.weight n s c) 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) hw
    simp only [hb, Bool.cond_false, hw, if_false, raw_mul]
    have hc : fComp n s c = (SuppliedRootFineParent3Columns.complement n s c).val := fComp_eq n s c
    have e1 := fLeaf_eq n s c p (OrbitLevel3.encoding.columns o).1
    have e2 := fLeaf_eq n s (SuppliedRootFineParent3Columns.complement n s c) p (OrbitLevel3.encoding.columns o).2
    rw [hc, h1, h2]
    push_cast
    rw [e1, e2, wsc_eq, wsc_eq]

end MatrixBounds.Numeric.FKLFine3
