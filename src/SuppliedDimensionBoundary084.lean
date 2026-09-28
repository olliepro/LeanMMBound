import SuppliedDimensionLeafCachedBlock084
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary084
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (15385365325111918373297876302344988532104922356614046140960813 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (50192898200429344938791602523050595948987270968514029610709119 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock084.summary (certificateWindow 84)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 84) =
    rationalLogValue (certificateWindow 84) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 84) = _
  rw [SuppliedDimensionLeafCachedBlock084.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary084
