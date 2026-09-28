import CWPermutedTerminalLaws
import CWPermutedTerminalCoarse
import CWExactCoarseRates
import CWTerminalRetention

/-! Actual coarse and fine retention rates for every physical terminal
orientation. The total-two coordinate determines the ternary entropy entry. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Entropy on one original terminal coordinate, in natural-log units. -/
def axisEntropy (extreme middle : ℕ) (axis : Fin 3) : ℝ :=
  if axis = 2 then entropy (![parameter extreme middle, 1-2*parameter extreme middle,
    parameter extreme middle] : Fin 3 → ℝ) else Real.log 2

/-- Every coordinate marginal of the terminal four-symbol profile has its stated entropy. -/
theorem coordinate_entropy (extreme middle : ℕ) (positive : 0 < extreme+middle) (axis : Fin 3) :
    entropy (fun value => (marginalProfile (counts extreme middle)
      (fun child => shapeCoordinate child.val axis) value : ℝ)/(2*((extreme : ℝ)+middle))) =
      axisEntropy extreme middle axis := by
  fin_cases axis
  · change entropy (fun value => (marginalProfile (counts extreme middle) splitXIndex value : ℝ)/
      (2*((extreme : ℝ)+middle))) = Real.log 2
    rw [(counts_binary_marginals extreme middle positive).1, balanced_binary_entropy]
  · change entropy (fun value => (marginalProfile (counts extreme middle) splitYIndex value : ℝ)/
      (2*((extreme : ℝ)+middle))) = Real.log 2
    rw [(counts_binary_marginals extreme middle positive).2, balanced_binary_entropy]
  · change entropy (fun value => (marginalProfile (counts extreme middle) splitZIndex value : ℝ)/
      (2*((extreme : ℝ)+middle))) = _
    rw [counts_z_marginal extreme middle positive]
    rfl

/-- The actual permuted coarse-X marginal has the entropy selected by its physical role. -/
theorem permuted_coarse_entropy (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    entropy (fun value => ((permutedData axes extreme middle).coarseX value : ℝ)/
      Fintype.card (Fin (2*(extreme+middle)))) = axisEntropy extreme middle (axes 0) := by
  have marginal : (permutedData axes extreme middle).coarseX =
      marginalProfile (counts extreme middle) (fun child => shapeCoordinate child.val (axes 0)) := by
    change marginalProfile (fullProfile (counts extreme middle) ∘ (shapeAlphabetPermutation axes 2).symm)
      (fun child => shapeCoordinate child 0) = _
    rw [marginalProfile_shapePermutation, fullCounts_marginal]
  rw [marginal]
  simpa only [Fintype.card_fin, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat] using
    coordinate_entropy extreme middle positive (axes 0)

/-- Exact permuted Y fine retention has no compatibility penalty. -/
theorem permuted_y_fine_retention (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).fineRetention (P := Fin (2*(extreme+middle))) yClass
      (permutedData axes extreme middle).fineY = axisEntropy extreme middle (axes 1) := by
  rw [SplitRestrictionData.fineRetention_childLaw _ _ _ (permutedRepresentativeY axes extreme middle)]
  change (permutedData axes extreme middle).lawRetention (P := Fin (2*(extreme+middle))) yClass
    ((permutedData axes extreme middle).childLaw (fun child => oneLetterProfile (shapeYIndex child)
      (2*(permutedData axes extreme middle).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.lawRetention_active _ (permuted_counts_symmetric axes extreme middle),
    one_letter_y_retention]
  exact permuted_parent_entropy axes extreme middle positive 1

/-- Exact permuted Z fine retention has the other selected physical entropy. -/
theorem permuted_z_fine_retention (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    (permutedData axes extreme middle).fineRetention (P := Fin (2*(extreme+middle))) zClass
      (permutedData axes extreme middle).fineZ = axisEntropy extreme middle (axes 2) := by
  rw [SplitRestrictionData.fineRetention_childLaw _ _ _ (permutedRepresentativeZ axes extreme middle)]
  change (permutedData axes extreme middle).lawRetention (P := Fin (2*(extreme+middle))) zClass
    ((permutedData axes extreme middle).childLaw (fun child => oneLetterProfile (shapeZIndex child)
      (2*(permutedData axes extreme middle).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.lawRetention_active _ (permuted_counts_symmetric axes extreme middle),
    one_letter_z_retention]
  exact permuted_parent_entropy axes extreme middle positive 2

/-- The actual maximum coarse degree has the exact physically selected entropy rate. -/
theorem permuted_coarse_degree_rate (axes : Equiv.Perm (Fin 3)) (extreme middle : ℕ)
    (positive : 0 < extreme+middle) :
    ((permutedData axes extreme middle).coarseDegree (P := Fin (2*(extreme+middle))) : ℝ)/
      Nat.card (TypedWord (P := Fin (2*(extreme+middle))) (permutedData axes extreme middle).split) ≤
      Real.exp (-(2*((extreme : ℝ)+middle))*axisEntropy extreme middle (axes 0)+
        3*(Real.log (2*((extreme : ℝ)+middle)+1)+1)) := by
  have bound := (permutedData axes extreme middle).complete_coarse_degree_rate
    (permutedReference axes extreme middle) (permuted_all_edges_prescribed axes extreme middle)
  rw [permuted_coarse_entropy axes extreme middle positive] at bound
  simpa only [← Nat.card_eq_fintype_card, Nat.card_fin, Nat.cast_mul, Nat.cast_add,
    Nat.cast_ofNat, Nat.cast_one, mul_one, show (2 : ℝ)+1 = 3 from by norm_num] using bound

end
end MatrixBounds.Tensor.CW.Terminal
