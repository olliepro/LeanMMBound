import SuppliedDimensionLeafCachedBlock094
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary094
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (837175248223741966463962282294779417710187198817763594365703 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (2601670168592016815090039276593440104406940090185422947549995 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock094.summary (certificateWindow 94)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 94) =
    rationalLogValue (certificateWindow 94) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 94) = _
  rw [SuppliedDimensionLeafCachedBlock094.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary094
