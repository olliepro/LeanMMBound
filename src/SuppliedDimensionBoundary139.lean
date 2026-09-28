import SuppliedDimensionZero3CachedBlock004
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary139
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(1 : ℚ) / 2199023255552, (-777447952351293825 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (51107957973605793634681946922675 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (35164074937118845454907638185064675 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (1333064629448408586518299919047825 : ℚ) / 664613997892457936451903530140172288⟩,
  ⟨(8 : ℚ) / 1, (7469438971533866381933086626168975 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock004.summary (certificateWindow 139)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 139) =
    rationalLogValue (certificateWindow 139) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 4) = _
  rw [SuppliedDimensionZero3CachedBlock004.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary139
