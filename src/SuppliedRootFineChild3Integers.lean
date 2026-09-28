import RootFineIntegerMixture
import SuppliedRootFineParent3Integers

/-! Complete actual four-letter child laws admit exact numerators at denominator 2^178. -/
namespace MatrixBounds.Numeric.SuppliedRootFineChild3Integers

open Tensor.CW SuppliedLeafLaws
noncomputable section

/-- All original strategy contributions to the four-letter child numerator. -/
def mixed (node : Fin 945) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  integerMixtureNumerator (SuppliedTypedParameters.strategies node).numerator
    (fun strategy => SuppliedRootFineParent3Integers.numerator node strategy axis) orbit

/-- Integer strategy mixing gives exactly the actual complete positive child law. -/
theorem mixed_value (node : Fin 945) (axis : Fin 3) (orbit : Fin 21) :
    (mixed node axis orbit : ℚ)/(2:ℚ)^178 = SuppliedRootFineFastArithmetic.mixed3 node axis orbit := by
  have identity := integerMixtureNumerator_value (SuppliedTypedParameters.strategies node).numerator
    (fun strategy => SuppliedRootFineParent3Integers.numerator node strategy axis)
    17592186044416 (2^134) orbit
  simp only [Nat.cast_ofNat, Nat.cast_pow] at identity
  have denominator : (17592186044416:ℚ)*(2:ℚ)^134 = (2:ℚ)^178 := by norm_num
  rw [denominator] at identity
  simp only [OrbitArithmetic.mixture] at identity
  simp_rw [SuppliedRootFineParent3Integers.numerator_value] at identity
  simpa only [mixed, SuppliedRootFineFastArithmetic.mixed3, OrbitArithmetic.mixture,
    TypedProbabilityRow.rational, Nat.cast_ofNat] using identity

/-- Complete original physical zero-child numerator, rescaled to the same denominator as positive children. -/
def zero (node : Fin 840) (shape : Shape) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  if axis = zeroAxis shape then if orbit = 0 then 2^178 else 0
  else if axis = positiveAxis shape then
    ((SuppliedTypedParameters.zero3 node).numerator orbit : ℤ)*2^134
  else ((SuppliedTypedParameters.zero3 node).numerator (OrbitLevel3.complement orbit) : ℤ)*2^134

/-- Every physical zero-child numerator has exactly the original rational orientation. -/
theorem zero_value (node : Fin 840) (shape : Shape) (axis : Fin 3) (orbit : Fin 21) :
    (zero node shape axis orbit : ℚ)/(2:ℚ)^178 = SuppliedHigherOrbitMass.zero3 node shape axis orbit := by
  simp only [zero, SuppliedHigherOrbitMass.zero3, TypedProbabilityRow.orientedOrbitMass, ite_apply]
  split_ifs <;> simp only [TypedProbabilityRow.rational, Int.cast_mul, Int.cast_natCast,
    Int.cast_pow, Int.cast_ofNat, Int.cast_zero, Nat.cast_ofNat]
  all_goals norm_num <;> ring

/-- All original positive, zero-coordinate, and absent hierarchy entries at one exact denominator. -/
def numerator (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  match SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => 0
  | some (Sum.inl node) => mixed node axis orbit
  | some (Sum.inr node) => zero node child.val axis orbit

/-- The complete integer child hierarchy equals every original rational child mass. -/
theorem numerator_value (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) (orbit : Fin 21) :
    (numerator parent child axis orbit : ℚ)/(2:ℚ)^178 =
      SuppliedRootFineFastArithmetic.child3 parent child axis orbit := by
  unfold numerator SuppliedRootFineFastArithmetic.child3
  cases lookupCase : SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => simp only [Int.cast_zero, zero_div]
  | some kind =>
    cases kind with
    | inl node => exact mixed_value node axis orbit
    | inr node => exact zero_value node child.val axis orbit

end
end MatrixBounds.Numeric.SuppliedRootFineChild3Integers
