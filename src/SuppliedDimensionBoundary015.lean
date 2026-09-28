import SuppliedDimensionLeafCachedBlock015
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary015
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (58759318217542586049602095374839963296132851644140977153495 : ℚ) / 25711008708143844408671393477458601640355247900524685364822016⟩,
  ⟨(5 : ℚ) / 1, (2263069304022532461977187488312845271101548978926824323958671 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock015.summary (certificateWindow 15)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 15) =
    rationalLogValue (certificateWindow 15) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 15) = _
  rw [SuppliedDimensionLeafCachedBlock015.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary015
