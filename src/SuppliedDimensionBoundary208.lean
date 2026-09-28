import SuppliedDimensionZero3CachedBlock073
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary208
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (575988875505187319884936278092895 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (7163905419173814454683884286510255 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (75873129879047870534663588963510025 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (2811471120107420799445643031187545 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock073.summary (certificateWindow 208)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 208) =
    rationalLogValue (certificateWindow 208) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 73) = _
  rw [SuppliedDimensionZero3CachedBlock073.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary208
