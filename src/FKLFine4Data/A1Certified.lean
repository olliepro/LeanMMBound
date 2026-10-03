module

public import FKLFine4Data.A1Corr
public import SuppliedPairedFineBlocks
public import PairedFine4TableA1

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4Data.A1

open FKL FKLFine3 FKLFine4 SuppliedPairedFine
open scoped BigOperators
set_option maxRecDepth 100000

/-- Fast block boundaries of level-four fine axis 1. -/
theorem boundaries (block : Fin 15) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) 1)) =
      rationalLogValue (MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.window block) + rawValue 406 494 (corrs.getD block.val []) := by
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

/-- The complete original level-four fine source expression on fine axis 1 is exactly its certificate. -/
theorem expression_eq : rationalLogValue (expression4 1) = CertifiedLevel4Rate2.value := by
  rw [expression4_blocks]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4TableA1.windows_value]
  have : (∑ block : Fin 15, rawValue 406 494 (corrs.getD block.val [])) = 0 := by
    rw [sum_getD corrs 15 (by decide) (rawValue 406 494), corr_sum]
  rw [this, add_zero]

/-- The actual normalized level-4 fine rate on physical axis 2 equals its supplied certificate. -/
theorem level4_rate2 : SuppliedFixedStages.level4.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate2.value := by
  have identity := normalized_stage_rate4 1
  rw [expression_eq] at identity
  exact identity

end MatrixBounds.Numeric.FKLFine4Data.A1
