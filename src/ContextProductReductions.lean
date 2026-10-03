module

public import ContextProducts
public import CoordinateRestriction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent contextual transformations combine multiplicatively while
preserving arbitrary further companion factors. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Exchange two independent tensor factors through three actual coordinate swaps. -/
def productSwapRestriction {X Y Z U V W : Type*}
    (first : Coeff K X Y Z) (second : Coeff K U V W) :
    CoordinateRestriction (product first second) (product second first) where
  left := Prod.swap
  middle := Prod.swap
  right := Prod.swap
  coefficient _ _ _ := mul_comm _ _

/-- Preserve a finite right-hand tensor factor through a contextual transformation. -/
theorem ContextReduction.keep_right {X Y Z U V W A B C : Type}
    [Fintype A] [Fintype B] [Fintype C]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) (waiting : Coeff K A B C) :
    ContextReduction.{v} (product source waiting) (product target waiting) cost := by
  simpa only [one_mul, mul_one] using
    ((productSwapRestriction source waiting).context.trans (reduction.keep_left waiting)).trans
      (productSwapRestriction waiting target).context

/-- Independent contextual transformations multiply their costs once across a tensor product. -/
theorem ContextReduction.product {X Y Z U V W A B C D E F : Type}
    [Fintype A] [Fintype B] [Fintype C] [Fintype U] [Fintype V] [Fintype W]
    {source : Coeff K X Y Z} {target : Coeff K U V W}
    {source' : Coeff K A B C} {target' : Coeff K D E F} {cost cost' : ℕ}
    (first : ContextReduction.{v} source target cost) (second : ContextReduction.{v} source' target' cost') :
    ContextReduction.{v} (Tensor.product source source') (Tensor.product target target') (cost*cost') := by
  simpa only [Nat.mul_comm cost' cost] using (first.keep_right source').trans (second.keep_left target)

end
end MatrixBounds.Tensor
