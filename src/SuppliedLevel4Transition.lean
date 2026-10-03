module

public import SuppliedLevel4TransitionAllocation
public import SuppliedLevel4TransitionRestoration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The checked canonical level-four output really supplies the canonical
level-three input, with every history label and every waiting zero source. -/
namespace MatrixBounds.Numeric.SuppliedLevel4Transition

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedPopulationPaths
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- The next stage inherits its own preceding parent's width; distinct histories stay distinct. -/
def nextTolerance (tolerance : Fin 105 × AxisOrder → ℝ) (label : SuppliedPathStages.Labels3) : ℝ :=
  tolerance (nodeParent label.val.source.1, label.val.previous)

/-- Positive next-stage labels keep strictly positive inherited widths. -/
theorem nextTolerance_positive (tolerance : Fin 105 × AxisOrder → ℝ)
    (positive : ∀ parent, 0 < tolerance parent) (label : SuppliedPathStages.Labels3) :
    0 < nextTolerance tolerance label := positive _

/-- The complete original strategy window has the precise parent shape stored in the next rational split. -/
def activeLabelRestriction (label : Label3) (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction
      (SuppliedAllocationWindows.strategy3 (K := K) label.source (weight3 label*size) tolerance)
      (SuppliedAllocationWindows.window (K := K) 4
        (SuppliedTypedParameters.level3Split label.source.1 label.source.2).parent
        (weight3 label*size) (SuppliedLeafLaws.parent3 label.source.1 label.source.2) tolerance) := by
  rw [SuppliedHierarchyParents.level3Split_parent]
  exact CoordinateRestriction.refl _

/-- Drop only empty allocated labels and identify all remaining original parent shapes and complete laws. -/
def activeParentRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction (active3 (K := K) size tolerance)
      (SuppliedStagePresentations.level3.originalParent (K := K) size 5 (nextTolerance tolerance)) := by
  change CoordinateRestriction (active3 (K := K) size tolerance)
    (heterogeneous (fun label : SuppliedPathStages.Labels3 =>
      SuppliedAllocationWindows.window (K := K) 4
        (SuppliedTypedParameters.level3Split label.val.source.1 label.val.source.2).parent
        (weight3 label.val*size) (SuppliedLeafLaws.parent3 label.val.source.1 label.val.source.2)
        (tolerance (nodeParent label.val.source.1, label.val.previous))))
  have drop := dropZeroWeightRestriction weight3 size
    (fun label => constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 label.source.1))
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (fun label => SuppliedLeafLaws.parent3 label.source.1 label.source.2 0)
    (fun label => SuppliedLeafLaws.parent3 label.source.1 label.source.2 1)
    (fun label => SuppliedLeafLaws.parent3 label.source.1 label.source.2 2)
    (fun label => tolerance (nodeParent label.source.1, label.previous))
  exact drop.trans (CoordinateRestriction.heterogeneous (fun label : SuppliedPathStages.Labels3 =>
    activeLabelRestriction (K := K) label.val size (tolerance (nodeParent label.val.source.1, label.val.previous))))

/-- Every actual complete level-four output supplies its exact next canonical parent and all waiting zero windows. -/
theorem canonical_transition {size : ℕ} (sizePositive : 0 < size)
    (tolerance : SuppliedFixedStages.Labels4 → ℝ) (positive : ∀ label, 0 < tolerance label) :
    ContextReduction.{v}
      (SuppliedStagePresentations.level4.originalChildren (K := K) size 5 tolerance)
      (product
        (SuppliedStagePresentations.level3.originalParent (K := K) size 5
          (nextTolerance (extendTolerance tolerance)))
        (waiting3 (K := K) size (extendTolerance tolerance))) 1 := by
  have allocations := full_transition (K := K) sizePositive (extendTolerance tolerance)
    (fun label => (extendTolerance_positive tolerance positive label).le)
  have retain := (activeParentRestriction (K := K) size (extendTolerance tolerance)).context.product
    (ContextReduction.refl (waiting3 (K := K) size (extendTolerance tolerance)))
  simpa only [one_mul] using ((originalChildRestriction (K := K) size tolerance).context.trans allocations).trans retain

end
end MatrixBounds.Numeric.SuppliedLevel4Transition
