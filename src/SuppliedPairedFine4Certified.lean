import SuppliedPairedFineBlocks
import PairedFine4Boundary000A0
import PairedFine4Boundary001A0
import PairedFine4Boundary002A0
import PairedFine4Boundary003A0
import PairedFine4Boundary004A0
import PairedFine4Boundary005A0
import PairedFine4Boundary006A0
import PairedFine4Boundary007A0
import PairedFine4Boundary008A0
import PairedFine4Boundary009A0
import PairedFine4Boundary010A0
import PairedFine4Boundary011A0
import PairedFine4Boundary012A0
import PairedFine4Boundary013A0
import PairedFine4Boundary014A0
import PairedFine4Boundary000A1
import PairedFine4Boundary001A1
import PairedFine4Boundary002A1
import PairedFine4Boundary003A1
import PairedFine4Boundary004A1
import PairedFine4Boundary005A1
import PairedFine4Boundary006A1
import PairedFine4Boundary007A1
import PairedFine4Boundary008A1
import PairedFine4Boundary009A1
import PairedFine4Boundary010A1
import PairedFine4Boundary011A1
import PairedFine4Boundary012A1
import PairedFine4Boundary013A1
import PairedFine4Boundary014A1

namespace MatrixBounds.Numeric.SuppliedPairedFine.SuppliedPairedFine4Certified
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Every complete block on fine axis 0 has its checked certificate window and correction. -/
theorem boundaries0 (block : Fin 15) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) 0)) =
      rationalLogValue (PairedFine4TableA0.window block) + rationalLogValue (PairedFine4CorrectionsA0.corrections block) := by
  fin_cases block
  · exact PairedFine4Boundary000A0.value
  · exact PairedFine4Boundary001A0.value
  · exact PairedFine4Boundary002A0.value
  · exact PairedFine4Boundary003A0.value
  · exact PairedFine4Boundary004A0.value
  · exact PairedFine4Boundary005A0.value
  · exact PairedFine4Boundary006A0.value
  · exact PairedFine4Boundary007A0.value
  · exact PairedFine4Boundary008A0.value
  · exact PairedFine4Boundary009A0.value
  · exact PairedFine4Boundary010A0.value
  · exact PairedFine4Boundary011A0.value
  · exact PairedFine4Boundary012A0.value
  · exact PairedFine4Boundary013A0.value
  · exact PairedFine4Boundary014A0.value

/-- The complete original fine source expression on axis 0 is exactly its independent certificate. -/
theorem expression_eq0 : rationalLogValue (expression4 0) = CertifiedLevel4Rate1.value := by
  rw [expression4_blocks]
  simp_rw [boundaries0]
  rw [Finset.sum_add_distrib, PairedFine4TableA0.windows_value, PairedFine4CorrectionsA0.cancelled, add_zero]

/-- The actual normalized level-4 fine rate on physical axis 1 equals its supplied certificate. -/
theorem level4_rate1 : SuppliedFixedStages.level4.rates 1/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate1.value := by
  have identity := normalized_stage_rate4 0
  rw [expression_eq0] at identity
  exact identity
/-- Every complete block on fine axis 1 has its checked certificate window and correction. -/
theorem boundaries1 (block : Fin 15) :
    (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) 1)) =
      rationalLogValue (PairedFine4TableA1.window block) + rationalLogValue (PairedFine4CorrectionsA1.corrections block) := by
  fin_cases block
  · exact PairedFine4Boundary000A1.value
  · exact PairedFine4Boundary001A1.value
  · exact PairedFine4Boundary002A1.value
  · exact PairedFine4Boundary003A1.value
  · exact PairedFine4Boundary004A1.value
  · exact PairedFine4Boundary005A1.value
  · exact PairedFine4Boundary006A1.value
  · exact PairedFine4Boundary007A1.value
  · exact PairedFine4Boundary008A1.value
  · exact PairedFine4Boundary009A1.value
  · exact PairedFine4Boundary010A1.value
  · exact PairedFine4Boundary011A1.value
  · exact PairedFine4Boundary012A1.value
  · exact PairedFine4Boundary013A1.value
  · exact PairedFine4Boundary014A1.value

/-- The complete original fine source expression on axis 1 is exactly its independent certificate. -/
theorem expression_eq1 : rationalLogValue (expression4 1) = CertifiedLevel4Rate2.value := by
  rw [expression4_blocks]
  simp_rw [boundaries1]
  rw [Finset.sum_add_distrib, PairedFine4TableA1.windows_value, PairedFine4CorrectionsA1.cancelled, add_zero]

/-- The actual normalized level-4 fine rate on physical axis 2 equals its supplied certificate. -/
theorem level4_rate2 : SuppliedFixedStages.level4.rates 2/(SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate2.value := by
  have identity := normalized_stage_rate4 1
  rw [expression_eq1] at identity
  exact identity

end MatrixBounds.Numeric.SuppliedPairedFine.SuppliedPairedFine4Certified
