module

public import TypeSamplingGeneral
public import IndicatorConcentration
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Concentration of disjoint fixed-size blocks in a uniformly sampled exact-type word. -/
namespace MatrixBounds.Empirical

open Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Select two different parent positions using a two-element index. -/
def twoEmbedding {A : Type*} (first second : A) (different : first ≠ second) : Fin 2 ↪ A where
  toFun index := if index.val = 0 then first else second
  inj' := by
    intro left right same
    apply Fin.ext
    dsimp at same
    by_cases hl : left.val = 0 <;> by_cases hr : right.val = 0 <;> simp_all
    omega

variable {P B Parent Slot : Type*} [Fintype P] [Fintype B] [Fintype Parent] [Fintype Slot]
variable [Nonempty Parent] [DecidableEq P]

/-- The event that one block of an exact-type word matches the desired pattern. -/
def blockEvent (profile : B → ℕ) (positions : Parent × Slot ↪ P) (pattern : Slot → B)
    (parent : Parent) (word : TypedWord (P := P) profile) : Prop :=
  ∀ slot, word.val (positions (parent, slot)) = pattern slot

/-- Independent expected frequency of the block pattern under the empirical symbol distribution. -/
def blockCenter (profile : B → ℕ) (pattern : Slot → B) : ℝ :=
  ∏ slot, (profile (pattern slot) : ℝ) / Fintype.card P

/-- Coordinate embedding for one parent block. -/
def blockSlots (positions : Parent × Slot ↪ P) (parent : Parent) : Slot ↪ P where
  toFun slot := positions (parent, slot)
  inj' _ _ same := (Prod.mk.inj (positions.injective same)).2

omit [Fintype B] [Fintype Parent] [DecidableEq P] in
/-- Feasible empirical profiles give independent block frequencies between zero and one. -/
theorem blockCenter_bounds (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positions : Parent × Slot ↪ P) (pattern : Slot → B) :
    0 ≤ blockCenter (P := P) profile pattern ∧ blockCenter (P := P) profile pattern ≤ 1 := by
  by_cases empty : IsEmpty Slot
  · letI := empty
    simp [blockCenter]
  haveI : Nonempty Slot := not_isEmpty_iff.mp empty
  letI : Nonempty P := ⟨positions (Classical.choice inferInstance, Classical.choice inferInstance)⟩
  have positive : (0 : ℝ) < Fintype.card P := by exact_mod_cast Fintype.card_pos
  have bound (symbol : B) : (profile symbol : ℝ) ≤ Fintype.card P := by
    have natural : count representative.val symbol ≤ Fintype.card P := by
      simpa only [count, Nat.card_eq_fintype_card] using
        Fintype.card_subtype_le (fun p => representative.val p = symbol)
    rw [representative.property symbol] at natural
    exact_mod_cast natural
  constructor
  · exact Finset.prod_nonneg (fun _ _ => div_nonneg (Nat.cast_nonneg _) positive.le)
  · exact Finset.prod_le_one₀ (fun _ _ => div_nonneg (Nat.cast_nonneg _) positive.le)
      (fun slot _ => (div_le_one positive).mpr (bound (pattern slot)))

omit [Fintype Parent] [Nonempty Parent] in
/-- A single block event is close to the product law, with error k^2/N. -/
theorem block_single_error (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positions : Parent × Slot ↪ P) (pattern : Slot → B) (parent : Parent) :
    |average (indicator (blockEvent profile positions pattern parent)) - blockCenter (P := P) profile pattern| ≤
      (Fintype.card Slot : ℝ)^2 / Fintype.card P := by
  rw [average_indicator]
  exact exact_type_pattern_bias_indexed profile representative (blockSlots positions parent) pattern

omit [Fintype Parent] [Nonempty Parent] in
/-- Two disjoint block events are close to two independent copies of the product law. -/
theorem block_joint_error (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positions : Parent × Slot ↪ P) (pattern : Slot → B) (first second : Parent) (different : first ≠ second) :
    |average (indicator (fun word => blockEvent profile positions pattern first word ∧
        blockEvent profile positions pattern second word)) - (blockCenter (P := P) profile pattern)^2| ≤
      (2*(Fintype.card Slot : ℝ))^2 / Fintype.card P := by
  let selected : Fin 2 × Slot ↪ P :=
    ((twoEmbedding first second different).prodMap (Function.Embedding.refl Slot)).trans positions
  have result := exact_type_pattern_bias_indexed profile representative selected (fun pair => pattern pair.2)
  have events (word : TypedWord (P := P) profile) :
      (∀ pair, word.val (selected pair) = pattern pair.2) ↔
        blockEvent profile positions pattern first word ∧ blockEvent profile positions pattern second word := by
    constructor
    · intro h
      constructor
      · intro slot
        simpa [selected, twoEmbedding] using h (0, slot)
      · intro slot
        simpa [selected, twoEmbedding] using h (1, slot)
    · rintro ⟨hf, hs⟩ ⟨choice, slot⟩
      by_cases zero : choice = 0
      · simpa [selected, twoEmbedding, zero] using hf slot
      · simpa [selected, twoEmbedding, zero] using hs slot
  have count_eq := Nat.card_congr (Equiv.subtypeEquivRight events)
  rw [count_eq] at result
  rw [average_indicator]
  simpa only [Fintype.card_prod, Fintype.card_fin, Nat.cast_mul, Nat.cast_ofNat,
    Fintype.prod_prod_type, Finset.prod_const, Finset.card_univ, blockCenter] using result

/-- A uniform exact-type word has only O(1/N) probability of atypical block frequency.
For paired children k=2 and N=2m, the bound becomes 13/(m*threshold^2). -/
theorem block_frequency_concentration (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positions : Parent × Slot ↪ P) (pattern : Slot → B) {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {word : TypedWord (P := P) profile // threshold ≤
        |(∑ parent, indicator (blockEvent profile positions pattern parent) word) / Fintype.card Parent -
          blockCenter (P := P) profile pattern|} : ℝ) / Fintype.card (TypedWord (P := P) profile) ≤
      (1/(Fintype.card Parent : ℝ) + 6*(Fintype.card Slot : ℝ)^2 / Fintype.card P) / threshold^2 := by
  letI : Nonempty (TypedWord (P := P) profile) := ⟨representative⟩
  have bounds := blockCenter_bounds profile representative positions pattern
  have result := indicator_frequency_concentration (blockEvent profile positions pattern)
    bounds.1 bounds.2 (by positivity) (by positivity) positive
    (block_single_error profile representative positions pattern)
    (block_joint_error profile representative positions pattern)
  convert result using 1
  ring

/-- Simultaneously control every empirical parent-word frequency by a finite alphabet union bound. -/
theorem all_block_frequencies_concentration (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positions : Parent × Slot ↪ P) {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {word : TypedWord (P := P) profile // ∃ pattern : Slot → B, threshold ≤
        |(∑ parent, indicator (blockEvent profile positions pattern parent) word) / Fintype.card Parent -
          blockCenter (P := P) profile pattern|} : ℝ) / Fintype.card (TypedWord (P := P) profile) ≤
      (Fintype.card B : ℝ) ^ Fintype.card Slot *
        ((1/(Fintype.card Parent : ℝ) + 6*(Fintype.card Slot : ℝ)^2 / Fintype.card P) / threshold^2) := by
  let bad : (Slot → B) → TypedWord (P := P) profile → Prop := fun pattern word => threshold ≤
    |(∑ parent, indicator (blockEvent profile positions pattern parent) word) / Fintype.card Parent -
      blockCenter (P := P) profile pattern|
  have count_bound := Selection.union_count bad
  have divided := div_le_div_of_nonneg_right (show (Nat.card {word // ∃ pattern, bad pattern word} : ℝ) ≤
      ∑ pattern, (Nat.card {word // bad pattern word} : ℝ) by exact_mod_cast count_bound)
    (Nat.cast_nonneg (Fintype.card (TypedWord (P := P) profile)))
  rw [Finset.sum_div] at divided
  have individual := Finset.sum_le_sum (s := Finset.univ)
    (fun pattern _ => block_frequency_concentration profile representative positions pattern positive)
  exact divided.trans (by simpa only [Finset.sum_const, Finset.card_univ,
    Fintype.card_fun, nsmul_eq_mul, Nat.cast_pow] using individual)

end
end MatrixBounds.Empirical
