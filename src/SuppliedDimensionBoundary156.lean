import SuppliedDimensionZero3CachedBlock021
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary156
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (58392004531441585975550430306125 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(4 : ℚ) / 1, (1879296537634286306098971236549375 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(5 : ℚ) / 1, (3800071923687967661480546789281625 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(8 : ℚ) / 1, (339771192672255094730977987026375 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock021.summary (certificateWindow 156)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 156) =
    rationalLogValue (certificateWindow 156) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 21) = _
  rw [SuppliedDimensionZero3CachedBlock021.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary156
