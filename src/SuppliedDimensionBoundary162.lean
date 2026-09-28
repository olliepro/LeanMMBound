import SuppliedDimensionZero3CachedBlock027
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary162
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (389482351612636842176692485726671 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (1381934767223480817668454586412657 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (1044123405692176350807443016836029 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(8 : ℚ) / 1, (1239821341701587513318270250943 : ℚ) / 166153499473114484112975882535043072⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock027.summary (certificateWindow 162)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 162) =
    rationalLogValue (certificateWindow 162) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 27) = _
  rw [SuppliedDimensionZero3CachedBlock027.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary162
