import SuppliedDimensionZero3CachedBlock042
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary177
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (71961735336474858801442912994753 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(4 : ℚ) / 1, (5103222504125087890305642421431229 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (6103692600513992334838940932374381 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(8 : ℚ) / 1, (1321451718860676093506332790028207 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock042.summary (certificateWindow 177)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 177) =
    rationalLogValue (certificateWindow 177) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 42) = _
  rw [SuppliedDimensionZero3CachedBlock042.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary177
