import SuppliedDimensionLeafCachedBlock116
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary116
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (14167995379192658292305312298079475124210510034428459713187 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(5 : ℚ) / 1, (2508300809430912087370413939384130862264987200499243478732387 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock116.summary (certificateWindow 116)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 116) =
    rationalLogValue (certificateWindow 116) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 116) = _
  rw [SuppliedDimensionLeafCachedBlock116.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary116
