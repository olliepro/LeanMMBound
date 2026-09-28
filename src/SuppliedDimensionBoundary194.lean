import SuppliedDimensionZero3CachedBlock059
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary194
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (383668866018591673473851168043513 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (20468233415008367045189263367999799 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (28995075482175454151498591707042611 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (1783602408744323572564807387352901 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock059.summary (certificateWindow 194)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 194) =
    rationalLogValue (certificateWindow 194) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 59) = _
  rw [SuppliedDimensionZero3CachedBlock059.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary194
