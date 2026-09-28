import RationalIntervalOperations

/-! A finite certificate of outward-rounded power intervals is checked by
exact rational arithmetic and proves the associated logarithm-series sum. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Sum a natural-indexed interval family over its first specified number of terms. -/
def Interval.sumRange (bounds : ℕ → Interval) (terms : ℕ) : Interval :=
  ⟨∑ index ∈ Finset.range terms, (bounds index).lower,
    ∑ index ∈ Finset.range terms, (bounds index).upper⟩

/-- Endpoint summation encloses every real finite sum over the same indices. -/
theorem Interval.sumRange_sound (bounds : ℕ → Interval) (value : ℕ → ℝ) (terms : ℕ)
    (inside : ∀ index < terms, (bounds index).Contains (value index)) :
    (sumRange bounds terms).Contains (∑ index ∈ Finset.range terms, value index) := by
  unfold Contains sumRange
  push_cast
  exact ⟨Finset.sum_le_sum (fun index present => (inside index (Finset.mem_range.mp present)).1),
    Finset.sum_le_sum (fun index present => (inside index (Finset.mem_range.mp present)).2)⟩

/-- Rounded interval values for a base's successive natural powers, beginning at exponent zero. -/
structure PowerTrace where
  powers : Array Interval
  deriving DecidableEq

/-- Read one supplied power enclosure; missing entries are interpreted as zero and must still pass every check. -/
def PowerTrace.at (trace : PowerTrace) (exponent : ℕ) : Interval :=
  trace.powers[exponent]?.getD (Interval.point 0)

/-- Reuse the same power data for a negated base, negating precisely its odd powers. -/
def PowerTrace.negateBase (trace : PowerTrace) : PowerTrace :=
  ⟨trace.powers.mapIdx (fun exponent bounds => if exponent%2 = 0 then bounds else bounds.neg)⟩

/-- Check the initial unit and every successive multiplication, permitting only outward rounding. -/
def PowerTrace.check (trace : PowerTrace) (base : Interval) (terms : ℕ) : Bool :=
  (trace.at 0).encloses (Interval.point 1) && decide (∀ index : Fin terms,
    (trace.at (index.val+1)).encloses ((trace.at index.val).mul base) = true)

/-- Every checked power interval encloses the true power of every real value in the base interval. -/
theorem PowerTrace.sound {trace : PowerTrace} {base : Interval} {terms : ℕ}
    (checked : trace.check base terms = true) {value : ℝ} (inside : base.Contains value)
    (exponent : ℕ) (bounded : exponent ≤ terms) : (trace.at exponent).Contains (value^exponent) := by
  have facts : (trace.at 0).encloses (Interval.point 1) = true ∧ ∀ index : Fin terms,
      (trace.at (index.val+1)).encloses ((trace.at index.val).mul base) = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  induction exponent with
  | zero =>
    simpa only [pow_zero, Rat.cast_one] using Interval.encloses_sound facts.1 (Interval.point_sound 1)
  | succ exponent ih =>
    have previous := ih (by omega)
    have step := Interval.encloses_sound (facts.2 ⟨exponent, by omega⟩) (Interval.mul_sound previous inside)
    simpa only [pow_succ] using step

/-- Enclose the sum of successive powers divided by their strictly positive integer exponents. -/
def PowerTrace.harmonicSum (trace : PowerTrace) (terms : ℕ) : Interval :=
  Interval.sumRange (fun index => Interval.scale (1/((index : ℚ)+1)) (trace.at (index+1))) terms

/-- The finite rounded trace gives a sound enclosure for the corresponding exact real logarithm-series sum. -/
theorem PowerTrace.harmonicSum_sound {trace : PowerTrace} {base : Interval} {terms : ℕ}
    (checked : trace.check base terms = true) {value : ℝ} (inside : base.Contains value) :
    (trace.harmonicSum terms).Contains (∑ index ∈ Finset.range terms, value^(index+1)/((index : ℝ)+1)) := by
  apply Interval.sumRange_sound
  intro index below
  have power := trace.sound checked inside (index+1) (by omega)
  have scaled := Interval.scale_sound (1/((index : ℚ)+1)) power
  simpa only [Rat.cast_div, Rat.cast_inv, Rat.cast_one, Rat.cast_add, Rat.cast_natCast, div_eq_mul_inv, one_mul, mul_comm] using scaled

end MatrixBounds.Numeric
