import SuppliedDimensionLeafCachedBlock128
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary128
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (501996815616322292325596110271831904483646385840772869933049 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (773850093597930595385659921825419299980549296414284668376463 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock128.summary (certificateWindow 128)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 128) =
    rationalLogValue (certificateWindow 128) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 128) = _
  rw [SuppliedDimensionLeafCachedBlock128.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary128
