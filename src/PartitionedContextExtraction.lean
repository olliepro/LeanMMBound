module

public import HeterogeneousPartition
public import ContextProductReductions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A shared extraction of a labelled active subset extends to all source
factors when the complementary waiting factors have explicit restrictions. -/
namespace MatrixBounds.Tensor

universe v
open Interface
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K T : Type} [CommSemiring K] [Fintype T]

/-- Advance an arbitrary active subset and restore every original waiting label inside every retained output copy. -/
theorem ContextReduction.extract_partition
    {X Y Z U V W : T → Type}
    [∀ label, Fintype (X label)] [∀ label, Fintype (Y label)] [∀ label, Fintype (Z label)]
    [∀ label, Fintype (U label)] [∀ label, Fintype (V label)] [∀ label, Fintype (W label)]
    (predicate : T → Prop) [DecidablePred predicate]
    (source : ∀ label, Coeff K (X label) (Y label) (Z label))
    (target : ∀ label, Coeff K (U label) (V label) (W label)) {copies cost : ℕ}
    (active : ContextReduction.{v}
      (heterogeneous (fun label : {label // predicate label} => source label.val))
      (directSum (fun _ : Fin copies => heterogeneous (fun label : {label // predicate label} => target label.val))) cost)
    (waiting : CoordinateRestriction
      (heterogeneous (fun label : {label // ¬predicate label} => source label.val))
      (heterogeneous (fun label : {label // ¬predicate label} => target label.val))) :
    ContextReduction.{v} (heterogeneous source)
      (directSum (fun _ : Fin copies => heterogeneous target)) cost := by
  let inactive := heterogeneous (fun label : {label // ¬predicate label} => source label.val)
  let activeSource := heterogeneous (fun label : {label // predicate label} => source label.val)
  let activeTarget := heterogeneous (fun label : {label // predicate label} => target label.val)
  have split := (partitionRestriction predicate source).context
  have swapped := split.trans (productSwapRestriction activeSource inactive).context
  have extracted := swapped.trans (active.extract_with_waiting inactive)
  have restored := ((productSwapRestriction inactive activeTarget).trans
    ((CoordinateRestriction.refl activeTarget).product waiting)).trans (restorePartitionRestriction predicate target)
  simpa only [one_mul, mul_one] using extracted.trans (restored.context.batch (I := Fin copies))

/-- Restore two separated labelled tensor families into the complete product at every original label. -/
def distributeProductsRestriction {X Y Z U V W : T → Type}
    (first : ∀ label, Coeff K (X label) (Y label) (Z label))
    (second : ∀ label, Coeff K (U label) (V label) (W label)) :
    CoordinateRestriction (product (heterogeneous first) (heterogeneous second))
      (heterogeneous (fun label => product (first label) (second label))) where
  left entries := (fun label => (entries label).1, fun label => (entries label).2)
  middle entries := (fun label => (entries label).1, fun label => (entries label).2)
  right entries := (fun label => (entries label).1, fun label => (entries label).2)
  coefficient _ _ _ := by simp only [product, heterogeneous, Finset.prod_mul_distrib]

end
end MatrixBounds.Tensor
