import SuppliedDimensionZero4CachedBlock000
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary255
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (796717039468449 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (332141895044606411 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (37469152718837005 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (-2790969947889115302811 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (-4352262757703482821817 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock000.summary (certificateWindow 255)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 255) =
    rationalLogValue (certificateWindow 255) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 0) = _
  rw [SuppliedDimensionZero4CachedBlock000.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary255
