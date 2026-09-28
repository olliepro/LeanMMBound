import SuppliedDimensionZero3CachedBlock036
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary171
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (183519763006292216661178529341869 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (2112959520327827336953298438600625 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (3155819456803229623362697952943747 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(8 : ℚ) / 1, (154193487227985288671064496801013 : ℚ) / 10633823966279326983230456482242756608⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock036.summary (certificateWindow 171)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 171) =
    rationalLogValue (certificateWindow 171) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 36) = _
  rw [SuppliedDimensionZero3CachedBlock036.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary171
