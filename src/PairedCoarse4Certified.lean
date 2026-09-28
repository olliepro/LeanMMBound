import SuppliedPairedCoarseBinding
import PairedCoarse4Boundary000
import PairedCoarse4Boundary001
import PairedCoarse4Boundary002
import PairedCoarse4Boundary003
import PairedCoarse4Boundary004
import PairedCoarse4Boundary005
import PairedCoarse4Boundary006
import PairedCoarse4Boundary007
import PairedCoarse4Boundary008
import PairedCoarse4Boundary009
import PairedCoarse4Boundary010
import PairedCoarse4Boundary011
import PairedCoarse4Boundary012
import PairedCoarse4Boundary013
import PairedCoarse4Boundary014

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Certified
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Every complete actual source block has its independently checked original certificate window and correction. -/
theorem boundaries (block : Fin 15) : rationalLogValue (block4 block) =
    rationalLogValue (PairedCoarse4CertificateTable.window block) + rationalLogValue (PairedCoarse4Corrections.corrections block) := by
  fin_cases block
  · exact PairedCoarse4Boundary000.value
  · exact PairedCoarse4Boundary001.value
  · exact PairedCoarse4Boundary002.value
  · exact PairedCoarse4Boundary003.value
  · exact PairedCoarse4Boundary004.value
  · exact PairedCoarse4Boundary005.value
  · exact PairedCoarse4Boundary006.value
  · exact PairedCoarse4Boundary007.value
  · exact PairedCoarse4Boundary008.value
  · exact PairedCoarse4Boundary009.value
  · exact PairedCoarse4Boundary010.value
  · exact PairedCoarse4Boundary011.value
  · exact PairedCoarse4Boundary012.value
  · exact PairedCoarse4Boundary013.value
  · exact PairedCoarse4Boundary014.value

/-- The actual complete original source expression is exactly the independently certified coarse expression. -/
theorem expression_eq : rationalLogValue expression4 = CertifiedLevel4Rate0.value := by
  rw [← blocks4_value]
  simp_rw [boundaries]
  rw [Finset.sum_add_distrib, PairedCoarse4CertificateTable.windows_value, PairedCoarse4Corrections.cancelled, add_zero]

/-- The actual full-history coarse extraction rate equals its supplied certificate at the original population unit. -/
theorem normalized_rate_eq : (SuppliedPathStages.fixed .level4).rates 0 / (SuppliedPopulationWeights.rootWeight : ℝ) =
    CertifiedLevel4Rate0.value := by
  rw [normalized_stage4, expression_eq]

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Certified
