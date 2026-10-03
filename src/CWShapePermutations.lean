module

public import ShapePermutations
public import CWOneLetterData
public import TypeRelabeling

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Permuting physical roles reindexes the actual split alphabet, its bounded
coarse coordinates, and its empirical marginal profiles. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Select any physical shape coordinate in its bounded coarse alphabet. -/
def shapeCoordinate {total : ℕ} (child : ShapeAlphabet total) (axis : Fin 3) : Fin (total+1) :=
  ⟨Shape.coordinates child.val axis, by
    have sum := shapes_total child.property
    fin_cases axis <;> dsimp [Shape.coordinates] <;> unfold Shape.total at sum <;> omega⟩

/-- The generic physical coordinate recovers the established X index. -/
theorem shapeCoordinate_x {total : ℕ} (child : ShapeAlphabet total) :
    shapeCoordinate child 0 = shapeXIndex child := rfl

/-- The generic physical coordinate recovers the established Y index. -/
theorem shapeCoordinate_y {total : ℕ} (child : ShapeAlphabet total) :
    shapeCoordinate child 1 = shapeYIndex child := rfl

/-- The generic physical coordinate recovers the established Z index. -/
theorem shapeCoordinate_z {total : ℕ} (child : ShapeAlphabet total) :
    shapeCoordinate child 2 = shapeZIndex child := rfl

/-- The bounded coordinate of a reindexed shape is precisely the selected original coordinate. -/
theorem shapeCoordinate_permutation (axes : Equiv.Perm (Fin 3)) (total : ℕ)
    (child : ShapeAlphabet total) (axis : Fin 3) :
    shapeCoordinate (shapeAlphabetPermutation axes total child) axis = shapeCoordinate child (axes axis) := by
  apply Fin.ext
  exact Shape.permute_coordinate axes child.val axis

/-- Reindex all admissible children of a parent, including their support proofs. -/
def splitAlphabetPermutation (axes : Equiv.Perm (Fin 3)) (parent : Shape) (total : ℕ) :
    SplitAlphabet parent total ≃ SplitAlphabet (parent.permute axes) total :=
  Equiv.subtypeEquiv (shapeAlphabetPermutation axes total)
    (fun child => (Shape.permute_fits axes child.val parent).symm)

/-- Coarse marginalization commutes with relabeling its complete symbol alphabet. -/
theorem marginalProfile_relabel {A B C : Type*} [Fintype A] [Fintype B] [DecidableEq C]
    (labels : A ≃ B) (profile : A → ℕ) (projection : B → C) :
    marginalProfile (profile ∘ labels.symm) projection = marginalProfile profile (projection ∘ labels) := by
  funext value
  unfold marginalProfile
  rw [← labels.sum_comp]
  simp only [Function.comp_apply, Equiv.symm_apply_apply]
  apply Finset.sum_congr rfl
  intro symbol _
  split_ifs <;> rfl

/-- A physically permuted split has exactly the correspondingly permuted coarse marginals. -/
theorem marginalProfile_shapePermutation (axes : Equiv.Perm (Fin 3)) (total : ℕ)
    (profile : ShapeAlphabet total → ℕ) (axis : Fin 3) :
    marginalProfile (profile ∘ (shapeAlphabetPermutation axes total).symm)
      (fun child => shapeCoordinate child axis) =
      marginalProfile profile (fun child => shapeCoordinate child (axes axis)) := by
  rw [marginalProfile_relabel]
  simp only [Function.comp_def, shapeCoordinate_permutation]

/-- The full permuted profile has an exact feasible word at the same population. -/
def permutedShapeWord {P : Type*} (axes : Equiv.Perm (Fin 3)) (total : ℕ)
    (profile : ShapeAlphabet total → ℕ) (word : TypedWord (P := P) profile) :
    TypedWord (P := P) (profile ∘ (shapeAlphabetPermutation axes total).symm) :=
  typedWordRelabel (shapeAlphabetPermutation axes total) profile word

end
end MatrixBounds.Tensor.CW
