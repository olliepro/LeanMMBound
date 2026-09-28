import SuppliedDimensionZero3CachedBlock038
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary173
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (10612686858271275224556897275439 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (9965122779822221036257797132443 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (66592760764737192846836238900743 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (651687126490508043935685405945 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock038.summary (certificateWindow 173)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 173) =
    rationalLogValue (certificateWindow 173) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 38) = _
  rw [SuppliedDimensionZero3CachedBlock038.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary173
