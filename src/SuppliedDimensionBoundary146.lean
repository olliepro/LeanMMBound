import SuppliedDimensionZero3CachedBlock011
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary146
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (74582428376574608854981058079 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (2667983661161572809166908514785 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (5854622557457804689266915214647 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock011.summary (certificateWindow 146)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 146) =
    rationalLogValue (certificateWindow 146) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 11) = _
  rw [SuppliedDimensionZero3CachedBlock011.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary146
