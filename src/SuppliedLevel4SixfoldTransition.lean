import SuppliedLevel4Transition
import ContextFactorGrouping

/-! Separate the waiting and active parts of the exact sixfold level-four
output for use by the complete batch schedule. -/
namespace MatrixBounds.Numeric.SuppliedLevel4Transition

universe v
open Tensor Tensor.CW Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- Six actual level-four outputs give all six waiting families beside the exact next canonical parents, at unit cost. -/
theorem sixfold_transition {size : ℕ} (sizePositive : 0 < size)
    (tolerance : SuppliedFixedStages.Labels4 → ℝ) (positive : ∀ label, 0 < tolerance label) :
    ContextReduction.{v}
      (heterogeneous (fun order : AxisOrder => orient order
        (SuppliedStagePresentations.level4.originalChildren (K := K) size 5 tolerance)))
      (product (heterogeneous (fun order : AxisOrder => orient order
        (waiting3 (K := K) size (extendTolerance tolerance))))
        (heterogeneous (fun order : AxisOrder => orient order
          (SuppliedStagePresentations.level3.originalParent (K := K) size 5
            (nextTolerance (extendTolerance tolerance)))))) 1 := by
  have transition := (canonical_transition (K := K) sizePositive tolerance positive).sixfold
  have separate := (sixfoldProductRestriction
    (SuppliedStagePresentations.level3.originalParent (K := K) size 5 (nextTolerance (extendTolerance tolerance)))
    (waiting3 (K := K) size (extendTolerance tolerance))).context
  have swap := (productSwapRestriction
    (heterogeneous (fun order : AxisOrder => orient order
      (SuppliedStagePresentations.level3.originalParent (K := K) size 5 (nextTolerance (extendTolerance tolerance)))))
    (heterogeneous (fun order : AxisOrder => orient order
      (waiting3 (K := K) size (extendTolerance tolerance))))).context
  simpa only [one_pow, one_mul] using (transition.trans separate).trans swap

end
end MatrixBounds.Numeric.SuppliedLevel4Transition
