import SuppliedDimensionZero3CachedBlock040
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary175
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1833636433178435217554560689663589 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (6581829223763970846242639277941675 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (2665241607230979959254891484362909 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(8 : ℚ) / 1, (62123503437427936738572391816827 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock040.summary (certificateWindow 175)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 175) =
    rationalLogValue (certificateWindow 175) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 40) = _
  rw [SuppliedDimensionZero3CachedBlock040.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary175
