module

public import FKLTermData.A0Certified
public import FKLTermData.A1Certified
public import FKLTermData.A2Certified

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The three fast terminal axis identities, collected exactly as in `SuppliedTerminalRateBinding`. -/

namespace MatrixBounds.Numeric.FKLTerm

open SuppliedTerminalRates SuppliedPopulationWeights

/-- Same statement as `SuppliedTerminalRates.normalized_rate_eq`. -/
theorem normalized_rate_eq (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis / (rootWeight : ℝ) = certificateValue axis := by
  fin_cases axis
  · exact FKLTermData.A0.rate_eq
  · exact FKLTermData.A1.rate_eq
  · exact FKLTermData.A2.rate_eq

/-- Same statement as `SuppliedTerminalRates.expression_certificate_value`. -/
theorem expression_certificate_value (axis : Fin 3) :
    rationalLogValue (expression axis) = certificateValue axis := by
  rw [← normalized_stage_rate]
  exact normalized_rate_eq axis

end MatrixBounds.Numeric.FKLTerm
