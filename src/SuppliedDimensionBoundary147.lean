import SuppliedDimensionZero3CachedBlock012
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary147
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (76117583918139179134754660625 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (492655372698441122819769458415 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (2911495353388441269091804965 : ℚ) / 41538374868278621028243970633760768⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionZero3CachedBlock012.summary (certificateWindow 147)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 147) =
    rationalLogValue (certificateWindow 147) + rationalLogValue correction := by
  change rationalLogValue (zero3BlockExpression 12) = _
  rw [SuppliedDimensionZero3CachedBlock012.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary147
