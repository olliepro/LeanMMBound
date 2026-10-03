module

public import CWSequentialData
public import SupportedTypes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Prescribed edges in the complete marginal graph have exactly the usual
multinomial type count. One feasible reference fixes all support and marginal
constraints; position permutations generate every other exact split word. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Prescribed copies are the exact split-profile subfamily of the complete marginal graph. -/
abbrev PrescribedEdges (data : SplitRestrictionData length) :=
  {edge : data.Edges (P := P) // data.prescribed edge}

omit [Fintype P] in
/-- The complete shape word uniquely determines its marginal-graph edge. -/
theorem word_injective (data : SplitRestrictionData length) : Function.Injective (data.word (P := P)) := by
  intro left right same
  apply Subtype.ext
  funext position
  apply Subtype.ext
  exact congrFun same position

/-- Erase the extra graph and support proofs from a prescribed edge, retaining its exact split type. -/
def prescribedWord (data : SplitRestrictionData length) (edge : data.PrescribedEdges (P := P)) :
    TypedWord (P := P) data.split := ⟨data.word edge.val, edge.property⟩

omit [Fintype P] in
/-- No prescribed edges are merged by reading their exact split words. -/
theorem prescribedWord_injective (data : SplitRestrictionData length) :
    Function.Injective (data.prescribedWord (P := P)) := by
  intro left right same
  exact Subtype.ext (data.word_injective (congrArg Subtype.val same))

/-- Reordering the positions of a feasible reference realizes every exact word of the prescribed split type. -/
theorem prescribedWord_surjective (data : SplitRestrictionData length)
    (reference : data.PrescribedEdges (P := P)) : Function.Surjective (data.prescribedWord (P := P)) := by
  intro target
  obtain ⟨permutation, same⟩ := same_type_permutation (data.word reference.val) target.val
    (fun symbol => (reference.property symbol).trans (target.property symbol).symm)
  let edge : data.Edges (P := P) := permutation • reference.val
  have wordSame : data.word edge = target.val := same
  refine ⟨⟨edge, ?_⟩, Subtype.ext wordSame⟩
  change HasType data.split (data.word edge)
  rw [wordSame]
  exact target.property

/-- A feasible prescribed graph is in bijection with the entire empirical split type. -/
def prescribedWordEquiv (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P)) :
    data.PrescribedEdges (P := P) ≃ TypedWord (P := P) data.split :=
  Equiv.ofBijective data.prescribedWord ⟨data.prescribedWord_injective, data.prescribedWord_surjective reference⟩

/-- The actual number of prescribed coarse edges is exactly the multinomial type count. -/
theorem prescribed_card (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P)) :
    Nat.card (data.PrescribedEdges (P := P)) = Nat.card (TypedWord (P := P) data.split) :=
  Nat.card_congr (data.prescribedWordEquiv reference)

omit [Fintype P] in
/-- One feasible prescribed graph edge proves all off-support split-profile entries are zero. -/
theorem prescribed_support (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (symbol : ShapeAlphabet (2*length)) (outside : ¬symbol.val.Fits data.parent) : data.split symbol = 0 := by
  rw [← reference.property symbol]
  exact count_subtype_outside (fun symbol : ShapeAlphabet (2*length) => symbol.val.Fits data.parent)
    reference.val.val symbol outside

/-- Restricting the prescribed family to any fine compatibility predicate cannot exceed its full exact-type degree. -/
theorem prescribed_compatible_degree_le (data : SplitRestrictionData length)
    (compatible : (P → ShapeAlphabet (2*length)) → Prop) :
    Nat.card {edge : data.PrescribedEdges (P := P) // compatible (data.word edge.val)} ≤
      Nat.card {word : TypedWord (P := P) data.split // compatible word.val} := by
  apply Nat.card_le_card_of_injective
    (fun edge => (⟨data.prescribedWord edge.val, edge.property⟩ :
      {word : TypedWord (P := P) data.split // compatible word.val}))
  intro left right same
  exact Subtype.ext (data.prescribedWord_injective (congrArg Subtype.val same))

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
