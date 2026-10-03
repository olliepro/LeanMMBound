module

public import VariableExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Sequential compatibility restrictions: the Z conditions may use full Y
types that are imposed only after Y has acquired its unique owner. -/
namespace MatrixBounds.Tensor.Extraction

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K X Y Z E : Type*} [CommSemiring K]

/-- Keep an owned variable only when it satisfies its owner's full type restriction. -/
def refineOwner (owner : X → Option E) (accepted : E → X → Prop) (entry : X) : Option E :=
  match owner entry with
  | none => none
  | some edge => if accepted edge entry then some edge else none

/-- Refining an owner imposes its extra type condition without changing its identity. -/
theorem refineOwner_eq_iff (owner : X → Option E) (accepted : E → X → Prop) (entry : X) (edge : E) :
    refineOwner owner accepted entry = some edge ↔ owner entry = some edge ∧ accepted edge entry := by
  cases present : owner entry with
  | none => simp [refineOwner, present]
  | some other =>
      by_cases keep : accepted other entry <;> simp [refineOwner, present, keep] <;>
        aesop

/-- A uniquely compatible retained variable satisfies both compatibility and its full type. -/
theorem refined_unique_spec (compatible accepted : E → X → Prop) (entry : X) (edge : E)
    (owned : refineOwner (uniqueOwner compatible) accepted entry = some edge) :
    compatible edge entry ∧ accepted edge entry ∧ ∀ other, compatible other entry → other = edge := by
  obtain ⟨unique, accepted⟩ := (refineOwner_eq_iff _ _ _ _).mp owned
  obtain ⟨present, only⟩ := uniqueOwner_spec _ _ _ unique
  exact ⟨present, accepted, only⟩

/-- Necessary Y compatibility is used first; necessary Z compatibility may then use the imposed Y type. -/
theorem sequential_owners_disjoint (source : Coeff K X Y Z) (ownerX : X → Option E)
    (compatibleY acceptedY : E → Y → Prop) (compatibleZ acceptedZ : E → Z → Prop)
    (necessaryY : ∀ e x y z, ownerX x = some e → source x y z ≠ 0 → compatibleY e y)
    (necessaryZ : ∀ e x y z, ownerX x = some e → acceptedY e y →
      source x y z ≠ 0 → compatibleZ e z)
    (e f g : E) (x : X) (y : Y) (z : Z)
    (hx : ownerX x = some e)
    (hy : refineOwner (uniqueOwner compatibleY) acceptedY y = some f)
    (hz : refineOwner (uniqueOwner compatibleZ) acceptedZ z = some g)
    (nonzero : source x y z ≠ 0) : e = f ∧ f = g := by
  obtain ⟨_, fullY, uniqueY⟩ := refined_unique_spec compatibleY acceptedY y f hy
  have ef := uniqueY e (necessaryY e x y z hx nonzero)
  subst f
  obtain ⟨_, _, uniqueZ⟩ := refined_unique_spec compatibleZ acceptedZ z g hz
  exact ⟨rfl, uniqueZ e (necessaryZ e x y z hx fullY nonzero)⟩

/-- Sequential coarse-X, fine-Y, and fine-Z zero-outs construct independent output pieces.
The polynomial certificate uses the same budget as the source and explicit axis maps. -/
def sequentialCompatibilityExtraction [Fintype X] [Fintype Y] [Fintype Z] [Fintype E]
    [DecidableEq X] [DecidableEq Y] [DecidableEq Z] [DecidableEq E]
    {source : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Degeneration.Certificate source rank degree) (ownerX : X → Option E)
    (compatibleY acceptedY : E → Y → Prop) (compatibleZ acceptedZ : E → Z → Prop)
    (necessaryY : ∀ e x y z, ownerX x = some e → source x y z ≠ 0 → compatibleY e y)
    (necessaryZ : ∀ e x y z, ownerX x = some e → acceptedY e y →
      source x y z ≠ 0 → compatibleZ e z) :
    Degeneration.Certificate (directSum (ownedPiece source ownerX
      (refineOwner (uniqueOwner compatibleY) acceptedY)
      (refineOwner (uniqueOwner compatibleZ) acceptedZ))) rank degree := by
  rw [← owned_pieces_restriction source ownerX _ _
    (sequential_owners_disjoint source ownerX compatibleY acceptedY compatibleZ acceptedZ necessaryY necessaryZ)]
  exact certificate.restrict _ _ _

end
end MatrixBounds.Tensor.Extraction
