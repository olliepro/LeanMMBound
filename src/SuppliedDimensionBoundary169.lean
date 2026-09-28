import SuppliedDimensionZero3CachedBlock034
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary169
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1057631932550430521175281441662091 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (173774191119873395482687719742539 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(5 : ℚ) / 1, (2141752675863193800849190310473301 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(8 : ℚ) / 1, (112062959397986968548673540773573 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock034.summary (certificateWindow 169)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 169) =
    rationalLogValue (certificateWindow 169) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 34) = _
  rw [SuppliedDimensionZero3CachedBlock034.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary169
