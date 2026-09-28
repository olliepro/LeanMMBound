import RationalIntervalOperations
import Mathlib.Data.Int.DivMod

/-! Integer interval arithmetic on a fixed dyadic scale. Kernel checks use only
integer operations; the proved interpretation supplies real-number soundness. -/
namespace MatrixBounds.Numeric

/-- Integer endpoints representing multiples of the reciprocal of a positive natural scale. -/
structure FixedBounds where
  lower : ℤ
  upper : ℤ
  deriving DecidableEq

/-- Interpret fixed integer endpoints as an exact rational interval. -/
def FixedBounds.interval (bounds : FixedBounds) (scale : ℕ) : Interval :=
  ⟨(bounds.lower : ℚ)/scale, (bounds.upper : ℚ)/scale⟩

/-- Exact integer addition preserves the common fixed scale. -/
def FixedBounds.add (left right : FixedBounds) : FixedBounds :=
  ⟨left.lower+right.lower, left.upper+right.upper⟩

/-- The real interpretation of integer endpoint addition equals ordinary interval addition. -/
theorem FixedBounds.add_interval (left right : FixedBounds) (scale : ℕ) :
    (left.add right).interval scale = (left.interval scale).add (right.interval scale) := by
  simp only [add, interval, Interval.add, Int.cast_add, add_div]

/-- Integer endpoint addition encloses sums of represented real values. -/
theorem FixedBounds.add_sound {left right : FixedBounds} {scale : ℕ} {x y : ℝ}
    (hx : (left.interval scale).Contains x) (hy : (right.interval scale).Contains y) :
    ((left.add right).interval scale).Contains (x+y) := by
  rw [add_interval]
  exact Interval.add_sound hx hy

/-- Outward integer quotient bounds for a rational numerator divided by a positive natural denominator. -/
def FixedBounds.quotient (numerator : ℤ) (denominator scale : ℕ) : FixedBounds :=
  ⟨numerator*scale/denominator, -((-numerator*scale)/denominator)⟩

/-- Euclidean division gives a lower bound on the corresponding real quotient. -/
theorem integer_quotient_lower (numerator : ℤ) {denominator : ℕ} (positive : 0 < denominator) :
    ((numerator/(denominator : ℤ) : ℤ) : ℝ) ≤ (numerator : ℝ)/denominator := by
  have denominatorPositive : (0 : ℝ) < denominator := by exact_mod_cast positive
  rw [le_div_iff₀ denominatorPositive]
  exact_mod_cast Int.ediv_mul_le numerator (show (denominator : ℤ) ≠ 0 by exact_mod_cast Nat.ne_of_gt positive)

/-- Both outward integer quotient endpoints enclose the exact original rational value. -/
theorem FixedBounds.quotient_sound (numerator : ℤ) {denominator scale : ℕ}
    (denominatorPositive : 0 < denominator) (scalePositive : 0 < scale) :
    ((quotient numerator denominator scale).interval scale).Contains ((numerator : ℝ)/denominator) := by
  have scaleRealPositive : (0 : ℝ) < scale := by exact_mod_cast scalePositive
  have low := integer_quotient_lower (numerator*scale) denominatorPositive
  have high := integer_quotient_lower (-numerator*scale) denominatorPositive
  simp only [Int.cast_mul, Int.cast_neg, Int.cast_natCast] at low high
  unfold Interval.Contains interval quotient
  simp only [Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast, Rat.cast_neg, Int.cast_neg]
  constructor
  · rw [div_le_iff₀ scaleRealPositive]
    convert low using 1; ring
  · rw [le_div_iff₀ scaleRealPositive]
    have negated := neg_le_neg high
    convert negated using 1; ring

/-- Scale an interval by any signed rational coefficient using only integer multiplication and division. -/
def FixedBounds.scaleRatio (numerator : ℤ) (denominator : ℕ) (bounds : FixedBounds) : FixedBounds :=
  if 0 ≤ numerator then
    ⟨numerator*bounds.lower/denominator, -((-numerator*bounds.upper)/denominator)⟩
  else
    ⟨numerator*bounds.upper/denominator, -((-numerator*bounds.lower)/denominator)⟩

/-- Integer signed rational scaling encloses the exact scaled real value at the unchanged fixed scale. -/
theorem FixedBounds.scaleRatio_sound (numerator : ℤ) {denominator scale : ℕ} {bounds : FixedBounds} {value : ℝ}
    (denominatorPositive : 0 < denominator) (scalePositive : 0 < scale)
    (inside : (bounds.interval scale).Contains value) :
    ((scaleRatio numerator denominator bounds).interval scale).Contains ((numerator : ℝ)/denominator*value) := by
  have scaleRealPositive : (0 : ℝ) < scale := by exact_mod_cast scalePositive
  have denominatorRealPositive : (0 : ℝ) < denominator := by exact_mod_cast denominatorPositive
  have lowerValue : (bounds.lower : ℝ) ≤ value*scale := by
    exact (div_le_iff₀ scaleRealPositive).mp (by simpa only [interval, Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast] using inside.1)
  have upperValue : value*scale ≤ (bounds.upper : ℝ) := by
    exact (le_div_iff₀ scaleRealPositive).mp (by simpa only [interval, Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast] using inside.2)
  unfold scaleRatio
  split_ifs with nonnegative
  · have coefficientPositive : (0 : ℝ) ≤ numerator := by exact_mod_cast nonnegative
    have low := integer_quotient_lower (numerator*bounds.lower) denominatorPositive
    have high := neg_le_neg (integer_quotient_lower (-numerator*bounds.upper) denominatorPositive)
    have lowerProduct := div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left lowerValue coefficientPositive) denominatorRealPositive.le
    have upperProduct := div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left upperValue coefficientPositive) denominatorRealPositive.le
    simp only [Int.cast_mul, Int.cast_neg] at low high
    unfold Interval.Contains interval
    simp only [Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast, Rat.cast_neg, Int.cast_neg]
    constructor
    · rw [div_le_iff₀ scaleRealPositive]
      convert low.trans lowerProduct using 1; ring
    · rw [le_div_iff₀ scaleRealPositive]
      convert upperProduct.trans (by convert high using 1; ring) using 1; ring
  · have coefficientNegative : (numerator : ℝ) ≤ 0 := by exact_mod_cast (le_of_not_ge nonnegative)
    have low := integer_quotient_lower (numerator*bounds.upper) denominatorPositive
    have high := neg_le_neg (integer_quotient_lower (-numerator*bounds.lower) denominatorPositive)
    have lowerProduct := div_le_div_of_nonneg_right (mul_le_mul_of_nonpos_left upperValue coefficientNegative) denominatorRealPositive.le
    have upperProduct := div_le_div_of_nonneg_right (mul_le_mul_of_nonpos_left lowerValue coefficientNegative) denominatorRealPositive.le
    simp only [Int.cast_mul, Int.cast_neg] at low high
    unfold Interval.Contains interval
    simp only [Rat.cast_div, Rat.cast_intCast, Rat.cast_natCast, Rat.cast_neg, Int.cast_neg]
    constructor
    · rw [div_le_iff₀ scaleRealPositive]
      convert low.trans lowerProduct using 1; ring
    · rw [le_div_iff₀ scaleRealPositive]
      convert upperProduct.trans (by convert high using 1; ring) using 1; ring

end MatrixBounds.Numeric
