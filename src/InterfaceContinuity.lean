import EntropyBounds
import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog
import Mathlib.Analysis.Normed.Group.Constructions
import Mathlib.Topology.UniformSpace.HeineCantor

/-! Uniform entropy control and stable independent-concatenation distributions
for passing from exact empirical types to approximate interfaces. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A : Type*} [Fintype A]

/-- Finite entropy is continuous, including distributions with zero entries. -/
theorem continuous_entropy : Continuous (entropy (A := A)) := by
  apply Continuous.neg
  exact continuous_finset_sum Finset.univ (fun a _ =>
    Real.continuous_mul_log.comp (continuous_apply a))

/-- One tolerance controls entropy differences uniformly throughout the finite probability cube. -/
theorem entropy_uniform_tolerance {error : ℝ} (error_positive : 0 < error) :
    ∃ tolerance > 0, ∀ p q : A → ℝ,
      (∀ a, 0 ≤ p a ∧ p a ≤ 1) → (∀ a, 0 ≤ q a ∧ q a ≤ 1) →
      (∀ a, |p a-q a| < tolerance) → |entropy p-entropy q| < error := by
  have uniform := (isCompact_Icc (a := (fun _ : A => (0 : ℝ))) (b := fun _ => 1)).uniformContinuousOn_of_continuous
    continuous_entropy.continuousOn
  obtain ⟨tolerance, positive, control⟩ := Metric.uniformContinuousOn_iff.mp uniform error error_positive
  refine ⟨tolerance, positive, ?_⟩
  intro p q hp hq close
  have p_mem : p ∈ Set.Icc (fun _ : A => (0 : ℝ)) (fun _ => 1) :=
    ⟨fun a => (hp a).1, fun a => (hp a).2⟩
  have q_mem : q ∈ Set.Icc (fun _ : A => (0 : ℝ)) (fun _ => 1) :=
    ⟨fun a => (hq a).1, fun a => (hq a).2⟩
  have distance : dist p q < tolerance := (dist_pi_lt_iff positive).mpr
    (fun a => by simpa only [Real.dist_eq] using close a)
  simpa only [Real.dist_eq] using control p p_mem q q_mem distance

omit [Fintype A] in
/-- Perturbing both probability factors by at most δ perturbs their product by at most 2δ. -/
theorem probability_product_error {a b c d tolerance : ℝ}
    (b_nonneg : 0 ≤ b) (b_bound : b ≤ 1) (c_nonneg : 0 ≤ c) (c_bound : c ≤ 1)
    (tolerance_nonneg : 0 ≤ tolerance) (left_close : |a-c| ≤ tolerance) (right_close : |b-d| ≤ tolerance) :
    |a*b-c*d| ≤ 2*tolerance := by
  have identity : a*b-c*d = (a-c)*b+c*(b-d) := by ring
  rw [identity]
  calc
    _ ≤ |(a-c)*b|+|c*(b-d)| := abs_add_le _ _
    _ = |a-c| * b + c * |b-d| := by rw [abs_mul, abs_mul, abs_of_nonneg b_nonneg, abs_of_nonneg c_nonneg]
    _ ≤ tolerance*1+1*tolerance := add_le_add
      (mul_le_mul left_close b_bound b_nonneg tolerance_nonneg)
      (mul_le_mul c_bound right_close (abs_nonneg _) (by norm_num))
    _ = _ := by ring

/-- A normalized mixture of independent concatenations has the same 2δ coordinate error bound. -/
theorem mixture_product_error (weight left right left' right' : A → ℝ) {tolerance : ℝ}
    (weight_nonneg : ∀ a, 0 ≤ weight a) (weight_total : ∑ a, weight a = 1)
    (right_range : ∀ a, 0 ≤ right a ∧ right a ≤ 1)
    (left'_range : ∀ a, 0 ≤ left' a ∧ left' a ≤ 1) (tolerance_nonneg : 0 ≤ tolerance)
    (left_close : ∀ a, |left a-left' a| ≤ tolerance)
    (right_close : ∀ a, |right a-right' a| ≤ tolerance) :
    |(∑ a, weight a*(left a*right a)) - ∑ a, weight a*(left' a*right' a)| ≤ 2*tolerance := by
  rw [← Finset.sum_sub_distrib]
  have identity : (∑ a, (weight a*(left a*right a)-weight a*(left' a*right' a))) =
      ∑ a, weight a*(left a*right a-left' a*right' a) := by
    apply Finset.sum_congr rfl
    intro a _
    ring
  rw [identity]
  calc
    _ ≤ ∑ a, |weight a*(left a*right a-left' a*right' a)| := Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ a, weight a*(2*tolerance) := by
      apply Finset.sum_le_sum
      intro a _
      rw [abs_mul, abs_of_nonneg (weight_nonneg a)]
      exact mul_le_mul_of_nonneg_left (probability_product_error (right_range a).1 (right_range a).2
        (left'_range a).1 (left'_range a).2 tolerance_nonneg (left_close a) (right_close a)) (weight_nonneg a)
    _ = _ := by rw [← Finset.sum_mul, weight_total, one_mul]

end
end MatrixBounds.Entropy
