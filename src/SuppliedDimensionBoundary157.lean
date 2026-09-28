import SuppliedDimensionZero3CachedBlock022
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary157
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (78572495363891485122623703253067 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(4 : ℚ) / 1, (710874587875950561442452587037711 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (587065375855404323741077798005923 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(8 : ℚ) / 1, (16062655509558742819627208775103 : ℚ) / 1329227995784915872903807060280344576⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock022.summary (certificateWindow 157)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 157) =
    rationalLogValue (certificateWindow 157) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 22) = _
  rw [SuppliedDimensionZero3CachedBlock022.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary157
