import SuppliedDimensionZero4CachedBlock002
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary257
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (3738825207491751 : ℚ) / 2417851639229258349412352⟩,
  ⟨(4 : ℚ) / 1, (72093637404053260199 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (30629462918840863861945 : ℚ) / 9671406556917033397649408⟩,
  ⟨(8 : ℚ) / 1, (2398117933057824896101 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (990376591443635749747 : ℚ) / 9671406556917033397649408⟩,
  ⟨(32 : ℚ) / 1, (3305324043992177118037 : ℚ) / 19342813113834066795298816⟩,
  ⟨(64 : ℚ) / 1, (904961177982257980559 : ℚ) / 9671406556917033397649408⟩,
  ⟨(128 : ℚ) / 1, (177844317797823213 : ℚ) / 37778931862957161709568⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock002.summary (certificateWindow 257)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 257) =
    rationalLogValue (certificateWindow 257) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 2) = _
  rw [SuppliedDimensionZero4CachedBlock002.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary257
