import SuppliedDimensionZero3CachedBlock046
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary181
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (504667770494905124651230450307029 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (79309759919888740586806972373913729 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (261011672467852648429685603761263259 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(8 : ℚ) / 1, (33814978515573341927896543979694517 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock046.summary (certificateWindow 181)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 181) =
    rationalLogValue (certificateWindow 181) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 46) = _
  rw [SuppliedDimensionZero3CachedBlock046.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary181
