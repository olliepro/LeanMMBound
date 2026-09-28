import SuppliedDimensionZero3CachedBlock063
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary198
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (52174469108788265936013437724501 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (3447152886741044239519497246159031 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(5 : ℚ) / 1, (75865887291964292338644249419237797 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (2256434731613200594638316937271525 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock063.summary (certificateWindow 198)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 198) =
    rationalLogValue (certificateWindow 198) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 63) = _
  rw [SuppliedDimensionZero3CachedBlock063.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary198
