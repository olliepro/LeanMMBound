import SuppliedRootFineBinding
import SuppliedRootCoarseRate

/-! The complete supplied root extraction retention has three exact source
expressions, with the coarse component already numerically identified. -/
namespace MatrixBounds.Numeric.SuppliedRootFine

open Tensor.CW
noncomputable section

/-- Complete actual root retention is precisely the minimum of its three exact expressions. -/
theorem retention_expression : SuppliedRootStage.retention =
    min CertifiedRootRate0.value
      (min (rationalLogValue (expression 0)) (rationalLogValue (expression 1))) := by
  unfold SuppliedRootStage.retention RootRestrictionData.rationalRetention
  rw [SuppliedRootCoarse.rate_eq, expression_value, expression_value]
  rfl

end
end MatrixBounds.Numeric.SuppliedRootFine
