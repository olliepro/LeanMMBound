module

public import LocalLogBounds

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! After tabulated range reduction the four-term logarithm series is an exact
rational cubic. This avoids rounded power traces for the many individual masses. -/
namespace MatrixBounds.Numeric

/-- The four-term signed logarithm series is exactly its odd cubic polynomial. -/
theorem logSeries_four (parameter : ℝ) :
    logSeries parameter 4 = 2*parameter+(2/3 : ℝ)*parameter^3 := by
  norm_num [logSeries, Finset.sum_range_succ]
  ring

/-- Exact rational cubic approximation at the logarithm-ratio parameter. -/
def cubicLogApproximation (input : ℚ) : ℚ :=
  let parameter := (input-1)/(input+1)
  2*parameter+(2/3 : ℚ)*parameter^3

/-- The cubic's rational value is exactly the analytically bounded real logarithm series. -/
theorem cubicLogApproximation_cast (input : ℚ) :
    (cubicLogApproximation input : ℝ) = logSeries (((input : ℝ)-1)/((input : ℝ)+1)) 4 := by
  rw [logSeries_four]
  simp only [cubicLogApproximation, Rat.cast_add, Rat.cast_mul, Rat.cast_div, Rat.cast_sub,
    Rat.cast_pow, Rat.cast_one, Rat.cast_ofNat]

/-- Exact rational enclosure formed from the cubic and its explicitly bounded geometric remainder. -/
def cubicLogBounds (input radius : ℚ) : Interval :=
  ⟨cubicLogApproximation input-radiusLogError radius 4, cubicLogApproximation input+radiusLogError radius 4⟩

/-- The exact cubic computation encloses the actual real logarithm whenever its radius check passes. -/
theorem cubicLogBounds_sound (input radius : ℚ) (checked : localLogCheck input radius = true) :
    (cubicLogBounds input radius).Contains (Real.log (input : ℝ)) := by
  have facts : 0 < input ∧ 0 ≤ radius ∧ radius < 1 ∧ |(input-1)/(input+1)| ≤ radius := of_decide_eq_true checked
  have positive : (0 : ℝ) < input := by exact_mod_cast facts.1
  have nonnegative : (0 : ℝ) ≤ radius := by exact_mod_cast facts.2.1
  have belowOne : (radius : ℝ) < 1 := by exact_mod_cast facts.2.2.1
  have small : |((input : ℝ)-1)/((input : ℝ)+1)| ≤ (radius : ℝ) := by exact_mod_cast facts.2.2.2
  have error : logError (((input : ℝ)-1)/((input : ℝ)+1)) 4 ≤ (radiusLogError radius 4 : ℝ) := by
    simpa only [radiusLogError, Rat.cast_div, Rat.cast_mul, Rat.cast_pow, Rat.cast_sub, Rat.cast_one, Rat.cast_ofNat] using
      logError_le_radius nonnegative belowOne small 4
  have analytic := log_enclosure (input : ℝ) positive 4
  unfold Interval.Contains cubicLogBounds
  push_cast
  rw [cubicLogApproximation_cast]
  constructor <;> linarith [analytic.1, analytic.2]

end MatrixBounds.Numeric
