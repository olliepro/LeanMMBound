import SuppliedDimensionLeafCachedBlock009
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary009
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (144547217537115275329263924280254383736635183103705880219625 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (791293225804559661997838673032485938663636368648899685245149 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock009.summary (certificateWindow 9)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 9) =
    rationalLogValue (certificateWindow 9) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 9) = _
  rw [SuppliedDimensionLeafCachedBlock009.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary009
