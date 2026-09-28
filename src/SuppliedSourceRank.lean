import SuppliedSourceCertificate
import SuppliedSourcePipeline
import ProfileCountRates
import ContextRank

/-! Exact original source rank and the one polynomial coefficient-extraction
cost are bounded before any final matrix relabeling. -/
namespace MatrixBounds.Numeric.SuppliedSourceRank

open Tensor Tensor.CW Interface SuppliedPopulationWeights
noncomputable section

/-- Exponential rank growth of all six original CW sources in every batch. -/
def rate (batches : ℕ) : ℝ := 48*(batches : ℝ)*rootWeight*Real.log 7

/-- Exact rank of the original polynomial certificate, before coefficient extraction. -/
def budget (batches size : ℕ) : ℕ := ((7^(8*(rootWeight*size)))^6)^batches

/-- Exact degree of the original polynomial certificate for all supplied batches. -/
def degree (batches size : ℕ) : ℕ := batches*(6*(24*(rootWeight*size)))

/-- The original source budget has exactly its asserted exponential growth. -/
theorem budget_eq (batches size : ℕ) :
    (budget batches size : ℝ) = Real.exp (rate batches*size) := by
  unfold budget rate
  push_cast
  rw [← Real.exp_log (by norm_num : (0 : ℝ) < 7), ← Real.exp_nat_mul,
    ← Real.exp_nat_mul, ← Real.exp_nat_mul]
  rw [Real.log_exp]
  congr 1
  push_cast
  ring

/-- The single coefficient-extraction factor contributes arbitrarily small exponential overhead. -/
theorem degree_cost_eventually (batches : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (((degree batches size+1)^2 : ℕ) : ℝ) ≤ Real.exp (error*size) := by
  obtain ⟨threshold, bound⟩ := Selection.polynomial_cost_eventually 2 (batches*6*24*rootWeight) positive
  refine ⟨threshold, ?_⟩
  intro size above
  have equal : degree batches size = batches*6*24*rootWeight*size := by unfold degree; ring
  simpa only [equal, Nat.cast_pow] using bound size above

/-- Rank overhead and the source polynomial factor add their exponential allowances. -/
theorem eventual_budget (batches : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → ∀ cost : ℕ,
      (cost : ℝ) ≤ Real.exp ((error/2)*size) →
      ((cost*(budget batches size*(degree batches size+1)^2) : ℕ) : ℝ) ≤
        Real.exp ((rate batches+error)*size) := by
  obtain ⟨threshold, polynomial⟩ := degree_cost_eventually batches (half_pos positive)
  refine ⟨threshold, ?_⟩
  intro size above cost overhead
  have first := mul_le_mul_of_nonneg_left (polynomial size above)
    (Nat.cast_nonneg (budget batches size) : (0 : ℝ) ≤ budget batches size)
  have combined := mul_le_mul overhead first (by positivity) (Real.exp_pos _).le
  rw [budget_eq, ← Real.exp_add, ← Real.exp_add] at combined
  simp only [Nat.cast_mul, Nat.cast_pow] at combined ⊢
  rw [budget_eq]
  convert combined using 1
  congr 1
  ring

end
end MatrixBounds.Numeric.SuppliedSourceRank
