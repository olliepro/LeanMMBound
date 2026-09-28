import SuppliedDimensionZero3CachedBlock041
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary176
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (251586840817850703079918474555427 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (12257648894837882866594256475520377 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (86732318828179052826920618959492781 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(8 : ℚ) / 1, (3435963247375173828143352603128369 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock041.summary (certificateWindow 176)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 176) =
    rationalLogValue (certificateWindow 176) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 41) = _
  rw [SuppliedDimensionZero3CachedBlock041.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary176
