import SuppliedDimensionZero4CachedBlock010
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary265
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (7196737879814861 : ℚ) / 604462909807314587353088⟩,
  ⟨(4 : ℚ) / 1, (570684184124324685 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (11817346863229391739 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (162554110172470001 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (2718375439856071469 : ℚ) / 9671406556917033397649408⟩,
  ⟨(32 : ℚ) / 1, (724697130789987327 : ℚ) / 2417851639229258349412352⟩,
  ⟨(64 : ℚ) / 1, (27016463759505565 : ℚ) / 1208925819614629174706176⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock010.summary (certificateWindow 265)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 265) =
    rationalLogValue (certificateWindow 265) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 10) = _
  rw [SuppliedDimensionZero4CachedBlock010.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary265
