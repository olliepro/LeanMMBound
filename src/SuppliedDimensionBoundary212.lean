import SuppliedDimensionZero3CachedBlock077
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary212
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (319963950878856687354578118181571 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (31765365776176590637989502414553595 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(5 : ℚ) / 1, (130524830268352474814648549241955557 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (10298297435698457309250743106798875 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock077.summary (certificateWindow 212)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 212) =
    rationalLogValue (certificateWindow 212) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 77) = _
  rw [SuppliedDimensionZero3CachedBlock077.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary212
