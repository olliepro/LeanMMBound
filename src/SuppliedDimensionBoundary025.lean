import SuppliedDimensionLeafCachedBlock025
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary025
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (459553641782663264308158282228235494744260877652434919832367 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (58004444949602189787340618907347517839433817159925653005332265 : ℚ) / 1645504557321206042154969182557350504982735865633579863348609024⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock025.summary (certificateWindow 25)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 25) =
    rationalLogValue (certificateWindow 25) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 25) = _
  rw [SuppliedDimensionLeafCachedBlock025.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary025
