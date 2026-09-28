import SuppliedDimensionLeafCachedBlock101
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary101
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (3252686790082788956041237829261985789271451120417116067432405 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (3166898054126366074181046540230608140079437970926550704623875 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock101.summary (certificateWindow 101)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 101) =
    rationalLogValue (certificateWindow 101) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 101) = _
  rw [SuppliedDimensionLeafCachedBlock101.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary101
