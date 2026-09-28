import SuppliedDimensionZero3CachedBlock070
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary205
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (287733895013819548643957623512779 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (22700324190500460213823147251452719 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (88427789499917595773246685268839699 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (3019460299655974493538862958261195 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock070.summary (certificateWindow 205)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 205) =
    rationalLogValue (certificateWindow 205) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 70) = _
  rw [SuppliedDimensionZero3CachedBlock070.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary205
