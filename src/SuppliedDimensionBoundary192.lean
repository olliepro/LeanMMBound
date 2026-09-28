import SuppliedDimensionZero3CachedBlock057
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary192
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1474977174671393303937002242593 : ℚ) / 664613997892457936451903530140172288⟩,
  ⟨(4 : ℚ) / 1, (11204442461018960235908847556176787 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (7641118782245664746172412519935101 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(8 : ℚ) / 1, (1812880338402483262323816579443165 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock057.summary (certificateWindow 192)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 192) =
    rationalLogValue (certificateWindow 192) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 57) = _
  rw [SuppliedDimensionZero3CachedBlock057.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary192
