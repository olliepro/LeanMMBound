module

public import FKLTerm.Rates
public import CertifiedPipelineScalar
public import SuppliedNormalizedRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact identification of every actual terminal extraction rate with the
independently interval-certified original numerical expressions. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open SuppliedPopulationWeights
noncomputable section

/-- Every normalized original terminal stage rate equals its complete original numerical certificate. -/
theorem normalized_rate_eq (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis/(rootWeight : ℝ) = certificateValue axis := by
  fin_cases axis
  · exact FKLTermData.A0.rate_eq
  · exact FKLTermData.A1.rate_eq
  · exact FKLTermData.A2.rate_eq

/-- All original terminal source expressions have exactly their complete certificate values. -/
theorem expression_certificate_value (axis : Fin 3) :
    rationalLogValue (expression axis) = certificateValue axis := by
  rw [← normalized_stage_rate]
  exact normalized_rate_eq axis

/-- The actual normalized terminal rate is the rate used in the full numerical pipeline certificate. -/
theorem rate_eq (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis/(rootWeight : ℝ) = CertifiedPipelineScalar.terminalRates axis := by
  rw [normalized_rate_eq]
  rfl

/-- The complete actual normalized terminal vector is exactly the original certified terminal vector. -/
theorem vector_eq : SuppliedNormalizedRates.stages 2 = CertifiedPipelineScalar.terminalRates := by
  funext axis
  change SuppliedFixedStages.terminal.rates axis/(rootWeight : ℝ) = _
  rw [← SuppliedPathStages.terminal_rates]
  exact rate_eq axis

/-- The actual terminal stage has the common root population scale times the complete certified rate. -/
theorem scaled_rate_eq (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis = (rootWeight : ℝ)*CertifiedPipelineScalar.terminalRates axis := by
  have rootNonzero : (rootWeight : ℝ) ≠ 0 := by norm_num [rootWeight, DyadicPopulationArithmetic.denominator]
  have identity := (div_eq_iff rootNonzero).mp (rate_eq axis)
  simpa only [mul_comm] using identity

/-- The original numerical interval encloses the actual normalized terminal rate without an identification hypothesis. -/
theorem rate_sound (axis : Fin 3) : (CertifiedPipelineScalar.terminalBounds axis).Contains
    (SuppliedPathStages.terminal.rates axis/(rootWeight : ℝ)) := by
  rw [rate_eq]
  exact CertifiedPipelineScalar.terminal_sound axis

end
end MatrixBounds.Numeric.SuppliedTerminalRates
