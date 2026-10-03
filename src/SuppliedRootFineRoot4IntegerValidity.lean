module

public import RootFineIntegerPools

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete source probability laws validate sparse root integer mixture and pool checks. -/
namespace MatrixBounds.Numeric.SuppliedRootFineRoot4Integers

open Tensor.CW
open scoped BigOperators
noncomputable section
set_option exponentiation.threshold 1000

/-- Every complete original root integer law represents its exact rational orbit mass. -/
theorem numerator_rational (child : ShapeAlphabet 16) (axis : Fin 3) (orbit : Fin 231) :
    (numerator child axis orbit : ℚ)/(2:ℚ)^406 = SuppliedHigherOrbitMass.root4 child axis orbit := by
  rw [numerator_value, SuppliedRootFineFastArithmetic.root4_eq, SuppliedRootFineArithmetic.root4_eq]

/-- Every complete original root integer orbit numerator is nonnegative. -/
theorem numerator_nonnegative (child : ShapeAlphabet 16) (axis : Fin 3) (orbit : Fin 231) :
    0 ≤ numerator child axis orbit := by
  have nonnegative := (SuppliedHigherOrbitMass.root4_valid child axis).1 orbit
  rw [← numerator_rational] at nonnegative
  have positive : (0:ℚ) < (2:ℚ)^406 := by positivity
  have integerNonnegative := mul_nonneg nonnegative positive.le
  rw [div_mul_cancel₀ _ positive.ne'] at integerNonnegative
  exact_mod_cast integerNonnegative

/-- Every complete root integer orbit vector totals its exact common denominator. -/
theorem numerator_normalized (child : ShapeAlphabet 16) (axis : Fin 3) :
    ∑ orbit, numerator child axis orbit = (2:ℤ)^406 := by
  have rationalTotal := (SuppliedHigherOrbitMass.root4_valid child axis).2
  simp_rw [← numerator_rational] at rationalTotal
  rw [← Finset.sum_div] at rationalTotal
  have nonzero : (2:ℚ)^406 ≠ 0 := by positivity
  have integerTotal := (div_eq_iff nonzero).mp rationalTotal
  simp only [one_mul] at integerTotal
  exact_mod_cast integerTotal

end
end MatrixBounds.Numeric.SuppliedRootFineRoot4Integers
