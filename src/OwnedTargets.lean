import SequentialExtraction
import TypePartition

/-! Identify extracted owner pieces with one common child target and its
per-copy fine-block holes. The source and target are related by explicit maps. -/
namespace MatrixBounds.Tensor.Extraction

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K E X Y Z U V W BX BY BZ : Type*} [CommSemiring K]

/-- Pulling independently owned pieces back along their child-coordinate maps gives a damaged target batch. -/
theorem owned_targets_identity [Fintype E] [DecidableEq E]
    (source : Coeff K X Y Z) (target : Coeff K U V W)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (mapX : E → U → X) (mapY : E → V → Y) (mapZ : E → W → Z)
    (partX : U → BX) (partY : V → BY) (partZ : W → BZ)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (coordinates : ∀ e x y z, ¬holesX e (partX x) → ¬holesY e (partY y) → ¬holesZ e (partZ z) →
      source (mapX e x) (mapY e y) (mapZ e z) = target x y z)
    (ownsX : ∀ e x, ownerX (mapX e x) = some e ↔ ¬holesX e (partX x))
    (ownsY : ∀ e y, ownerY (mapY e y) = some e ↔ ¬holesY e (partY y))
    (ownsZ : ∀ e z, ownerZ (mapZ e z) = some e ↔ ¬holesZ e (partZ z)) :
    (fun x y z => directSum (ownedPiece source ownerX ownerY ownerZ)
      (x.1, mapX x.1 x.2) (y.1, mapY y.1 y.2) (z.1, mapZ z.1 z.2)) =
      directSum (fun edge => Empirical.acceptedTensor target partX partY partZ
        (fun part => ¬holesX edge part) (fun part => ¬holesY edge part) (fun part => ¬holesZ edge part)) := by
  funext ⟨e, x⟩ ⟨f, y⟩ ⟨g, z⟩
  by_cases same : e = f ∧ f = g
  · obtain ⟨rfl, rfl⟩ := same
    simp only [directSum, and_self, if_true, ownedPiece, ownsX, ownsY, ownsZ,
      Empirical.acceptedTensor]
    split_ifs with retained
    · exact coordinates _ x y z retained.1 retained.2.1 retained.2.2
    · rfl
  · simp only [directSum, if_neg same]

/-- The actual source certificate supplies a whole damaged batch at the same rank and degree budget. -/
def ownedTargetCertificate [Fintype E] [DecidableEq E] [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    {source : Coeff K X Y Z} {rank degree : ℕ} (certificate : Degeneration.Certificate source rank degree)
    (target : Coeff K U V W) (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ e f g x y z, ownerX x = some e → ownerY y = some f → ownerZ z = some g →
      source x y z ≠ 0 → e = f ∧ f = g)
    (mapX : E → U → X) (mapY : E → V → Y) (mapZ : E → W → Z)
    (partX : U → BX) (partY : V → BY) (partZ : W → BZ)
    (holesX : E → BX → Prop) (holesY : E → BY → Prop) (holesZ : E → BZ → Prop)
    (coordinates : ∀ e x y z, ¬holesX e (partX x) → ¬holesY e (partY y) → ¬holesZ e (partZ z) →
      source (mapX e x) (mapY e y) (mapZ e z) = target x y z)
    (ownsX : ∀ e x, ownerX (mapX e x) = some e ↔ ¬holesX e (partX x))
    (ownsY : ∀ e y, ownerY (mapY e y) = some e ↔ ¬holesY e (partY y))
    (ownsZ : ∀ e z, ownerZ (mapZ e z) = some e ↔ ¬holesZ e (partZ z)) :
    Degeneration.Certificate (directSum (fun edge => Empirical.acceptedTensor target partX partY partZ
      (fun part => ¬holesX edge part) (fun part => ¬holesY edge part) (fun part => ¬holesZ edge part))) rank degree := by
  have restricted := certificate.restrict (ownerMap ownerX) (ownerMap ownerY) (ownerMap ownerZ)
  rw [owned_pieces_restriction source ownerX ownerY ownerZ disjoint] at restricted
  rw [← owned_targets_identity source target ownerX ownerY ownerZ mapX mapY mapZ partX partY partZ
    holesX holesY holesZ coordinates ownsX ownsY ownsZ]
  exact restricted.pullback _ _ _

end
end MatrixBounds.Tensor.Extraction
