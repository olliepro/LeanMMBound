import SuppliedDimensionLeafCachedBlock110
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary110
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (360201250018407636160619298341468369836763113481250652433155 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (4287585004958390828248967742892135049577347517082765769067649 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock110.summary (certificateWindow 110)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 110) =
    rationalLogValue (certificateWindow 110) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 110) = _
  rw [SuppliedDimensionLeafCachedBlock110.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary110
