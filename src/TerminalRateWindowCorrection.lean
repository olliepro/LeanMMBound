module

public import TerminalRateCertificateWindows
public import SuppliedTerminalRateBlocks

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Small shared-logarithm corrections compose bounded source and certificate checks. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open scoped BigOperators
noncomputable section

/-- Exact symbolic difference of two complete logarithmic expressions. -/
def differenceExpression (left right : RationalLogExpression) : RationalLogExpression :=
  left ++ scaleLogExpression (-1) right

/-- A checked small correction identifies the complete semantic difference of two blocks. -/
theorem value_eq_add_of_correction {left right correction : RationalLogExpression}
    (checked : mergeNormalizeLogExpression (differenceExpression left right) = correction) :
    rationalLogValue left = rationalLogValue right + rationalLogValue correction := by
  have identity := congrArg rationalLogValue checked
  rw [mergeNormalizeLogExpression_value, differenceExpression, rationalLogValue_append,
    scaleLogExpression_value] at identity
  norm_num at identity
  linarith

/-- Exact cancellation of the normalized finite correction expression gives zero total correction. -/
theorem sum_corrections_zero {count : ℕ} (corrections : Fin count → RationalLogExpression)
    (checked : mergeNormalizeLogExpression (finiteLogSum corrections) = []) :
    (∑ index, rationalLogValue (corrections index)) = 0 := by
  have identity := congrArg rationalLogValue checked
  rw [mergeNormalizeLogExpression_value, finiteLogSum_value] at identity
  exact identity

/-- All original source blocks identify the original normalized terminal rate after exact correction cancellation. -/
theorem rate_of_window_corrections (axis : Fin 3)
    (windows corrections : Fin 135 → RationalLogExpression)
    (boundaries : ∀ block, rationalLogValue (blockExpression block axis) =
      rationalLogValue (windows block) + rationalLogValue (corrections block))
    (complete : (∑ block, rationalLogValue (windows block)) = certificateValue axis)
    (cancelled : (∑ block, rationalLogValue (corrections block)) = 0) :
    SuppliedPathStages.terminal.rates axis / (SuppliedPopulationWeights.rootWeight : ℝ) =
      certificateValue axis := by
  rw [normalized_stage_rate, expression_blocks_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, complete, cancelled, add_zero]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
