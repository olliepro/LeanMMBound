import SuppliedDimensionZero4CachedBlock009
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary264
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (114365777159004705 : ℚ) / 9671406556917033397649408⟩,
  ⟨(4 : ℚ) / 1, (46760955831765599709 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (1760247608318864737143 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (240448496260688815937 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (495878254982388112223 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (346716934631390982121 : ℚ) / 19342813113834066795298816⟩,
  ⟨(64 : ℚ) / 1, (209580731193417923963 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock009.summary (certificateWindow 264)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 264) =
    rationalLogValue (certificateWindow 264) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 9) = _
  rw [SuppliedDimensionZero4CachedBlock009.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary264
