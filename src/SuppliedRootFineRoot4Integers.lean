import SuppliedRootFineParent4Integers

/-! Every complete original root child has an exact integer orbit law at denominator 2^406. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRoot4Integers

set_option exponentiation.threshold 1000

open Tensor.CW SuppliedLeafLaws
noncomputable section

/-- Complete original zero-coordinate root laws rescaled to the common parent denominator. -/
def zero (child : Fin 48) (shape : Shape) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  if axis = zeroAxis shape then if orbit = 0 then 2^406 else 0
  else if axis = positiveAxis shape then
    ((SuppliedTypedParameters.zero4 child).numerator orbit : ℤ)*2^362
  else ((SuppliedTypedParameters.zero4 child).numerator (OrbitLevel4.complement orbit) : ℤ)*2^362

/-- Every rescaled integer root-zero law equals its original exact rational orientation. -/
theorem zero_value (child : Fin 48) (shape : Shape) (axis : Fin 3) (orbit : Fin 231) :
    (zero child shape axis orbit : ℚ)/(2:ℚ)^406 = SuppliedHigherOrbitMass.zero4 child shape axis orbit := by
  simp only [zero, SuppliedHigherOrbitMass.zero4, TypedProbabilityRow.orientedOrbitMass, ite_apply]
  split_ifs <;> simp only [TypedProbabilityRow.rational, Int.cast_mul, Int.cast_natCast,
    Int.cast_pow, Int.cast_ofNat, Int.cast_zero, Nat.cast_ofNat]
  all_goals norm_num <;> ring

/-- All original positive and zero root children on the complete shape alphabet. -/
def numerator (child : ShapeAlphabet 16) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  match SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | Sum.inl selected => zero selected child.val axis orbit
  | Sum.inr selected => SuppliedRootFineParent4Integers.numerator selected axis orbit

/-- The complete original integer root law is exactly the actual supplied rational orbit law. -/
theorem numerator_value (child : ShapeAlphabet 16) (axis : Fin 3) (orbit : Fin 231) :
    (numerator child axis orbit : ℚ)/(2:ℚ)^406 = SuppliedRootFineFastArithmetic.root4 child axis orbit := by
  unfold numerator SuppliedRootFineFastArithmetic.root4
  cases kindCase : SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | inl selected => exact zero_value selected child.val axis orbit
  | inr selected => exact SuppliedRootFineParent4Integers.numerator_value selected axis orbit

end
end MatrixBounds.Numeric.SuppliedRootFineRoot4Integers
