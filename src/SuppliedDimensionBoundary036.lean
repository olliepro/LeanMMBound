import SuppliedDimensionLeafCachedBlock036
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary036
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (12719624945475225354420343211685158110287662650078168911985 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩,
  ⟨(5 : ℚ) / 1, (40713316894665113517086734606344930995692972153044833891951 : ℚ) / 51422017416287688817342786954917203280710495801049370729644032⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock036.summary (certificateWindow 36)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 36) =
    rationalLogValue (certificateWindow 36) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 36) = _
  rw [SuppliedDimensionLeafCachedBlock036.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary036
