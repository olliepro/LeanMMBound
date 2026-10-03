module

public import CWShapePermutations
public import CWTerminalCounts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! All terminal physical role choices are actual feasible split data. Their
profiles, complementary symmetry, and reference words are transported rather
than assumed from permuted numerical vectors. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Build canonical one-letter data with its coarse marginals computed from the complete split. -/
def oneLetterMarginalData (parent : Shape) (balanced : parent.total = 4) (split : ShapeAlphabet 2 → ℕ) :
    SplitRestrictionData 1 := oneLetterData parent balanced
      (marginalProfile split shapeXIndex) (marginalProfile split shapeYIndex)
      (marginalProfile split shapeZIndex) split

/-- Every supported exact split word gives an actual prescribed reference for the computed marginal data. -/
def oneLetterMarginalReference {P : Type*} [Fintype P] (parent : Shape) (balanced : parent.total = 4)
    (split : ShapeAlphabet 2 → ℕ) (word : TypedWord (P := P) split)
    (supported : ∀ position, (word.val position).val.Fits parent) :
    (oneLetterMarginalData parent balanced split).PrescribedEdges (P := P) := by
  refine ⟨⟨fun position => ⟨word.val position, supported position⟩, ?_, ?_, ?_⟩, ?_⟩
  · exact hasType_projected split shapeXIndex word.val word.property
  · exact hasType_projected split shapeYIndex word.val word.property
  · exact hasType_projected split shapeZIndex word.val word.property
  · exact word.property

namespace Terminal

/-- The complete terminal split counts in a chosen physical coordinate order. -/
def permutedCounts (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) : ShapeAlphabet 2 → ℕ :=
  fullProfile (counts extreme middle) ∘ (shapeAlphabetPermutation axes 2).symm

/-- Actual extraction data for any of the six physical terminal role assignments. -/
def permutedData (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) : SplitRestrictionData 1 :=
  oneLetterMarginalData (parent.permute axes) ((Shape.permute_total axes parent).trans (by decide))
    (permutedCounts axes extreme middle)

/-- The permuted terminal split keeps exact complementary symmetry. -/
theorem permuted_counts_symmetric (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).Symmetric := by
  intro child
  let labels := shapeAlphabetPermutation axes 2
  have balanced : (parent.permute axes).total = 4 := (Shape.permute_total axes parent).trans (by decide)
  have commute : labels.symm (complementSymbol (parent.permute axes) 2 balanced child) =
      complementSymbol parent 2 (by decide) (labels.symm child) := by
    apply labels.injective
    rw [Equiv.apply_symm_apply]
    change _ = shapeAlphabetPermutation axes 2 (complementSymbol parent 2 (by decide) (labels.symm child))
    rw [shapeAlphabetPermutation_complement]
    rw [show shapeAlphabetPermutation axes 2 (labels.symm child) = child from labels.apply_symm_apply child]
  change fullProfile (counts extreme middle)
      (labels.symm (complementSymbol (parent.permute axes) 2 balanced child)) =
    fullProfile (counts extreme middle) (labels.symm child)
  rw [commute]
  exact counts_symmetric extreme middle (labels.symm child)

/-- Permute the actual terminal reference word to witness every population and role assignment. -/
def permutedReference (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).PrescribedEdges (P := Fin (2*(extreme+middle))) := by
  let original := countsReference extreme middle
  let word := (data (counts extreme middle)).prescribedWord original
  apply oneLetterMarginalReference _ _ _ (permutedShapeWord axes 2 _ word)
  intro position
  exact (Shape.permute_fits axes (original.val.val position).val.val parent).mpr
    (original.val.val position).property

/-- Every X child pool of every permuted terminal type has its forced fine-word representative. -/
def permutedRepresentativeX (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).TargetParts (permutedData axes extreme middle).fineX :=
  oneLetterRepresentativeX _ _ _ _ _ _

/-- Every Y child pool of every permuted terminal type has its forced fine-word representative. -/
def permutedRepresentativeY (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).TargetParts (permutedData axes extreme middle).fineY :=
  oneLetterRepresentativeY _ _ _ _ _ _

/-- Every Z child pool of every permuted terminal type has its forced fine-word representative. -/
def permutedRepresentativeZ (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) :
    (permutedData axes extreme middle).TargetParts (permutedData axes extreme middle).fineZ :=
  oneLetterRepresentativeZ _ _ _ _ _ _

end Terminal
end
end MatrixBounds.Tensor.CW
