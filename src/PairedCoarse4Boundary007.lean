import PairedCoarse4SourceBlock007
import PairedCoarse4CertificateTable
import PairedCoarse4Corrections

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary007
open SuppliedTerminalRates
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete source summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedCoarse4SourceBlock007.summary (PairedCoarse4CertificateTable.window 7)) =
    PairedCoarse4Corrections.corrections 7 := by decide +kernel

/-- The actual complete source block has the original certificate-window value plus its exact correction. -/
theorem value : rationalLogValue (block4 7) =
    rationalLogValue (PairedCoarse4CertificateTable.window 7) + rationalLogValue (PairedCoarse4Corrections.corrections 7) := by
  rw [PairedCoarse4SourceBlock007.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary007
