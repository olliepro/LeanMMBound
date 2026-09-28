import SuppliedDimensionZero3CachedBlock017
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary152
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (60968272278195225571732078981005 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (29752418563403419082887887307024185 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (98660675692838419792197511963221405 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (1416488889146447090330444420058615 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock017.summary (certificateWindow 152)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 152) =
    rationalLogValue (certificateWindow 152) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 17) = _
  rw [SuppliedDimensionZero3CachedBlock017.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary152
