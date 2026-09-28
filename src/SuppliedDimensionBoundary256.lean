import SuppliedDimensionZero4CachedBlock001
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary256
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (63175605369681145 : ℚ) / 9671406556917033397649408⟩,
  ⟨(4 : ℚ) / 1, (2865538178433062491 : ℚ) / 604462909807314587353088⟩,
  ⟨(5 : ℚ) / 1, (13544705507719995899079 : ℚ) / 9671406556917033397649408⟩,
  ⟨(8 : ℚ) / 1, (1881997690956400661643 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (805675708562749051381 : ℚ) / 19342813113834066795298816⟩,
  ⟨(32 : ℚ) / 1, (260266650959979368121 : ℚ) / 4835703278458516698824704⟩,
  ⟨(64 : ℚ) / 1, (-452603447685905345473 : ℚ) / 4835703278458516698824704⟩,
  ⟨(128 : ℚ) / 1, (-177844317797823213 : ℚ) / 37778931862957161709568⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero4CachedBlock001.summary (certificateWindow 256)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 256) =
    rationalLogValue (certificateWindow 256) + rationalLogValue correction := by
  change rationalLogValue (zero4BlockExpression 1) = _
  rw [SuppliedDimensionZero4CachedBlock001.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary256
