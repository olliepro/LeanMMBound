import TypeEntropy
import FiniteSelection

/-! Positive Gibbs weights bound actual word counts directly. This avoids
assuming an optimizer or maximizing over unenumerated empirical profiles. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P A : Type*} [Fintype P] [Fintype A]

/-- Sum a statistic over positions by first counting its symbol fibers. -/
theorem sum_by_counts (word : P → A) (value : A → ℝ) :
    (∑ position, value (word position)) = ∑ symbol, (count word symbol : ℝ)*value symbol := by
  have counts (symbol : A) : (count word symbol : ℝ) =
      ∑ position, if word position = symbol then 1 else 0 := by
    simp only [count, Nat.card_eq_fintype_card, Finset.sum_boole, Fintype.card_subtype]
  simp only [counts, Finset.sum_mul, ite_mul, one_mul, zero_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro position _
  simp

/-- Summing product weights over all words gives the partition function raised to the word length. -/
theorem all_word_weights (weight : A → ℝ) :
    (∑ word : P → A, ∏ position, weight (word position)) = (∑ symbol, weight symbol)^Fintype.card P := by
  rw [← Fintype.prod_sum]
  simp

/-- A set of words with a fixed total log weight has a rigorous exponential cardinality bound. -/
theorem gibbs_word_count [Nonempty A] (accepted : (P → A) → Prop) (weight : A → ℝ)
    (positive : ∀ symbol, 0 < weight symbol) (logWeight : ℝ)
    (fixed : ∀ word, accepted word → ∑ position, Real.log (weight (word position)) = logWeight) :
    (Nat.card {word : P → A // accepted word} : ℝ) ≤
      Real.exp ((Fintype.card P : ℝ)*Real.log (∑ symbol, weight symbol)-logWeight) := by
  have total_positive : 0 < ∑ symbol, weight symbol :=
    Finset.sum_pos (fun symbol _ => positive symbol) Finset.univ_nonempty
  have per_word (word : P → A) :
      (if accepted word then (1 : ℝ) else 0)*Real.exp logWeight ≤ ∏ position, weight (word position) := by
    by_cases keep : accepted word
    · rw [if_pos keep, one_mul, ← fixed word keep, Real.exp_sum]
      simp only [Real.exp_log (positive _), le_refl]
    · rw [if_neg keep, zero_mul]
      exact Finset.prod_nonneg (fun position _ => (positive (word position)).le)
  have summed := Finset.sum_le_sum (s := Finset.univ) (fun word _ => per_word word)
  rw [← Finset.sum_mul, all_word_weights] at summed
  simp only [Finset.sum_boole, Nat.card_eq_fintype_card, Fintype.card_subtype] at summed ⊢
  calc
    _ ≤ (∑ symbol, weight symbol)^Fintype.card P / Real.exp logWeight :=
      (le_div_iff₀ (Real.exp_pos logWeight)).mpr summed
    _ = _ := by rw [Real.exp_sub, Real.exp_nat_mul, Real.exp_log total_positive]

/-- Exact empirical profiles make the log weight a fixed count-weighted expectation. -/
theorem typed_word_log_weight (profile : A → ℕ) (weight : A → ℝ)
    (word : TypedWord (P := P) profile) :
    (∑ position, Real.log (weight (word.val position))) = ∑ symbol, (profile symbol : ℝ)*Real.log (weight symbol) := by
  rw [sum_by_counts word.val (fun symbol => Real.log (weight symbol))]
  have counts (symbol : A) : count word.val symbol = profile symbol := word.property symbol
  simp only [counts]

/-- Actual exact-type word counts satisfy every supplied positive Gibbs bound. -/
theorem typed_word_gibbs_count [Nonempty A] (profile : A → ℕ) (weight : A → ℝ)
    (positive : ∀ symbol, 0 < weight symbol) :
    (Nat.card (TypedWord (P := P) profile) : ℝ) ≤
      Real.exp ((Fintype.card P : ℝ)*Real.log (∑ symbol, weight symbol) -
        ∑ symbol, (profile symbol : ℝ)*Real.log (weight symbol)) := by
  exact gibbs_word_count (HasType profile) weight positive _
    (fun word typed => typed_word_log_weight profile weight ⟨word, typed⟩)

end
end MatrixBounds.Empirical
