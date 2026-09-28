import SuppliedDimensionZero3CachedBlock086
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary221
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1261706965317498442485927551532735 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (39745999579556027139842924850893665 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (29642572551277435765423718411956335 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (98049598546014199498876919160175 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock086.summary (certificateWindow 221)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 221) =
    rationalLogValue (certificateWindow 221) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 86) = _
  rw [SuppliedDimensionZero3CachedBlock086.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary221
