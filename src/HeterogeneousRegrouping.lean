module

public import CoordinateRestriction
public import HeterogeneousFlatten

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit coordinate maps regroup labelled tensor factors without changing
their coefficients, for active stages, waiting factors, and terminal outputs. -/
namespace MatrixBounds.Interface

universe u
open Tensor
open scoped BigOperators
noncomputable section
variable {K T S : Type*} [CommSemiring K] [Fintype T] [Fintype S]

/-- Flatten nested labelled products by assembling each outer factor from its child coordinates. -/
def flattenRestriction {Pools : T → Type*} [∀ type, Fintype (Pools type)]
    {X Y Z : (type : T) → Pools type → Type*}
    (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool)) :
    CoordinateRestriction (heterogeneous (fun type => heterogeneous (family type)))
      (heterogeneous (fun index : (type : T) × Pools type => family index.1 index.2)) where
  left entries type pool := entries ⟨type, pool⟩
  middle entries type pool := entries ⟨type, pool⟩
  right entries type pool := entries ⟨type, pool⟩
  coefficient left middle right := by simp only [heterogeneous, Fintype.prod_sigma]

/-- Regroup a flattened dependent product into its outer and inner labels through explicit coordinate maps. -/
def unflattenRestriction {Pools : T → Type*} [∀ type, Fintype (Pools type)]
    {X Y Z : (type : T) → Pools type → Type*}
    (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool)) :
    CoordinateRestriction (heterogeneous (fun index : (type : T) × Pools type => family index.1 index.2))
      (heterogeneous (fun type => heterogeneous (family type))) where
  left entries index := entries index.1 index.2
  middle entries index := entries index.1 index.2
  right entries index := entries index.1 index.2
  coefficient left middle right := by simp only [heterogeneous, Fintype.prod_sigma]

/-- Group the two labelled halves of a sum-indexed family into an ordinary tensor product. -/
def sumProductRestriction {X Y Z : T → Type u} {U V W : S → Type u}
    (first : ∀ type, Coeff K (X type) (Y type) (Z type))
    (second : ∀ type, Coeff K (U type) (V type) (W type)) :
    CoordinateRestriction (heterogeneous (T := T ⊕ S) (X := Sum.elim X U) (Y := Sum.elim Y V) (Z := Sum.elim Z W)
      (fun type => Sum.rec first second type))
      (product (heterogeneous first) (heterogeneous second)) where
  left entries := Sum.rec entries.1 entries.2
  middle entries := Sum.rec entries.1 entries.2
  right entries := Sum.rec entries.1 entries.2
  coefficient left middle right := by simp only [heterogeneous, Fintype.prod_sum_type, product]

/-- Restore two tensor products to one labelled sum family, preserving every factor. -/
def productSumRestriction {X Y Z : T → Type u} {U V W : S → Type u}
    (first : ∀ type, Coeff K (X type) (Y type) (Z type))
    (second : ∀ type, Coeff K (U type) (V type) (W type)) :
    CoordinateRestriction (product (heterogeneous first) (heterogeneous second))
      (heterogeneous (T := T ⊕ S) (X := Sum.elim X U) (Y := Sum.elim Y V) (Z := Sum.elim Z W)
        (fun type => Sum.rec first second type)) where
  left entries := (fun type => entries (.inl type), fun type => entries (.inr type))
  middle entries := (fun type => entries (.inl type), fun type => entries (.inr type))
  right entries := (fun type => entries (.inl type), fun type => entries (.inr type))
  coefficient left middle right := by simp only [heterogeneous, Fintype.prod_sum_type, product]

end
end MatrixBounds.Interface
