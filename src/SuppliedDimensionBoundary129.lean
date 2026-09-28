import SuppliedDimensionLeafCachedBlock129
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary129
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (392416888176340135617070258371118752251908156163109793664851 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (3863848514759084643701422651201288549432422379271149201894023 : ℚ) / 3291009114642412084309938365114701009965471731267159726697218048⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock129.summary (certificateWindow 129)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 129) =
    rationalLogValue (certificateWindow 129) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 129) = _
  rw [SuppliedDimensionLeafCachedBlock129.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary129
