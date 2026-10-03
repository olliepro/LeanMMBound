module

public import ContextSequence
public import Mathlib.Analysis.SpecialFunctions.Exp

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite products of the actually retained integer copies and overheads
satisfy the sums of their stage exponent bounds. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section

/-- Multiplying integer copy counts adds their proved logarithmic lower bounds. -/
theorem copy_product_lower (copies : ℕ → ℕ) (growth : ℕ → ℝ) (length : ℕ)
    (bounds : ∀ stage, stage < length → Real.exp (growth stage) ≤ copies stage) :
    Real.exp (∑ stage ∈ Finset.range length, growth stage) ≤ (∏ stage ∈ Finset.range length, copies stage : ℕ) := by
  rw [Real.exp_sum, Nat.cast_prod]
  exact Finset.prod_le_prod₀ (fun stage _ => (Real.exp_pos _).le)
    (fun stage inside => bounds stage (Finset.mem_range.mp inside))

/-- Multiplying integer overheads adds their proved logarithmic upper bounds. -/
theorem overhead_product_upper (overhead : ℕ → ℕ) (loss : ℕ → ℝ) (length : ℕ)
    (bounds : ∀ stage, stage < length → (overhead stage : ℝ) ≤ Real.exp (loss stage)) :
    (∏ stage ∈ Finset.range length, overhead stage : ℕ) ≤ Real.exp (∑ stage ∈ Finset.range length, loss stage) := by
  rw [Real.exp_sum, Nat.cast_prod]
  exact Finset.prod_le_prod₀ (fun stage _ => Nat.cast_nonneg _)
    (fun stage inside => bounds stage (Finset.mem_range.mp inside))

/-- A finite sequence of actual extractions has the product copy count, summed exponent rates, and a checked final rank decomposition. -/
theorem context_sequence_rates {K : Type*} [CommSemiring K] {X Y Z : ℕ → Type*}
    (tensors : ∀ stage, Coeff K (X stage) (Y stage) (Z stage)) (copies overhead : ℕ → ℕ)
    (growth loss : ℕ → ℝ) (length : ℕ)
    (stages : ∀ stage, stage < length → ContextReduction.{v} (tensors stage)
      (directSum (fun _ : Fin (copies stage) => tensors (stage+1))) (overhead stage))
    (copyBounds : ∀ stage, stage < length → Real.exp (growth stage) ≤ copies stage)
    (costBounds : ∀ stage, stage < length → (overhead stage : ℝ) ≤ Real.exp (loss stage))
    (rank degree : ℕ) (certificate : Degeneration.Certificate (tensors 0) rank degree) :
    ∃ finalCopies budget : ℕ,
      Real.exp (∑ stage ∈ Finset.range length, growth stage) ≤ finalCopies ∧
      (budget : ℝ) ≤ Real.exp (∑ stage ∈ Finset.range length, loss stage)*(rank*(degree+1)^2) ∧
      RankLE (directSum (fun _ : Fin finalCopies => tensors length)) budget := by
  refine ⟨∏ stage ∈ Finset.range length, copies stage,
    (∏ stage ∈ Finset.range length, overhead stage)*(rank*(degree+1)^2),
    copy_product_lower copies growth length copyBounds, ?_,
    context_sequence_rank tensors copies overhead length stages rank degree certificate⟩
  have bound := mul_le_mul_of_nonneg_right (overhead_product_upper overhead loss length costBounds)
    (show (0 : ℝ) ≤ (rank : ℝ)*(degree+1)^2 by positivity)
  simpa only [Nat.cast_mul, Nat.cast_pow, Nat.cast_add, Nat.cast_one] using bound

end
end MatrixBounds.Tensor
