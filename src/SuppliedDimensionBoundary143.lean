import SuppliedDimensionZero3CachedBlock008
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary143
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (806048646160675263449261872013343 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (33824894217280778912464404283044701 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (53715177600533533680526340200933745 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(8 : ℚ) / 1, (3151652912453766414555675586907387 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock008.summary (certificateWindow 143)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 143) =
    rationalLogValue (certificateWindow 143) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 8) = _
  rw [SuppliedDimensionZero3CachedBlock008.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary143
