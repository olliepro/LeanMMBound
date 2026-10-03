module

public import HeterogeneousRegrouping

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Partition a labelled tensor product into active and waiting factors by
explicit coordinate maps, then restore all original labels. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {K T : Type*} [CommSemiring K] [Fintype T]

/-- Split all factors into a first subset and its complement without changing coefficients. -/
def partitionRestriction {X Y Z : T → Type*} (predicate : T → Prop) [DecidablePred predicate]
    (family : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    CoordinateRestriction (heterogeneous family)
      (product (heterogeneous (fun type : {type // predicate type} => family type.val))
        (heterogeneous (fun type : {type // ¬predicate type} => family type.val))) where
  left entries type := if present : predicate type then entries.1 ⟨type, present⟩ else entries.2 ⟨type, present⟩
  middle entries type := if present : predicate type then entries.1 ⟨type, present⟩ else entries.2 ⟨type, present⟩
  right entries type := if present : predicate type then entries.1 ⟨type, present⟩ else entries.2 ⟨type, present⟩
  coefficient x y z := by
    simp only [heterogeneous, product]
    rw [← Fintype.prod_subtype_mul_prod_subtype predicate]
    congr 1 <;> apply Finset.prod_congr rfl <;> intro type _
    · simp only [dif_pos type.property]
    · simp only [dif_neg type.property]

/-- Restore a partitioned product to its original labels by restriction to each subset. -/
def restorePartitionRestriction {X Y Z : T → Type*} (predicate : T → Prop) [DecidablePred predicate]
    (family : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    CoordinateRestriction
      (product (heterogeneous (fun type : {type // predicate type} => family type.val))
        (heterogeneous (fun type : {type // ¬predicate type} => family type.val)))
      (heterogeneous family) where
  left entries := (fun type => entries type.val, fun type => entries type.val)
  middle entries := (fun type => entries type.val, fun type => entries type.val)
  right entries := (fun type => entries type.val, fun type => entries type.val)
  coefficient x y z := Fintype.prod_subtype_mul_prod_subtype predicate (fun type => family type (x type) (y type) (z type))

end
end MatrixBounds.Interface
