import PairedFine4Block013A0
import PairedFine4TableA0
import PairedFine4CorrectionsA0

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary013A0
open SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete block summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedFine4Block013A0.summary (PairedFine4TableA0.window 13)) =
    PairedFine4CorrectionsA0.corrections 13 := by decide +kernel

/-- The actual complete block has the original certificate-window value plus its exact correction. -/
theorem value : (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv ((13 : Fin 15), offset)) 0)) =
    rationalLogValue (PairedFine4TableA0.window 13) + rationalLogValue (PairedFine4CorrectionsA0.corrections 13) := by
  rw [PairedFine4Block013A0.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary013A0
