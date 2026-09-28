import SuppliedDimensionZero3CachedBlock095
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary230
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (4014619166880932144634581718291 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(4 : ℚ) / 1, (9421431967533378369683201101714355 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (11568812083815726258837130733268675 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(8 : ℚ) / 1, (2646384503415716615882654019577717 : ℚ) / 10633823966279326983230456482242756608⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock095.summary (certificateWindow 230)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 230) =
    rationalLogValue (certificateWindow 230) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 95) = _
  rw [SuppliedDimensionZero3CachedBlock095.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary230
