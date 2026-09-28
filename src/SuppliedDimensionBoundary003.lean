import SuppliedDimensionLeafCachedBlock003
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary003
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (212385258927254285304939061797991215094667223749691006249823 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (4989050940234577870571409358927256647786163270833524869792029 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock003.summary (certificateWindow 3)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 3) =
    rationalLogValue (certificateWindow 3) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 3) = _
  rw [SuppliedDimensionLeafCachedBlock003.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary003
