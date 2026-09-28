import SuppliedDimensionZero4CachedBlock006
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary261
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (128036905303335765545 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (3611486760901424755973 : ℚ) / 9671406556917033397649408⟩,
  ⟨(8 : ℚ) / 1, (61698547373487022077 : ℚ) / 4835703278458516698824704⟩,
  ⟨(16 : ℚ) / 1, (493996432864264740877 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (183007275261240401881 : ℚ) / 9671406556917033397649408⟩,
  ⟨(64 : ℚ) / 1, (-2592539472338130504789 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock006.summary (certificateWindow 261)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 261) =
    rationalLogValue (certificateWindow 261) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 6) = _
  rw [SuppliedDimensionZero4CachedBlock006.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary261
