import SuppliedDimensionLeafCachedBlock049
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary049
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (3012882312370674947756672243647712204043956686055193822551181 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (239020296810505553111579032805470698303578735686685991150804639 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock049.summary (certificateWindow 49)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 49) =
    rationalLogValue (certificateWindow 49) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 49) = _
  rw [SuppliedDimensionLeafCachedBlock049.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary049
