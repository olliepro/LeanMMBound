module

public import CWRootData
public import CWCoarseOwnership

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The root's complete coarse graph contains every shape of its length.
An enclosing box only encodes this finite alphabet; it is not a source tensor. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- An enclosing coordinate box for all shapes of a fixed total. -/
def rootBox (total : ℕ) : Shape := ⟨total, total, total⟩

/-- Every shape of the required total lies in the root's full support box. -/
theorem shape_fits_rootBox {total : ℕ} (child : ShapeAlphabet total) : child.val.Fits (rootBox total) := by
  have equation := shapes_total child.property
  change child.val.x ≤ total ∧ child.val.y ≤ total ∧ child.val.z ≤ total
  unfold Shape.total at equation
  omega

namespace RootRestrictionData

variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

/-- Coarse marginal counts on any physical root coordinate are computed from the joint split profile. -/
def coarse (data : RootRestrictionData length) (axis : Fin 3) : Fin (2*length+1) → ℕ :=
  marginalProfile data.split (fun child => shapeCoordinate child axis)

/-- The complete root graph contains all joint shapes satisfying these three marginal types. -/
abbrev Edges (data : RootRestrictionData length) :=
  CoarseWords (P := P) (rootBox (2*length)) (2*length) (data.coarse 0) (data.coarse 1) (data.coarse 2)

/-- Read the full constituent-shape word of a root graph edge. -/
def word (data : RootRestrictionData length) (edge : data.Edges (P := P)) : P → ShapeAlphabet (2*length) :=
  fun position => (edge.val position).val

/-- A prescribed root edge has the requested joint multiplicities. -/
def prescribed (data : RootRestrictionData length) (edge : data.Edges (P := P)) : Prop :=
  HasType data.split (data.word edge)

/-- Prescribed root graph edges, including their complete graph membership proofs. -/
abbrev PrescribedEdges (data : RootRestrictionData length) := {edge : data.Edges (P := P) // data.prescribed edge}

/-- Every exact shape word is an actual edge of the unrestricted root's complete marginal graph. -/
def edgeOfWord (data : RootRestrictionData length) (typed : TypedWord (P := P) data.split) : data.PrescribedEdges (P := P) := by
  refine ⟨⟨fun position => ⟨typed.val position, shape_fits_rootBox (typed.val position)⟩, ?_, ?_, ?_⟩, typed.property⟩
  · exact hasType_projected data.split (fun child => shapeCoordinate child 0) typed.val typed.property
  · exact hasType_projected data.split (fun child => shapeCoordinate child 1) typed.val typed.property
  · exact hasType_projected data.split (fun child => shapeCoordinate child 2) typed.val typed.property

/-- Erase only proof fields from a prescribed root edge to recover its exact word. -/
def prescribedWordEquiv (data : RootRestrictionData length) :
    data.PrescribedEdges (P := P) ≃ TypedWord (P := P) data.split where
  toFun edge := ⟨data.word edge.val, edge.property⟩
  invFun := data.edgeOfWord
  left_inv edge := by
    apply Subtype.ext
    apply Subtype.ext
    funext position
    rfl
  right_inv typed := rfl

/-- Root copy candidates have exactly the joint-profile multinomial count. -/
theorem prescribed_card (data : RootRestrictionData length) :
    Nat.card (data.PrescribedEdges (P := P)) = Nat.card (TypedWord (P := P) data.split) :=
  Nat.card_congr data.prescribedWordEquiv

/-- Restrict the actual unrestricted source by its three complete coarse marginal types. -/
def coarseFiltered (data : RootRestrictionData length) (q : ℕ) :=
  acceptedTensor (rootPower (K := K) (P := P) q length)
    (fun x position => wordCoarseIndex (x position))
    (fun y position => wordCoarseIndex (y position))
    (fun z position => wordCoarseIndex (z position))
    (HasType (data.coarse 0)) (HasType (data.coarse 1)) (HasType (data.coarse 2))

/-- Every surviving source coefficient has an actual edge in the complete root graph. -/
theorem coarseFiltered_complete (data : RootRestrictionData length) (q : ℕ)
    (x y z : P → Fin length → Fin (q+2))
    (nonzero : data.coarseFiltered (K := K) q x y z ≠ 0) :
    ∃ edge : data.Edges (P := P),
      (splitWordEdge edge.val).x = (fun position => wordCoarse (x position)) ∧
      (splitWordEdge edge.val).y = (fun position => wordCoarse (y position)) ∧
      (splitWordEdge edge.val).z = (fun position => wordCoarse (z position)) := by
  unfold coarseFiltered acceptedTensor at nonzero
  split_ifs at nonzero with typed
  · have factors (position : P) : wordPower (tensor (K := K) q) length (x position) (y position) (z position) ≠ 0 := by
      intro zero
      exact nonzero (Finset.prod_eq_zero (Finset.mem_univ position) zero)
    let symbol : P → ShapeAlphabet (2*length) := fun position =>
      ⟨⟨wordCoarse (x position), wordCoarse (y position), wordCoarse (z position)⟩,
        mem_shapes_of_total (word_support_total _ _ _ (factors position))⟩
    refine ⟨⟨fun position => ⟨symbol position, shape_fits_rootBox (symbol position)⟩, typed⟩, rfl, rfl, rfl⟩
  · exact (nonzero rfl).elim

/-- Coarse marginal filtering is a variable restriction preserving the original root certificate. -/
def coarseFilteredCertificate (data : RootRestrictionData length) (q : ℕ) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (rootPower (K := K) (P := P) q length) rank degree) :
    Degeneration.Certificate (data.coarseFiltered (K := K) (P := P) q) rank degree :=
  acceptedCertificate (rootPower (K := K) (P := P) q length)
    (fun x position => wordCoarseIndex (x position)) (fun y position => wordCoarseIndex (y position))
    (fun z position => wordCoarseIndex (z position))
    (HasType (data.coarse 0)) (HasType (data.coarse 1)) (HasType (data.coarse 2)) certificate

end RootRestrictionData
end
end MatrixBounds.Tensor.CW
