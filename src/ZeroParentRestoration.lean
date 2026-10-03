module

public import ZeroWeightRestoration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Restoring an empty parent restores only empty child windows. This retains
the complete original parent labels after a positive-parent extraction. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K]
variable {Child : T → Type*} [∀ type, Fintype (Child type)]
variable {X Y Z BX BY BZ : ∀ type, Child type → Type*}

/-- Restore every original zero-parent label and its complete family of neutral child windows. -/
def restoreZeroParentRestriction (parentWeight : T → ℕ) (childWeight : ∀ type, Child type → ℕ)
    (emptyChild : ∀ type, parentWeight type = 0 → ∀ child, childWeight type child = 0) (size : ℕ)
    (family : ∀ type child, Coeff K (X type child) (Y type child) (Z type child))
    (partX : ∀ type child, X type child → BX type child)
    (partY : ∀ type child, Y type child → BY type child)
    (partZ : ∀ type child, Z type child → BZ type child)
    (lawX : ∀ type child, BX type child → ℝ) (lawY : ∀ type child, BY type child → ℝ)
    (lawZ : ∀ type child, BZ type child → ℝ) (tolerance : ∀ type, Child type → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun type : PositiveWeight parentWeight => heterogeneous (fun child =>
        windowedPower (P := Fin (childWeight type.val child*size)) (family type.val child)
          (partX type.val child) (partY type.val child) (partZ type.val child)
          (lawX type.val child) (lawY type.val child) (lawZ type.val child) (tolerance type.val child))))
      (heterogeneous (fun type => heterogeneous (fun child =>
        windowedPower (P := Fin (childWeight type child*size)) (family type child)
          (partX type child) (partY type child) (partZ type child)
          (lawX type child) (lawY type child) (lawZ type child) (tolerance type child)))) where
  left entries type child := entries type.val child
  middle entries type child := entries type.val child
  right entries type child := entries type.val child
  coefficient x y z := by
    let coefficient := fun type => heterogeneous (fun child =>
      windowedPower (P := Fin (childWeight type child*size)) (family type child)
        (partX type child) (partY type child) (partZ type child)
        (lawX type child) (lawY type child) (lawZ type child) (tolerance type child)) (x type) (y type) (z type)
    have partition := Fintype.prod_subtype_mul_prod_subtype (fun type => 0 < parentWeight type) coefficient
    have empty : (∏ type : {type // ¬0 < parentWeight type}, coefficient type.val) = 1 := by
      apply Finset.prod_eq_one
      intro type _
      unfold coefficient heterogeneous
      apply Finset.prod_eq_one
      intro child _
      exact windowedPower_empty _ _ _ _ _ _ _ _
        (by simp only [Fintype.card_fin, emptyChild type.val (Nat.eq_zero_of_not_pos type.property), zero_mul]) _ _ _
    rw [empty, mul_one] at partition
    exact partition

end
end MatrixBounds.Interface
