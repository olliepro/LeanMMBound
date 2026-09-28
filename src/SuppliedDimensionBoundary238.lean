import SuppliedDimensionZero3CachedBlock103
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary238
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (10804145576557156411894814812629 : ℚ) / 166153499473114484112975882535043072⟩,
  ⟨(4 : ℚ) / 1, (199764482297176420274842349741279 : ℚ) / 332306998946228968225951765070086144⟩,
  ⟨(5 : ℚ) / 1, (44106012898469453695999152108683 : ℚ) / 20769187434139310514121985316880384⟩,
  ⟨(8 : ℚ) / 1, (26937931128021839904815612588597 : ℚ) / 332306998946228968225951765070086144⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock103.summary (certificateWindow 238)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 238) =
    rationalLogValue (certificateWindow 238) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 103) = _
  rw [SuppliedDimensionZero3CachedBlock103.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary238
