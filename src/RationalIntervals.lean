import LogEnclosures
import Mathlib.Data.Rat.Cast.Order

/-! Exact rational interval arithmetic. Soundness is proved over real numbers;
no floating-point rounding behavior is assumed. -/
namespace MatrixBounds.Numeric

/-- Rational endpoints describing an enclosure of a real quantity. -/
structure Interval where
  lower : ℚ
  upper : ℚ
  deriving DecidableEq

/-- The real quantity lies between the interval's rational endpoints. -/
def Interval.Contains (bounds : Interval) (value : ℝ) : Prop :=
  (bounds.lower : ℝ) ≤ value ∧ value ≤ (bounds.upper : ℝ)

/-- Exact interval enclosing a rational input. -/
def Interval.point (value : ℚ) : Interval := ⟨value, value⟩

/-- Add two interval bounds with exact rational arithmetic. -/
def Interval.add (left right : Interval) : Interval :=
  ⟨left.lower + right.lower, left.upper + right.upper⟩

/-- Negate an interval by reversing and negating its endpoints. -/
def Interval.neg (bounds : Interval) : Interval := ⟨-bounds.upper, -bounds.lower⟩

/-- Multiply intervals using the extremal products of their four endpoint pairs. -/
def Interval.mul (left right : Interval) : Interval :=
  ⟨min (min (left.lower * right.lower) (left.lower * right.upper))
       (min (left.upper * right.lower) (left.upper * right.upper)),
   max (max (left.lower * right.lower) (left.lower * right.upper))
       (max (left.upper * right.lower) (left.upper * right.upper))⟩

/-- Rational inputs are contained in their singleton intervals. -/
theorem Interval.point_sound (value : ℚ) : (Interval.point value).Contains value := ⟨le_rfl, le_rfl⟩

/-- Interval addition is sound. -/
theorem Interval.add_sound {left right : Interval} {x y : ℝ}
    (hx : left.Contains x) (hy : right.Contains y) : (left.add right).Contains (x+y) := by
  unfold Contains add
  push_cast
  exact ⟨add_le_add hx.1 hy.1, add_le_add hx.2 hy.2⟩

/-- Interval negation is sound. -/
theorem Interval.neg_sound {bounds : Interval} {x : ℝ} (hx : bounds.Contains x) :
    bounds.neg.Contains (-x) := by
  unfold Contains neg
  push_cast
  exact ⟨neg_le_neg hx.2, neg_le_neg hx.1⟩

/-- Multiplying by a fixed scalar is bounded by the two endpoint products. -/
theorem scalar_interval {low high value : ℝ} (bounds : low ≤ value ∧ value ≤ high) (scalar : ℝ) :
    min (scalar*low) (scalar*high) ≤ scalar*value ∧
      scalar*value ≤ max (scalar*low) (scalar*high) := by
  by_cases positive : 0 ≤ scalar
  · exact ⟨(min_le_left _ _).trans (mul_le_mul_of_nonneg_left bounds.1 positive),
      (mul_le_mul_of_nonneg_left bounds.2 positive).trans (le_max_right _ _)⟩
  · exact ⟨(min_le_right _ _).trans (mul_le_mul_of_nonpos_left bounds.2 (le_of_not_ge positive)),
      (mul_le_mul_of_nonpos_left bounds.1 (le_of_not_ge positive)).trans (le_max_left _ _)⟩

/-- Four endpoint products enclose a product of arbitrary signed real intervals. -/
theorem endpoint_product_bounds {a b c d x y : ℝ}
    (hx : a ≤ x ∧ x ≤ b) (hy : c ≤ y ∧ y ≤ d) :
    min (min (a*c) (a*d)) (min (b*c) (b*d)) ≤ x*y ∧
    x*y ≤ max (max (a*c) (a*d)) (max (b*c) (b*d)) := by
  have left := scalar_interval hy a
  have right := scalar_interval hy b
  have middle := scalar_interval hx y
  rw [mul_comm y a, mul_comm y b, mul_comm y x] at middle
  exact ⟨(min_le_min left.1 right.1).trans middle.1,
    middle.2.trans (max_le_max left.2 right.2)⟩

/-- Interval multiplication is sound for all signs. -/
theorem Interval.mul_sound {left right : Interval} {x y : ℝ}
    (hx : left.Contains x) (hy : right.Contains y) : (left.mul right).Contains (x*y) := by
  unfold Contains mul
  push_cast
  exact endpoint_product_bounds hx hy

end MatrixBounds.Numeric
