import PairedFine4Block004A0
import PairedFine4TableA0
import PairedFine4CorrectionsA0

namespace MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary004A0
open SuppliedTerminalRates
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- The complete block summary differs from its original certificate window by exactly the declared shared terms. -/
theorem checked : mergeNormalizeLogExpression (differenceExpression PairedFine4Block004A0.summary (PairedFine4TableA0.window 4)) =
    PairedFine4CorrectionsA0.corrections 4 := by decide +kernel

/-- The actual complete block has the original certificate-window value plus its exact correction. -/
theorem value : (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv ((4 : Fin 15), offset)) 0)) =
    rationalLogValue (PairedFine4TableA0.window 4) + rationalLogValue (PairedFine4CorrectionsA0.corrections 4) := by
  rw [PairedFine4Block004A0.value]
  exact value_eq_add_of_correction checked

end MatrixBounds.Numeric.SuppliedPairedFine.PairedFine4Boundary004A0
