import ContextRestrictions
import TensorTranspose
import HeterogeneousInterface

/-! Explicit coordinate maps and their coefficient identities can be composed
and multiplied without losing the physical tensor interpretation. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
variable {K X Y Z U V W : Type*} [CommSemiring K]

/-- Three coordinate selections whose pullback is the target tensor.
For example, a matrix leaf records the row/inner/column maps into its CW variables. -/
structure CoordinateRestriction (source : Coeff K X Y Z) (target : Coeff K U V W) where
  /-- Map a target X coordinate into its source axis. -/
  left : U → X
  /-- Map a target Y coordinate into its source axis. -/
  middle : V → Y
  /-- Map a target Z coordinate into its source axis. -/
  right : W → Z
  /-- The selected source coefficient is exactly the requested target coefficient. -/
  coefficient : ∀ x y z, source (left x) (middle y) (right z) = target x y z

/-- Identity coordinate selections preserve a tensor exactly. -/
def CoordinateRestriction.refl (tensor : Coeff K X Y Z) : CoordinateRestriction tensor tensor where
  left := id
  middle := id
  right := id
  coefficient _ _ _ := rfl

/-- Explicit coordinate selections give a unit-cost transformation in every tensor context. -/
theorem CoordinateRestriction.context {source : Coeff K X Y Z} {target : Coeff K U V W}
    (restriction : CoordinateRestriction source target) : ContextReduction.{v} source target 1 := by
  have identity : (fun x y z => source (restriction.left x) (restriction.middle y) (restriction.right z)) = target :=
    funext (fun x => funext (fun y => funext (restriction.coefficient x y)))
  rw [← identity]
  exact contextReduction_pullback _ _ _ _

/-- Coordinate selections compose by composing their three physical maps. -/
def CoordinateRestriction.trans {A B C : Type*} {source : Coeff K X Y Z} {middle : Coeff K U V W}
    {target : Coeff K A B C} (first : CoordinateRestriction source middle)
    (second : CoordinateRestriction middle target) : CoordinateRestriction source target where
  left := first.left ∘ second.left
  middle := first.middle ∘ second.middle
  right := first.right ∘ second.right
  coefficient x y z := (first.coefficient _ _ _).trans (second.coefficient x y z)

/-- Physical coordinate selections rotate together with source and target tensor axes. -/
def CoordinateRestriction.cyclic {source : Coeff K X Y Z} {target : Coeff K U V W}
    (restriction : CoordinateRestriction source target) :
    CoordinateRestriction (Tensor.cyclic source) (Tensor.cyclic target) where
  left := restriction.middle
  middle := restriction.right
  right := restriction.left
  coefficient x y z := restriction.coefficient z x y

/-- Coordinate maps on independent tensor factors combine componentwise. -/
def CoordinateRestriction.product {A B C D E F : Type*}
    {source : Coeff K X Y Z} {target : Coeff K U V W}
    {source' : Coeff K A B C} {target' : Coeff K D E F}
    (first : CoordinateRestriction source target) (second : CoordinateRestriction source' target') :
    CoordinateRestriction (Tensor.product source source') (Tensor.product target target') where
  left entries := (first.left entries.1, second.left entries.2)
  middle entries := (first.middle entries.1, second.middle entries.2)
  right entries := (first.right entries.1, second.right entries.2)
  coefficient x y z := by simp only [Tensor.product, first.coefficient, second.coefficient]

/-- Independent coordinate selections act on each labelled factor of a heterogeneous product. -/
def CoordinateRestriction.heterogeneous {T : Type*} [Fintype T]
    {X Y Z U V W : T → Type*} {source : ∀ t, Coeff K (X t) (Y t) (Z t)}
    {target : ∀ t, Coeff K (U t) (V t) (W t)}
    (restrictions : ∀ t, CoordinateRestriction (source t) (target t)) :
    CoordinateRestriction (Interface.heterogeneous source) (Interface.heterogeneous target) where
  left entries t := (restrictions t).left (entries t)
  middle entries t := (restrictions t).middle (entries t)
  right entries t := (restrictions t).right (entries t)
  coefficient x y z := Finset.prod_congr rfl (fun t _ => (restrictions t).coefficient (x t) (y t) (z t))

end
end MatrixBounds.Tensor
