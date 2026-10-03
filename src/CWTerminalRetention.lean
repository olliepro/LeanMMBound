module

public import CWTerminalParentLaws
public import CWOneLetterProfileLaws
public import CWTerminalDegreeRate

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The three actual terminal entropy rates, with their empirical centers and
one-letter compatibility penalties identified with the verifier formulas. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The coarse-X entropy of the exact terminal data is log 2. -/
theorem terminal_coarse_entropy (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    entropy (fun label => ((data (counts extreme middle)).coarseX label : ℝ)/
      Fintype.card (Fin (2*(extreme+middle)))) = Real.log 2 := by
  have marginal := (counts_binary_marginals extreme middle positive).1
  have same : (fun label => ((data (counts extreme middle)).coarseX label : ℝ)/
      Fintype.card (Fin (2*(extreme+middle)))) = (![1/2, 1/2, 0] : Fin 3 → ℝ) := by
    simpa only [data, oneLetterData, Fintype.card_fin, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat] using marginal
  rw [same, balanced_binary_entropy]

/-- The actual nominal Y rate is log 2 because its complete fine parent law is binary and the compatibility loss is zero. -/
theorem terminal_y_law_retention (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).lawRetention (P := Fin (2*(extreme+middle))) yClass
      (fun child => oneLetterLaw (shapeYIndex child)) = Real.log 2 := by
  rw [one_letter_y_retention, terminal_parent_law_y extreme middle positive, binary_parent_entropy]

/-- The actual nominal Z rate is the entropy of mu, 1-2mu, mu, with zero compatibility loss. -/
theorem terminal_z_law_retention (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).lawRetention (P := Fin (2*(extreme+middle))) zClass
      (fun child => oneLetterLaw (shapeZIndex child)) =
        entropy (![parameter extreme middle, 1-2*parameter extreme middle, parameter extreme middle] : Fin 3 → ℝ) := by
  rw [one_letter_z_retention, terminal_parent_law_z extreme middle positive, ternary_parent_entropy]

/-- The exact-profile Y retention equals the same nominal binary entropy rate, including empty child pools. -/
theorem terminal_y_fine_retention (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).fineRetention (P := Fin (2*(extreme+middle))) yClass
      (data (counts extreme middle)).fineY = Real.log 2 := by
  rw [SplitRestrictionData.fineRetention_childLaw _ _ _ (representativeY (counts extreme middle))]
  change (data (counts extreme middle)).lawRetention (P := Fin (2*(extreme+middle))) yClass
    ((data (counts extreme middle)).childLaw (fun child => oneLetterProfile (shapeYIndex child)
      (2*(data (counts extreme middle)).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.lawRetention_active _ (counts_symmetric extreme middle)]
  exact terminal_y_law_retention extreme middle positive

/-- The exact-profile Z retention is the same proved ternary entropy rate. -/
theorem terminal_z_fine_retention (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (data (counts extreme middle)).fineRetention (P := Fin (2*(extreme+middle))) zClass
      (data (counts extreme middle)).fineZ =
        entropy (![parameter extreme middle, 1-2*parameter extreme middle, parameter extreme middle] : Fin 3 → ℝ) := by
  rw [SplitRestrictionData.fineRetention_childLaw _ _ _ (representativeZ (counts extreme middle))]
  change (data (counts extreme middle)).lawRetention (P := Fin (2*(extreme+middle))) zClass
    ((data (counts extreme middle)).childLaw (fun child => oneLetterProfile (shapeZIndex child)
      (2*(data (counts extreme middle)).split child))) = _
  rw [one_letter_childLaw, SplitRestrictionData.lawRetention_active _ (counts_symmetric extreme middle)]
  exact terminal_z_law_retention extreme middle positive

set_option maxHeartbeats 800000 in
/-- The terminal maximum coarse degree has the explicit binary rate at every finite population. -/
theorem terminal_coarse_degree_binary (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    ((data (counts extreme middle)).coarseDegree (P := Fin (2*(extreme+middle))) : ℝ) /
      Fintype.card (TypedWord (P := Fin (2*(extreme+middle))) (data (counts extreme middle)).split) ≤
      Real.exp (-(2*((extreme : ℝ)+middle))*Real.log 2 +
        3*(Real.log (2*((extreme : ℝ)+middle)+1)+1)) := by
  have bound := terminal_coarse_degree_rate (counts extreme middle) (counts_feasible extreme middle).some
  rw [terminal_coarse_entropy extreme middle positive] at bound
  have population : (Fintype.card (Fin (2*(extreme+middle))) : ℝ) =
      2*((extreme : ℝ)+middle) := by simp only [Fintype.card_fin, Nat.cast_mul, Nat.cast_add, Nat.cast_ofNat]
  rw [population] at bound
  convert bound using 1
  simp only [← Nat.card_eq_fintype_card]

end
end MatrixBounds.Tensor.CW.Terminal
