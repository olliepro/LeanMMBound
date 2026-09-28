import SuppliedDimensionLeafCachedBlock046
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary046
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2112618093041530508804500230587121776428364121887141766343275 : ℚ) / 205688069665150755269371147819668813122841983204197482918576128⟩,
  ⟨(5 : ℚ) / 1, (6634438203726025474888741425443017556447885152924178292755325 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock046.summary (certificateWindow 46)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 46) =
    rationalLogValue (certificateWindow 46) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 46) = _
  rw [SuppliedDimensionLeafCachedBlock046.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary046
