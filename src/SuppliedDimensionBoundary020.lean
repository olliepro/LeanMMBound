import SuppliedDimensionLeafCachedBlock020
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary020
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (298576600557011679696637821570776299714981784209692330359 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(5 : ℚ) / 1, (12382815190114702922545797762430045125046571524261956790761 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock020.summary (certificateWindow 20)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 20) =
    rationalLogValue (certificateWindow 20) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 20) = _
  rw [SuppliedDimensionLeafCachedBlock020.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary020
