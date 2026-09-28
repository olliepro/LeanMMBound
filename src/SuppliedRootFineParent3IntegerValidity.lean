import SuppliedRootFineParent3Columns

/-! Actual parent probability laws provide integer nonnegativity and normalization for sparse checks. -/
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Columns

open scoped BigOperators
noncomputable section

/-- The finite-column integer parent numerator is the actual original rational orbit mass. -/
theorem numerator_rational (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    (numerator node strategy axis orbit : ℚ)/(2:ℚ)^134 =
      SuppliedLeafOrbitMass.parent3 node strategy axis orbit := by
  rw [numerator_eq, SuppliedRootFineParent3Integers.numerator_value,
    SuppliedRootFineFastArithmetic.parent3_eq, SuppliedRootFineArithmetic.parent3_eq]

/-- Every complete original parent integer numerator is nonnegative. -/
theorem numerator_nonnegative (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    0 ≤ numerator node strategy axis orbit := by
  have nonnegative := (SuppliedLeafOrbitMass.parent3_valid node strategy axis).1 orbit
  rw [← numerator_rational] at nonnegative
  have positive : (0:ℚ) < (2:ℚ)^134 := by positivity
  have integerNonnegative := mul_nonneg nonnegative positive.le
  rw [div_mul_cancel₀ _ positive.ne'] at integerNonnegative
  exact_mod_cast integerNonnegative

/-- The complete original parent integer vector has its exact common denominator as total. -/
theorem numerator_normalized (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    ∑ orbit, numerator node strategy axis orbit = (2:ℤ)^134 := by
  have rationalTotal := (SuppliedLeafOrbitMass.parent3_valid node strategy axis).2
  simp_rw [← numerator_rational] at rationalTotal
  rw [← Finset.sum_div] at rationalTotal
  have nonzero : (2:ℚ)^134 ≠ 0 := by positivity
  have integerTotal := (div_eq_iff nonzero).mp rationalTotal
  simp only [one_mul] at integerTotal
  exact_mod_cast integerTotal

end
end MatrixBounds.Numeric.SuppliedRootFineParent3Columns
