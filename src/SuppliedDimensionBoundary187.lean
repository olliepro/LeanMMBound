import SuppliedDimensionZero3CachedBlock052
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary187
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (174310319577930341060383105111043 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (4975101359804526426665214927642769 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (3736337984370379747846145075285617 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (340835630807715736291429587921983 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock052.summary (certificateWindow 187)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 187) =
    rationalLogValue (certificateWindow 187) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 52) = _
  rw [SuppliedDimensionZero3CachedBlock052.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary187
