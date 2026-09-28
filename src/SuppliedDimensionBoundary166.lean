import SuppliedDimensionZero3CachedBlock031
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary166
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (117243460322650223974014377548325 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (19021124956616783615995012519343595 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (28468628704594698080507960534411655 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (99488703656003713580574817349375 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock031.summary (certificateWindow 166)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 166) =
    rationalLogValue (certificateWindow 166) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 31) = _
  rw [SuppliedDimensionZero3CachedBlock031.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary166
