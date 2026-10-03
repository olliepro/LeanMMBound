module

public import TypeSampling

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit finite-population errors and second-moment concentration estimates. -/
namespace MatrixBounds.Sampling

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Sampling without replacement differs from the product frequency by at most 1/(n-1).
The correction d may be any value between zero and n, including the equal-symbol count. -/
theorem without_replacement_bias {n a b d : ℝ} (large : 1 < n)
    (a_nonneg : 0 ≤ a) (a_bound : a ≤ n) (b_nonneg : 0 ≤ b) (b_bound : b ≤ n)
    (d_nonneg : 0 ≤ d) (d_bound : d ≤ n) :
    |(a*b-d)/(n*(n-1)) - (a/n)*(b/n)| ≤ 1/(n-1) := by
  have positive : 0 < n := by linarith
  have remaining : 0 < n-1 := by linarith
  have product_bound : a*b ≤ n^2 := by nlinarith [mul_le_mul a_bound b_bound b_nonneg positive.le]
  have correction_bound : n*d ≤ n^2 := by nlinarith
  have difference_bound : |a*b-n*d| ≤ n^2 := by
    rw [abs_le]
    constructor <;> nlinarith [mul_nonneg a_nonneg b_nonneg, mul_nonneg positive.le d_nonneg]
  have identity : (a*b-d)/(n*(n-1)) - (a/n)*(b/n) = (a*b-n*d)/(n^2*(n-1)) := by
    field_simp [positive.ne', remaining.ne']
    ring
  rw [identity, abs_div, abs_of_pos (mul_pos (sq_pos_of_pos positive) remaining)]
  calc
    _ ≤ n^2/(n^2*(n-1)) := div_le_div_of_nonneg_right difference_bound (by positivity)
    _ = _ := by field_simp [positive.ne', remaining.ne']

/-- The exact empirical-type pair law is within 1/(N-1) of independent frequencies. -/
theorem type_pair_bias {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P]
    (profile : B → ℕ) [Nonempty (Empirical.TypedWord (P := P) profile)]
    (a b : B) (p q : P) (distinct : p ≠ q) :
    |(Nat.card {word : Empirical.TypedWord (P := P) profile // word.val p = a ∧ word.val q = b} : ℝ) /
        Fintype.card (Empirical.TypedWord (P := P) profile) -
      ((profile a : ℝ) / Fintype.card P) * ((profile b : ℝ) / Fintype.card P)| ≤
        1 / ((Fintype.card P : ℝ) - 1) := by
  let word : Empirical.TypedWord (P := P) profile := Classical.choice inferInstance
  have bound (symbol : B) : (profile symbol : ℝ) ≤ Fintype.card P := by
    have natural : Empirical.count word.val symbol ≤ Fintype.card P := by
      simpa only [Empirical.count, Nat.card_eq_fintype_card] using
        Fintype.card_subtype_le (fun p => word.val p = symbol)
    rw [word.property symbol] at natural
    exact_mod_cast natural
  rw [Empirical.type_pair_probability profile a b p q distinct]
  apply without_replacement_bias
  · exact_mod_cast Fintype.one_lt_card_iff.mpr ⟨p, q, distinct⟩
  · positivity
  · exact bound a
  · positivity
  · exact bound b
  · split_ifs <;> positivity
  · split_ifs
    · exact bound a
    · positivity

/-- A finite average is the sum divided by the sample-space cardinality. -/
def average {Outcome : Type*} [Fintype Outcome] (value : Outcome → ℝ) : ℝ :=
  (∑ outcome, value outcome) / Fintype.card Outcome

/-- Finite averaging is linear over a finite indexed sum. -/
theorem average_sum {Outcome Index : Type*} [Fintype Outcome] [Fintype Index]
    (value : Index → Outcome → ℝ) :
    average (fun outcome => ∑ i, value i outcome) = ∑ i, average (value i) := by
  unfold average
  rw [Finset.sum_comm, Finset.sum_div]

/-- Pointwise inequalities remain inequalities after finite averaging. -/
theorem average_mono {Outcome : Type*} [Fintype Outcome] {left right : Outcome → ℝ}
    (bound : ∀ outcome, left outcome ≤ right outcome) : average left ≤ average right :=
  div_le_div_of_nonneg_right (Finset.sum_le_sum (fun outcome _ => bound outcome)) (Nat.cast_nonneg _)

/-- Expand the mean square of a sum into its finite matrix of second moments. -/
theorem second_moment_sum {Outcome Index : Type*} [Fintype Outcome] [Fintype Index]
    (value : Index → Outcome → ℝ) :
    average (fun outcome => (∑ i, value i outcome)^2) =
      ∑ i, ∑ j, average (fun outcome => value i outcome * value j outcome) := by
  simp only [pow_two, Finset.sum_mul, Finset.mul_sum, average_sum]
  rw [Finset.sum_comm]

/-- Diagonal and off-diagonal second-moment bounds control the complete sum.
The off-diagonal estimate is one-sided, and no independence hypothesis is needed. -/
theorem second_moment_bound {Outcome Index : Type*} [Fintype Outcome] [Fintype Index]
    (value : Index → Outcome → ℝ) (diagonal covariance : ℝ) (covariance_nonneg : 0 ≤ covariance)
    (diagonal_bound : ∀ i, average (fun outcome => (value i outcome)^2) ≤ diagonal)
    (off_diagonal_bound : ∀ i j, i ≠ j →
      average (fun outcome => value i outcome * value j outcome) ≤ covariance) :
    average (fun outcome => (∑ i, value i outcome)^2) ≤
      (Fintype.card Index : ℝ) * diagonal + (Fintype.card Index : ℝ)^2 * covariance := by
  classical
  rw [second_moment_sum]
  calc
    _ ≤ ∑ i : Index, ∑ j : Index, ((if i = j then diagonal else 0) + covariance) := by
      apply Finset.sum_le_sum
      intro i _
      apply Finset.sum_le_sum
      intro j _
      by_cases same : i = j
      · subst j
        simp only [← pow_two]
        exact (diagonal_bound i).trans (le_add_of_nonneg_right covariance_nonneg)
      · simpa only [if_neg same, zero_add] using off_diagonal_bound i j same
    _ = _ := by
      simp only [Finset.sum_add_distrib, Finset.sum_ite_eq, Finset.mem_univ, if_true,
        Finset.sum_const, Finset.card_univ]
      ring

/-- Squared-error Markov inequality over a finite sample space. -/
theorem squared_error_count {Outcome : Type*} [Fintype Outcome]
    (value : Outcome → ℝ) (center threshold : ℝ) (threshold_nonneg : 0 ≤ threshold) :
    (Nat.card {outcome // threshold ≤ |value outcome - center|} : ℝ) * threshold^2 ≤
      ∑ outcome, (value outcome - center)^2 := by
  classical
  have bound (outcome : Outcome) :
      (if threshold ≤ |value outcome - center| then (1 : ℝ) else 0) * threshold^2 ≤
        (value outcome - center)^2 := by
    split_ifs with large
    · simp only [one_mul]
      nlinarith [sq_abs (value outcome - center)]
    · simp only [zero_mul]
      positivity
  have summed := Finset.sum_le_sum (s := Finset.univ) (fun outcome _ => bound outcome)
  simpa only [← Finset.sum_mul, Finset.sum_boole,
    Nat.card_eq_fintype_card, Fintype.card_subtype] using summed

/-- A second-moment bound gives an explicit bound on the fraction of deviating samples. -/
theorem squared_error_probability {Outcome : Type*} [Fintype Outcome] [Nonempty Outcome]
    (value : Outcome → ℝ) (center threshold error : ℝ) (threshold_positive : 0 < threshold)
    (moment : average (fun outcome => (value outcome - center)^2) ≤ error) :
    (Nat.card {outcome // threshold ≤ |value outcome - center|} : ℝ) / Fintype.card Outcome ≤
      error / threshold^2 := by
  have count_positive : (0 : ℝ) < Fintype.card Outcome := by exact_mod_cast Fintype.card_pos
  have bound := squared_error_count value center threshold threshold_positive.le
  have summed : (∑ outcome, (value outcome-center)^2) ≤ error * Fintype.card Outcome :=
    (div_le_iff₀ count_positive).mp moment
  apply (div_le_div_iff₀ count_positive (sq_pos_of_pos threshold_positive)).mpr
  nlinarith

end
end MatrixBounds.Sampling
