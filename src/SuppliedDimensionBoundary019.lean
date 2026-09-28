import SuppliedDimensionLeafCachedBlock019
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary019
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(1 : ℚ) / 2199023255552, (777447952351293825 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (30053184594877799789493100506341802000496457734646230851121 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (477633265331540486699065920319236898454936589313499638990181 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock019.summary (certificateWindow 19)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 19) =
    rationalLogValue (certificateWindow 19) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 19) = _
  rw [SuppliedDimensionLeafCachedBlock019.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary019
