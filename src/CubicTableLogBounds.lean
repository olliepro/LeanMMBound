module

public import CubicLogBounds
public import TabulatedLogBounds

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The final per-mass logarithm calculation uses a proved table value and an
exact rational cubic, retaining the complete analytic remainder bound. -/
namespace MatrixBounds.Numeric

/-- Two exact positive range reductions decompose the original real logarithm into three additive terms. -/
theorem tableLogarithm (input : ℚ) (exponent : ℤ) (base : ℚ)
    (positiveBase : (0 : ℝ) < base) (positiveRatio : (0 : ℝ) < tableLogRatio input exponent base) :
    Real.log (input : ℝ) = Real.log (tableLogRatio input exponent base : ℝ)+
      Real.log (base : ℝ)+(exponent : ℝ)*Real.log 2 := by
  have nonzero : (2 : ℝ)^exponent ≠ 0 := zpow_ne_zero _ (by norm_num)
  have identity : (input : ℝ) = (tableLogRatio input exponent base : ℝ)*(base : ℝ)*(2 : ℝ)^exponent := by
    simp only [tableLogRatio, Rat.cast_div, Rat.cast_mul, Rat.cast_zpow, Rat.cast_ofNat]
    calc
      (input : ℝ) = ((input : ℝ)/((2 : ℝ)^exponent*(base : ℝ)))*((2 : ℝ)^exponent*(base : ℝ)) :=
        (div_mul_cancel₀ _ (mul_ne_zero nonzero positiveBase.ne')).symm
      _ = _ := by ring
  rw [identity, Real.log_mul (mul_ne_zero positiveRatio.ne' positiveBase.ne') nonzero,
    Real.log_mul positiveRatio.ne' positiveBase.ne', Real.log_zpow]

/-- Compute exact cubic, tabulated, and binary-exponent contributions, then round only the final enclosure. -/
def cubicTableLogBounds (input : ℚ) (exponent : ℤ) (base radius : ℚ) (baseBounds : Interval) (precision : ℕ) : Interval :=
  (((cubicLogBounds (tableLogRatio input exponent base) radius).add baseBounds).add
    (Interval.scale (exponent : ℚ) logTwoInterval)).round (2^precision)

/-- A checked rational reduction and a proved table entry certify the complete original logarithm. -/
theorem cubicTableLogBounds_sound (input : ℚ) (exponent : ℤ) (base radius : ℚ) (baseBounds : Interval)
    (precision : ℕ) (baseSound : baseBounds.Contains (Real.log (base : ℝ)))
    (checked : tableLogCheck input exponent base radius = true) :
    (cubicTableLogBounds input exponent base radius baseBounds precision).Contains (Real.log (input : ℝ)) := by
  have facts : 0 < base ∧ localLogCheck (tableLogRatio input exponent base) radius = true := by
    simpa only [tableLogCheck, Bool.and_eq_true, decide_eq_true_eq] using checked
  have localFacts : 0 < tableLogRatio input exponent base ∧ 0 ≤ radius ∧ radius < 1 ∧
      |(tableLogRatio input exponent base-1)/(tableLogRatio input exponent base+1)| ≤ radius := of_decide_eq_true facts.2
  have positiveBase : (0 : ℝ) < base := by exact_mod_cast facts.1
  have positiveRatio : (0 : ℝ) < tableLogRatio input exponent base := by exact_mod_cast localFacts.1
  rw [tableLogarithm input exponent base positiveBase positiveRatio]
  apply Interval.round_sound (pow_pos (by decide) _)
  simpa only [Rat.cast_intCast] using Interval.add_sound
    (Interval.add_sound (cubicLogBounds_sound _ _ facts.2) baseSound)
    (Interval.scale_sound (exponent : ℚ) logTwoInterval_sound)

end MatrixBounds.Numeric
