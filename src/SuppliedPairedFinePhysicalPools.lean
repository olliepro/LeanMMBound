module

public import SuppliedPairedFinePoolArithmetic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Physical paired pools can use original child columns without merging any labelled sector. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
noncomputable section
set_option maxRecDepth 3000

/-- Original child columns map bijectively to the actual physically permuted children. -/
def physicalChildren (total : ℕ) (role : AxisOrder) :
    Fin (shapes total).length ≃ ShapeAlphabet total :=
  (shapeColumnEquiv total).trans (shapeAlphabetPermutation role.permutation total)

/-- Singleton sectors retain original source columns, while pooled sectors retain physical coordinates. -/
def physicalSectors (total : ℕ) (role : AxisOrder) :
    Fin ((shapes total).length + (total+1)) ≃ CompatibilityClass total :=
  finSumFinEquiv.symm.trans (Equiv.sumCongr (physicalChildren total role) (Equiv.refl _))

/-- Every original column has its complete separate physical compatibility label. -/
def physicalLabel (total : ℕ) (role : AxisOrder) (axis : Fin 2)
    (column : Fin (shapes total).length) : Fin ((shapes total).length + (total+1)) :=
  (physicalSectors total role).symm (actualClass axis (physicalChildren total role column))

/-- Pulling columns through a physical role preserves the original complete labelled pool. -/
theorem permutedColumnPool_eq {length denominator columns children sectors : ℕ}
    (split : RationalSplit length denominator)
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (axes : Equiv.Perm (Fin 3))
    (childrenEquiv : Fin columns ≃ ShapeAlphabet (2*length))
    (sectorEquiv : Fin sectors ≃ CompatibilityClass (2*length))
    (sector : Fin sectors) (orbit : Fin children) :
    columnPool (fun column => (split.numerator (childrenEquiv column) : ℚ)/denominator)
      (fun column => mass (childrenEquiv column))
      (fun column => sectorEquiv.symm
        (axisClass (shapeAlphabetPermutation axes (2*length) (childrenEquiv column)))) sector orbit =
      splitPoolMass (split.permute axes)
        (fun child => mass ((shapeAlphabetPermutation axes (2*length)).symm child))
        axisClass (sectorEquiv sector) orbit := by
  have identity := columnPool_eq (split.permute axes)
    (fun child => mass ((shapeAlphabetPermutation axes (2*length)).symm child)) axisClass
    (childrenEquiv.trans (shapeAlphabetPermutation axes (2*length))) sectorEquiv sector orbit
  simpa only [RationalSplit.permute, Function.comp_apply, Equiv.trans_apply,
    Equiv.symm_apply_apply] using identity

end
end MatrixBounds.Numeric.SuppliedPairedFine
