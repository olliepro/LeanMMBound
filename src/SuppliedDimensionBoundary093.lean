import SuppliedDimensionLeafCachedBlock093
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary093
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (1139893313510923033064731471994198543758929185366257610792377 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩,
  ⟨(5 : ℚ) / 1, (80547051656281528563323610763092101275786942020585338193203425 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock093.summary (certificateWindow 93)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 93) =
    rationalLogValue (certificateWindow 93) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 93) = _
  rw [SuppliedDimensionLeafCachedBlock093.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary093
