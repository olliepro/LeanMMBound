module

public import SuppliedRootFineParent3Integers

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete integer convolutions can be evaluated on finite source columns.
The reindexing theorem avoids reducing the dependent shape alphabet in checks. -/
namespace MatrixBounds.Numeric

open Tensor.CW
open scoped BigOperators
noncomputable section

/-- Reindex a complete integer parent convolution through an explicit finite column enumeration. -/
theorem integerParentNumerator_enumeration {I C P : Type*} [Fintype I] {n : ℕ}
    (enumeration : Fin n ≃ I) (weight : I → ℕ) (complement : I → I)
    (parentSize : P → ℕ) (columns : P → C × C) (wordScale : C → ℕ)
    (mass : I → C → ℤ) (orbit : P) :
    integerParentNumerator weight complement parentSize columns wordScale mass orbit =
      integerParentNumerator (fun column => weight (enumeration column))
        (fun column => enumeration.symm (complement (enumeration column)))
        parentSize columns wordScale (fun column => mass (enumeration column)) orbit := by
  unfold integerParentNumerator
  rw [← enumeration.sum_comp]
  simp only [Equiv.apply_symm_apply]

/-- An actual checked split reads exactly the original sparse source column numerator. -/
theorem checkedSplit_numerator_column {length denominator : ℕ}
    (row : SplitRow) (checked : row.check denominator = true)
    (total : row.childTotal = 2*length) (column : Fin (shapes (2*length)).length) :
    (RationalSplit.ofChecked row checked total).numerator (shapeColumnEquiv (2*length) column) =
      row.row.atColumn column.val := by
  change row.massAt ((shapes (2*length))[column.val]) = _
  have support : ∀ entry ∈ row.row.entries, entry.1 < (shapes row.childTotal).length := by
    intro entry present
    rw [← (SplitRow.check_sound checked).2.1]
    exact (DyadicRow.check_sound (SplitRow.check_sound checked).1).1 entry present
  have identity := SplitRow.massAt_column row ⟨column.val, by simpa only [total] using column.isLt⟩ support
  simpa only [total] using identity

end
end MatrixBounds.Numeric
