import PairedCoarse3SourceBlock069
import PairedCoarse3CertificateTable
import PairedCoarse3Corrections

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Boundary069
open SuppliedTerminalRates
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete source summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedCoarse3SourceBlock069.summary (PairedCoarse3CertificateTable.window 69)) =
    PairedCoarse3Corrections.corrections 69 := by decide +kernel

/-- The actual complete source block has the original certificate-window value plus its exact correction. -/
theorem value : rationalLogValue (block3 69) =
    rationalLogValue (PairedCoarse3CertificateTable.window 69) + rationalLogValue (PairedCoarse3Corrections.corrections 69) := by
  rw [PairedCoarse3SourceBlock069.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse3Boundary069
