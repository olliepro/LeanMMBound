import SuppliedDimensionLeafCachedBlock039
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary039
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1107294602493386309264830663371448089296082421099589634262263 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (15524525600404641725308032717363648920560287751973853096085917 : ℚ) / 3291009114642412084309938365114701009965471731267159726697218048⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock039.summary (certificateWindow 39)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 39) =
    rationalLogValue (certificateWindow 39) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 39) = _
  rw [SuppliedDimensionLeafCachedBlock039.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary039
