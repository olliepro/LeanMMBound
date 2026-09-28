import SuppliedDimensionZero4CachedBlock011
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary266
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (146662397994675 : ℚ) / 2417851639229258349412352⟩,
  ⟨(5 : ℚ) / 1, (1225877050396777 : ℚ) / 1208925819614629174706176⟩,
  ⟨(8 : ℚ) / 1, (181052347376853 : ℚ) / 1208925819614629174706176⟩,
  ⟨(16 : ℚ) / 1, (748524453613475 : ℚ) / 2417851639229258349412352⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock011.summary (certificateWindow 266)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 266) =
    rationalLogValue (certificateWindow 266) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 11) = _
  rw [SuppliedDimensionZero4CachedBlock011.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary266
