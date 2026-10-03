module

public import IntervalPowerTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Checked rounded power traces enclose natural logarithms on [1,2], with a
proved uniform remainder for the finite rational-series computation. -/
namespace MatrixBounds.Numeric

/-- Uniform rational remainder bound for the logarithm-ratio series on its normalized domain. -/
def uniformLogError (terms : ℕ) : ℚ := 3*(1/3 : ℚ)^(terms+1)

/-- The normalized interval bounds the complete infinite-series remainder uniformly. -/
theorem logError_le_uniform {parameter : ℝ} (small : |parameter| ≤ 1/3) (terms : ℕ) :
    logError parameter terms ≤ (uniformLogError terms : ℝ) := by
  have power := pow_le_pow_left₀ (abs_nonneg parameter) small (terms+1)
  have nonnegative : 0 ≤ (1/3 : ℝ)^(terms+1) := pow_nonneg (by norm_num) _
  have denominator : 0 < 1-|parameter| := by linarith
  unfold logError uniformLogError
  push_cast
  rw [div_le_iff₀ denominator]
  nlinarith

/-- The two rounded power sequences needed by the signed logarithm-ratio series. -/
structure NormalizedLogTrace where
  parameter : Interval
  positivePowers : PowerTrace
  negativePowers : PowerTrace
  deriving DecidableEq

/-- Check normalization, the exact rational series parameter, and every rounded power multiplication. -/
def NormalizedLogTrace.check (trace : NormalizedLogTrace) (input : ℚ) (terms : ℕ) : Bool :=
  decide (1 ≤ input ∧ input ≤ 2) && trace.parameter.encloses (Interval.point ((input-1)/(input+1))) &&
    trace.positivePowers.check trace.parameter terms && trace.negativePowers.check trace.parameter.neg terms

/-- The finite signed series plus its proved uniform remainder interval. -/
def NormalizedLogTrace.bounds (trace : NormalizedLogTrace) (terms : ℕ) : Interval :=
  ((trace.positivePowers.harmonicSum terms).sub (trace.negativePowers.harmonicSum terms)).add
    ⟨-uniformLogError terms, uniformLogError terms⟩

/-- The certificate's first exact check places its input in the normalized positive interval. -/
theorem NormalizedLogTrace.input_range {trace : NormalizedLogTrace} {input : ℚ} {terms : ℕ}
    (checked : trace.check input terms = true) : 1 ≤ input ∧ input ≤ 2 := by
  have facts : (((1 ≤ input ∧ input ≤ 2) ∧
      trace.parameter.encloses (Interval.point ((input-1)/(input+1))) = true) ∧
      trace.positivePowers.check trace.parameter terms = true) ∧
      trace.negativePowers.check trace.parameter.neg terms = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  exact facts.1.1.1

/-- Acceptance of the rational certificate proves an enclosure of the actual real natural logarithm. -/
theorem NormalizedLogTrace.sound {trace : NormalizedLogTrace} {input : ℚ} {terms : ℕ}
    (checked : trace.check input terms = true) : (trace.bounds terms).Contains (Real.log (input : ℝ)) := by
  have facts : (((1 ≤ input ∧ input ≤ 2) ∧
      trace.parameter.encloses (Interval.point ((input-1)/(input+1))) = true) ∧
      trace.positivePowers.check trace.parameter terms = true) ∧
      trace.negativePowers.check trace.parameter.neg terms = true := by
    simpa only [check, Bool.and_eq_true, decide_eq_true_eq] using checked
  obtain ⟨⟨⟨range, parameterCheck⟩, positiveCheck⟩, negativeCheck⟩ := facts
  have lower : (1 : ℝ) ≤ input := by exact_mod_cast range.1
  have upper : (input : ℝ) ≤ 2 := by exact_mod_cast range.2
  let parameter : ℝ := ((input : ℝ)-1)/((input : ℝ)+1)
  have parameterInside : trace.parameter.Contains parameter := by
    simpa only [Rat.cast_div, Rat.cast_sub, Rat.cast_add, Rat.cast_one, parameter] using
      Interval.encloses_sound parameterCheck (Interval.point_sound ((input-1)/(input+1)))
  have positive := trace.positivePowers.harmonicSum_sound positiveCheck parameterInside
  have negative := trace.negativePowers.harmonicSum_sound negativeCheck (Interval.neg_sound parameterInside)
  have series : ((trace.positivePowers.harmonicSum terms).sub (trace.negativePowers.harmonicSum terms)).Contains
      (logSeries parameter terms) := by
    simpa only [logSeries, Nat.cast_add, Nat.cast_one] using Interval.sub_sound positive negative
  have parameterRange := normalized_parameter_bound (input : ℝ) lower upper
  have small : |parameter| ≤ 1/3 := by
    rw [abs_of_nonneg parameterRange.1]
    exact parameterRange.2
  have error := logError_le_uniform small terms
  have analytic := log_enclosure (input : ℝ) (by linarith) terms
  change logSeries parameter terms-logError parameter terms ≤ Real.log (input : ℝ) ∧
    Real.log (input : ℝ) ≤ logSeries parameter terms+logError parameter terms at analytic
  have remainder : (⟨-uniformLogError terms, uniformLogError terms⟩ : Interval).Contains
      (Real.log (input : ℝ)-logSeries parameter terms) := by
    unfold Interval.Contains
    push_cast
    constructor <;> linarith [analytic.1, analytic.2]
  have result := Interval.add_sound series remainder
  convert result using 1
  · rfl
  · ring

end MatrixBounds.Numeric
