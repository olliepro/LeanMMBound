import CertifiedRootRate0
import CertifiedRootRate1
import CertifiedRootRate2
import CertifiedLevel4Rate0
import CertifiedLevel4Rate1
import CertifiedLevel4Rate2
import CertifiedLevel3Rate0
import CertifiedLevel3Rate1
import CertifiedLevel3Rate2
import CertifiedTerminalRate0
import CertifiedTerminalRate1
import CertifiedTerminalRate2
import CertifiedDimensionRate0
import CertifiedDimensionRate1
import CertifiedDimensionRate2
import CertifiedLogTraces
import PipelineNumericIntervals
import RectangularExtractionExponent

/-! Checked finite-pipeline scalar accounting for the exact supplied logarithmic
expressions. `SuppliedCertifiedPipeline` identifies these expressions with the actual
instantiated tensor pipeline and supplies its rectangular extractions. -/
namespace MatrixBounds.Numeric.CertifiedPipelineScalar
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Complete three-axis root logarithmic expressions. -/
noncomputable def rootRates : Rates := ![CertifiedRootRate0.value, CertifiedRootRate1.value, CertifiedRootRate2.value]
/-- Checked rational intervals for all three root expressions. -/
def rootBounds : RateBounds := ![CertifiedRootRate0.bounds.interval (2^60), CertifiedRootRate1.bounds.interval (2^60), CertifiedRootRate2.bounds.interval (2^60)]
/-- Every component interval contains its actual complete real expression. -/
theorem root_sound (axis : Fin 3) : (rootBounds axis).Contains (rootRates axis) := by
  fin_cases axis
  · exact CertifiedRootRate0.sound
  · exact CertifiedRootRate1.sound
  · exact CertifiedRootRate2.sound

/-- Complete three-axis level4 logarithmic expressions. -/
noncomputable def level4Rates : Rates := ![CertifiedLevel4Rate0.value, CertifiedLevel4Rate1.value, CertifiedLevel4Rate2.value]
/-- Checked rational intervals for all three level4 expressions. -/
def level4Bounds : RateBounds := ![CertifiedLevel4Rate0.bounds.interval (2^60), CertifiedLevel4Rate1.bounds.interval (2^60), CertifiedLevel4Rate2.bounds.interval (2^60)]
/-- Every component interval contains its actual complete real expression. -/
theorem level4_sound (axis : Fin 3) : (level4Bounds axis).Contains (level4Rates axis) := by
  fin_cases axis
  · exact CertifiedLevel4Rate0.sound
  · exact CertifiedLevel4Rate1.sound
  · exact CertifiedLevel4Rate2.sound

/-- Complete three-axis level3 logarithmic expressions. -/
noncomputable def level3Rates : Rates := ![CertifiedLevel3Rate0.value, CertifiedLevel3Rate1.value, CertifiedLevel3Rate2.value]
/-- Checked rational intervals for all three level3 expressions. -/
def level3Bounds : RateBounds := ![CertifiedLevel3Rate0.bounds.interval (2^60), CertifiedLevel3Rate1.bounds.interval (2^60), CertifiedLevel3Rate2.bounds.interval (2^60)]
/-- Every component interval contains its actual complete real expression. -/
theorem level3_sound (axis : Fin 3) : (level3Bounds axis).Contains (level3Rates axis) := by
  fin_cases axis
  · exact CertifiedLevel3Rate0.sound
  · exact CertifiedLevel3Rate1.sound
  · exact CertifiedLevel3Rate2.sound

/-- Complete three-axis terminal logarithmic expressions. -/
noncomputable def terminalRates : Rates := ![CertifiedTerminalRate0.value, CertifiedTerminalRate1.value, CertifiedTerminalRate2.value]
/-- Checked rational intervals for all three terminal expressions. -/
def terminalBounds : RateBounds := ![CertifiedTerminalRate0.bounds.interval (2^60), CertifiedTerminalRate1.bounds.interval (2^60), CertifiedTerminalRate2.bounds.interval (2^60)]
/-- Every component interval contains its actual complete real expression. -/
theorem terminal_sound (axis : Fin 3) : (terminalBounds axis).Contains (terminalRates axis) := by
  fin_cases axis
  · exact CertifiedTerminalRate0.sound
  · exact CertifiedTerminalRate1.sound
  · exact CertifiedTerminalRate2.sound

/-- Complete three-axis dimension logarithmic expressions. -/
noncomputable def dimensionRates : Rates := ![CertifiedDimensionRate0.value, CertifiedDimensionRate1.value, CertifiedDimensionRate2.value]
/-- Checked rational intervals for all three dimension expressions. -/
def dimensionBounds : RateBounds := ![CertifiedDimensionRate0.bounds.interval (2^60), CertifiedDimensionRate1.bounds.interval (2^60), CertifiedDimensionRate2.bounds.interval (2^60)]
/-- Every component interval contains its actual complete real expression. -/
theorem dimension_sound (axis : Fin 3) : (dimensionBounds axis).Contains (dimensionRates axis) := by
  fin_cases axis
  · exact CertifiedDimensionRate0.sound
  · exact CertifiedDimensionRate1.sound
  · exact CertifiedDimensionRate2.sound

/-- Complete exact enclosures used in the finite-pipeline budget. -/
def bounds : PipelineBounds where
  cost := Interval.scale 8 CertifiedLogTraces.Seven.bounds
  root := rootBounds
  level4 := level4Bounds
  level3 := level3Bounds
  terminal := terminalBounds
  dimension := dimensionBounds

/-- The original level-four q=5 rank budget has natural logarithmic rate 8 log 7. -/
theorem cost_sound : bounds.cost.Contains (8*Real.log 7) := by
  simpa only [CertifiedLogTraces.Seven.input, Rat.cast_div, Rat.cast_ofNat, div_one] using
    Interval.scale_sound 8 CertifiedLogTraces.Seven.log_bounds

/-- The proposed intermediate exponent is a rational strictly below the requested target. -/
def rate : ℚ := 23710448/10000000

/-- Kernel-checked positivity includes all fifteen complete rate expressions and every finite boundary term. -/
theorem residual_positive : 0 < (bounds.residual 1000000 rate).lower := by decide +kernel

/-- The exact sum of the three matrix dimension expressions. -/
noncomputable def volume : ℝ := ∑ axis, dimensionRates axis

/-- The complete matrix-volume rate has a strictly positive checked lower bound. -/
theorem volume_positive : 0 < volume := by
  have inside := Interval.sum_sound dimensionBounds dimensionRates dimension_sound
  have positive : (0 : ℚ) < (Interval.sum dimensionBounds).lower := by decide +kernel
  have positiveReal : (0 : ℝ) < (Interval.sum dimensionBounds).lower := by exact_mod_cast positive
  exact positiveReal.trans_le inside.1

/-- The finite million-batch retention rate of these exact expressions. -/
noncomputable def retention : ℝ :=
  finitePipelineRetention 1000000 rootRates level4Rates level3Rates terminalRates

/-- The full exact scalar budget has strict slack below 2.3710448. -/
theorem strict_budget : 8*Real.log 7 < retention+(rate : ℝ)/3*volume :=
  bounds.strict_budget 1000000 rate cost_sound root_sound level4_sound level3_sound
    terminal_sound dimension_sound residual_positive

/-- The exact proposed scalar quotient beats the stated intermediate exponent. -/
theorem scalar_bound : (8*Real.log 7-retention)/(volume/3) < (rate : ℝ) := by
  apply (div_lt_iff₀ (div_pos volume_positive (by norm_num))).mpr
  nlinarith [strict_budget]

/-- The intermediate rational exponent is strictly below the requested 2.3710449 threshold. -/
theorem rate_below_target : (rate : ℝ) < 23710449/10000000 := by norm_num [rate]

/-- The numerical expression is below the target; this statement does not assert a tensor exponent bound. -/
theorem scalar_below_target : (8*Real.log 7-retention)/(volume/3) < (23710449 : ℝ)/10000000 :=
  scalar_bound.trans rate_below_target

/-- Actual rectangular extractions at the certified rates give the requested exponent bound;
`SuppliedCertifiedPipeline` supplies them. -/
theorem exponent_bound_of_actual_extractions {K : Type*} [CommSemiring K]
    (extractions : ∀ error : ℝ, 0 < error → ∃ scale : ℝ, ∃ rank copies i j l : ℕ,
      0 < scale ∧ Tensor.RankLE (MatrixComplexity.rectangularBatch K copies i j l) rank ∧
      (rank : ℝ) ≤ Real.exp (scale*(8*Real.log 7+error)) ∧
      Real.exp (scale*(retention-error)) ≤ (copies : ℝ) ∧
      Real.exp (scale*(volume-error)) ≤ ((i*j*l : ℕ) : ℝ)) :
    MatrixComplexity.exponent K < (23710449 : ℝ)/10000000 := by
  have rateNonnegative : (0 : ℝ) ≤ rate := by norm_num [rate]
  exact (MatrixComplexity.exponent_le_of_asymptotic_rectangular_extraction
    volume_positive rateNonnegative strict_budget extractions).trans_lt rate_below_target

end MatrixBounds.Numeric.CertifiedPipelineScalar
