module

public import SequentialExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Additional acceptance windows can refine already disjoint owner maps.
This records both interface holes and collision holes in the final owners. -/
namespace MatrixBounds.Tensor.Extraction

noncomputable section
variable {K E X Y Z : Type*} [CommSemiring K]

/-- Further axis acceptance tests preserve the disjointness of any existing ownership construction. -/
theorem refined_owners_disjoint (source : Coeff K X Y Z)
    (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ edge other third x y z, ownerX x = some edge → ownerY y = some other → ownerZ z = some third →
      source x y z ≠ 0 → edge = other ∧ other = third)
    (acceptX : E → X → Prop) (acceptY : E → Y → Prop) (acceptZ : E → Z → Prop)
    (edge other third : E) (x : X) (y : Y) (z : Z)
    (ownedX : refineOwner ownerX acceptX x = some edge)
    (ownedY : refineOwner ownerY acceptY y = some other)
    (ownedZ : refineOwner ownerZ acceptZ z = some third) (nonzero : source x y z ≠ 0) :
    edge = other ∧ other = third :=
  disjoint edge other third x y z ((refineOwner_eq_iff _ _ _ _).mp ownedX).1
    ((refineOwner_eq_iff _ _ _ _).mp ownedY).1 ((refineOwner_eq_iff _ _ _ _).mp ownedZ).1 nonzero

/-- Refined owner pieces are supplied by the same original source certificate budget. -/
def refinedOwnershipCertificate [Fintype E] [Fintype X] [Fintype Y] [Fintype Z]
    [DecidableEq E] [DecidableEq X] [DecidableEq Y] [DecidableEq Z]
    (source : Coeff K X Y Z) (ownerX : X → Option E) (ownerY : Y → Option E) (ownerZ : Z → Option E)
    (disjoint : ∀ edge other third x y z, ownerX x = some edge → ownerY y = some other → ownerZ z = some third →
      source x y z ≠ 0 → edge = other ∧ other = third)
    (acceptX : E → X → Prop) (acceptY : E → Y → Prop) (acceptZ : E → Z → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate source rank degree) :
    Degeneration.Certificate (directSum (ownedPiece source (refineOwner ownerX acceptX)
      (refineOwner ownerY acceptY) (refineOwner ownerZ acceptZ))) rank degree := by
  rw [← owned_pieces_restriction source _ _ _
    (refined_owners_disjoint source ownerX ownerY ownerZ disjoint acceptX acceptY acceptZ)]
  exact certificate.restrict _ _ _

omit [CommSemiring K] in
/-- A compatible target passing its full type survives the final window exactly when it has neither kind of hole. -/
theorem windowed_unique_owner_iff (compatible full : E → X → Prop) (window : X → Prop)
    (edge : E) (entry : X) (present : compatible edge entry) (typed : full edge entry) :
    refineOwner (refineOwner (uniqueOwner compatible) full) (fun _ => window) entry = some edge ↔
      ¬(¬window entry ∨ ∃ other, other ≠ edge ∧ compatible other entry) := by
  rw [refineOwner_eq_iff, refineOwner_eq_iff, uniqueOwner_no_collision compatible entry edge present]
  simp only [typed, and_true, not_or, not_not]
  exact and_comm

end
end MatrixBounds.Tensor.Extraction
