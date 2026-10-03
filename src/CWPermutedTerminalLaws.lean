module

public import CWPermutedTerminalData
public import CWTerminalParentLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The full fine parent laws of every physical terminal orientation are the
same binary and ternary laws assigned to their actual permuted coordinates. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Reindexing the terminal split permutes its actual independent-concatenation fine laws. -/
theorem permuted_parentLaw (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ) (axis : Fin 3) :
    (permutedData axes extreme middle).parentLaw (P := P)
      (fun child => oneLetterLaw (shapeCoordinate child axis)) =
      (data (counts extreme middle)).parentLaw (P := P)
        (fun child => oneLetterLaw (shapeCoordinate child (axes axis))) := by
  funext word
  unfold SplitRestrictionData.parentLaw
  rw [← Equiv.sum_comp (shapeAlphabetPermutation axes 2)]
  apply Finset.sum_congr rfl
  intro child _
  dsimp only [permutedData, oneLetterMarginalData, oneLetterData, permutedCounts, data, Function.comp_apply]
  rw [Equiv.symm_apply_apply, shapeCoordinate_permutation]
  change _*(_*oneLetterLaw (shapeCoordinate
    (complementSymbol (parent.permute axes) 2 ((Shape.permute_total axes parent).trans (by decide))
      (shapeAlphabetPermutation axes 2 child)) axis) _) = _
  rw [← shapeAlphabetPermutation_complement axes parent 2 (by decide) child, shapeCoordinate_permutation]
  rfl

/-- The ternary law is on exactly the physical axis containing the original total-two coordinate. -/
theorem permuted_parent_law (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) (axis : Fin 3) :
    (permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeCoordinate child axis)) =
      if axes axis = 2 then ternaryParentLaw (parameter extreme middle) else binaryParentLaw := by
  rw [permuted_parentLaw]
  generalize axes axis = coordinate
  fin_cases coordinate
  · simpa only [show (0 : Fin 3) ≠ 2 from by decide, if_false, shapeCoordinate_x] using!
      terminal_parent_law_x extreme middle positive
  · simpa only [show (1 : Fin 3) ≠ 2 from by decide, if_false, shapeCoordinate_y] using!
      terminal_parent_law_y extreme middle positive
  · simpa only [if_true, shapeCoordinate_z] using! terminal_parent_law_z extreme middle positive

/-- The corresponding fine parent entropy vector is the physical permutation of the terminal vector. -/
theorem permuted_parent_entropy (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) (axis : Fin 3) :
    entropy ((permutedData axes extreme middle).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeCoordinate child axis))) =
      if axes axis = 2 then entropy (![parameter extreme middle, 1-2*parameter extreme middle,
        parameter extreme middle] : Fin 3 → ℝ) else Real.log 2 := by
  rw [permuted_parent_law axes extreme middle positive axis]
  split_ifs
  · exact ternary_parent_entropy _
  · exact binary_parent_entropy

end
end MatrixBounds.Tensor.CW.Terminal
