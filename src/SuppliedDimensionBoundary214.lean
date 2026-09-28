import SuppliedDimensionZero3CachedBlock079
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary214
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (131702307510977979991244936898375 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (59992799574068093271923741238256935 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (108645099619106212483991714861039105 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (26142478049686025962270564591374455 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock079.summary (certificateWindow 214)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 214) =
    rationalLogValue (certificateWindow 214) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 79) = _
  rw [SuppliedDimensionZero3CachedBlock079.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary214
