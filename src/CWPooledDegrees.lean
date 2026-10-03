module

public import CWPooledCompatibility
public import CWConstituents

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Pointwise competitor bounds for actual CW split words and typed fine blocks.
Symmetry and double counting are instantiated, rather than left as hypotheses. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Fine blocks and split words share a coarse vertex when their coordinate projections agree. -/
def coarseAgreement {A B C : Type*} (coarseIndex : A → C) (fineIndex : B → C)
    (left : P → A) (fine : P → B) : Prop :=
  ∀ position, fineIndex (fine position) = coarseIndex (left position)

omit [Fintype P] in
/-- Sharing a coarse vertex is invariant under simultaneous permutations of parent positions. -/
theorem coarseAgreement_reorder {A B C : Type*} (coarseIndex : A → C) (fineIndex : B → C)
    (permutation : Equiv.Perm P) (left : P → A) (fine : P → B) :
    coarseAgreement coarseIndex fineIndex (reorder permutation left) (reorder permutation fine) ↔
      coarseAgreement coarseIndex fineIndex left fine := by
  constructor
  · intro agrees position
    simpa only [coarseAgreement, reorder, Equiv.symm_apply_apply] using agrees (permutation position)
  · intro agrees position
    exact agrees (permutation.symm position)

/-- A CW fine block is incident to a prescribed split if it shares its coarse vertex and passes compatibility. -/
def compatibleFine {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (axisIndex : ShapeAlphabet total → ℕ) (left : P → ShapeAlphabet total)
    (fine : P → Fin (length+length) → Fin 3) : Prop :=
  coarseAgreement axisIndex (fun word => fineTotal (fun i => word (Fin.castAdd length i))) left fine ∧
    pooledCompatible length parent balanced axisClass profile left fine

omit [Fintype P] in
/-- The concrete fine-block incidence relation has the simultaneous permutation symmetry. -/
theorem compatibleFine_reorder {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (axisIndex : ShapeAlphabet total → ℕ) (permutation : Equiv.Perm P)
    (left : P → ShapeAlphabet total) (fine : P → Fin (length+length) → Fin 3) :
    compatibleFine length parent balanced axisClass profile axisIndex
      (reorder permutation left) (reorder permutation fine) ↔
    compatibleFine length parent balanced axisClass profile axisIndex left fine := by
  simp only [compatibleFine, coarseAgreement_reorder, pooledCompatible_reorder]

/-- Parent empirical types and the fixed coarse vertex only reduce the per-split compatibility count. -/
theorem compatibleFine_row_bound {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (axisIndex : ShapeAlphabet total → ℕ) (parentProfile : (Fin (length+length) → Fin 3) → ℕ)
    (left : P → ShapeAlphabet total) :
    Nat.card {fine : TypedWord (P := P) parentProfile //
      compatibleFine length parent balanced axisClass profile axisIndex left fine.val} ≤
      ∏ sector, Fintype.card (TypedWord (P := {slot : P ⊕ P //
        axisClass (childLabels parent balanced left slot) = sector}) (profile sector)) := by
  rw [← pooledCompatible_card length parent balanced axisClass profile left]
  apply Nat.card_le_card_of_injective (fun fine =>
    (⟨fine.val.val, fine.property.2⟩ : {fine // pooledCompatible length parent balanced axisClass profile left fine}))
  intro fine other same
  apply Subtype.ext
  apply Subtype.ext
  exact congrArg (fun word => word.val) same

/-- Every fine block has the same competitor degree, bounded by actual typed-word cardinalities.
For example, `yClass` and the Y-coordinate projection give the finite Y collision bound. -/
theorem compatibleFine_degree_bound {total : ℕ} (length : ℕ) (parent : Shape) (balanced : parent.total = 2*total)
    (axisClass : ShapeAlphabet total → CompatibilityClass total)
    (profile : CompatibilityClass total → (Fin length → Fin 3) → ℕ)
    (axisIndex : ShapeAlphabet total → ℕ) (splitProfile : ShapeAlphabet total → ℕ)
    (parentProfile : (Fin (length+length) → Fin 3) → ℕ)
    (reference : TypedWord (P := P) splitProfile) (block : TypedWord (P := P) parentProfile) :
    Fintype.card (TypedWord (P := P) parentProfile) *
      Nat.card {left : TypedWord (P := P) splitProfile //
        compatibleFine length parent balanced axisClass profile axisIndex left.val block.val} ≤
      Fintype.card (TypedWord (P := P) splitProfile) *
        ∏ sector, Fintype.card (TypedWord (P := {slot : P ⊕ P //
          axisClass (childLabels parent balanced reference.val slot) = sector}) (profile sector)) := by
  have identity := Selection.invariant_incidence_identity (G := Equiv.Perm P)
    (fun (left : TypedWord (P := P) splitProfile) (fine : TypedWord (P := P) parentProfile) =>
      compatibleFine length parent balanced axisClass profile axisIndex left.val fine.val)
    (fun permutation left fine => compatibleFine_reorder length parent balanced axisClass profile axisIndex
      permutation left.val fine.val) reference block
  rw [identity]
  exact Nat.mul_le_mul_left _ (compatibleFine_row_bound length parent balanced axisClass profile axisIndex
    parentProfile reference.val)

end
end MatrixBounds.Tensor.CW
