import SuppliedDimensionZero3CachedBlock072
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary207
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (405701021257888262901671103085381 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (23015188735574031123754839029645413 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (44677213591802146788569662016082129 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (3057299956531494451184494077404935 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock072.summary (certificateWindow 207)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 207) =
    rationalLogValue (certificateWindow 207) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 72) = _
  rw [SuppliedDimensionZero3CachedBlock072.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary207
