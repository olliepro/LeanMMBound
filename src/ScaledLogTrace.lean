module

public import NormalizedLogTrace
public import CertifiedConstants
public import Mathlib.Data.Rat.Cast.CharZero

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact binary range reduction extends checked finite logarithm certificates
to every positive rational input, including very small dyadic masses. -/
namespace MatrixBounds.Numeric

/-- The previously proved rational enclosure of the natural logarithm of two. -/
def logTwoInterval : Interval :=
  ⟨693147180559945309/10^18, 693147180559945310/10^18⟩

/-- The binary range-reduction constant is enclosed by kernel-proved endpoints. -/
theorem logTwoInterval_sound : logTwoInterval.Contains (Real.log 2) := by
  simpa only [Interval.Contains, logTwoInterval, Rat.cast_div, Rat.cast_pow, Rat.cast_ofNat] using log_two_bounds

/-- Binary exponent, normalized rational input, and its full checked logarithm-series certificate. -/
structure ScaledLogTrace where
  exponent : ℤ
  normalized : ℚ
  series : NormalizedLogTrace
  deriving DecidableEq

/-- Check the exact rational range-reduction identity and all normalized series steps. -/
def ScaledLogTrace.check (trace : ScaledLogTrace) (input : ℚ) (terms : ℕ) : Bool :=
  decide (input = (2 : ℚ)^trace.exponent*trace.normalized) && trace.series.check trace.normalized terms

/-- Enclose the complete logarithm, including its signed binary-exponent contribution. -/
def ScaledLogTrace.bounds (trace : ScaledLogTrace) (terms : ℕ) : Interval :=
  (trace.series.bounds terms).add (Interval.scale (trace.exponent : ℚ) logTwoInterval)

/-- The actual real logarithm of an accepted rational input lies in the reported rational interval. -/
theorem ScaledLogTrace.sound {trace : ScaledLogTrace} {input : ℚ} {terms : ℕ}
    (checked : trace.check input terms = true) : (trace.bounds terms).Contains (Real.log (input : ℝ)) := by
  have facts : input = (2 : ℚ)^trace.exponent*trace.normalized ∧ trace.series.check trace.normalized terms = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  have range := NormalizedLogTrace.input_range facts.2
  have lower : (1 : ℝ) ≤ trace.normalized := by exact_mod_cast range.1
  have positive : (0 : ℝ) < trace.normalized := by linarith
  have identity : (input : ℝ) = (2 : ℝ)^trace.exponent*(trace.normalized : ℝ) := by
    simpa only [Rat.cast_mul, Rat.cast_zpow, Rat.cast_ofNat] using
      congrArg (fun value : ℚ => (value : ℝ)) facts.1
  have logarithm : Real.log (input : ℝ) = Real.log (trace.normalized : ℝ)+(trace.exponent : ℝ)*Real.log 2 := by
    rw [identity, Real.log_mul (zpow_ne_zero _ (by norm_num)) positive.ne', Real.log_zpow, add_comm]
  rw [logarithm]
  simpa only [bounds, Rat.cast_intCast] using
    Interval.add_sound (NormalizedLogTrace.sound facts.2) (Interval.scale_sound (trace.exponent : ℚ) logTwoInterval_sound)

end MatrixBounds.Numeric
