import PairedFine4Block014A1
import PairedFine4TableA1
import PairedFine4CorrectionsA1

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary014A1
open SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete block summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedFine4Block014A1.summary (PairedFine4TableA1.window 14)) =
    PairedFine4CorrectionsA1.corrections 14 := by decide +kernel

/-- The actual complete block has the original certificate-window value plus its exact correction. -/
theorem value : (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv ((14 : Fin 15), offset)) 1)) =
    rationalLogValue (PairedFine4TableA1.window 14) + rationalLogValue (PairedFine4CorrectionsA1.corrections 14) := by
  rw [PairedFine4Block014A1.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary014A1
