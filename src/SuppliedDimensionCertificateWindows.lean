import SuppliedDimensionBlocks
import SuppliedDimensionCertificateTable0
import SuppliedDimensionCertificateTable1
import SuppliedDimensionCertificateTable2
import TerminalRateWindowCorrection
import CertifiedPipelineScalar

/-! The original source dimension and all three unchanged certificates admit
the same complete finite block accounting. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open scoped BigOperators
noncomputable section

/-- All original source dimensions in leaf, hierarchy, and root source order. -/
def orderedBlockExpression : Fin (135+(120+12)) → RationalLogExpression :=
  Fin.addCases leafBlockExpression (Fin.addCases zero3BlockExpression zero4BlockExpression)

/-- Reordering the three complete source families preserves their full real logarithmic value. -/
theorem ordered_blocks_value : rationalLogValue expression =
    ∑ block, rationalLogValue (orderedBlockExpression block) := by
  simp only [orderedBlockExpression, Fin.sum_univ_add, Fin.addCases_left, Fin.addCases_right]
  rw [expression_blocks_value]
  ring

/-- Three complete original axis windows belonging to one common source block. -/
def certificateWindow (block : Fin 267) : RationalLogExpression :=
  SuppliedDimensionCertificateTable0.window block ++
    SuppliedDimensionCertificateTable1.window block ++
    SuppliedDimensionCertificateTable2.window block

/-- The source-aligned windows include every original dimension certificate term exactly once. -/
theorem certificate_windows_value :
    (∑ block, rationalLogValue (certificateWindow block)) = CertifiedPipelineScalar.volume := by
  simp only [certificateWindow, rationalLogValue_append, Finset.sum_add_distrib,
    SuppliedDimensionCertificateTable0.windows_value,
    SuppliedDimensionCertificateTable1.windows_value,
    SuppliedDimensionCertificateTable2.windows_value]
  simp only [CertifiedPipelineScalar.volume, CertifiedPipelineScalar.dimensionRates,
    Fin.sum_univ_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Fin.sum_univ_zero, add_zero]
  ring

/-- Complete source-window identities and exact correction cancellation identify the whole dimension certificate. -/
theorem expression_of_window_corrections
    (corrections : Fin 267 → RationalLogExpression)
    (boundaries : ∀ block, rationalLogValue (orderedBlockExpression block) =
      rationalLogValue (certificateWindow block) + rationalLogValue (corrections block))
    (cancelled : (∑ block, rationalLogValue (corrections block)) = 0) :
    rationalLogValue expression = CertifiedPipelineScalar.volume := by
  rw [ordered_blocks_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, certificate_windows_value, cancelled, add_zero]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
