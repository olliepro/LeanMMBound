import SuppliedDimensionLeafCachedBlock120
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary120
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (21636881135787434067263278125227829877066591228112723543787 : ℚ) / 6427752177035961102167848369364650410088811975131171341205504⟩,
  ⟨(5 : ℚ) / 1, (56975301057784008480703386701738529502207608894688566735421 : ℚ) / 3213876088517980551083924184682325205044405987565585670602752⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock120.summary (certificateWindow 120)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 120) =
    rationalLogValue (certificateWindow 120) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 120) = _
  rw [SuppliedDimensionLeafCachedBlock120.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary120
