import PairedCoarse3SourceBlock088
import PairedCoarse3CertificateTable
import PairedCoarse3Corrections

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Boundary088
open SuppliedTerminalRates
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete source summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedCoarse3SourceBlock088.summary (PairedCoarse3CertificateTable.window 88)) =
    PairedCoarse3Corrections.corrections 88 := by decide +kernel

/-- The actual complete source block has the original certificate-window value plus its exact correction. -/
theorem value : rationalLogValue (block3 88) =
    rationalLogValue (PairedCoarse3CertificateTable.window 88) + rationalLogValue (PairedCoarse3Corrections.corrections 88) := by
  rw [PairedCoarse3SourceBlock088.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Boundary088
