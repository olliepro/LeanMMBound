import CWRootDegrees
import FiniteMaximumRates
import LogarithmicLoss

/-! Exact root fine types give entropy retention without a parent-window
approximation. The error is uniform over every feasible root profile. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- Global fine entropy minus pooled conditional mass entropy, normalized by the root population. -/
def fineRetention (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) : ℝ :=
  Entropy.entropy (fun symbol => (globalProfile profile symbol : ℝ)/Fintype.card P) -
    ∑ sector, Entropy.massEntropy (fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P)

/-- Alphabet constant controlling the finite root fine-count error. -/
def fineErrorConstant (length : ℕ) : ℕ :=
  Fintype.card (CompatibilityClass (2*length)) + Fintype.card (Fin length → Fin 3)

/-- The actual pooled root fine count has the mass-entropy upper bound with uniform logarithmic error. -/
theorem pooled_count_bound (data : RootRestrictionData length)
    (reference : TypedWord (P := P) data.split)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) :
    Real.log (Nat.card {word : P → Fin length → Fin 3 //
      SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) word} : ℝ) ≤
    (Fintype.card P : ℝ)*(∑ sector, Entropy.massEntropy
      (fun symbol => (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P)) +
      Fintype.card (CompatibilityClass (2*length))*(Real.log ((Fintype.card P : ℝ)+1)+1) := by
  let label := fun position => axisClass (reference.val position)
  have compatible := sectorCompatible_coarsen reference.val profile axisClass _
    (typePlacement_compatible data.split reference profile representative)
  let sectors := sectorCompatibleEquiv label (pooledProfile profile axisClass)
    ⟨data.targetFine reference profile representative, compatible⟩
  apply (pooled_mass_entropy_upper label (pooledProfile profile axisClass) sectors
    (Fintype.card P : ℝ) (by exact_mod_cast (Fintype.card_pos (α := P)).ne')).trans
  apply add_le_add_left
  calc
    _ ≤ ∑ _ : CompatibilityClass (2*length), (Real.log ((Fintype.card P : ℝ)+1)+1) := by
      apply Finset.sum_le_sum
      intro sector _
      apply add_le_add_right
      apply Real.log_le_log (by positivity)
      have bound := Nat.add_le_add_right (Fintype.card_subtype_le (fun position => label position = sector)) 1
      simp only [← Nat.card_eq_fintype_card] at bound ⊢
      exact_mod_cast bound
    _ = _ := by simp only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul]

/-- Incidence symmetry converts the actual root fine degree to its entropy retention exponent. -/
theorem fine_degree_pointwise_rate (data : RootRestrictionData length)
    (reference : TypedWord (P := P) data.split) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (fine : TypedWord (P := P) (globalProfile profile)) :
    (Nat.card {edge : TypedWord (P := P) data.split // compatibleFine axis axisClass profile edge.val fine.val} : ℝ)/
      Fintype.card (TypedWord (P := P) data.split) ≤
    Real.exp (-(Fintype.card P : ℝ)*fineRetention (P := P) axisClass profile +
      fineErrorConstant length*(Real.log ((Fintype.card P : ℝ)+1)+1)) := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨reference⟩
  letI : Nonempty (TypedWord (P := P) (globalProfile profile)) := ⟨fine⟩
  letI : Nonempty {word : P → Fin length → Fin 3 //
      SectorCompatible (fun position => axisClass (reference.val position)) (pooledProfile profile axisClass) word} :=
    ⟨⟨data.targetFine reference profile representative,
      sectorCompatible_coarsen reference.val profile axisClass _
        (typePlacement_compatible data.split reference profile representative)⟩⟩
  have lower := (log_type_count_bounds_any (globalProfile profile) fine).1
  have upper := data.pooled_count_bound reference axisClass profile representative
  simp only [← Nat.card_eq_fintype_card] at lower
  have bound := Selection.incidence_exponential_rate (Nat.card_pos) (Nat.card_pos) (Nat.card_pos)
    (data.fine_degree_product_bound axis axisClass profile reference fine) lower upper
  simp only [← Nat.card_eq_fintype_card] at bound ⊢
  convert bound using 1
  congr 1
  unfold fineRetention fineErrorConstant
  simp only [← Nat.card_eq_fintype_card, Nat.cast_add]
  ring

/-- Taking the maximum over the fixed global fine type preserves the same normalized rate. -/
theorem fine_degree_rate (data : RootRestrictionData length)
    (reference : TypedWord (P := P) data.split) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) :
    (data.fineDegree (P := P) axis axisClass profile : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*fineRetention (P := P) axisClass profile +
        fineErrorConstant length*(Real.log ((Fintype.card P : ℝ)+1)+1)) := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨reference⟩
  unfold fineDegree
  apply Selection.finite_maximum_normalized_bound _ _ Fintype.card_pos (Real.exp_pos _).le
  intro fine _
  exact data.fine_degree_pointwise_rate reference axis axisClass profile representative fine

/-- A single population threshold absorbs the fine-count error for every feasible root profile. -/
theorem exists_uniform_fine_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ (P : Type*) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
      ∀ (data : RootRestrictionData length) (_reference : TypedWord (P := P) data.split) (axis : Shape → ℕ)
        (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
        (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (_representative : data.TargetParts profile),
      (data.fineDegree (P := P) axis axisClass profile : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(fineRetention (P := P) axisClass profile-error)) := by
  obtain ⟨threshold, errors⟩ := Selection.logarithmic_error_eventually
    (constant := (fineErrorConstant length : ℝ)) (growth := 1) (Nat.cast_nonneg _) (by norm_num) positive
  refine ⟨threshold, ?_⟩
  intro P finite nonempty large data reference axis axisClass profile representative
  apply (data.fine_degree_rate reference axis axisClass profile representative).trans
  apply Real.exp_le_exp.mpr
  have small := errors (Fintype.card P) large
  simp only [one_mul] at small
  nlinarith

end
end MatrixBounds.Tensor.CW.RootRestrictionData
