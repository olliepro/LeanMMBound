import RationalIntervalOperations
import Mathlib.Data.Rat.Floor

/-! Deterministic outward rounding keeps every intermediate rational interval
on a fixed denominator without adding external numerical assumptions. -/
namespace MatrixBounds.Numeric

/-- Round both endpoints outward to integer multiples of the reciprocal of a fixed positive scale. -/
def Interval.round (bounds : Interval) (scale : ℕ) : Interval :=
  ⟨(Int.floor (bounds.lower*scale) : ℚ)/scale, (Int.ceil (bounds.upper*scale) : ℚ)/scale⟩

/-- Exact floor and ceiling guarantee that the rounded interval includes the complete original interval. -/
theorem Interval.round_encloses (bounds : Interval) {scale : ℕ} (positive : 0 < scale) :
    (bounds.round scale).encloses bounds = true := by
  have positiveRat : (0 : ℚ) < scale := by exact_mod_cast positive
  simp only [encloses, round, decide_eq_true_eq]
  constructor
  · rw [div_le_iff₀ positiveRat]
    exact Int.floor_le _
  · rw [le_div_iff₀ positiveRat]
    exact Int.le_ceil _

/-- Deterministic fixed-denominator rounding preserves the real quantity enclosed by the original interval. -/
theorem Interval.round_sound {bounds : Interval} {value : ℝ} {scale : ℕ}
    (positive : 0 < scale) (inside : bounds.Contains value) : (bounds.round scale).Contains value :=
  Interval.encloses_sound (bounds.round_encloses positive) inside

end MatrixBounds.Numeric
