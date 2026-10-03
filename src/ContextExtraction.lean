module

public import ContextRestrictions
public import SelectedTargets
public import RefinedOwnership
public import AcceptedRestrictions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Acceptance masks and unique-owner extraction have context-preserving
reductions, so they can process an incoming batch without losing its copies. -/
namespace MatrixBounds.Empirical

universe v
open Tensor
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K X Y Z PX PY PZ : Type*} [CommSemiring K] [Fintype X] [Fintype Y] [Fintype Z]

/-- Arbitrary independent axis-acceptance tests preserve every companion tensor at unit cost. -/
theorem contextReduction_accepted (source : Coeff K X Y Z)
    (typeX : X → PX) (typeY : Y → PY) (typeZ : Z → PZ)
    (acceptX : PX → Prop) (acceptY : PY → Prop) (acceptZ : PZ → Prop) :
    ContextReduction.{v} source (acceptedTensor source typeX typeY typeZ acceptX acceptY acceptZ) 1 := by
  simpa only [restrict_mask, decide_eq_true_eq, acceptedTensor] using! contextReduction_restrict source
    (mask (fun x => decide (acceptX (typeX x)))) (mask (fun y => decide (acceptY (typeY y))))
    (mask (fun z => decide (acceptZ (typeZ z))))

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.Extraction

universe v
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K E Selected X Y Z U V W BX BY BZ : Type*} [CommSemiring K] [Fintype E] [Fintype Selected] [DecidableEq E] [DecidableEq Selected]

omit [Fintype Selected] [DecidableEq Selected] in
/-- Independent owner pieces are obtained by a context-preserving tensor restriction. -/
theorem contextReduction_owned [Fintype X] [Fintype Y] [Fintype Z]
    (source : Coeff K X Y Z) (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ edge other third x y z, ownerX x = some edge → ownerY y = some other → ownerZ z = some third →
      source x y z ≠ 0 → edge = other ∧ other = third) :
    ContextReduction.{v} source (directSum (ownedPiece source ownerX ownerY ownerZ)) 1 := by
  rw [← owned_pieces_restriction source ownerX ownerY ownerZ disjoint]
  exact contextReduction_restrict _ _ _ _

omit [Fintype Selected] [DecidableEq Selected] in
/-- Adding windows to disjoint owner maps preserves their full contextual extraction property. -/
theorem contextReduction_refined [Fintype X] [Fintype Y] [Fintype Z]
    (source : Coeff K X Y Z) (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ edge other third x y z, ownerX x = some edge → ownerY y = some other → ownerZ z = some third →
      source x y z ≠ 0 → edge = other ∧ other = third)
    (acceptX : E → X → Prop) (acceptY : E → Y → Prop) (acceptZ : E → Z → Prop) :
    ContextReduction.{v} source (directSum (ownedPiece source (refineOwner ownerX acceptX)
      (refineOwner ownerY acceptY) (refineOwner ownerZ acceptZ))) 1 :=
  contextReduction_owned source _ _ _ (refined_owners_disjoint source ownerX ownerY ownerZ disjoint acceptX acceptY acceptZ)

omit [Fintype E] [Fintype Selected] in
/-- Selecting and identifying actual damaged targets preserves all earlier batches and waiting tensor factors. -/
theorem contextReduction_selectedOwnedTargets (embedding : Selected ↪ E)
    (source : Coeff K X Y Z) (target : Coeff K U V W)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (mapX : Selected → U → X) (mapY : Selected → V → Y) (mapZ : Selected → W → Z)
    (partX : U → BX) (partY : V → BY) (partZ : W → BZ)
    (holesX : Selected → BX → Prop) (holesY : Selected → BY → Prop) (holesZ : Selected → BZ → Prop)
    (coordinates : ∀ edge x y z, ¬holesX edge (partX x) → ¬holesY edge (partY y) → ¬holesZ edge (partZ z) →
      source (mapX edge x) (mapY edge y) (mapZ edge z) = target x y z)
    (ownsX : ∀ edge x, ownerX (mapX edge x) = some (embedding edge) ↔ ¬holesX edge (partX x))
    (ownsY : ∀ edge y, ownerY (mapY edge y) = some (embedding edge) ↔ ¬holesY edge (partY y))
    (ownsZ : ∀ edge z, ownerZ (mapZ edge z) = some (embedding edge) ↔ ¬holesZ edge (partZ z)) :
    ContextReduction.{v} (directSum (ownedPiece source ownerX ownerY ownerZ))
      (directSum (fun edge => Empirical.acceptedTensor target partX partY partZ
        (fun part => ¬holesX edge part) (fun part => ¬holesY edge part) (fun part => ¬holesZ edge part))) 1 := by
  rw [← selected_owned_targets_identity embedding source target ownerX ownerY ownerZ mapX mapY mapZ
    partX partY partZ holesX holesY holesZ coordinates ownsX ownsY ownsZ]
  exact contextReduction_pullback _ _ _ _

end
end MatrixBounds.Tensor.Extraction
