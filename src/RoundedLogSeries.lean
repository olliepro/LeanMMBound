import RationalIntervalRounding
import NormalizedLogTrace

/-! A deterministic fixed-denominator logarithm calculation has a general
soundness proof, avoiding a separate stored power trace for every input mass. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Exact coefficient of one power in the signed logarithm-ratio series. -/
def logCoefficient (index : ℕ) : ℚ := (1-(-1 : ℚ)^(index+1))/((index : ℚ)+1)

/-- The signed pair of logarithm series is one finite weighted power sum. -/
theorem logSeries_weighted (parameter : ℝ) (terms : ℕ) :
    logSeries parameter terms = ∑ index ∈ Finset.range terms, (logCoefficient index : ℝ)*parameter^(index+1) := by
  unfold logSeries
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro index _
  simp only [logCoefficient, Rat.cast_div, Rat.cast_sub, Rat.cast_one, Rat.cast_pow,
    Rat.cast_neg, Rat.cast_add, Rat.cast_natCast]
  rw [neg_pow]
  ring

/-- The current power and accumulated signed series after a finite number of rounded operations. -/
structure RoundedSeriesState where
  power : Interval
  total : Interval
  deriving DecidableEq

/-- Evaluate the logarithm-ratio polynomial while rounding each power and partial sum outward. -/
def roundedLogState (parameter : Interval) (scale : ℕ) : ℕ → RoundedSeriesState
  | 0 => ⟨Interval.point 1, Interval.point 0⟩
  | terms+1 =>
    let previous := roundedLogState parameter scale terms
    let power := (previous.power.mul parameter).round scale
    ⟨power, (previous.total.add (Interval.scale (logCoefficient terms) power)).round scale⟩

/-- Every intermediate state encloses its exact real power and complete partial polynomial. -/
theorem roundedLogState_sound {parameter : Interval} {value : ℝ} {scale : ℕ}
    (positive : 0 < scale) (inside : parameter.Contains value) (terms : ℕ) :
    ((roundedLogState parameter scale terms).power).Contains (value^terms) ∧
    ((roundedLogState parameter scale terms).total).Contains
      (∑ index ∈ Finset.range terms, (logCoefficient index : ℝ)*value^(index+1)) := by
  induction terms with
  | zero => simp [roundedLogState, Interval.Contains, Interval.point]
  | succ terms ih =>
    have power := Interval.round_sound positive (Interval.mul_sound ih.1 inside)
    rw [← pow_succ] at power
    have total := Interval.round_sound positive
      (Interval.add_sound ih.2 (Interval.scale_sound (logCoefficient terms) power))
    constructor
    · exact power
    · simpa only [roundedLogState, Finset.sum_range_succ] using total

/-- The rounded finite evaluator encloses the same exact logarithm-ratio polynomial as the analytic bound. -/
theorem roundedLogState_series {parameter : Interval} {value : ℝ} {scale : ℕ}
    (positive : 0 < scale) (inside : parameter.Contains value) (terms : ℕ) :
    ((roundedLogState parameter scale terms).total).Contains (logSeries value terms) := by
  rw [logSeries_weighted]
  exact (roundedLogState_sound positive inside terms).2

/-- Compute a complete interval for the natural logarithm of a rational in the normalized domain. -/
def roundedNormalizedLog (input : ℚ) (terms scale : ℕ) : Interval :=
  ((roundedLogState ((Interval.point ((input-1)/(input+1))).round scale) scale terms).total).add
    ⟨-uniformLogError terms, uniformLogError terms⟩

/-- The deterministic rational interval computation encloses the actual normalized natural logarithm. -/
theorem roundedNormalizedLog_sound (input : ℚ) (terms : ℕ) {scale : ℕ}
    (positive : 0 < scale) (lower : 1 ≤ input) (upper : input ≤ 2) :
    (roundedNormalizedLog input terms scale).Contains (Real.log (input : ℝ)) := by
  have realLower : (1 : ℝ) ≤ input := by exact_mod_cast lower
  have realUpper : (input : ℝ) ≤ 2 := by exact_mod_cast upper
  let parameter : ℝ := ((input : ℝ)-1)/((input : ℝ)+1)
  have parameterInside : ((Interval.point ((input-1)/(input+1))).round scale).Contains parameter := by
    simpa only [Rat.cast_div, Rat.cast_sub, Rat.cast_add, Rat.cast_one, parameter] using
      Interval.round_sound positive (Interval.point_sound ((input-1)/(input+1)))
  have series := roundedLogState_series positive parameterInside terms
  have parameterRange := normalized_parameter_bound (input : ℝ) realLower realUpper
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
  convert result using 1; ring

end MatrixBounds.Numeric
