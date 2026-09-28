import SuppliedDimensionZero3CachedBlock108
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary243
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (90464481304315526082202843033283 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (154029758318377047406644060961171 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(5 : ℚ) / 1, (9741400791945011720588040809757647 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (728551618661513904082252241926763 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock108.summary (certificateWindow 243)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 243) =
    rationalLogValue (certificateWindow 243) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 108) = _
  rw [SuppliedDimensionZero3CachedBlock108.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary243
