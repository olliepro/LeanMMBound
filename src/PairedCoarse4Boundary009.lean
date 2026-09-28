import PairedCoarse4SourceBlock009
import PairedCoarse4CertificateTable
import PairedCoarse4Corrections

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary009
open SuppliedTerminalRates
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete source summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedCoarse4SourceBlock009.summary (PairedCoarse4CertificateTable.window 9)) =
    PairedCoarse4Corrections.corrections 9 := by decide +kernel

/-- The actual complete source block has the original certificate-window value plus its exact correction. -/
theorem value : rationalLogValue (block4 9) =
    rationalLogValue (PairedCoarse4CertificateTable.window 9) + rationalLogValue (PairedCoarse4Corrections.corrections 9) := by
  rw [PairedCoarse4SourceBlock009.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary009
