import SuppliedDimensionLeafCachedBlock000
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary000
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (-712217845084343596192185824923554719677449876026102379031252769 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩,
  ⟨(5 : ℚ) / 1, (-11963394318899105826895165362128992893302708486180457462251116689 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock000.summary (certificateWindow 0)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 0) =
    rationalLogValue (certificateWindow 0) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 0) = _
  rw [SuppliedDimensionLeafCachedBlock000.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary000
