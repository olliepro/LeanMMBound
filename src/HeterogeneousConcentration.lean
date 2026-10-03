module

public import ProductSampling

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Parent-block concentration for independent exact child pools with different
alphabets, slot counts, and population sizes. All choices remain separately labelled. -/
namespace MatrixBounds.Empirical

open Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Pool Parent : Type*} [Fintype Pool] [Fintype Parent] [Nonempty Parent]
variable {P B Slot : Pool → Type*}
variable [∀ t, Fintype (P t)] [∀ t, Fintype (B t)] [∀ t, Fintype (Slot t)]
variable [∀ t, DecidableEq (P t)]

/-- One parent pattern in a product of separately typed child pools. -/
def heterogeneousBlockEvent (profile : ∀ t, B t → ℕ)
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t)
    (parent : Parent) (words : ∀ t, TypedWord (P := P t) (profile t)) : Prop :=
  ∀ t, blockEvent (profile t) (positions t) (pattern t) parent (words t)

/-- Independent concatenation frequency for a heterogeneous parent pattern. -/
def heterogeneousBlockCenter (profile : ∀ t, B t → ℕ) (pattern : ∀ t, Slot t → B t) : ℝ :=
  ∏ t, blockCenter (P := P t) (profile t) (pattern t)

/-- Sum of finite-population corrections for one slot pattern in each child pool. -/
def heterogeneousBlockError : ℝ := ∑ t, (Fintype.card (Slot t) : ℝ)^2 / Fintype.card (P t)

omit [Fintype Parent] [∀ t, Fintype (B t)] [∀ t, DecidableEq (P t)] in
/-- Heterogeneous independent concatenation is a probability between zero and one. -/
theorem heterogeneousBlockCenter_bounds (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t) :
    0 ≤ heterogeneousBlockCenter (P := P) profile pattern ∧
      heterogeneousBlockCenter (P := P) profile pattern ≤ 1 := by
  have bounds := fun t => blockCenter_bounds (profile t) (representative t) (positions t) (pattern t)
  exact ⟨Finset.prod_nonneg (fun t _ => (bounds t).1),
    Finset.prod_le_one₀ (fun t _ => (bounds t).1) (fun t _ => (bounds t).2)⟩

omit [Fintype Parent] in
/-- A single heterogeneous block has the independent product law up to the summed pool errors. -/
theorem heterogeneous_block_single_error (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t) (parent : Parent) :
    |average (indicator (heterogeneousBlockEvent profile positions pattern parent)) -
      heterogeneousBlockCenter (P := P) profile pattern| ≤ heterogeneousBlockError (P := P) (Slot := Slot) := by
  letI : ∀ t, Nonempty (TypedWord (P := P t) (profile t)) := fun t => ⟨representative t⟩
  exact independent_pi_event_error _ _ _
    (fun t => blockCenter_bounds (profile t) (representative t) (positions t) (pattern t))
    (fun t => block_single_error (profile t) (representative t) (positions t) (pattern t) parent)

omit [Fintype Parent] in
/-- Two disjoint heterogeneous blocks have a joint error at most four times the single error. -/
theorem heterogeneous_block_joint_error (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t)
    (first second : Parent) (different : first ≠ second) :
    |average (indicator (fun words => heterogeneousBlockEvent profile positions pattern first words ∧
        heterogeneousBlockEvent profile positions pattern second words)) -
      (heterogeneousBlockCenter (P := P) profile pattern)^2| ≤
        4*heterogeneousBlockError (P := P) (Slot := Slot) := by
  letI : ∀ t, Nonempty (TypedWord (P := P t) (profile t)) := fun t => ⟨representative t⟩
  have bounds (t : Pool) : 0 ≤ (blockCenter (P := P t) (profile t) (pattern t))^2 ∧
      (blockCenter (P := P t) (profile t) (pattern t))^2 ≤ 1 := by
    have h := blockCenter_bounds (profile t) (representative t) (positions t) (pattern t)
    constructor
    · positivity
    · nlinarith
  have result := independent_pi_event_error
    (fun t word => blockEvent (profile t) (positions t) (pattern t) first word ∧
      blockEvent (profile t) (positions t) (pattern t) second word)
    (fun t => (blockCenter (P := P t) (profile t) (pattern t))^2)
    (fun t => (2*(Fintype.card (Slot t) : ℝ))^2 / Fintype.card (P t)) bounds
    (fun t => block_joint_error (profile t) (representative t) (positions t) (pattern t) first second different)
  simp only [forall_and, Finset.prod_pow] at result
  convert result using 1
  · rfl
  simp only [heterogeneousBlockError, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro t _
  ring

/-- Parent frequencies concentrate for finitely many independently sampled child types.
For m parents and child pools of sizes N_t with k_t slots per parent, the bad
fraction is at most (1/m + 6*sum_t k_t^2/N_t)/threshold^2. -/
theorem heterogeneous_block_frequency_concentration (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t)
    {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ t, TypedWord (P := P t) (profile t) // threshold ≤
        |(∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) /
          Fintype.card Parent - heterogeneousBlockCenter (P := P) profile pattern|} : ℝ) /
        Fintype.card (∀ t, TypedWord (P := P t) (profile t)) ≤
      (1/(Fintype.card Parent : ℝ) + 6*heterogeneousBlockError (P := P) (Slot := Slot)) / threshold^2 := by
  letI : Nonempty (∀ t, TypedWord (P := P t) (profile t)) := ⟨representative⟩
  have bounds := heterogeneousBlockCenter_bounds profile representative positions pattern
  have nonneg : 0 ≤ heterogeneousBlockError (P := P) (Slot := Slot) :=
    Finset.sum_nonneg (fun _ _ => by positivity)
  have result := indicator_frequency_concentration (heterogeneousBlockEvent profile positions pattern)
    bounds.1 bounds.2 nonneg (by positivity) positive
    (heterogeneous_block_single_error profile representative positions pattern)
    (heterogeneous_block_joint_error profile representative positions pattern)
  convert result using 1
  ring

omit [∀ t, DecidableEq (P t)] in
/-- Injective placement bounds the total population correction by slots per parent divided by parents. -/
theorem heterogeneous_block_error_bound (positions : ∀ t, Parent × Slot t ↪ P t) :
    heterogeneousBlockError (P := P) (Slot := Slot) ≤
      (∑ t, (Fintype.card (Slot t) : ℝ)) / Fintype.card Parent := by
  have parent_positive : (0 : ℝ) < Fintype.card Parent := by exact_mod_cast Fintype.card_pos
  rw [Finset.sum_div]
  apply Finset.sum_le_sum
  intro t _
  by_cases empty : IsEmpty (Slot t)
  · letI := empty
    simp
  haveI : Nonempty (Slot t) := not_isEmpty_iff.mp empty
  letI : Nonempty (P t) := ⟨positions t (Classical.choice inferInstance, Classical.choice inferInstance)⟩
  have pool_positive : (0 : ℝ) < Fintype.card (P t) := by exact_mod_cast Fintype.card_pos
  have size : (Fintype.card Parent : ℝ) * Fintype.card (Slot t) ≤ Fintype.card (P t) := by
    exact_mod_cast (by simpa only [Fintype.card_prod] using
      Fintype.card_le_of_injective (positions t) (positions t).injective)
  apply (div_le_div_iff₀ pool_positive parent_positive).mpr
  nlinarith [mul_le_mul_of_nonneg_left size (Nat.cast_nonneg (Fintype.card (Slot t)))]

/-- The parent-hole fraction is bounded uniformly over all feasible child profiles by C/(m*epsilon^2). -/
theorem heterogeneous_block_uniform_concentration (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t)
    {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ t, TypedWord (P := P t) (profile t) // threshold ≤
        |(∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) /
          Fintype.card Parent - heterogeneousBlockCenter (P := P) profile pattern|} : ℝ) /
        Fintype.card (∀ t, TypedWord (P := P t) (profile t)) ≤
      (1 + 6*∑ t, (Fintype.card (Slot t) : ℝ)) / ((Fintype.card Parent : ℝ)*threshold^2) := by
  apply (heterogeneous_block_frequency_concentration profile representative positions pattern positive).trans
  calc
    _ ≤ (1/(Fintype.card Parent : ℝ) +
        6*((∑ t, (Fintype.card (Slot t) : ℝ)) / Fintype.card Parent)) / threshold^2 := by
      apply div_le_div_of_nonneg_right _ (sq_nonneg _)
      have bound := heterogeneous_block_error_bound positions
      linarith
    _ = _ := by field_simp

/-- The unnormalized pattern-count error has second moment at most a constant times the parent count. -/
theorem heterogeneous_block_second_moment (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) (pattern : ∀ t, Slot t → B t) :
    average (fun words => ((∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) -
      Fintype.card Parent * heterogeneousBlockCenter (P := P) profile pattern)^2) ≤
        (1 + 6*∑ t, (Fintype.card (Slot t) : ℝ)) * Fintype.card Parent := by
  letI : Nonempty (∀ t, TypedWord (P := P t) (profile t)) := ⟨representative⟩
  have bounds := heterogeneousBlockCenter_bounds profile representative positions pattern
  have nonneg : 0 ≤ heterogeneousBlockError (P := P) (Slot := Slot) :=
    Finset.sum_nonneg (fun _ _ => by positivity)
  have moment := second_moment_bound
    (fun parent words => indicator (heterogeneousBlockEvent profile positions pattern parent) words -
      heterogeneousBlockCenter (P := P) profile pattern)
    1 (6*heterogeneousBlockError (P := P) (Slot := Slot)) (by positivity)
    (fun parent => centered_indicator_diagonal _ bounds.1 bounds.2)
    (fun first second different => by
      have covariance := centered_indicator_bound
        (heterogeneousBlockEvent profile positions pattern first)
        (heterogeneousBlockEvent profile positions pattern second) bounds.1 bounds.2 nonneg
        (heterogeneous_block_single_error profile representative positions pattern first)
        (heterogeneous_block_single_error profile representative positions pattern second)
        (heterogeneous_block_joint_error profile representative positions pattern first second different)
      convert covariance using 1; ring)
  simp only [Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul] at moment
  apply moment.trans
  have positive : (0 : ℝ) < Fintype.card Parent := by exact_mod_cast Fintype.card_pos
  have correction := (le_div_iff₀ positive).mp (heterogeneous_block_error_bound positions)
  nlinarith [mul_le_mul_of_nonneg_left correction positive.le]

/-- All heterogeneous parent-pattern coordinates obey one finite union bound. -/
theorem heterogeneous_all_patterns_concentration (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {words : ∀ t, TypedWord (P := P t) (profile t) // ∃ pattern : ∀ t, Slot t → B t,
        threshold ≤ |(∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) /
          Fintype.card Parent - heterogeneousBlockCenter (P := P) profile pattern|} : ℝ) /
        Fintype.card (∀ t, TypedWord (P := P t) (profile t)) ≤
      (Fintype.card (∀ t, Slot t → B t) : ℝ) *
        ((1 + 6*∑ t, (Fintype.card (Slot t) : ℝ)) / ((Fintype.card Parent : ℝ)*threshold^2)) := by
  let bad : (∀ t, Slot t → B t) → (∀ t, TypedWord (P := P t) (profile t)) → Prop :=
    fun pattern words => threshold ≤
      |(∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) /
        Fintype.card Parent - heterogeneousBlockCenter (P := P) profile pattern|
  have bound := Selection.union_count bad
  have divided := div_le_div_of_nonneg_right (show (Nat.card {words // ∃ pattern, bad pattern words} : ℝ) ≤
      ∑ pattern, (Nat.card {words // bad pattern words} : ℝ) by exact_mod_cast bound)
    (Nat.cast_nonneg (Fintype.card (∀ t, TypedWord (P := P t) (profile t))))
  rw [Finset.sum_div] at divided
  have individual := Finset.sum_le_sum (s := Finset.univ)
    (fun pattern _ => heterogeneous_block_uniform_concentration profile representative positions pattern positive)
  exact divided.trans (by simpa only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul] using individual)

end
end MatrixBounds.Empirical
