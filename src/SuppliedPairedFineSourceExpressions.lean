module

public import SuppliedPathStages
public import SuppliedHigherOrbitMass
public import OrbitLogExpressions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete exact fine-axis source expressions for the original paired stages. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 4000000

/-- The two fine extraction rates occupy physical output axes Y and Z. -/
def physicalAxis (axis : Fin 2) : Fin 3 := axis.succ

/-- Actual asymmetric compatibility classes preserve forced children as separate labels. -/
def actualClass {total : ℕ} (axis : Fin 2) : ShapeAlphabet total → CompatibilityClass total :=
  if axis = 0 then yClass else zClass

/-- Enumerate every singleton and pooled compatibility sector at its original shape column. -/
def sectorEnumeration (total : ℕ) :
    Fin ((shapes total).length + (total+1)) ≃ CompatibilityClass total :=
  finSumFinEquiv.symm.trans (Equiv.sumCongr (shapeColumnEquiv total) (Equiv.refl _))

/-- Complete original two-letter orbit masses in the selected physical extraction role. -/
def mass3 (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2)
    (child : ShapeAlphabet 4) : Fin 6 → ℚ :=
  SuppliedLeafLaws.mass source.1 source.2 ((shapeAlphabetPermutation role.permutation 4).symm child)
    (role.permutation (physicalAxis axis))

/-- Complete original four-letter orbit masses in the selected physical extraction role. -/
def mass4 (source : SuppliedStage4.Source) (role : AxisOrder) (axis : Fin 2)
    (child : ShapeAlphabet 8) : Fin 21 → ℚ :=
  SuppliedHigherOrbitMass.child3 source ((shapeAlphabetPermutation role.permutation 8).symm child)
    (role.permutation (physicalAxis axis))

/-- Exact paired level-three fine retention, retaining every original compatibility sector. -/
def sourceExpression3 (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    RationalLogExpression :=
  splitFineRetentionExpression (SuppliedStage3.split source role) OrbitLevel3.encoding
    OrbitLevel2.orbits (mass3 source role axis) (actualClass axis) (sectorEnumeration 4)

/-- Exact paired level-four fine retention, retaining every original compatibility sector. -/
def sourceExpression4 (source : SuppliedStage4.Source) (role : AxisOrder) (axis : Fin 2) :
    RationalLogExpression :=
  splitFineRetentionExpression (SuppliedStage4.split source role) OrbitLevel4.encoding
    OrbitLevel3.orbits (mass4 source role axis) (actualClass axis) (sectorEnumeration 8)

/-- The exact source expression is the complete actual level-three tensor-extraction fine rate. -/
theorem sourceExpression3_value (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (sourceExpression3 source role axis) =
      (SuppliedStage3.split source role).fineRetention (actualClass axis)
        (SuppliedStage3.law source role (physicalAxis axis)) := by
  exact splitFineRetentionExpression_value (SuppliedStage3.split source role) OrbitLevel3.encoding
    OrbitLevel2.orbits (mass3 source role axis) (actualClass axis) (sectorEnumeration 4)

/-- The exact source expression is the complete actual level-four tensor-extraction fine rate. -/
theorem sourceExpression4_value (source : SuppliedStage4.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (sourceExpression4 source role axis) =
      (SuppliedStage4.split source role).fineRetention (actualClass axis)
        (SuppliedStage4.law source role (physicalAxis axis)) := by
  have identity := splitFineRetentionExpression_value (SuppliedStage4.split source role) OrbitLevel4.encoding
    OrbitLevel3.orbits (mass4 source role axis) (actualClass axis) (sectorEnumeration 8)
  have decoded : (fun child => OrbitLevel3.orbits.decode (fun orbit => (mass4 source role axis child orbit : ℝ))) =
      SuppliedStage4.law source role (physicalAxis axis) := by
    funext child
    exact (SuppliedHigherOrbitMass.child3_decode source _ _).symm
  rw [decoded] at identity
  exact identity

end
end MatrixBounds.Numeric.SuppliedPairedFine
