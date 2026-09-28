import PairedFine3Block123A0
import PairedFine3TableA0
import PairedFine3CorrectionsA0

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Boundary123A0
open SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete block summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedFine3Block123A0.summary (PairedFine3TableA0.window 123)) =
    PairedFine3CorrectionsA0.corrections 123 := by decide +kernel

/-- The actual complete block has the original certificate-window value plus its exact correction. -/
theorem value : (∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv ((123 : Fin 135), offset)) 0)) =
    rationalLogValue (PairedFine3TableA0.window 123) + rationalLogValue (PairedFine3CorrectionsA0.corrections 123) := by
  rw [PairedFine3Block123A0.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine3Boundary123A0
