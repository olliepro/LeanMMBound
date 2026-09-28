import SuppliedDimensionZero4CachedBlock005
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary260
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (296797361300407305 : ℚ) / 9671406556917033397649408⟩,
  ⟨(4 : ℚ) / 1, (386077307523652915 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (12180834573220432597 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (306494517871949741 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (-2782622375120433829443 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (-8646226655598302316841 : ℚ) / 19342813113834066795298816⟩,
  ⟨(64 : ℚ) / 1, (-2701649580492166642277 : ℚ) / 19342813113834066795298816⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock005.summary (certificateWindow 260)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 260) =
    rationalLogValue (certificateWindow 260) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 5) = _
  rw [SuppliedDimensionZero4CachedBlock005.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary260
