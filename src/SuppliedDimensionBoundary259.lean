import SuppliedDimensionZero4CachedBlock004
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary259
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (854159652106611 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (4694510146267599 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (1678588825333151 : ℚ) / 9671406556917033397649408⟩,
  ⟨(16 : ℚ) / 1, (-343681883035678369001 : ℚ) / 2417851639229258349412352⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock004.summary (certificateWindow 259)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 259) =
    rationalLogValue (certificateWindow 259) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 4) = _
  rw [SuppliedDimensionZero4CachedBlock004.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary259
