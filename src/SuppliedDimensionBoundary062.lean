import SuppliedDimensionLeafCachedBlock062
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary062
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (732555819986934682586470635917324473683740485908361481720375 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (6225071120487190363137537594789707618122511579984973489230375 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock062.summary (certificateWindow 62)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 62) =
    rationalLogValue (certificateWindow 62) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 62) = _
  rw [SuppliedDimensionLeafCachedBlock062.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary062
