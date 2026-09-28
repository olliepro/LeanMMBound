import PairedCoarse4SourceBlock008
import PairedCoarse4CertificateTable
import PairedCoarse4Corrections

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary008
open SuppliedTerminalRates
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete source summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedCoarse4SourceBlock008.summary (PairedCoarse4CertificateTable.window 8)) =
    PairedCoarse4Corrections.corrections 8 := by decide +kernel

/-- The actual complete source block has the original certificate-window value plus its exact correction. -/
theorem value : rationalLogValue (block4 8) =
    rationalLogValue (PairedCoarse4CertificateTable.window 8) + rationalLogValue (PairedCoarse4Corrections.corrections 8) := by
  rw [PairedCoarse4SourceBlock008.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Boundary008
