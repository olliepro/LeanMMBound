import SuppliedDimensionLeafCachedBlock017
import SuppliedDimensionCertificateWindows

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary017
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def correction : RationalLogExpression := [
  ⟨(2 : ℚ) / 1, (18562697562004901219141237741682036402458126461033712944875 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩,
  ⟨(5 : ℚ) / 1, (116133883529820656745479747939288885103846270226008214073625 : ℚ) / 12855504354071922204335696738729300820177623950262342682411008⟩
]

/-- The entire original source/certificate difference reduces to this exact shared-logarithm correction. -/
theorem correction_checked :
    mergeNormalizeLogExpression (SuppliedTerminalRates.differenceExpression
      SuppliedDimensionLeafCachedBlock017.summary (certificateWindow 17)) = correction := by decide +kernel

/-- This complete original source block has its exact certificate-window value and correction. -/
theorem boundary : rationalLogValue (orderedBlockExpression 17) =
    rationalLogValue (certificateWindow 17) + rationalLogValue correction := by
  change rationalLogValue (leafBlockExpression 17) = _
  rw [SuppliedDimensionLeafCachedBlock017.value]
  exact SuppliedTerminalRates.value_eq_add_of_correction correction_checked

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionBoundary017
