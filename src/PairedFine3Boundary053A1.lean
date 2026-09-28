import PairedFine3Block053A1
import PairedFine3TableA1
import PairedFine3CorrectionsA1

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Boundary053A1
open SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete block summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedFine3Block053A1.summary (PairedFine3TableA1.window 53)) =
    PairedFine3CorrectionsA1.corrections 53 := by decide +kernel

/-- The actual complete block has the original certificate-window value plus its exact correction. -/
theorem value : (∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((53 : Fin 135), offset)) 1)) =
    rationalLogValue (PairedFine3TableA1.window 53) + rationalLogValue (PairedFine3CorrectionsA1.corrections 53) := by
  rw [PairedFine3Block053A1.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Boundary053A1
