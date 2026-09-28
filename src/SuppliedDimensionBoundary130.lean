import SuppliedDimensionLeafCachedBlock130
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary130
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (4864522298998461409783931351997005170443760343543282232983 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (47182532538834256005392676680280540768766031121695519863513 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock130.summary (certificateWindow 130)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 130) =
    rationalLogValue (certificateWindow 130) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 130) = _
  rw [SuppliedDimensionLeafCachedBlock130.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary130
