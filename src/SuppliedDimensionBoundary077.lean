import SuppliedDimensionLeafCachedBlock077
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary077
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (371245717345655232717224847472059930194539456637412570010973 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (666129067630462077659015626427420897751252130715988098463993 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock077.summary (certificateWindow 77)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 77) =
    rationalLogValue (certificateWindow 77) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 77) = _
  rw [SuppliedDimensionLeafCachedBlock077.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary077
