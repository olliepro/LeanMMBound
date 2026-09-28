import SuppliedDimensionZero4CachedBlock008
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary263
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (55210669201310519 : ℚ) / 19342813113834066795298816⟩,
  ⟨(4 : ℚ) / 1, (108184326722237172633 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (40181869884059634356241 : ℚ) / 9671406556917033397649408⟩,
  ⟨(8 : ℚ) / 1, (4025315057287389717313 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (2214829645018445128553 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (3945088522751315007445 : ℚ) / 19342813113834066795298816⟩,
  ⟨(64 : ℚ) / 1, (2559003969950254491855 : ℚ) / 19342813113834066795298816⟩,
  ⟨(128 : ℚ) / 1, (153049986749902290299 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock008.summary (certificateWindow 263)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 263) =
    rationalLogValue (certificateWindow 263) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 8) = _
  rw [SuppliedDimensionZero4CachedBlock008.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary263
