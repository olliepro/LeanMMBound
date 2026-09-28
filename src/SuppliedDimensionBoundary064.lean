import SuppliedDimensionLeafCachedBlock064
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary064
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (284121491164287961954961552498607180779499243711949761080055 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(5 : ℚ) / 1, (148710349929992934795549424674520447070168248652587586114247585 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock064.summary (certificateWindow 64)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 64) =
    rationalLogValue (certificateWindow 64) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 64) = _
  rw [SuppliedDimensionLeafCachedBlock064.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary064
