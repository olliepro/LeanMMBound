import SuppliedDimensionLeafCachedBlock042
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary042
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (399589124484176012964739043677332592078814835485661026618955 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (3815801815582095690993480934199928429045383791856956218290241 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock042.summary (certificateWindow 42)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 42) =
    rationalLogValue (certificateWindow 42) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 42) = _
  rw [SuppliedDimensionLeafCachedBlock042.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary042
