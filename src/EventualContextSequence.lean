module

public import ContextSequenceRates
public import RepairRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite forward selection of shrinking window parameters. Parameters are
chosen before the growing scale, and one threshold serves the entire sequence. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
variable {K : Type} [CommSemiring K]

/-- A parameterized finite sequence of actual extractions has a single chosen terminal parameter and one common scale threshold.
The retained and overhead exponents add over all selected steps. -/
theorem eventual_parameterized_sequence
    (Param : ℕ → Type*) (X Y Z : ∀ stage, Param stage → ℕ → Type)
    (tensors : ∀ stage parameter size, Coeff K (X stage parameter size) (Y stage parameter size) (Z stage parameter size))
    (admissible : ℕ → Prop) (growth loss : ℕ → ℝ) (initial : Param 0) (length : ℕ)
    (step : ∀ stage, stage < length → ∀ parameter : Param stage,
      ∃ next : Param (stage+1), ∃ threshold : ℕ,
        ∀ k, threshold ≤ k → admissible k → ∃ copies cost : ℕ,
          Real.exp (growth stage*RepairRates.scale k) ≤ copies ∧
          (cost : ℝ) ≤ Real.exp (loss stage*RepairRates.scale k) ∧
          ContextReduction.{v} (tensors stage parameter (RepairRates.scale k))
            (directSum (fun _ : Fin copies => tensors (stage+1) next (RepairRates.scale k))) cost) :
    ∃ terminal : Param length, ∃ threshold : ℕ,
      ∀ k, threshold ≤ k → admissible k → ∃ copies cost : ℕ,
        Real.exp ((∑ stage ∈ Finset.range length, growth stage)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp ((∑ stage ∈ Finset.range length, loss stage)*RepairRates.scale k) ∧
        ContextReduction.{v} (tensors 0 initial (RepairRates.scale k))
          (directSum (fun _ : Fin copies => tensors length terminal (RepairRates.scale k))) cost := by
  induction length with
  | zero =>
    refine ⟨initial, 0, ?_⟩
    intro k _ _
    refine ⟨1, 1, ?_, ?_, contextReduction_singleton _⟩ <;> simp
  | succ length induction =>
    obtain ⟨middle, firstThreshold, earlier⟩ := induction (fun stage inside => step stage (Nat.lt_succ_of_lt inside))
    obtain ⟨terminal, lastThreshold, later⟩ := step length (Nat.lt_succ_self length) middle
    refine ⟨terminal, max firstThreshold lastThreshold, ?_⟩
    intro k large allowed
    obtain ⟨firstCopies, firstCost, firstRetained, firstOverhead, firstReduction⟩ :=
      earlier k (le_trans (le_max_left _ _) large) allowed
    obtain ⟨lastCopies, lastCost, lastRetained, lastOverhead, lastReduction⟩ :=
      later k (le_trans (le_max_right _ _) large) allowed
    refine ⟨firstCopies*lastCopies, firstCost*lastCost, ?_, ?_, firstReduction.compose_fin_extractions lastReduction⟩
    · rw [Finset.sum_range_succ, add_mul, Real.exp_add, Nat.cast_mul]
      exact mul_le_mul firstRetained lastRetained (Real.exp_pos _).le (Nat.cast_nonneg _)
    · rw [Finset.sum_range_succ, add_mul, Real.exp_add, Nat.cast_mul]
      exact mul_le_mul firstOverhead lastOverhead (Nat.cast_nonneg _) (Real.exp_pos _).le

end
end MatrixBounds.Tensor
