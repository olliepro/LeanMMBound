import SuppliedRootFineChild3Integers

/-! The complete supplied eight-letter parent laws have exact integer numerators at denominator 2^406. -/
namespace MatrixBounds.Numeric.SuppliedRootFineParent4Integers

set_option exponentiation.threshold 1000

open Tensor.CW
noncomputable section

/-- Exact integer correction for every verified four-letter orbit cardinality. -/
def wordScale (orbit : Fin 21) : ℕ := 8/OrbitLevel3.sizes orbit

/-- The verified corrections turn every child orbit mass into its complete word mass. -/
theorem wordScale_checked (orbit : Fin 21) : wordScale orbit*OrbitLevel3.sizes orbit = 8 :=
  (by decide +kernel : ∀ orbit : Fin 21, wordScale orbit*OrbitLevel3.sizes orbit = 8) orbit

/-- Complete original eight-letter parent convolution on all source child coordinates. -/
def numerator (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  let split := SuppliedTypedParameters.level4Split parent
  SuppliedRootFineParent3Integers.sparseIntegerParent split.numerator
    (complementEquiv split.parent 8 split.balanced) OrbitLevel4.sizes OrbitLevel4.encoding.columns
    wordScale (fun child => SuppliedRootFineChild3Integers.numerator parent child axis) orbit

/-- The exact parent integer numerator represents the actual full eight-letter rational law. -/
theorem numerator_value (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    (numerator parent axis orbit : ℚ)/(2:ℚ)^406 =
      SuppliedRootFineFastArithmetic.parent4 parent axis orbit := by
  let split := SuppliedTypedParameters.level4Split parent
  have identity := integerParentNumerator_value split.numerator
    (complementEquiv split.parent 8 split.balanced) OrbitLevel3.sizes OrbitLevel4.sizes
    OrbitLevel4.encoding.columns wordScale
    (fun child => SuppliedRootFineChild3Integers.numerator parent child axis)
    17592186044416 (2^178) 8 (by decide) (by positivity) (by decide) wordScale_checked orbit
  simp only [Nat.cast_ofNat, Nat.cast_pow] at identity
  have denominator : (17592186044416:ℚ)*((2:ℚ)^178*8)^2 = (2:ℚ)^406 := by norm_num
  rw [denominator] at identity
  simp only [OrbitArithmetic.parentMass] at identity
  simp_rw [SuppliedRootFineChild3Integers.numerator_value] at identity
  simpa only [numerator, SuppliedRootFineParent3Integers.sparseIntegerParent_eq,
    SuppliedRootFineFastArithmetic.parent4, SuppliedRootFineArithmetic.sparseParent_eq,
    OrbitArithmetic.parentMass, split] using identity

end
end MatrixBounds.Numeric.SuppliedRootFineParent4Integers
