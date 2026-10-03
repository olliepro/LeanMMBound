module

public import LocalLogBounds
public import ScaledLogTrace

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A proved logarithm table supplies a second range reduction. The remaining
small rational ratio requires only a short, rigorously bounded local series. -/
namespace MatrixBounds.Numeric

/-- A rational table argument and rational endpoints already proved to enclose its actual logarithm. -/
structure CertifiedLogBound where
  input : ℚ
  bounds : Interval
  sound : bounds.Contains (Real.log (input : ℝ))

/-- The exact residual argument after binary and tabulated rational range reduction. -/
def tableLogRatio (input : ℚ) (exponent : ℤ) (base : ℚ) : ℚ := input/((2 : ℚ)^exponent*base)

/-- Check positivity of the tabulated base and all preconditions for its small residual series. -/
def tableLogCheck (input : ℚ) (exponent : ℤ) (base radius : ℚ) : Bool :=
  decide (0 < base) && localLogCheck (tableLogRatio input exponent base) radius

/-- Enclose the short local series plus the certified table and binary logarithms, rounding the final endpoints outward. -/
def tableLogBounds (input : ℚ) (exponent : ℤ) (base radius : ℚ) (baseBounds : Interval) (terms precision : ℕ) : Interval :=
  (((localLogBounds (tableLogRatio input exponent base) radius terms precision).add baseBounds).add
    (Interval.scale (exponent : ℚ) logTwoInterval)).round (2^precision)

/-- A valid table entry and checked small-ratio reduction prove the entire original logarithm interval. -/
theorem tableLogBounds_sound (input : ℚ) (exponent : ℤ) (base radius : ℚ) (baseBounds : Interval)
    (terms precision : ℕ) (baseSound : baseBounds.Contains (Real.log (base : ℝ)))
    (checked : tableLogCheck input exponent base radius = true) :
    (tableLogBounds input exponent base radius baseBounds terms precision).Contains (Real.log (input : ℝ)) := by
  have facts : 0 < base ∧ localLogCheck (tableLogRatio input exponent base) radius = true := by
    simpa only [tableLogCheck, Bool.and_eq_true, decide_eq_true_eq] using checked
  have localFacts : 0 < tableLogRatio input exponent base ∧ 0 ≤ radius ∧ radius < 1 ∧
      |(tableLogRatio input exponent base-1)/(tableLogRatio input exponent base+1)| ≤ radius := of_decide_eq_true facts.2
  have positiveBase : (0 : ℝ) < base := by exact_mod_cast facts.1
  have positiveRatio : (0 : ℝ) < tableLogRatio input exponent base := by exact_mod_cast localFacts.1
  have positiveScale : 0 < (2 : ℕ)^precision := pow_pos (by decide) _
  have nonzero : (2 : ℝ)^exponent ≠ 0 := zpow_ne_zero _ (by norm_num)
  have identity : (input : ℝ) = (tableLogRatio input exponent base : ℝ)*(base : ℝ)*(2 : ℝ)^exponent := by
    simp only [tableLogRatio, Rat.cast_div, Rat.cast_mul, Rat.cast_zpow, Rat.cast_ofNat]
    calc
      (input : ℝ) = ((input : ℝ)/((2 : ℝ)^exponent*(base : ℝ)))*((2 : ℝ)^exponent*(base : ℝ)) :=
        (div_mul_cancel₀ _ (mul_ne_zero nonzero positiveBase.ne')).symm
      _ = _ := by ring
  have logarithm : Real.log (input : ℝ) = Real.log (tableLogRatio input exponent base : ℝ)+
      Real.log (base : ℝ)+(exponent : ℝ)*Real.log 2 := by
    rw [identity, Real.log_mul (mul_ne_zero positiveRatio.ne' positiveBase.ne') nonzero,
      Real.log_mul positiveRatio.ne' positiveBase.ne', Real.log_zpow]
  rw [logarithm]
  apply Interval.round_sound positiveScale
  simpa only [Rat.cast_intCast] using Interval.add_sound
    (Interval.add_sound (localLogBounds_sound _ _ _ _ facts.2) baseSound)
    (Interval.scale_sound (exponent : ℚ) logTwoInterval_sound)

end MatrixBounds.Numeric
