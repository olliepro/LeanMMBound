import SuppliedDimensionLeafCachedBlock065
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary065
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (7481949511480332153573370263151459211330877801061034891497755 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (3140399258731351848408600477421971866037254505739748447088789 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock065.summary (certificateWindow 65)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 65) =
    rationalLogValue (certificateWindow 65) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 65) = _
  rw [SuppliedDimensionLeafCachedBlock065.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary065
