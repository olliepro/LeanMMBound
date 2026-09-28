import SuppliedDimensionLeafCachedBlock083
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary083
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (9451180826227136385891768638665800270245388577280033172491281 : ℚ) / 822752278660603021077484591278675252491367932816789931674304512⟩,
  ⟨(5 : ℚ) / 1, (150582919870060678737621395661191608520467887927164314051112565 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock083.summary (certificateWindow 83)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 83) =
    rationalLogValue (certificateWindow 83) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 83) = _
  rw [SuppliedDimensionLeafCachedBlock083.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary083
