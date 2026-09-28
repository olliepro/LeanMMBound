import SuppliedDimensionLeafCachedBlock007
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary007
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (156534900820073338970977609535447576499136905195644308001 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (411691681168025762258934991650784525724908901092207456863 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock007.summary (certificateWindow 7)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 7) =
    rationalLogValue (certificateWindow 7) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 7) = _
  rw [SuppliedDimensionLeafCachedBlock007.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary007
