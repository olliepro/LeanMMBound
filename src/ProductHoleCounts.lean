module

public import FiniteSelection
public import Mathlib.Logic.Equiv.Prod

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Integer hole bounds lift from individual coordinates to their entire
heterogeneous product, without division or independence assumptions on holes. -/
namespace MatrixBounds.Selection

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Index : Type*} [Fintype Index] {Outcome : Index → Type*} [∀ index, Fintype (Outcome index)]

/-- Split a product event on one coordinate into its local event and unrestricted remaining coordinates. -/
def coordinateHoleEquiv (index : Index) (holes : Outcome index → Prop) :
    {outcome : ∀ index, Outcome index // holes (outcome index)} ≃
      {outcome : Outcome index // holes outcome} × (∀ other : {other // other ≠ index}, Outcome other.val) :=
  ((Equiv.piSplitAt index Outcome).subtypeEquiv (fun _ => Iff.rfl)).trans Equiv.prodSubtypeFstEquivSubtypeProd

/-- A local integer hole fraction has the identical bound in the full product space. -/
theorem coordinate_holes_bound (index : Index) (holes : Outcome index → Prop) (scale constant : ℕ)
    (localBound : Nat.card {outcome : Outcome index // holes outcome}*scale ≤ constant*Nat.card (Outcome index)) :
    Nat.card {outcome : ∀ index, Outcome index // holes (outcome index)}*scale ≤
      constant*Nat.card (∀ index, Outcome index) := by
  have allCount := Nat.card_congr (Equiv.piSplitAt index Outcome)
  have holeCount := Nat.card_congr (coordinateHoleEquiv index holes)
  simp only [Nat.card_eq_fintype_card, Fintype.card_prod] at allCount holeCount localBound ⊢
  rw [allCount, holeCount]
  calc
    _ = (Fintype.card {outcome : Outcome index // holes outcome}*scale)*
        Fintype.card (∀ other : {other // other ≠ index}, Outcome other.val) := by ring
    _ ≤ (constant*Fintype.card (Outcome index))*
        Fintype.card (∀ other : {other // other ≠ index}, Outcome other.val) := Nat.mul_le_mul_right _ localBound
    _ = _ := by ring

/-- The union of coordinate hole sets costs at most the sum of their local integer constants. -/
theorem product_holes_bound (holes : ∀ index, Outcome index → Prop) (scale : ℕ) (constant : Index → ℕ)
    (localBounds : ∀ index, Nat.card {outcome : Outcome index // holes index outcome}*scale ≤
      constant index*Nat.card (Outcome index)) :
    Nat.card {outcome : ∀ index, Outcome index // ∃ index, holes index (outcome index)}*scale ≤
      (∑ index, constant index)*Nat.card (∀ index, Outcome index) := by
  have union := Nat.mul_le_mul_right scale (union_count (fun index (outcome : ∀ index, Outcome index) => holes index (outcome index)))
  rw [Finset.sum_mul] at union
  apply union.trans
  rw [Finset.sum_mul]
  exact Finset.sum_le_sum (fun index _ => coordinate_holes_bound index (holes index) scale (constant index) (localBounds index))

end
end MatrixBounds.Selection
