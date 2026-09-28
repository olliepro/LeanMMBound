import SuppliedDimensionLeafCachedBlock032
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary032
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (4263816841311456542429461586257752643053181853074113154629921 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (4553979857640135712669355384104482639290952922338046583386627 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock032.summary (certificateWindow 32)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 32) =
    rationalLogValue (certificateWindow 32) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 32) = _
  rw [SuppliedDimensionLeafCachedBlock032.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary032
