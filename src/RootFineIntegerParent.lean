import SuppliedRootFineArithmetic

/-! Parent convolution may be checked by integer arithmetic at one common
binary denominator, then interpreted as the actual rational orbit masses. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Exact parent numerator with fixed integer expansion factors for child orbit sizes. -/
def integerParentNumerator {I C P : Type*} [Fintype I]
    (weight : I → ℕ) (complement : I → I) (parentSize : P → ℕ)
    (columns : P → C × C) (wordScale : C → ℕ) (mass : I → C → ℤ) (orbit : P) : ℤ :=
  parentSize orbit*∑ child, (weight child : ℤ)*
    (mass child (columns orbit).1*wordScale (columns orbit).1)*
    (mass (complement child) (columns orbit).2*wordScale (columns orbit).2)

/-- Integer child expansion is exactly division by the actual verified child orbit size. -/
theorem integerOrbitWord_value (mass : ℤ) (denominator expansion size wordScale : ℕ)
    (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (scaleCorrect : wordScale*size = expansion) :
    ((mass : ℚ)*wordScale)/(denominator*expansion) = ((mass : ℚ)/denominator)/size := by
  have denominatorNonzero : (denominator : ℚ) ≠ 0 := by exact_mod_cast denominatorPositive.ne'
  have expansionNonzero : (expansion : ℚ) ≠ 0 := by exact_mod_cast expansionPositive.ne'
  have sizePositive : 0 < size := by
    by_contra impossible
    have zero : size = 0 := by omega
    simp only [zero, mul_zero] at scaleCorrect
    omega
  have sizeNonzero : (size : ℚ) ≠ 0 := by exact_mod_cast sizePositive.ne'
  have scaleEquation : (wordScale : ℚ)*size = expansion := by exact_mod_cast scaleCorrect
  rw [div_div]
  apply (div_eq_div_iff (mul_ne_zero denominatorNonzero expansionNonzero)
    (mul_ne_zero denominatorNonzero sizeNonzero)).mpr
  calc
    _ = (mass : ℚ)*denominator*((wordScale : ℚ)*size) := by ring
    _ = _ := by rw [scaleEquation]; ring

/-- A complete integer convolution at the stated common denominator is the exact rational parent law. -/
theorem integerParentNumerator_value {I C P : Type*} [Fintype I]
    (weight : I → ℕ) (complement : I → I) (childSize : C → ℕ) (parentSize : P → ℕ)
    (columns : P → C × C) (wordScale : C → ℕ) (mass : I → C → ℤ)
    (weightDenominator childDenominator expansion : ℕ)
    (weightPositive : 0 < weightDenominator) (childPositive : 0 < childDenominator)
    (expansionPositive : 0 < expansion) (scaleCorrect : ∀ child, wordScale child*childSize child = expansion)
    (orbit : P) :
    (integerParentNumerator weight complement parentSize columns wordScale mass orbit : ℚ)/
      ((weightDenominator : ℚ)*((childDenominator : ℚ)*expansion)^2) =
      OrbitArithmetic.parentMass (fun child => (weight child : ℚ)/weightDenominator)
        complement childSize parentSize columns (fun child coordinate => (mass child coordinate : ℚ)/childDenominator) orbit := by
  have denominatorNonzero : (weightDenominator : ℚ) ≠ 0 := by exact_mod_cast weightPositive.ne'
  have childNonzero : (childDenominator : ℚ) ≠ 0 := by exact_mod_cast childPositive.ne'
  have expansionNonzero : (expansion : ℚ) ≠ 0 := by exact_mod_cast expansionPositive.ne'
  have word (child : I) (coordinate : C) := integerOrbitWord_value (mass child coordinate)
    childDenominator expansion (childSize coordinate) (wordScale coordinate)
    childPositive expansionPositive (scaleCorrect coordinate)
  unfold integerParentNumerator OrbitArithmetic.parentMass
  push_cast
  rw [mul_div_assoc]
  congr 1
  rw [Finset.sum_div]
  apply Finset.sum_congr rfl
  intro child _
  rw [← word child (columns orbit).1, ← word (complement child) (columns orbit).2]
  field_simp

end MatrixBounds.Numeric
