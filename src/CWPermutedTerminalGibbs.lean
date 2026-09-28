import CWExactGibbs
import CWPermutedTerminalRates

/-! Physical terminal types have positive exact Gibbs potentials in every
interior case. They can therefore share the general mixed extraction theorem
with nonterminal types without adding any coarse-entropy penalty. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The nonconstant terminal potential follows the physical total-two coordinate. -/
def coordinatePotential (axes : Equiv.Perm (Fin 3)) (mu : ℝ) (axis value : Fin 3) : ℝ :=
  if axes axis = 2 then zPotential mu value else 1

/-- Every physically assigned terminal potential is strictly positive for interior parameters. -/
theorem coordinatePotential_positive (axes : Equiv.Perm (Fin 3)) {mu : ℝ}
    (positive : 0 < mu) (belowHalf : mu < 1/2) (axis value : Fin 3) :
    0 < coordinatePotential axes mu axis value := by
  unfold coordinatePotential
  split_ifs
  · exact zPotential_positive positive belowHalf value
  · norm_num

/-- The three physical coordinate potentials reproduce the original terminal split weight after relabeling. -/
theorem coordinatePotential_product (axes : Equiv.Perm (Fin 3)) (mu : ℝ) (child : ShapeAlphabet 2) :
    coordinatePotential axes mu 0 (shapeCoordinate (shapeAlphabetPermutation axes 2 child) 0)*
      coordinatePotential axes mu 1 (shapeCoordinate (shapeAlphabetPermutation axes 2 child) 1)*
      coordinatePotential axes mu 2 (shapeCoordinate (shapeAlphabetPermutation axes 2 child) 2) =
      zPotential mu (shapeCoordinate child 2) := by
  simp only [shapeCoordinate_permutation, coordinatePotential]
  have reindexed := Equiv.prod_comp axes (fun axis : Fin 3 =>
    if axis = 2 then zPotential mu (shapeCoordinate child axis) else 1)
  simpa [Fin.prod_univ_succ, mul_assoc] using reindexed

/-- The actual permuted split has zero count on every inadmissible child shape. -/
theorem permutedCounts_support (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (child : ShapeAlphabet 2) (outside : ¬child.val.Fits (parent.permute axes)) :
    permutedCounts axes extreme middle child = 0 := by
  apply fullProfile_outside
  intro fits
  have transported := (Shape.permute_fits axes ((shapeAlphabetPermutation axes 2).symm child).val parent).mpr fits
  have same : (((shapeAlphabetPermutation axes 2).symm child).val).permute axes = child.val :=
    congrArg Subtype.val ((shapeAlphabetPermutation axes 2).apply_symm_apply child)
  rw [same] at transported
  exact outside transported

/-- The normalized actual integer terminal split equals the product of its physical positive potentials. -/
theorem permutedCounts_gibbs (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) (positive : 0 < extreme+middle)
    (child : SplitAlphabet (parent.permute axes) 2) :
    (permutedCounts axes extreme middle child.val : ℝ)/Fintype.card (Fin (2*(extreme+middle))) =
      coordinatePotential axes (parameter extreme middle) 0 (splitXIndex child)*
        coordinatePotential axes (parameter extreme middle) 1 (splitYIndex child)*
        coordinatePotential axes (parameter extreme middle) 2 (splitZIndex child) := by
  let original := (splitAlphabetPermutation axes parent 2).symm child
  have moved : shapeAlphabetPermutation axes 2 original.val = child.val :=
    congrArg Subtype.val ((splitAlphabetPermutation axes parent 2).apply_symm_apply child)
  have product := coordinatePotential_product axes (parameter extreme middle) original.val
  rw [moved] at product
  change _ = coordinatePotential axes (parameter extreme middle) 0 (shapeCoordinate child.val 0)*
    coordinatePotential axes (parameter extreme middle) 1 (shapeCoordinate child.val 1)*
    coordinatePotential axes (parameter extreme middle) 2 (shapeCoordinate child.val 2)
  rw [product]
  have normalized := congrFun (counts_probability extreme middle positive) original
  change (fullProfile (counts extreme middle) original.val : ℝ)/Fintype.card (Fin (2*(extreme+middle))) = _
  rw [fullProfile_supported]
  simpa only [Fintype.card_fin, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat, splitLaw, zPotential] using normalized

/-- The general mixed extraction's coarse rate is exactly the physical terminal entropy, with no penalty. -/
theorem permuted_coarseRetention_exact (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positiveExtreme : 0 < extreme) (positiveMiddle : 0 < middle) :
    (permutedData axes extreme middle).coarseRetention (P := Fin (2*(extreme+middle)))
      (coordinatePotential axes (parameter extreme middle) 0)
      (coordinatePotential axes (parameter extreme middle) 1)
      (coordinatePotential axes (parameter extreme middle) 2) = axisEntropy extreme middle (axes 0) := by
  have positive : 0 < extreme+middle := by omega
  letI : Nonempty (Fin (2*(extreme+middle))) := ⟨⟨0, by omega⟩⟩
  have interior := parameter_interior positiveExtreme positiveMiddle
  rw [SplitRestrictionData.coarseRetention_of_exact_gibbs _
    ((permutedData axes extreme middle).prescribedWord (permutedReference axes extreme middle))
    _ _ _ (coordinatePotential_positive axes interior.1 interior.2 0)
    (coordinatePotential_positive axes interior.1 interior.2 1) (coordinatePotential_positive axes interior.1 interior.2 2)
    rfl rfl rfl (permutedCounts_support axes extreme middle) (permutedCounts_gibbs axes extreme middle positive)]
  exact permuted_coarse_entropy axes extreme middle positive

end
end MatrixBounds.Tensor.CW.Terminal
