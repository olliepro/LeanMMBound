import SuppliedDimensionLeafCachedBlock122
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary122
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (334135143281632352126104792176463013371428126473524842901433 : ℚ) / 102844034832575377634685573909834406561420991602098741459288064⟩,
  ⟨(5 : ℚ) / 1, (12972488483683244589248689729314925676556892643143345623449581 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock122.summary (certificateWindow 122)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 122) =
    rationalLogValue (certificateWindow 122) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 122) = _
  rw [SuppliedDimensionLeafCachedBlock122.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary122
