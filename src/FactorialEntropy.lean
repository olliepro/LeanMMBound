module

public import EntropyBounds
public import Mathlib.Data.Nat.Factorial.Basic
public import Mathlib.Data.Nat.Choose.Multinomial
public import Mathlib.Tactic.NormNum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Elementary logarithmic factorial estimates, sufficient for multinomial
entropy asymptotics with an explicit logarithmic error. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section

/-- Lower logarithmic factorial estimate, proved by induction without asymptotic notation. -/
theorem log_factorial_lower (n : ℕ) :
    (n : ℝ) * Real.log n - n ≤ Real.log (n.factorial : ℝ) := by
  induction n with
  | zero => simp
  | succ n ih =>
    by_cases zero : n = 0
    · subst n; norm_num
    · have hn : (0 : ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero zero
      have ratio := mul_le_mul_of_nonneg_left
        (Real.log_le_sub_one_of_pos (div_pos (by positivity : (0 : ℝ) < n+1) hn)) hn.le
      rw [Real.log_div (by positivity) hn.ne'] at ratio
      have cancel : (n : ℝ) * (((n : ℝ)+1)/n-1) = 1 := by field_simp; ring
      rw [cancel] at ratio
      rw [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one,
        Real.log_mul (by positivity) (by positivity)]
      nlinarith

/-- Upper logarithmic factorial estimate for positive n. -/
theorem log_factorial_upper_pos (n : ℕ) (positive : 0 < n) :
    Real.log (n.factorial : ℝ) ≤ (n : ℝ) * Real.log n - n + Real.log n + 1 := by
  induction n with
  | zero => omega
  | succ n ih =>
    by_cases zero : n = 0
    · subst n; norm_num
    · have hn : (0 : ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero zero
      have induction_bound := ih (Nat.pos_of_ne_zero zero)
      have ratio := mul_le_mul_of_nonneg_left
        (Real.log_le_sub_one_of_pos (div_pos hn (by positivity : (0 : ℝ) < n+1)))
        (by positivity : (0 : ℝ) ≤ n+1)
      rw [Real.log_div hn.ne' (by positivity)] at ratio
      have cancel : ((n : ℝ)+1) * ((n : ℝ)/(n+1)-1) = -1 := by field_simp; ring
      rw [cancel] at ratio
      rw [Nat.factorial_succ, Nat.cast_mul, Nat.cast_add, Nat.cast_one,
        Real.log_mul (by positivity) (by positivity)]
      nlinarith

/-- A uniform upper estimate including zero counts, with explicit log(n+1)+1 error. -/
theorem log_factorial_upper (n : ℕ) :
    Real.log (n.factorial : ℝ) ≤ (n : ℝ) * Real.log n - n + Real.log (n+1) + 1 := by
  by_cases zero : n = 0
  · subst n; norm_num
  · have hn : (0 : ℝ) < n := by exact_mod_cast Nat.pos_of_ne_zero zero
    have monotone_log := Real.log_le_log hn (show (n : ℝ) ≤ n+1 by linarith)
    linarith [log_factorial_upper_pos n (Nat.pos_of_ne_zero zero)]

variable {A : Type*} [Fintype A]

/-- Entropy multiplied by the sample size, expressed directly in integer symbol counts. -/
def countEntropy (counts : A → ℕ) : ℝ :=
  ((∑ a, counts a : ℕ) : ℝ) * Real.log (∑ a, counts a : ℕ) -
    ∑ a, (counts a : ℝ) * Real.log (counts a)

/-- The logarithm of a multinomial coefficient is the difference of logarithmic factorial sums. -/
theorem log_multinomial (counts : A → ℕ) :
    Real.log (Nat.multinomial Finset.univ counts : ℝ) =
      Real.log ((∑ a, counts a).factorial : ℝ) - ∑ a, Real.log ((counts a).factorial : ℝ) := by
  have identity := congrArg (fun n : ℕ => Real.log (n : ℝ))
    (Nat.multinomial_spec Finset.univ counts)
  push_cast at identity
  rw [Real.log_mul (by positivity) (by exact_mod_cast (Nat.multinomial_pos (s := Finset.univ)
    (f := counts)).ne'), Real.log_prod (fun a _ => by positivity)] at identity
  linarith

/-- Multinomial logarithms differ from sample-size times entropy by explicit logarithmic errors. -/
theorem multinomial_entropy_bounds (counts : A → ℕ) :
    countEntropy counts - Fintype.card A * (Real.log ((∑ a, counts a : ℕ)+1) + 1) ≤
      Real.log (Nat.multinomial Finset.univ counts : ℝ) ∧
    Real.log (Nat.multinomial Finset.univ counts : ℝ) ≤
      countEntropy counts + Real.log ((∑ a, counts a : ℕ)+1) + 1 := by
  have lower_total := log_factorial_lower (∑ a, counts a)
  have upper_total := log_factorial_upper (∑ a, counts a)
  have lower_sum := Finset.sum_le_sum (s := Finset.univ) (fun a _ => log_factorial_lower (counts a))
  have upper_each (a : A) : Real.log ((counts a).factorial : ℝ) ≤
      (counts a : ℝ) * Real.log (counts a) - counts a +
        Real.log ((∑ b, counts b : ℕ)+1) + 1 := by
    have le_total : counts a ≤ ∑ b, counts b := Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ a)
    have le_real : (counts a : ℝ)+1 ≤ (∑ b, counts b : ℕ)+1 := by exact_mod_cast Nat.add_le_add_right le_total 1
    have log_le := Real.log_le_log (by positivity : (0 : ℝ) < (counts a : ℝ)+1) le_real
    linarith [log_factorial_upper (counts a)]
  have upper_sum := Finset.sum_le_sum (s := Finset.univ) (fun a _ => upper_each a)
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_const,
    Finset.card_univ, nsmul_eq_mul] at lower_sum upper_sum
  rw [log_multinomial]
  unfold countEntropy
  push_cast at *
  constructor <;> nlinarith

/-- Integer count entropy agrees with ordinary entropy of normalized empirical frequencies. -/
theorem countEntropy_eq (counts : A → ℕ) (positive : 0 < ∑ a, counts a) :
    countEntropy counts = ((∑ a, counts a : ℕ) : ℝ) *
      entropy (fun a => (counts a : ℝ) / (∑ b, counts b : ℕ)) := by
  have total_positive : (0 : ℝ) < (∑ a, counts a : ℕ) := by exact_mod_cast positive
  have term (a : A) : ((∑ b, counts b : ℕ) : ℝ) *
      ((counts a : ℝ) / (∑ b, counts b : ℕ) * Real.log ((counts a : ℝ) / (∑ b, counts b : ℕ))) =
      (counts a : ℝ) * Real.log (counts a) - (counts a : ℝ) * Real.log (∑ b, counts b : ℕ) := by
    by_cases zero : counts a = 0
    · simp [zero]
    · rw [Real.log_div (by exact_mod_cast zero) total_positive.ne']
      field_simp
  unfold entropy countEntropy
  rw [mul_neg, Finset.mul_sum]
  simp_rw [term]
  rw [Finset.sum_sub_distrib, ← Finset.sum_mul]
  push_cast
  ring

end
end MatrixBounds.Entropy
