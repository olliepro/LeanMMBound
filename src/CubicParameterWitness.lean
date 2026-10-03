module

public import CubicTableLogBounds

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A short dyadic parameter enclosure avoids cubing the large exact original
mass denominator. Every parameter enclosure is itself checked exactly. -/
namespace MatrixBounds.Numeric

/-- The rational cubic appearing in the four-term logarithm series. -/
def logCubic (parameter : ℚ) : ℚ := 2*parameter+(2/3 : ℚ)*parameter^3

/-- Evaluate the monotone cubic at nonnegative parameter endpoints and add its analytic remainder. -/
def cubicWitnessBounds (parameter : Interval) (radius : ℚ) : Interval :=
  ⟨logCubic parameter.lower-radiusLogError radius 4,
    logCubic parameter.upper+radiusLogError radius 4⟩

/-- Check a positive input, a nonnegative small parameter enclosure, and both exact rational inclusions. -/
def cubicWitnessCheck (input : ℚ) (parameter : Interval) (radius : ℚ) : Bool :=
  decide (0 < input ∧ 0 ≤ parameter.lower ∧ parameter.upper ≤ radius ∧
    0 ≤ radius ∧ radius < 1 ∧ parameter.lower ≤ (input-1)/(input+1) ∧
    (input-1)/(input+1) ≤ parameter.upper)

/-- Checked small parameter endpoints enclose the actual logarithm without large-denominator polynomial evaluation. -/
theorem cubicWitnessBounds_sound (input : ℚ) (parameter : Interval) (radius : ℚ)
    (checked : cubicWitnessCheck input parameter radius = true) :
    (cubicWitnessBounds parameter radius).Contains (Real.log (input : ℝ)) := by
  have facts : 0 < input ∧ 0 ≤ parameter.lower ∧ parameter.upper ≤ radius ∧
      0 ≤ radius ∧ radius < 1 ∧ parameter.lower ≤ (input-1)/(input+1) ∧
      (input-1)/(input+1) ≤ parameter.upper := of_decide_eq_true checked
  have positive : (0 : ℝ) < input := by exact_mod_cast facts.1
  have lowPositive : (0 : ℝ) ≤ parameter.lower := by exact_mod_cast facts.2.1
  have upperRadius : (parameter.upper : ℝ) ≤ radius := by exact_mod_cast facts.2.2.1
  have radiusPositive : (0 : ℝ) ≤ radius := by exact_mod_cast facts.2.2.2.1
  have radiusSmall : (radius : ℝ) < 1 := by exact_mod_cast facts.2.2.2.2.1
  let value : ℝ := ((input : ℝ)-1)/((input : ℝ)+1)
  have lower : (parameter.lower : ℝ) ≤ value := by
    dsimp only [value]
    exact_mod_cast facts.2.2.2.2.2.1
  have upper : value ≤ (parameter.upper : ℝ) := by
    dsimp only [value]
    exact_mod_cast facts.2.2.2.2.2.2
  have nonnegative : 0 ≤ value := lowPositive.trans lower
  have small : |value| ≤ (radius : ℝ) := by rw [abs_of_nonneg nonnegative]; exact upper.trans upperRadius
  have lowerCube := pow_le_pow_left₀ lowPositive lower 3
  have upperCube := pow_le_pow_left₀ nonnegative upper 3
  have lowerSeries : (logCubic parameter.lower : ℝ) ≤ logSeries value 4 := by
    rw [logSeries_four]
    simp only [logCubic, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat]
    linarith
  have upperSeries : logSeries value 4 ≤ (logCubic parameter.upper : ℝ) := by
    rw [logSeries_four]
    simp only [logCubic, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat]
    linarith
  have error : logError value 4 ≤ (radiusLogError radius 4 : ℝ) := by
    simpa only [radiusLogError, Rat.cast_div, Rat.cast_mul, Rat.cast_pow, Rat.cast_sub,
      Rat.cast_one, Rat.cast_ofNat] using logError_le_radius radiusPositive radiusSmall small 4
  have analytic := log_enclosure (input : ℝ) positive 4
  change logSeries value 4-logError value 4 ≤ Real.log (input : ℝ) ∧
    Real.log (input : ℝ) ≤ logSeries value 4+logError value 4 at analytic
  unfold Interval.Contains cubicWitnessBounds
  push_cast
  constructor <;> linarith [analytic.1, analytic.2]

/-- Compute the full logarithm interval from a short parameter witness and a proved grid value. -/
def cubicWitnessTableBounds (exponent : ℤ) (parameter baseBounds : Interval) (radius : ℚ) : Interval :=
  (((cubicWitnessBounds parameter radius).add baseBounds).add
    (Interval.scale (exponent : ℚ) logTwoInterval)).round (2^60)

/-- The checked parameter, grid, and binary exponent contributions bound the original real logarithm. -/
theorem cubicWitnessTableBounds_sound (input : ℚ) (exponent : ℤ) (base radius : ℚ)
    (parameter baseBounds : Interval) (positiveBase : (0 : ℝ) < base)
    (baseSound : baseBounds.Contains (Real.log (base : ℝ)))
    (checked : cubicWitnessCheck (tableLogRatio input exponent base) parameter radius = true) :
    (cubicWitnessTableBounds exponent parameter baseBounds radius).Contains (Real.log (input : ℝ)) := by
  have facts := of_decide_eq_true checked
  have positiveRatio : (0 : ℝ) < tableLogRatio input exponent base := by exact_mod_cast facts.1
  rw [tableLogarithm input exponent base positiveBase positiveRatio]
  apply Interval.round_sound (by decide)
  simpa only [Rat.cast_intCast] using Interval.add_sound
    (Interval.add_sound (cubicWitnessBounds_sound _ _ _ checked) baseSound)
    (Interval.scale_sound (exponent : ℚ) logTwoInterval_sound)

end MatrixBounds.Numeric
