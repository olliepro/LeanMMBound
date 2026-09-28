import Mathlib.Analysis.SpecialFunctions.Log.Basic
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring

/-! Finite entropy and a Gibbs upper bound, including zero probability entries.
The bound is used by the certificate to enclose constrained maximum entropy
without trusting a numerical optimizer. Logarithms here are natural logarithms. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A : Type*} [Fintype A]

/-- Shannon entropy in natural-log units, with 0*log 0 interpreted as zero. -/
def entropy (probability : A → ℝ) : ℝ := -∑ a, probability a * Real.log (probability a)

/-- The elementary Gibbs inequality for one probability mass, including mass zero. -/
theorem entropy_term_le (p q : ℝ) (nonnegative : 0 ≤ p) (positive : 0 < q) :
    -(p * Real.log p) ≤ -(p * Real.log q) + q - p := by
  by_cases zero : p = 0
  · simp [zero, positive.le]
  · have p_positive : 0 < p := lt_of_le_of_ne nonnegative (Ne.symm zero)
    have bound := mul_le_mul_of_nonneg_left
      (Real.log_le_sub_one_of_pos (div_pos positive p_positive)) nonnegative
    rw [Real.log_div positive.ne' p_positive.ne'] at bound
    have cancellation : p * (q/p-1) = q-p := by field_simp
    rw [cancellation] at bound
    nlinarith

/-- Cross entropy bounds entropy for normalized finite distributions. -/
theorem entropy_le_cross_entropy (p q : A → ℝ)
    (p_nonnegative : ∀ a, 0 ≤ p a) (q_positive : ∀ a, 0 < q a)
    (p_total : ∑ a, p a = 1) (q_total : ∑ a, q a = 1) :
    entropy p ≤ -∑ a, p a * Real.log (q a) := by
  have bound := Finset.sum_le_sum (s := Finset.univ)
    (fun a _ => entropy_term_le (p a) (q a) (p_nonnegative a) (q_positive a))
  simpa only [Finset.sum_add_distrib, Finset.sum_sub_distrib, Finset.sum_neg_distrib,
    p_total, q_total, entropy, add_sub_cancel_right] using bound

/-- Gibbs potentials provide an upper bound on entropy without solving an optimization problem. -/
theorem gibbs_upper_bound [Nonempty A] (p weight : A → ℝ)
    (p_nonnegative : ∀ a, 0 ≤ p a) (weight_positive : ∀ a, 0 < weight a)
    (p_total : ∑ a, p a = 1) :
    entropy p ≤ Real.log (∑ a, weight a) - ∑ a, p a * Real.log (weight a) := by
  let normalizer := ∑ a, weight a
  have normalizer_positive : 0 < normalizer := Finset.sum_pos
    (fun a _ => weight_positive a) Finset.univ_nonempty
  have total : (∑ a, weight a / normalizer) = 1 := by
    rw [← Finset.sum_div]
    exact div_self normalizer_positive.ne'
  have bound := entropy_le_cross_entropy p (fun a => weight a / normalizer)
    p_nonnegative (fun a => div_pos (weight_positive a) normalizer_positive) p_total total
  simp only [Real.log_div (weight_positive _).ne' normalizer_positive.ne', mul_sub,
    Finset.sum_sub_distrib, ← Finset.sum_mul, p_total, one_mul] at bound
  dsimp [normalizer] at bound
  linarith

/-- Marginal mass of a coordinate label in a finite distribution. -/
def marginal {B : Type*} [DecidableEq B] (p : A → ℝ) (index : A → B) (label : B) : ℝ :=
  ∑ a, if index a = label then p a else 0

/-- Expectations of coordinate functions depend only on that coordinate's marginal. -/
theorem expectation_marginal {B : Type*} [Fintype B] [DecidableEq B]
    (p : A → ℝ) (index : A → B) (value : B → ℝ) :
    (∑ a, p a * value (index a)) = ∑ label, marginal p index label * value label := by
  simp only [marginal, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a _
  simp [ite_mul]

/-- Equal marginals imply equal expectations for every function of one coordinate. -/
theorem expectation_eq_of_marginal_eq {B : Type*} [Fintype B] [DecidableEq B]
    (p reference : A → ℝ) (index : A → B) (value : B → ℝ)
    (same : marginal p index = marginal reference index) :
    (∑ a, p a * value (index a)) = ∑ a, reference a * value (index a) := by
  rw [expectation_marginal p index value, expectation_marginal reference index value, same]

/-- Three positive coordinate potentials bound the entropy of every feasible joint distribution.
This proves the maximum-entropy certificate formula used for the source split distributions. -/
theorem constrained_gibbs_bound [Nonempty A] {BX BY BZ : Type*}
    [Fintype BX] [Fintype BY] [Fintype BZ] [DecidableEq BX] [DecidableEq BY] [DecidableEq BZ]
    (p reference : A → ℝ) (ix : A → BX) (iy : A → BY) (iz : A → BZ)
    (ux : BX → ℝ) (uy : BY → ℝ) (uz : BZ → ℝ)
    (p_nonnegative : ∀ a, 0 ≤ p a) (p_total : ∑ a, p a = 1)
    (positiveX : ∀ b, 0 < ux b) (positiveY : ∀ b, 0 < uy b) (positiveZ : ∀ b, 0 < uz b)
    (sameX : marginal p ix = marginal reference ix)
    (sameY : marginal p iy = marginal reference iy)
    (sameZ : marginal p iz = marginal reference iz) :
    entropy p ≤ Real.log (∑ a, ux (ix a) * uy (iy a) * uz (iz a)) -
      ∑ a, reference a * (Real.log (ux (ix a)) + Real.log (uy (iy a)) + Real.log (uz (iz a))) := by
  have bound := gibbs_upper_bound p (fun a => ux (ix a) * uy (iy a) * uz (iz a))
    p_nonnegative (fun a => mul_pos (mul_pos (positiveX _) (positiveY _)) (positiveZ _)) p_total
  have log_product (a : A) : Real.log (ux (ix a) * uy (iy a) * uz (iz a)) =
      Real.log (ux (ix a)) + Real.log (uy (iy a)) + Real.log (uz (iz a)) := by
    rw [Real.log_mul (mul_pos (positiveX _) (positiveY _)).ne' (positiveZ _).ne',
      Real.log_mul (positiveX _).ne' (positiveY _).ne']
  simp only [log_product, mul_add, Finset.sum_add_distrib] at bound ⊢
  rw [expectation_eq_of_marginal_eq p reference ix (fun b => Real.log (ux b)) sameX,
    expectation_eq_of_marginal_eq p reference iy (fun b => Real.log (uy b)) sameY,
    expectation_eq_of_marginal_eq p reference iz (fun b => Real.log (uz b)) sameZ] at bound
  exact bound

end
end MatrixBounds.Entropy
