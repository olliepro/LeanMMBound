import RootFineIntegerParent

/-! Integer strategy mixtures retain exact source coefficients at a common denominator. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- The full integer numerator of a source-weighted finite mixture. -/
def integerMixtureNumerator {I O : Type*} [Fintype I]
    (weight : I → ℕ) (mass : I → O → ℤ) (orbit : O) : ℤ :=
  ∑ index, (weight index : ℤ)*mass index orbit

/-- Integer mixing at the product denominator equals the exact rational source mixture. -/
theorem integerMixtureNumerator_value {I O : Type*} [Fintype I]
    (weight : I → ℕ) (mass : I → O → ℤ) (weightDenominator massDenominator : ℕ) (orbit : O) :
    (integerMixtureNumerator weight mass orbit : ℚ)/(weightDenominator*massDenominator) =
      OrbitArithmetic.mixture (fun index => (weight index : ℚ)/weightDenominator)
        (fun index coordinate => (mass index coordinate : ℚ)/massDenominator) orbit := by
  simp only [integerMixtureNumerator, OrbitArithmetic.mixture, Int.cast_sum,
    Int.cast_mul, Int.cast_natCast, Finset.sum_div, mul_div_mul_comm]

end MatrixBounds.Numeric
