import SuppliedDimensionZero3CachedBlock023
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary158
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (245708121697278190037606427748901 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (528586560145026349952969440896821 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (770306604950491339195318273972393 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(8 : ℚ) / 1, (4514392643388022695444697397075 : ℚ) / 10633823966279326983230456482242756608⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock023.summary (certificateWindow 158)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 158) =
    rationalLogValue (certificateWindow 158) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 23) = _
  rw [SuppliedDimensionZero3CachedBlock023.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary158
