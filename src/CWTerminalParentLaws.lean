import CWTerminalProbabilities
import CWOneLetterEntropy

/-! The independent-concatenation parent laws of the actual terminal data
are precisely the full two-letter fine laws used in the supplied verifier. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The two fine words on each parent axis of coarse total one have equal probability. -/
def binaryParentLaw (word : Fin 2 → Fin 3) : ℝ :=
  if word = ![0, 1] ∨ word = ![1, 0] then 1/2 else 0

/-- The complete parent fine law on the coarse-total-two axis. -/
def ternaryParentLaw (mu : ℝ) (word : Fin 2 → Fin 3) : ℝ :=
  if word = ![0, 2] ∨ word = ![2, 0] then mu else if word = ![1, 1] then 1-2*mu else 0

/-- The actual terminal independent-concatenation Y law is balanced on 01 and 10. -/
theorem terminal_parent_law_y (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeYIndex child)) = binaryParentLaw := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  funext word
  rw [← (finTwoArrowEquiv (Fin 3)).symm_apply_apply word]
  generalize (finTwoArrowEquiv (Fin 3)) word = pair
  rcases pair with ⟨left, right⟩
  unfold SplitRestrictionData.parentLaw
  rw [← (shapeColumnEquiv 2).sum_comp]
  change (∑ column : Fin 6, _) = _
  simp only [Fin.sum_univ_succ]
  fin_cases left <;> fin_cases right <;>
    norm_num [data, oneLetterData, fullCounts_formula, oneLetterLaw, binaryParentLaw,
      finTwoArrowEquiv, leftHalf, rightHalf, shapeYIndex, shapeColumnEquiv,
      List.Nodup.getEquiv, shapes, List.range_succ, complementEquiv, complementSymbol,
      parent, Shape.Fits, Shape.complement, funext_iff, Fin.forall_fin_succ, Fin.castAdd, Fin.natAdd]
  all_goals field_simp
  all_goals ring

/-- The actual terminal independent-concatenation X law is balanced on 01 and 10. -/
theorem terminal_parent_law_x (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeXIndex child)) = binaryParentLaw := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  funext word
  rw [← (finTwoArrowEquiv (Fin 3)).symm_apply_apply word]
  generalize (finTwoArrowEquiv (Fin 3)) word = pair
  rcases pair with ⟨left, right⟩
  unfold SplitRestrictionData.parentLaw
  rw [← (shapeColumnEquiv 2).sum_comp]
  change (∑ column : Fin 6, _) = _
  simp only [Fin.sum_univ_succ]
  fin_cases left <;> fin_cases right <;>
    norm_num [data, oneLetterData, fullCounts_formula, oneLetterLaw, binaryParentLaw,
      finTwoArrowEquiv, leftHalf, rightHalf, shapeXIndex, shapeColumnEquiv,
      List.Nodup.getEquiv, shapes, List.range_succ, complementEquiv, complementSymbol,
      parent, Shape.Fits, Shape.complement, funext_iff, Fin.forall_fin_succ, Fin.castAdd, Fin.natAdd]
  all_goals field_simp
  all_goals ring

/-- The actual terminal independent-concatenation Z law has masses mu, 1-2mu, mu. -/
theorem terminal_parent_law_z (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).parentLaw (P := Fin (2*(extreme+middle)))
      (fun child => oneLetterLaw (shapeZIndex child)) = ternaryParentLaw (parameter extreme middle) := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  funext word
  rw [← (finTwoArrowEquiv (Fin 3)).symm_apply_apply word]
  generalize (finTwoArrowEquiv (Fin 3)) word = pair
  rcases pair with ⟨left, right⟩
  unfold SplitRestrictionData.parentLaw
  rw [← (shapeColumnEquiv 2).sum_comp]
  change (∑ column : Fin 6, _) = _
  simp only [Fin.sum_univ_succ]
  fin_cases left <;> fin_cases right <;>
    norm_num [data, oneLetterData, fullCounts_formula, oneLetterLaw, ternaryParentLaw, parameter,
      finTwoArrowEquiv, leftHalf, rightHalf, shapeZIndex, shapeColumnEquiv,
      List.Nodup.getEquiv, shapes, List.range_succ, complementEquiv, complementSymbol,
      parent, Shape.Fits, Shape.complement, funext_iff, Fin.forall_fin_succ, Fin.castAdd, Fin.natAdd]
  all_goals norm_num only [Fin.ext_iff, show (0 : Fin 3).val = 0 from rfl,
    show (1 : Fin 3).val = 1 from rfl, show (2 : Fin 3).val = 2 from rfl, ite_false, ite_true]
  all_goals simp_all
  all_goals field_simp
  all_goals ring

/-- The full binary parent fine law has entropy log 2. -/
theorem binary_parent_entropy : entropy binaryParentLaw = Real.log 2 := by
  unfold entropy
  rw [← (finTwoArrowEquiv (Fin 3)).symm.sum_comp]
  norm_num [binaryParentLaw, finTwoArrowEquiv, Fintype.sum_prod_type,
    Fin.sum_univ_succ, funext_iff, Fin.forall_fin_succ, Real.log_div]
  norm_num only [Fin.ext_iff, show (0 : Fin 3).val = 0 from rfl,
    show (1 : Fin 3).val = 1 from rfl, show (2 : Fin 3).val = 2 from rfl, ite_false, ite_true]
  all_goals ring

/-- The full ternary parent fine law has exactly the entropy of its three nonzero positions. -/
theorem ternary_parent_entropy (mu : ℝ) :
    entropy (ternaryParentLaw mu) = entropy (![mu, 1-2*mu, mu] : Fin 3 → ℝ) := by
  unfold entropy
  rw [← (finTwoArrowEquiv (Fin 3)).symm.sum_comp]
  norm_num [ternaryParentLaw, finTwoArrowEquiv, Fintype.sum_prod_type,
    Fin.sum_univ_succ, funext_iff, Fin.forall_fin_succ]
  norm_num only [Fin.ext_iff, show (0 : Fin 3).val = 0 from rfl,
    show (1 : Fin 3).val = 1 from rfl, show (2 : Fin 3).val = 2 from rfl, ite_false, ite_true]
  all_goals ring

end
end MatrixBounds.Tensor.CW.Terminal
