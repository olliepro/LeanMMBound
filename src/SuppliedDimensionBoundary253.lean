import SuppliedDimensionZero3CachedBlock118
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary253
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (36488388236669125716386623717 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (2606196525788128185926396563227 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (85195369485367499611254810757 : ℚ) / 166153499473114484112975882535043072⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock118.summary (certificateWindow 253)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 253) =
    rationalLogValue (certificateWindow 253) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 118) = _
  rw [SuppliedDimensionZero3CachedBlock118.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary253
