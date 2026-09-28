import SuppliedDimensionLeafCachedBlock086
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary086
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2604145513958318305782953204003120497337050122737541502137945 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (30119317202842774015104171377054599812834917968701112576199925 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock086.summary (certificateWindow 86)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 86) =
    rationalLogValue (certificateWindow 86) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 86) = _
  rw [SuppliedDimensionLeafCachedBlock086.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary086
