import SuppliedDimensionLeafCachedBlock006
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary006
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (2132642874996482800265154014797432720324788787564521182445 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(5 : ℚ) / 1, (146622339203633530780728261813635793671520121467500742267189 : ℚ) / 411376139330301510538742295639337626245683966408394965837152256⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock006.summary (certificateWindow 6)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 6) =
    rationalLogValue (certificateWindow 6) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 6) = _
  rw [SuppliedDimensionLeafCachedBlock006.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary006
