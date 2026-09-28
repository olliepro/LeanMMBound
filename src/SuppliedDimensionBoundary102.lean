import SuppliedDimensionLeafCachedBlock102
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary102
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1006142574457903119941320189071607111912761761038274379261075 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (11693623349547286633506728425845758726445213836267046249418425 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock102.summary (certificateWindow 102)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 102) =
    rationalLogValue (certificateWindow 102) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 102) = _
  rw [SuppliedDimensionLeafCachedBlock102.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary102
