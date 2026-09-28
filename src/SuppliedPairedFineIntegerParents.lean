import SuppliedPairedFinePoolArithmetic
import SuppliedRootFineParent4Integers

/-! Original complete parent entropies may be read from verified integer hierarchy caches. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 4000000

/-- All level-three parent coordinates retain their original node, strategy, axis, and orbit. -/
abbrev ParentValues3 := Fin 945 → Fin 6 → Fin 3 → Fin 21 → ℤ

/-- All level-four parent coordinates retain their original source, axis, and orbit. -/
abbrev ParentValues4 := Fin 105 → Fin 3 → Fin 231 → ℤ

/-- Exact four-letter parent entropy at its complete integer denominator. -/
def parentExpression3 (parents : ParentValues3) (source : SuppliedStage3.Source)
    (role : AxisOrder) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression
    (fun orbit => (parents source.1 source.2 (role.permutation (physicalAxis axis)) orbit : ℚ)/(2:ℚ)^134)
    OrbitLevel3.sizes

/-- Exact eight-letter parent entropy at its complete integer denominator. -/
def parentExpression4 (parents : ParentValues4) (source : SuppliedStage4.Source)
    (role : AxisOrder) (axis : Fin 2) : RationalLogExpression :=
  orbitEntropyExpression
    (fun orbit => (parents source (role.permutation (physicalAxis axis)) orbit : ℚ)/(2:ℚ)^406)
    OrbitLevel4.sizes

/-- Every verified four-letter parent integer has its original full physical parent entropy. -/
theorem parentExpression3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (parentExpression3 parents source role axis) =
      entropy ((SuppliedStage3.split source role).parentLaw
        (SuppliedStage3.law source role (physicalAxis axis))) := by
  rw [SuppliedStage3.parent_center]
  simp only [parentExpression3, sourceEq, SuppliedRootFineParent3Integers.numerator_value,
    SuppliedRootFineFastArithmetic.parent3_eq, SuppliedRootFineArithmetic.parent3_eq]
  have identity := SuppliedLeafOrbitMass.parent3_entropy source.1 source.2
    (role.permutation (physicalAxis axis))
  simpa only [funext OrbitLevel3.sizes_correct] using identity

/-- Every verified eight-letter parent integer has its original full physical parent entropy. -/
theorem parentExpression4_value (parents : ParentValues4)
    (sourceEq : ∀ source axis orbit, parents source axis orbit =
      SuppliedRootFineParent4Integers.numerator source axis orbit)
    (source : SuppliedStage4.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (parentExpression4 parents source role axis) =
      entropy ((SuppliedStage4.split source role).parentLaw
        (SuppliedStage4.law source role (physicalAxis axis))) := by
  rw [SuppliedStage4.parent_center]
  simp only [parentExpression4, sourceEq, SuppliedRootFineParent4Integers.numerator_value,
    SuppliedRootFineFastArithmetic.parent4_eq, SuppliedRootFineArithmetic.parent4_eq]
  have identity := SuppliedHigherOrbitMass.parent4_entropy source (role.permutation (physicalAxis axis))
  simpa only [funext OrbitLevel4.sizes_correct] using identity

/-- Paired level-three fine expression with only the complete parent entropy cached. -/
def parentReplacement3 (parents : ParentValues3) (source : SuppliedStage3.Source)
    (role : AxisOrder) (axis : Fin 2) : RationalLogExpression :=
  expressionWithParent (SuppliedStage3.split source role) OrbitLevel2.orbits
    (mass3 source role axis) (actualClass axis) (sectorEnumeration 4)
    (parentExpression3 parents source role axis)

/-- Paired level-four fine expression with only the complete parent entropy cached. -/
def parentReplacement4 (parents : ParentValues4) (source : SuppliedStage4.Source)
    (role : AxisOrder) (axis : Fin 2) : RationalLogExpression :=
  expressionWithParent (SuppliedStage4.split source role) OrbitLevel3.orbits
    (mass4 source role axis) (actualClass axis) (sectorEnumeration 8)
    (parentExpression4 parents source role axis)

/-- The cached level-three parent leaves every original child compatibility constraint intact. -/
theorem parentReplacement3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (source : SuppliedStage3.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (parentReplacement3 parents source role axis) =
      rationalLogValue (sourceExpression3 source role axis) := by
  rw [sourceExpression3_value]
  exact expressionWithParent_value (SuppliedStage3.split source role) OrbitLevel2.orbits
    (mass3 source role axis) (actualClass axis) (sectorEnumeration 4)
    (parentExpression3 parents source role axis)
    (parentExpression3_value parents sourceEq source role axis)

/-- The cached level-four parent leaves every original child compatibility constraint intact. -/
theorem parentReplacement4_value (parents : ParentValues4)
    (sourceEq : ∀ source axis orbit, parents source axis orbit =
      SuppliedRootFineParent4Integers.numerator source axis orbit)
    (source : SuppliedStage4.Source) (role : AxisOrder) (axis : Fin 2) :
    rationalLogValue (parentReplacement4 parents source role axis) =
      rationalLogValue (sourceExpression4 source role axis) := by
  rw [sourceExpression4_value]
  have decoded : (fun child => OrbitLevel3.orbits.decode
      (fun orbit => (mass4 source role axis child orbit : ℝ))) =
      SuppliedStage4.law source role (physicalAxis axis) := by
    funext child
    exact (SuppliedHigherOrbitMass.child3_decode source _ _).symm
  have identity := expressionWithParent_value (SuppliedStage4.split source role) OrbitLevel3.orbits
    (mass4 source role axis) (actualClass axis) (sectorEnumeration 8)
    (parentExpression4 parents source role axis)
  rw [decoded] at identity
  exact identity (parentExpression4_value parents sourceEq source role axis)

end
end MatrixBounds.Numeric.SuppliedPairedFine
