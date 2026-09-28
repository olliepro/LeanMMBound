import SuppliedDimensionLeafCachedBlock033
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary033
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (220860501716253351454115087624219231205578267415595767216871 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (3488172758869874133432217975565079225691703392067652522227775 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock033.summary (certificateWindow 33)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 33) =
    rationalLogValue (certificateWindow 33) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 33) = _
  rw [SuppliedDimensionLeafCachedBlock033.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary033
