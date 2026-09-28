import SuppliedDimensionLeafCachedBlock098
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary098
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (20265330670899043634916031367204659871897080543725472332431565 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (57881569413001713938166862971475606816264956696476231418571945 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock098.summary (certificateWindow 98)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 98) =
    rationalLogValue (certificateWindow 98) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 98) = _
  rw [SuppliedDimensionLeafCachedBlock098.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary098
