import SuppliedDimensionZero3CachedBlock104
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary239
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (400022399951390842185492059841565 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (22902378528364238564015846717492467 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (2538695741788378988402868281549691 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(8 : ℚ) / 1, (3451001192527197458239319607979321 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock104.summary (certificateWindow 239)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 239) =
    rationalLogValue (certificateWindow 239) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 104) = _
  rw [SuppliedDimensionZero3CachedBlock104.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary239
