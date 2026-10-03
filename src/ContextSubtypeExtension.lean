module

public import ContextComposition
public import SubtypeExtension

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Extending exact subtype axes by zero is a context-preserving operation. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K X Y Z : Type*} [CommSemiring K]

/-- Exact subtype coordinates extend by zero while every companion coefficient is preserved. -/
theorem contextReduction_extend_subtypes (tensor : Coeff K X Y Z)
    (keepX : X → Prop) (keepY : Y → Prop) (keepZ : Z → Prop) :
    ContextReduction.{v} (subtypeTensor tensor keepX keepY keepZ)
      (Empirical.acceptedTensor tensor id id id keepX keepY keepZ) 1 := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  have pulled := rankLE_pullback algorithm
    (fun x : {x : A × X // keepX x.2} => (x.val.1, ⟨x.val.2, x.property⟩))
    (fun y : {y : B × Y // keepY y.2} => (y.val.1, ⟨y.val.2, y.property⟩))
    (fun z : {z : C × Z // keepZ z.2} => (z.val.1, ⟨z.val.2, z.property⟩))
  have extended := rankLE_extend_subtypes (product companion tensor)
    (fun x => keepX x.2) (fun y => keepY y.2) (fun z => keepZ z.2) pulled
  have identity : Empirical.acceptedTensor (product companion tensor) id id id
      (fun x => keepX x.2) (fun y => keepY y.2) (fun z => keepZ z.2) =
      product companion (Empirical.acceptedTensor tensor id id id keepX keepY keepZ) := by
    funext x y z
    simp only [product, Empirical.acceptedTensor, id_eq, mul_ite, mul_zero]
  simpa only [identity, one_mul] using extended

end
end MatrixBounds.Tensor
