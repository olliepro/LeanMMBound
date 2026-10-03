module

public import CertificateData.Part000
public import DyadicShapeData
public import CWRootRationalData
public import CWShapePermutations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied unrestricted-root distribution is instantiated on its actual
length-eight shape alphabet, including the verifier's physical X-Z-Y order. -/
namespace MatrixBounds.Numeric.CertifiedRoot

open Empirical Tensor.CW
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 4000000

/-- Exact root split row, the second deduplicated row of the supplied certificate. -/
def row : DyadicRow := CertificateData.Part000.rows[1]'(by decide)

/-- The supplied root row has the common exact dyadic normalization. -/
theorem row_checked : row.check 17592186044416 = true :=
  List.all_eq_true.mp CertificateData.Part000.rows_checked row (List.getElem_mem _)

/-- The row covers all 153 length-eight coarse shapes. -/
theorem row_width : row.width = (shapes 16).length := by decide

/-- Actual physical root numerators use the verifier's swap of Y and Z. -/
def numerator : ShapeAlphabet 16 → ℕ :=
  row.shapeNumerator 16 ∘ (shapeAlphabetPermutation (Equiv.swap 1 2) 16).symm

/-- The physical root numerators retain their exact total mass. -/
theorem numerator_total : (∑ child, numerator child) = 17592186044416 := by
  rw [← DyadicRow.shapeNumerator_total row_checked row_width]
  exact Equiv.sum_comp (shapeAlphabetPermutation (Equiv.swap 1 2) 16).symm (row.shapeNumerator 16)

/-- The actual unrestricted-root extraction data for the supplied distribution at any population. -/
def data (size : ℕ) : RootRestrictionData 8 :=
  RootRestrictionData.fromRational numerator 17592186044416 size

/-- Every divisible root population has a genuine graph reference for these supplied parameters. -/
theorem reference {size : ℕ} (divisible : 17592186044416 ∣ size) :
    Nonempty ((data size).PrescribedEdges (P := Fin size)) :=
  RootRestrictionData.fromRational_reference (length := 8) numerator numerator_total divisible

end
end MatrixBounds.Numeric.CertifiedRoot
