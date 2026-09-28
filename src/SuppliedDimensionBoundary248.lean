import SuppliedDimensionZero3CachedBlock113
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary248
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (305828937925577625643306243674615 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (1003640498614484446594205337238845 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (1462884998368487471131634989238511 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (10672583987784299276439996513331 : ℚ) / 10633823966279326983230456482242756608⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock113.summary (certificateWindow 248)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 248) =
    rationalLogValue (certificateWindow 248) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 113) = _
  rw [SuppliedDimensionZero3CachedBlock113.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary248
