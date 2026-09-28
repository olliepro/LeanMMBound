import SuppliedDimensionZero3CachedBlock106
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary241
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (3358348211009988792697275308458917 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (8801261291385636218928088346570171 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (6228785070147596429680028095182065 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (3238495476583759018489812584565 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock106.summary (certificateWindow 241)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 241) =
    rationalLogValue (certificateWindow 241) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 106) = _
  rw [SuppliedDimensionZero3CachedBlock106.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary241
