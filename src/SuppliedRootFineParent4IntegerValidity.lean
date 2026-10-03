module

public import SuppliedRootFineParent4Integers

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete actual parent4 probability laws justify sparse independent integer-vector checks. -/
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Integers

open scoped BigOperators
noncomputable section
set_option exponentiation.threshold 1000

/-- Every integer parent4 numerator represents its exact complete original rational orbit mass. -/
theorem numerator_rational (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    (numerator parent axis orbit : ℚ)/(2:ℚ)^406 = SuppliedHigherOrbitMass.parent4 parent axis orbit := by
  rw [numerator_value, SuppliedRootFineFastArithmetic.parent4_eq, SuppliedRootFineArithmetic.parent4_eq]

/-- Every complete original parent4 integer orbit numerator is nonnegative. -/
theorem numerator_nonnegative (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    0 ≤ numerator parent axis orbit := by
  have nonnegative := (SuppliedHigherOrbitMass.parent4_valid parent axis).1 orbit
  rw [← numerator_rational] at nonnegative
  have positive : (0:ℚ) < (2:ℚ)^406 := by positivity
  have integerNonnegative := mul_nonneg nonnegative positive.le
  rw [div_mul_cancel₀ _ positive.ne'] at integerNonnegative
  exact_mod_cast integerNonnegative

/-- The complete original parent4 integer vector has total exactly2^406. -/
theorem numerator_normalized (parent : Fin 105) (axis : Fin 3) :
    ∑ orbit, numerator parent axis orbit = (2:ℤ)^406 := by
  have rationalTotal := (SuppliedHigherOrbitMass.parent4_valid parent axis).2
  simp_rw [← numerator_rational] at rationalTotal
  rw [← Finset.sum_div] at rationalTotal
  have nonzero : (2:ℚ)^406 ≠ 0 := by positivity
  have integerTotal := (div_eq_iff nonzero).mp rationalTotal
  simp only [one_mul] at integerTotal
  exact_mod_cast integerTotal

end
end MatrixBounds.Numeric.SuppliedRootFineParent4Integers
