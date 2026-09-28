import SuppliedDimensionZero4CachedBlock003
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary258
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(4 : ℚ) / 1, (751718640831167517 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (5512991461318556423 : ℚ) / 2417851639229258349412352⟩,
  ⟨(8 : ℚ) / 1, (183067545844507837 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (70954006860855499 : ℚ) / 302231454903657293676544⟩,
  ⟨(32 : ℚ) / 1, (45875858370220557 : ℚ) / 151115727451828646838272⟩,
  ⟨(64 : ℚ) / 1, (245717389552710387 : ℚ) / 9671406556917033397649408⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock003.summary (certificateWindow 258)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 258) =
    rationalLogValue (certificateWindow 258) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 3) = _
  rw [SuppliedDimensionZero4CachedBlock003.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary258
