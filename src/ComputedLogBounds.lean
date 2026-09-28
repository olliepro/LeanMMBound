import RoundedLogSeries
import ScaledLogTrace

/-! A small exact range-reduction witness suffices for a complete deterministic
kernel-checkable logarithm computation; no per-input power trace is stored. -/
namespace MatrixBounds.Numeric

/-- Normalize a rational argument by an explicitly supplied integer binary exponent. -/
def binaryLogInput (input : ℚ) (exponent : ℤ) : ℚ := input/(2 : ℚ)^exponent

/-- Check the only input-specific analytic precondition for the normalized computation. -/
def binaryLogCheck (input : ℚ) (exponent : ℤ) : Bool :=
  decide (1 ≤ binaryLogInput input exponent ∧ binaryLogInput input exponent ≤ 2)

/-- Compute and round an enclosure of the complete natural logarithm using fixed binary precision. -/
def computedLogBounds (input : ℚ) (exponent : ℤ) (terms precision : ℕ) : Interval :=
  ((roundedNormalizedLog (binaryLogInput input exponent) terms (2^precision)).add
    (Interval.scale (exponent : ℚ) logTwoInterval)).round (2^precision)

/-- Acceptance of the small range-reduction witness proves the entire deterministic logarithm enclosure. -/
theorem computedLogBounds_sound (input : ℚ) (exponent : ℤ) (terms precision : ℕ)
    (checked : binaryLogCheck input exponent = true) :
    (computedLogBounds input exponent terms precision).Contains (Real.log (input : ℝ)) := by
  have range : 1 ≤ binaryLogInput input exponent ∧ binaryLogInput input exponent ≤ 2 := of_decide_eq_true checked
  have positiveScale : 0 < (2 : ℕ)^precision := pow_pos (by decide) _
  have normalized := roundedNormalizedLog_sound (binaryLogInput input exponent) terms positiveScale range.1 range.2
  have lower : (1 : ℝ) ≤ binaryLogInput input exponent := by exact_mod_cast range.1
  have positive : (0 : ℝ) < binaryLogInput input exponent := by linarith
  have nonzero : (2 : ℝ)^exponent ≠ 0 := zpow_ne_zero _ (by norm_num)
  have identity : (input : ℝ) = (2 : ℝ)^exponent*(binaryLogInput input exponent : ℝ) := by
    simp only [binaryLogInput, Rat.cast_div, Rat.cast_zpow, Rat.cast_ofNat]
    rw [mul_comm, div_mul_cancel₀ _ nonzero]
  have logarithm : Real.log (input : ℝ) =
      Real.log (binaryLogInput input exponent : ℝ)+(exponent : ℝ)*Real.log 2 := by
    rw [identity, Real.log_mul nonzero positive.ne', Real.log_zpow, add_comm]
  rw [logarithm]
  apply Interval.round_sound positiveScale
  simpa only [Rat.cast_intCast] using
    Interval.add_sound normalized (Interval.scale_sound (exponent : ℚ) logTwoInterval_sound)

end MatrixBounds.Numeric
