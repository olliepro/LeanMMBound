import WeightedSectorAllocation
import CWRationalPopulation

/-! A fixed extra power of the supplied denominator clears each successive
population allocation without rounding or assumptions about asymptotic sizes. -/
namespace MatrixBounds.Numeric.DyadicPopulationArithmetic

open Tensor Tensor.CW Interface
noncomputable section

/-- The common denominator of every supplied probability distribution. -/
def denominator : ℕ := 17592186044416

/-- Integer population with the specified number of denominator powers still available. -/
def scaled (depth numerator : ℕ) : ℕ := denominator^depth*numerator

/-- One rational allocation removes exactly one reserve denominator power. -/
theorem divide_scaled (depth numerator : ℕ) :
    scaled (depth+1) numerator/denominator = scaled depth numerator := by
  unfold scaled
  rw [pow_succ]
  have rearrange : denominator^depth*denominator*numerator = (denominator^depth*numerator)*denominator := by ring
  rw [rearrange, Nat.mul_div_cancel _ (by decide : 0 < denominator)]

/-- Every positive reserve depth is exactly divisible by the source denominator. -/
theorem scaled_divisible (depth numerator : ℕ) : denominator ∣ scaled (depth+1) numerator := by
  unfold scaled
  exact dvd_mul_of_dvd_left (dvd_pow_self denominator (by omega)) numerator

/-- An allocated source row gives the exact fixed integer child coefficient. -/
theorem allocate_scaled {T : Type*} (depth numerator : ℕ) (allocation : T → ℕ) (label : T) :
    allocatedWeight (scaled (depth+1) numerator) denominator allocation label =
      scaled depth (numerator*allocation label) := by
  unfold allocatedWeight
  rw [divide_scaled]
  unfold scaled
  ring

/-- Paired splitting has the exact doubled source mass and consumes one denominator power. -/
theorem child_scaled {length : ℕ} (split : RationalSplit length denominator)
    (depth numerator : ℕ) (child : ShapeAlphabet (2*length)) :
    split.childWeight (scaled (depth+1) numerator) child =
      scaled depth (2*numerator*split.numerator child) := by
  unfold RationalSplit.childWeight
  rw [divide_scaled]
  unfold scaled
  ring

/-- Dividing a reserved population by the common root scale recovers exactly its rational source coefficient. -/
theorem normalized_scaled (depth consumed numerator : ℕ) :
    (scaled depth numerator : ℚ)/(denominator^(depth+consumed) : ℕ) =
      (numerator : ℚ)/(denominator^consumed : ℕ) := by
  have nonzero : (denominator : ℚ) ≠ 0 := by norm_num [denominator]
  simp only [scaled, Nat.cast_mul, Nat.cast_pow, pow_add]
  field_simp

end
end MatrixBounds.Numeric.DyadicPopulationArithmetic
