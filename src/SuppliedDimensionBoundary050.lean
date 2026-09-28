import SuppliedDimensionLeafCachedBlock050
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary050
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2496524611582148675882039194624086142424005372323517870677835 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (32225229944374705041424802334886967958051728692850800914113085 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock050.summary (certificateWindow 50)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 50) =
    rationalLogValue (certificateWindow 50) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 50) = _
  rw [SuppliedDimensionLeafCachedBlock050.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary050
