import RationalIntervals
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Data.Rat.Cast.Lemmas

/-! Finite rational interval computations, including checked outward rounding,
are sound for the real arithmetic used by the numerical certificate. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Exact rational interval subtraction. -/
def Interval.sub (left right : Interval) : Interval := left.add right.neg

/-- Subtraction of enclosing intervals contains the actual real difference. -/
theorem Interval.sub_sound {left right : Interval} {x y : ℝ}
    (hx : left.Contains x) (hy : right.Contains y) : (left.sub right).Contains (x-y) := by
  simpa only [sub_eq_add_neg] using Interval.add_sound hx (Interval.neg_sound hy)

/-- Multiply an interval by an exact rational coefficient of either sign. -/
def Interval.scale (factor : ℚ) (bounds : Interval) : Interval := (point factor).mul bounds

/-- Rational scaling preserves a sound real enclosure. -/
theorem Interval.scale_sound (factor : ℚ) {bounds : Interval} {value : ℝ}
    (inside : bounds.Contains value) : (scale factor bounds).Contains ((factor : ℝ)*value) :=
  mul_sound (point_sound factor) inside

/-- Enclose the smaller of two real quantities using corresponding endpoint minima. -/
def Interval.minimum (left right : Interval) : Interval :=
  ⟨min left.lower right.lower, min left.upper right.upper⟩

/-- Endpoint minima contain the actual minimum of two enclosed real quantities. -/
theorem Interval.minimum_sound {left right : Interval} {x y : ℝ}
    (hx : left.Contains x) (hy : right.Contains y) : (left.minimum right).Contains (min x y) := by
  unfold Contains minimum
  push_cast
  exact ⟨min_le_min hx.1 hy.1, min_le_min hx.2 hy.2⟩

/-- Sum finitely many interval endpoints in exact rational arithmetic. -/
def Interval.sum {I : Type*} [Fintype I] (bounds : I → Interval) : Interval :=
  ⟨∑ index, (bounds index).lower, ∑ index, (bounds index).upper⟩

/-- Exact finite interval summation encloses the complete real sum. -/
theorem Interval.sum_sound {I : Type*} [Fintype I] (bounds : I → Interval) (value : I → ℝ)
    (inside : ∀ index, (bounds index).Contains (value index)) :
    (sum bounds).Contains (∑ index, value index) := by
  unfold Contains sum
  push_cast
  exact ⟨Finset.sum_le_sum (fun index _ => (inside index).1),
    Finset.sum_le_sum (fun index _ => (inside index).2)⟩

/-- Raise an interval to a natural power using exact interval multiplication. -/
def Interval.power (bounds : Interval) : ℕ → Interval
  | 0 => point 1
  | exponent+1 => (power bounds exponent).mul bounds

/-- Repeated exact interval multiplication encloses each actual natural power. -/
theorem Interval.power_sound {bounds : Interval} {value : ℝ} (inside : bounds.Contains value) (exponent : ℕ) :
    (bounds.power exponent).Contains (value^exponent) := by
  induction exponent with
  | zero => simpa only [power, pow_zero, Rat.cast_one] using point_sound 1
  | succ exponent ih => simpa only [power, pow_succ] using Interval.mul_sound ih inside

/-- A decidable check that an outer interval includes both endpoints of an inner interval. -/
def Interval.encloses (outer inner : Interval) : Bool :=
  decide (outer.lower ≤ inner.lower ∧ inner.upper ≤ outer.upper)

/-- Checked outward rounding preserves every real value contained in the unrounded interval. -/
theorem Interval.encloses_sound {outer inner : Interval} {value : ℝ}
    (checked : outer.encloses inner = true) (inside : inner.Contains value) : outer.Contains value := by
  have endpoints : outer.lower ≤ inner.lower ∧ inner.upper ≤ outer.upper := of_decide_eq_true checked
  have lower : (outer.lower : ℝ) ≤ inner.lower := by exact_mod_cast endpoints.1
  have upper : (inner.upper : ℝ) ≤ outer.upper := by exact_mod_cast endpoints.2
  exact ⟨lower.trans inside.1, inside.2.trans upper⟩

end MatrixBounds.Numeric
