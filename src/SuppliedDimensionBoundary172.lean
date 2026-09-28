import SuppliedDimensionZero3CachedBlock037
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary172
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (14852571055850637213279376924457 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(4 : ℚ) / 1, (2247371137987752594168339042905323 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (3262137859425622302746929232044513 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (175826810292384973087233784045701 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock037.summary (certificateWindow 172)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 172) =
    rationalLogValue (certificateWindow 172) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 37) = _
  rw [SuppliedDimensionZero3CachedBlock037.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary172
