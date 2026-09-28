import SuppliedDimensionZero3CachedBlock119
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary254
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (292443543802573606747446644583 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (1918036102168449120841329078425 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (180016290241390049566557496901 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock119.summary (certificateWindow 254)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 254) =
    rationalLogValue (certificateWindow 254) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 119) = _
  rw [SuppliedDimensionZero3CachedBlock119.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary254
