module

public import CWTargetConcentration
public import ApproximateTypes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Probability-cube bounds for the actual independent-child parent centers,
including child pools with zero positions and zero profile counts. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Every feasible child fine profile has normalized coordinates between zero and one, including empty pools. -/
theorem child_profile_range (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    0 ≤ (profile child symbol : ℝ)/(2*data.split child) ∧ (profile child symbol : ℝ)/(2*data.split child) ≤ 1 := by
  have bound := empirical_probability_range (representative child).val symbol
  rw [(representative child).property symbol] at bound
  simpa only [ChildPositions, Fintype.card_fin, Nat.cast_mul, Nat.cast_ofNat] using bound

/-- The prescribed parent split weights sum to one whenever the parent population is nonempty. -/
theorem parent_weights_sum [Nonempty P] (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P)) :
    (∑ child, (data.split child : ℝ)/Fintype.card P) = 1 := by
  have population : (Fintype.card P : ℝ) ≠ 0 := by exact_mod_cast (Fintype.card_pos (α := P)).ne'
  rw [← Finset.sum_div, ← Nat.cast_sum, profile_total data.split (data.prescribedWord reference), div_self population]

/-- The actual parent-center mixture lies in the probability cube uniformly over all feasible profiles. -/
theorem parentCenter_range [Nonempty P] (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (symbol : Fin (length+length) → Fin 3) :
    0 ≤ data.parentCenter (P := P) profile symbol ∧ data.parentCenter (P := P) profile symbol ≤ 1 := by
  have nonnegative (child : ShapeAlphabet (2*length)) : 0 ≤ (data.split child : ℝ)/Fintype.card P := by positivity
  constructor
  · unfold parentCenter
    exact Finset.sum_nonneg (fun child _ => mul_nonneg (nonnegative child)
      (mul_nonneg (data.child_profile_range profile representative child (leftHalf symbol)).1
        (data.child_profile_range profile representative _ (rightHalf symbol)).1))
  · unfold parentCenter
    calc
      _ ≤ ∑ child, (data.split child : ℝ)/Fintype.card P * 1 := by
        apply Finset.sum_le_sum
        intro child _
        apply mul_le_mul_of_nonneg_left _ (nonnegative child)
        have left := data.child_profile_range profile representative child (leftHalf symbol)
        have right := data.child_profile_range profile representative
          (complementEquiv data.parent (2*length) data.balanced child) (rightHalf symbol)
        simpa only [one_mul] using mul_le_mul left.2 right.2 right.1 (by norm_num : (0 : ℝ) ≤ 1)
      _ = 1 := by simp only [mul_one]; exact data.parent_weights_sum reference

/-- A positive tolerance controls the empirical entropy of every word accepted around the actual parent center. -/
theorem exists_parent_entropy_control [Nonempty P] (data : SplitRestrictionData length)
    (reference : data.PrescribedEdges (P := P))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) {error : ℝ} (positive : 0 < error) :
    ∃ tolerance > 0, ∀ fine : P → Fin (length+length) → Fin 3,
      Within (data.parentCenter (P := P) profile) tolerance fine →
        |Entropy.entropy (fun symbol => (count fine symbol : ℝ)/Fintype.card P) -
          Entropy.entropy (data.parentCenter (P := P) profile)| < error := by
  obtain ⟨tolerance, tolerancePositive, control⟩ := exists_within_entropy_control
    (data.parentCenter (P := P) profile) (data.parentCenter_range reference profile representative) positive
  exact ⟨tolerance, tolerancePositive, fun fine inside => control P fine inside⟩

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
