import SuppliedDimensionZero3CachedBlock109
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary244
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (350586401151463156193340589501175 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (1833212664473190184173669534529091 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (1366686242992069874897136334706073 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(8 : ℚ) / 1, (63715328321182667628617129512803 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock109.summary (certificateWindow 244)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 244) =
    rationalLogValue (certificateWindow 244) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 109) = _
  rw [SuppliedDimensionZero3CachedBlock109.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary244
