module

public import WindowedInterface
public import ContextRestrictions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Empty labelled powers contribute the scalar one. Dropping them is an
explicit coordinate restriction, allowing extraction on nonempty parent pools. -/
namespace MatrixBounds.Interface

universe v
open Tensor
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K]
variable {Positions X Y Z BX BY BZ : T → Type*} [∀ type, Fintype (Positions type)]

/-- Labels whose physical position pools are nonempty. -/
abbrev ActivePool (Positions : T → Type*) := {type // Nonempty (Positions type)}

/-- Embed the active-pool coordinates into all pools; an actual position itself proves its pool is active. -/
def includeActive (entries : ∀ type : ActivePool Positions, Positions type.val → X type.val) :
    ∀ type, Positions type → X type := fun type position => entries ⟨type, ⟨position⟩⟩ position

/-- An active label's position type has the nonemptiness instance needed by the extraction theorems. -/
instance activePoolNonempty (type : ActivePool Positions) : Nonempty (Positions type.val) := type.property

/-- The coefficient of the regrouped full product equals that of its nonempty pools. -/
theorem active_pool_identity (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ)
    (x : ∀ type : ActivePool Positions, Positions type.val → X type.val)
    (y : ∀ type : ActivePool Positions, Positions type.val → Y type.val)
    (z : ∀ type : ActivePool Positions, Positions type.val → Z type.val) :
    heterogeneous (fun type => windowedPower (P := Positions type) (family type) (partX type) (partY type) (partZ type)
      (lawX type) (lawY type) (lawZ type) (tolerance type)) (includeActive x) (includeActive y) (includeActive z) =
    heterogeneous (fun type : ActivePool Positions => windowedPower (P := Positions type.val) (family type.val)
      (partX type.val) (partY type.val) (partZ type.val) (lawX type.val) (lawY type.val) (lawZ type.val) (tolerance type.val)) x y z := by
  let coefficients := fun type => windowedPower (P := Positions type) (family type) (partX type) (partY type) (partZ type)
    (lawX type) (lawY type) (lawZ type) (tolerance type) (includeActive x type) (includeActive y type) (includeActive z type)
  have partition := Fintype.prod_subtype_mul_prod_subtype (fun type => Nonempty (Positions type)) coefficients
  have emptyProduct : (∏ type : {type // ¬Nonempty (Positions type)}, coefficients type.val) = 1 := by
    apply Finset.prod_eq_one
    intro type _
    haveI : IsEmpty (Positions type.val) := not_nonempty_iff.mp type.property
    exact windowedPower_empty _ _ _ _ _ _ _ _ (Fintype.card_eq_zero) _ _ _
  rw [emptyProduct, mul_one] at partition
  change (∏ type, coefficients type) = _
  rw [← partition]
  apply Finset.prod_congr rfl
  intro type _
  rfl

/-- Removing neutral empty pools preserves the complete tensor context at unit cost. -/
theorem contextReduction_drop_empty_pools (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ) :
    ContextReduction.{v}
      (heterogeneous (fun type => windowedPower (P := Positions type) (family type) (partX type) (partY type) (partZ type)
        (lawX type) (lawY type) (lawZ type) (tolerance type)))
      (heterogeneous (fun type : ActivePool Positions => windowedPower (P := Positions type.val) (family type.val)
        (partX type.val) (partY type.val) (partZ type.val) (lawX type.val) (lawY type.val) (lawZ type.val) (tolerance type.val))) 1 := by
  have pulled := contextReduction_pullback.{v}
    (heterogeneous (fun type => windowedPower (P := Positions type) (family type) (partX type) (partY type) (partZ type)
      (lawX type) (lawY type) (lawZ type) (tolerance type))) includeActive includeActive includeActive
  simpa only [active_pool_identity] using pulled

end
end MatrixBounds.Interface
