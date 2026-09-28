import SuppliedDimensionZero3CachedBlock115
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary250
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (18605597720401469985144845275755 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (10810869313379200931980760341547 : ℚ) / 664613997892457936451903530140172288⟩,
  ⟨(5 : ℚ) / 1, (28971498060976048815361037162797 : ℚ) / 664613997892457936451903530140172288⟩,
  ⟨(8 : ℚ) / 1, (2116707672400899389116448947695 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock115.summary (certificateWindow 250)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 250) =
    rationalLogValue (certificateWindow 250) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 115) = _
  rw [SuppliedDimensionZero3CachedBlock115.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary250
