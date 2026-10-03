module

public import CWCoarseData
public import CWShapePermutations
public import CWTargetMaps
public import CWProfileLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual symmetric split data and nominal parent laws transport through
all physical coordinate orders at arbitrary recursion lengths. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length : ℕ}

/-- Reindex a coarse extraction record to any physical axis order, recomputing its marginals. -/
def permutedCoarse (data : SplitRestrictionData length) (axes : Equiv.Perm (Fin 3)) :
    SplitRestrictionData length :=
  fromCoarse (data.parent.permute axes) ((Shape.permute_total axes data.parent).trans data.balanced)
    (data.split ∘ (shapeAlphabetPermutation axes (2*length)).symm)

/-- Every feasible original split reference transports to the permuted supported marginal graph. -/
def permutedCoarseReference {P : Type*} [Fintype P] (data : SplitRestrictionData length)
    (axes : Equiv.Perm (Fin 3)) (reference : data.PrescribedEdges (P := P)) :
    (data.permutedCoarse axes).PrescribedEdges (P := P) := by
  let word := permutedShapeWord axes (2*length) data.split (data.prescribedWord reference)
  refine fromCoarseReference _ _ _ word ?_
  intro position
  exact (Shape.permute_fits axes _ _).mpr (reference.val.val position).property

/-- Physical coordinate transport preserves exact complementary symmetry. -/
theorem permutedCoarse_symmetric (data : SplitRestrictionData length)
    (symmetric : data.Symmetric) (axes : Equiv.Perm (Fin 3)) : (data.permutedCoarse axes).Symmetric := by
  intro child
  let labels := shapeAlphabetPermutation axes (2*length)
  have commute : labels.symm
      (complementSymbol (data.parent.permute axes) (2*length)
        ((Shape.permute_total axes data.parent).trans data.balanced) child) =
      complementSymbol data.parent (2*length) data.balanced (labels.symm child) := by
    apply labels.injective
    rw [Equiv.apply_symm_apply]
    change _ = shapeAlphabetPermutation axes (2*length) _
    rw [shapeAlphabetPermutation_complement, show labels (labels.symm child) = child from labels.apply_symm_apply child]
  change data.split (labels.symm (complementSymbol (data.parent.permute axes) (2*length)
    ((Shape.permute_total axes data.parent).trans data.balanced) child)) = data.split (labels.symm child)
  rw [commute]
  exact symmetric (labels.symm child)

/-- Relabel a complete child law by the actual permutation of its coarse shape labels. -/
def permutedLaw (axes : Equiv.Perm (Fin 3))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ :=
  fun child => law ((shapeAlphabetPermutation axes (2*length)).symm child)

/-- Reindexing the split and its complete child law preserves the actual parent-window center. -/
theorem permutedCoarse_parentLaw {P : Type*} [Fintype P]
    (data : SplitRestrictionData length) (axes : Equiv.Perm (Fin 3))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (data.permutedCoarse axes).parentLaw (P := P) (permutedLaw axes law) = data.parentLaw (P := P) law := by
  funext word
  let labels := shapeAlphabetPermutation axes (2*length)
  unfold parentLaw
  rw [← Equiv.sum_comp labels]
  apply Finset.sum_congr rfl
  intro child _
  change ((data.split (labels.symm (labels child)) : ℝ)/Fintype.card P)*
      (law (labels.symm (labels child)) (leftHalf word)*
        law (labels.symm (complementSymbol (data.parent.permute axes) (2*length)
          ((Shape.permute_total axes data.parent).trans data.balanced) (labels child))) (rightHalf word)) = _
  rw [← shapeAlphabetPermutation_complement axes data.parent (2*length) data.balanced,
    Equiv.symm_apply_apply, Equiv.symm_apply_apply]
  rfl

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
