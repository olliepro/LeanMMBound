import CWUniformWindowEntropy
import PooledMassEntropy
import LogarithmicLoss

/-! Normalize the actual compatibility count to the pooled mass-entropy rate.
All finite errors are bounded uniformly by a constant times log(2N+1)+1. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- The fine-axis retention rate is parent entropy minus the sum of pooled mass entropies, in natural logarithms. -/
def fineRetention (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) : ℝ :=
  Entropy.entropy (data.parentCenter (P := P) profile) -
    ∑ sector, Entropy.massEntropy (fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P)

/-- The fixed alphabet constant in the finite fine-axis logarithmic error. -/
def fineErrorConstant (length : ℕ) : ℕ :=
  Fintype.card (CompatibilityClass (2*length)) + Fintype.card (Fin (length+length) → Fin 3)

/-- The actual pooled compatibility cost has the normalized mass-entropy main term and a uniform finite error. -/
theorem compatibilityCost_bound (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (representative : data.TargetParts profile) :
    data.compatibilityCost reference axisClass profile ≤
      (Fintype.card P : ℝ)*(∑ sector, Entropy.massEntropy
        (fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P)) +
      Fintype.card (CompatibilityClass (2*length))*(Real.log (2*(Fintype.card P : ℝ)+1)+1) := by
  let label := fun slot : P ⊕ P => axisClass (childLabels data.parent data.balanced (data.word reference.val) slot)
  have compatible := data.targetParts_compatible symmetric reference axis additive profile support axisClass representative
  let sectors := sectorCompatibleEquiv label (pooledProfile profile axisClass)
    ⟨fineHalves length ((data.targetPairing symmetric reference).parentFineWord length (fun child => (representative child).val)), compatible.2⟩
  have main := pooled_entropy_main label (pooledProfile profile axisClass) sectors (Fintype.card P : ℝ)
    (by exact_mod_cast (Fintype.card_pos (α := P)).ne')
  unfold compatibilityCost
  dsimp only
  simp only [← Nat.card_eq_fintype_card] at main ⊢
  rw [main]
  simp only [Nat.card_eq_fintype_card]
  apply add_le_add_left
  calc
    _ ≤ ∑ _ : CompatibilityClass (2*length), (Real.log (2*(Fintype.card P : ℝ)+1)+1) := by
      apply Finset.sum_le_sum
      intro sector _
      apply add_le_add_right
      apply Real.log_le_log (by positivity)
      have size := Fintype.card_subtype_le (fun slot : P ⊕ P => label slot = sector)
      simp only [Fintype.card_sum] at size
      exact_mod_cast (show Fintype.card {slot : P ⊕ P // label slot = sector}+1 ≤ 2*Fintype.card P+1 by omega)
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]

/-- Combining the sector and parent type-count errors gives a population-uniform logarithmic error. -/
theorem fine_error_bound (Positions : Type*) [Fintype Positions] (length : ℕ) :
    Fintype.card (CompatibilityClass (2*length))*(Real.log (2*(Fintype.card Positions : ℝ)+1)+1) +
      parentTypeError Positions length ≤
    fineErrorConstant length*(Real.log (2*(Fintype.card Positions : ℝ)+1)+1) := by
  unfold parentTypeError fineErrorConstant
  push_cast
  rw [add_mul]
  apply add_le_add_left
  apply mul_le_mul_of_nonneg_left _ (Nat.cast_nonneg _)
  apply add_le_add_right
  exact Real.log_le_log (by positivity) (by have := Nat.cast_nonneg (Fintype.card Positions) (α := ℝ); linarith)

/-- One tolerance, chosen before all populations and profiles, bounds the actual maximum degree by the normalized fine-axis rate. -/
theorem exists_uniform_fine_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ tolerance > 0, ∀ (P : Type*) [Fintype P] [Nonempty P]
      (data : SplitRestrictionData length) (_symmetric : data.Symmetric)
      (_reference : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
      (_additive : ∀ left right, axis (addShape left right) = axis left + axis right)
      (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
      (_support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
      (_representative : data.TargetParts profile),
      (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) tolerance) : ℝ)/
          Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(data.fineRetention (P := P) axisClass profile-error) +
          fineErrorConstant length*(Real.log (2*(Fintype.card P : ℝ)+1)+1)) := by
  obtain ⟨tolerance, positiveTolerance, bound⟩ := exists_uniform_window_degree_entropy length positive
  refine ⟨tolerance, positiveTolerance, ?_⟩
  intro P finite nonempty data symmetric reference axis additive axisClass profile support representative
  apply (bound P data symmetric reference axis additive axisClass profile support representative).trans
  apply Real.exp_le_exp.mpr
  have cost := data.compatibilityCost_bound symmetric reference axis additive axisClass profile support representative
  have errors := fine_error_bound P length
  unfold fineRetention
  linarith

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
