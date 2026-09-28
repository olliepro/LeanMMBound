import SuppliedDimensionLeafCachedBlock013
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary013
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (96035385878730200865732142999748039098362344962081342347589 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(5 : ℚ) / 1, (5635613400713097710605143308510977012621527433132920079424049 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock013.summary (certificateWindow 13)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 13) =
    rationalLogValue (certificateWindow 13) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 13) = _
  rw [SuppliedDimensionLeafCachedBlock013.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary013
