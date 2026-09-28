import SuppliedDimensionZero3CachedBlock051
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary186
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2464081152083595009321526900061591 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (5538834594566120363054457887203333 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (9263043684649028032501989980003291 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (1025811683867632097141750277576819 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock051.summary (certificateWindow 186)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 186) =
    rationalLogValue (certificateWindow 186) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 51) = _
  rw [SuppliedDimensionZero3CachedBlock051.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary186
