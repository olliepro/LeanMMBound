import SuppliedDimensionLeafCachedBlock092
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary092
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (845682553282812400755590258405996570765318157312818302202615 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (4998624784806176631724141535671520440498627154099072209088415 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock092.summary (certificateWindow 92)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 92) =
    rationalLogValue (certificateWindow 92) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 92) = _
  rw [SuppliedDimensionLeafCachedBlock092.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary092
