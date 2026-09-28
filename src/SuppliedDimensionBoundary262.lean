import SuppliedDimensionZero4CachedBlock007
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary262
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (52362536175488385 : ℚ) / 19342813113834066795298816⟩,
  ⟨(4 : ℚ) / 1, (71271536313115238023 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (40372166010914038730803 : ℚ) / 9671406556917033397649408⟩,
  ⟨(8 : ℚ) / 1, (500222283198030456677 : ℚ) / 2417851639229258349412352⟩,
  ⟨(16 : ℚ) / 1, (580482591866355437265 : ℚ) / 4835703278458516698824704⟩,
  ⟨(32 : ℚ) / 1, (3982609070646795624897 : ℚ) / 19342813113834066795298816⟩,
  ⟨(64 : ℚ) / 1, (78911627758327270069 : ℚ) / 604462909807314587353088⟩,
  ⟨(128 : ℚ) / 1, (-153049986749902290299 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock007.summary (certificateWindow 262)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 262) =
    rationalLogValue (certificateWindow 262) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 7) = _
  rw [SuppliedDimensionZero4CachedBlock007.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary262
