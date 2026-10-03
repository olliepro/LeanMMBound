module

public import CWAsymptoticDegrees

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent position types multiply their actual finite degrees. Their
exponents therefore sum on each axis before any comparison between axes. -/
namespace MatrixBounds.Selection

open scoped BigOperators

/-- Products of normalized finite count bounds have the sum of their exponential costs. -/
theorem normalized_product_exponential {T : Type*} [Fintype T]
    (degrees edges : T → ℕ) (exponent : T → ℝ)
    (pointwise : ∀ type, (degrees type : ℝ)/edges type ≤ Real.exp (exponent type)) :
    ((∏ type, degrees type : ℕ) : ℝ)/(∏ type, edges type : ℕ) ≤ Real.exp (∑ type, exponent type) := by
  push_cast
  rw [← Finset.prod_div_distrib, Real.exp_sum]
  exact Finset.prod_le_prod₀ (fun _ _ => div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _))
    (fun type _ => pointwise type)

/-- A lower target retention rate gives the corresponding upper normalized degree rate. -/
theorem normalized_product_retention {T : Type*} [Fintype T]
    (degrees edges : T → ℕ) (retention : T → ℝ) {rate : ℝ}
    (pointwise : ∀ type, (degrees type : ℝ)/edges type ≤ Real.exp (-retention type))
    (lower : rate ≤ ∑ type, retention type) :
    ((∏ type, degrees type : ℕ) : ℝ)/(∏ type, edges type : ℕ) ≤ Real.exp (-rate) := by
  apply (normalized_product_exponential degrees edges (fun type => -retention type) pointwise).trans
  apply Real.exp_le_exp.mpr
  rw [Finset.sum_neg_distrib]
  linarith

end MatrixBounds.Selection
