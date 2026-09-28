import SuppliedDimensionLeafCachedBlock041
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary041
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (5264811896288916881565940165308277425019259416663145515595805 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (26194752350859628472171626730790178163096203477508992940839969 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock041.summary (certificateWindow 41)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 41) =
    rationalLogValue (certificateWindow 41) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 41) = _
  rw [SuppliedDimensionLeafCachedBlock041.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary041
