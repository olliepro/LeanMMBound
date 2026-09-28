import SuppliedDimensionLeafCachedBlock134
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary134
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (75097856196437138814346403649946923665794516430405686885 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(5 : ℚ) / 1, (852339260463876420135313482430338351563291796172339148033 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock134.summary (certificateWindow 134)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 134) =
    rationalLogValue (certificateWindow 134) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 134) = _
  rw [SuppliedDimensionLeafCachedBlock134.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary134
