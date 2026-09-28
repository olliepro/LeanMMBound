import SuppliedDimensionLeafCachedBlock057
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary057
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2821992435425491636244418006910475326831140151393512529803725 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (4029195897528640408287862602766510335953137567488424552721575 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock057.summary (certificateWindow 57)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 57) =
    rationalLogValue (certificateWindow 57) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 57) = _
  rw [SuppliedDimensionLeafCachedBlock057.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary057
