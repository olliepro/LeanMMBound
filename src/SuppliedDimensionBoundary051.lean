import SuppliedDimensionLeafCachedBlock051
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary051
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (7203217971513887780275190004096434665882774572879287966076403 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (32334594202914189474809609971863978209383000597672893275972373 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock051.summary (certificateWindow 51)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 51) =
    rationalLogValue (certificateWindow 51) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 51) = _
  rw [SuppliedDimensionLeafCachedBlock051.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary051
