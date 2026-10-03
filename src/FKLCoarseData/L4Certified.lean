module

public import FKLCoarseData.L4Corr
public import SuppliedPairedCoarseBinding

@[expose] public section

/-! Fast replacement of `PairedCoarse4Certified`: same final statements, boundaries from FKL checks. -/

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Certified

open FKL FKLCoarse MatrixBounds.Numeric.FKLCoarseData.L4
open scoped BigOperators
set_option maxRecDepth 100000

/-- Every complete source block has its original certificate window plus a raw FKL correction. -/
theorem boundaries (block : Fin 15) : rationalLogValue (block4 block) =
    rationalLogValue (MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.window block) + rawValue 197 132 (corrs.getD block.val []) := by
  fin_cases block
  · exact boundary000
  · exact boundary001
  · exact boundary002
  · exact boundary003
  · exact boundary004
  · exact boundary005
  · exact boundary006
  · exact boundary007
  · exact boundary008
  · exact boundary009
  · exact boundary010
  · exact boundary011
  · exact boundary012
  · exact boundary013
  · exact boundary014

/-- The actual complete original source expression is exactly the certified coarse expression. -/
theorem expression_eq : rationalLogValue expression4 = CertifiedLevel4Rate0.value := by
  rw [← blocks4_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4CertificateTable.windows_value]
  have : (∑ block : Fin 15, rawValue 197 132 (corrs.getD block.val [])) = 0 := by
    rw [sum_getD corrs 15 (by decide) (rawValue 197 132), corr_sum]
  rw [this, add_zero]

/-- The actual full-history coarse extraction rate equals its supplied certificate at the original population unit. -/
theorem normalized_rate_eq : (SuppliedPathStages.fixed .level4).rates 0 / (SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate0.value := by
  rw [normalized_stage4, expression_eq]

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Certified
