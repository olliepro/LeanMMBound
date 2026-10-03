module

public import OwnedTargets

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Retain an injected subfamily of the actual independent owner pieces, then
identify its coordinate maps with a common target and per-copy fine-block holes. -/
namespace MatrixBounds.Tensor.Extraction

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K E Selected X Y Z U V W BX BY BZ : Type*} [CommSemiring K]
variable [Fintype E] [Fintype Selected] [DecidableEq E] [DecidableEq Selected]

omit [Fintype E] [Fintype Selected] in
/-- The selected owned pieces pull back to the common target with exactly their recorded part holes. -/
theorem selected_owned_targets_identity (embedding : Selected ↪ E)
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
    (fun x y z => directSum (ownedPiece source ownerX ownerY ownerZ)
      (embedding x.1, mapX x.1 x.2) (embedding y.1, mapY y.1 y.2) (embedding z.1, mapZ z.1 z.2)) =
      directSum (fun edge => Empirical.acceptedTensor target partX partY partZ
        (fun part => ¬holesX edge part) (fun part => ¬holesY edge part) (fun part => ¬holesZ edge part)) := by
  funext ⟨edge, x⟩ ⟨other, y⟩ ⟨third, z⟩
  simp only [directSum, embedding.injective.eq_iff]
  by_cases same : edge = other ∧ other = third
  · obtain ⟨rfl, rfl⟩ := same
    simp only [and_self, if_true, ownedPiece, ownsX, ownsY, ownsZ, Empirical.acceptedTensor]
    split_ifs with retained
    · exact coordinates _ x y z retained.1 retained.2.1 retained.2.2
    · rfl
  · simp only [if_neg same]

/-- Selecting and identifying the damaged target copies preserves the single extracted-batch certificate budget. -/
def selectedOwnedTargetCertificate (embedding : Selected ↪ E)
    (source : Coeff K X Y Z) (target : Coeff K U V W)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (mapX : Selected → U → X) (mapY : Selected → V → Y) (mapZ : Selected → W → Z)
    (partX : U → BX) (partY : V → BY) (partZ : W → BZ)
    (holesX : Selected → BX → Prop) (holesY : Selected → BY → Prop) (holesZ : Selected → BZ → Prop)
    (coordinates : ∀ edge x y z, ¬holesX edge (partX x) → ¬holesY edge (partY y) → ¬holesZ edge (partZ z) →
      source (mapX edge x) (mapY edge y) (mapZ edge z) = target x y z)
    (ownsX : ∀ edge x, ownerX (mapX edge x) = some (embedding edge) ↔ ¬holesX edge (partX x))
    (ownsY : ∀ edge y, ownerY (mapY edge y) = some (embedding edge) ↔ ¬holesY edge (partY y))
    (ownsZ : ∀ edge z, ownerZ (mapZ edge z) = some (embedding edge) ↔ ¬holesZ edge (partZ z))
    {rank degree : ℕ}
    (certificate : Degeneration.Certificate (directSum (ownedPiece source ownerX ownerY ownerZ)) rank degree) :
    Degeneration.Certificate (directSum (fun edge => Empirical.acceptedTensor target partX partY partZ
      (fun part => ¬holesX edge part) (fun part => ¬holesY edge part) (fun part => ¬holesZ edge part))) rank degree := by
  rw [← selected_owned_targets_identity embedding source target ownerX ownerY ownerZ mapX mapY mapZ
    partX partY partZ holesX holesY holesZ coordinates ownsX ownsY ownsZ]
  exact certificate.pullback _ _ _

end
end MatrixBounds.Tensor.Extraction
