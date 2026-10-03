module

public import ContextComposition
public import HeterogeneousFlatten

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit regrouping of heterogeneous axes is valid inside every context. -/
namespace MatrixBounds.Interface

universe v
open Tensor
noncomputable section
variable {T K : Type*} [Fintype T] [CommSemiring K] {S : T → Type*} [∀ type, Fintype (S type)]
variable {X Y Z : (type : T) → S type → Type*}

/-- Flatten the parent and child labels of exact tensors while preserving all context coordinates. -/
theorem contextReduction_flatten (family : ∀ type pool, Coeff K (X type pool) (Y type pool) (Z type pool)) :
    ContextReduction.{v} (heterogeneous (fun type => heterogeneous (family type)))
      (heterogeneous (fun index : (type : T) × S type => family index.1 index.2)) 1 := by
  have pulled := contextReduction_pullback.{v} (heterogeneous (fun type => heterogeneous (family type)))
    (fun x : ∀ index : (type : T) × S type, X index.1 index.2 => fun type pool => x ⟨type, pool⟩)
    (fun y : ∀ index : (type : T) × S type, Y index.1 index.2 => fun type pool => y ⟨type, pool⟩)
    (fun z : ∀ index : (type : T) × S type, Z index.1 index.2 => fun type pool => z ⟨type, pool⟩)
  simpa only [heterogeneous_flatten] using pulled

end
end MatrixBounds.Interface
