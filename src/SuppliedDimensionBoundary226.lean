import SuppliedDimensionZero3CachedBlock091
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary226
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (260446246588557999628657957027745 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (15315795471377085625287345685427845 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (13577620379255305661234716918140395 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(8 : ℚ) / 1, (6231312272493215507217707991905185 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock091.summary (certificateWindow 226)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 226) =
    rationalLogValue (certificateWindow 226) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 91) = _
  rw [SuppliedDimensionZero3CachedBlock091.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary226
