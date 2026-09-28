import SuppliedDimensionLeafCachedBlock037
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary037
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (11933675303732621593617278333332815953328313415373210380785 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (48186807945474303011455923450597410431969353156787181880811 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock037.summary (certificateWindow 37)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 37) =
    rationalLogValue (certificateWindow 37) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 37) = _
  rw [SuppliedDimensionLeafCachedBlock037.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary037
