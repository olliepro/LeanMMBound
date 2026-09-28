import SuppliedDimensionZero3CachedBlock089
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary224
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (16826601694193453387166385566597 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(4 : ℚ) / 1, (36901866215572891701060331768955 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(5 : ℚ) / 1, (104529717903702793893072054096267 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock089.summary (certificateWindow 224)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 224) =
    rationalLogValue (certificateWindow 224) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 89) = _
  rw [SuppliedDimensionZero3CachedBlock089.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary224
