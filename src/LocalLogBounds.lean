import RoundedLogSeries

/-! A smaller proved series-parameter radius permits a much shorter logarithm
calculation after a second, tabulated range reduction. -/
namespace MatrixBounds.Numeric

/-- Exact geometric remainder allowance at an explicitly checked series-parameter radius. -/
def radiusLogError (radius : ℚ) (terms : ℕ) : ℚ := 2*radius^(terms+1)/(1-radius)

/-- A bounded nonnegative radius controls the complete analytic logarithm-series remainder. -/
theorem logError_le_radius {parameter radius : ℝ} (nonnegative : 0 ≤ radius) (belowOne : radius < 1)
    (small : |parameter| ≤ radius) (terms : ℕ) :
    logError parameter terms ≤ 2*radius^(terms+1)/(1-radius) := by
  have power := pow_le_pow_left₀ (abs_nonneg parameter) small (terms+1)
  unfold logError
  apply (div_le_div_iff₀ (by linarith) (by linarith)).mpr
  exact mul_le_mul (mul_le_mul_of_nonneg_left power (by norm_num))
    (sub_le_sub_left small 1) (by linarith) (mul_nonneg (by norm_num) (pow_nonneg nonnegative _))

/-- Check a positive rational input and an explicit valid radius for its exact logarithm-series parameter. -/
def localLogCheck (input radius : ℚ) : Bool :=
  decide (0 < input ∧ 0 ≤ radius ∧ radius < 1 ∧ |(input-1)/(input+1)| ≤ radius)

/-- Compute the short local logarithm series and its proved radius-dependent remainder. -/
def localLogBounds (input radius : ℚ) (terms precision : ℕ) : Interval :=
  ((roundedLogState ((Interval.point ((input-1)/(input+1))).round (2^precision)) (2^precision) terms).total).add
    ⟨-radiusLogError radius terms, radiusLogError radius terms⟩

/-- Checked radius reduction proves a complete real logarithm enclosure with the shorter finite series. -/
theorem localLogBounds_sound (input radius : ℚ) (terms precision : ℕ)
    (checked : localLogCheck input radius = true) :
    (localLogBounds input radius terms precision).Contains (Real.log (input : ℝ)) := by
  have facts : 0 < input ∧ 0 ≤ radius ∧ radius < 1 ∧ |(input-1)/(input+1)| ≤ radius := of_decide_eq_true checked
  have positive : (0 : ℝ) < input := by exact_mod_cast facts.1
  have nonnegative : (0 : ℝ) ≤ radius := by exact_mod_cast facts.2.1
  have belowOne : (radius : ℝ) < 1 := by exact_mod_cast facts.2.2.1
  let parameter : ℝ := ((input : ℝ)-1)/((input : ℝ)+1)
  have small : |parameter| ≤ (radius : ℝ) := by
    dsimp only [parameter]
    exact_mod_cast facts.2.2.2
  have positiveScale : 0 < (2 : ℕ)^precision := pow_pos (by decide) _
  have parameterInside : ((Interval.point ((input-1)/(input+1))).round (2^precision)).Contains parameter := by
    simpa only [Rat.cast_div, Rat.cast_sub, Rat.cast_add, Rat.cast_one, parameter] using
      Interval.round_sound positiveScale (Interval.point_sound ((input-1)/(input+1)))
  have series := roundedLogState_series positiveScale parameterInside terms
  have error : logError parameter terms ≤ (radiusLogError radius terms : ℝ) := by
    simpa only [radiusLogError, Rat.cast_div, Rat.cast_mul, Rat.cast_pow, Rat.cast_sub, Rat.cast_one, Rat.cast_ofNat] using
      logError_le_radius nonnegative belowOne small terms
  have analytic := log_enclosure (input : ℝ) positive terms
  change logSeries parameter terms-logError parameter terms ≤ Real.log (input : ℝ) ∧
    Real.log (input : ℝ) ≤ logSeries parameter terms+logError parameter terms at analytic
  have remainder : (⟨-radiusLogError radius terms, radiusLogError radius terms⟩ : Interval).Contains
      (Real.log (input : ℝ)-logSeries parameter terms) := by
    unfold Interval.Contains
    push_cast
    constructor <;> linarith [analytic.1, analytic.2]
  have result := Interval.add_sound series remainder
  convert result using 1; ring

end MatrixBounds.Numeric
