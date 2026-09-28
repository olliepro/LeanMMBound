import CWPermutedTerminalAsymptotic
import CWTerminalScaling

/-! Common integer repetition preserves every terminal law and scales the
actual shared terminal extraction rate exactly, before numerical bounds. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Numeric Entropy
open scoped BigOperators
noncomputable section

/-- Repetition preserves the complete terminal entropy on every physical axis. -/
theorem axisEntropy_scale (extreme middle repetitions : ℕ) (positive : 0 < repetitions) (axis : Fin 3) :
    axisEntropy (repetitions*extreme) (repetitions*middle) axis = axisEntropy extreme middle axis := by
  simp only [axisEntropy, parameter_scale extreme middle repetitions positive]

/-- Each actual permuted terminal retention exponent scales linearly under common repetition. -/
theorem permutedRate_scale (axes : Equiv.Perm (Fin 3)) (error : ℝ) (extreme middle repetitions : ℕ)
    (positive : 0 < repetitions) (axis : Fin 3) :
    permutedRate axes error (repetitions*extreme) (repetitions*middle) axis =
      permutedRate axes error extreme middle axis*repetitions := by
  simp only [permutedRate, axisEntropy_scale extreme middle repetitions positive, Nat.cast_mul]
  ring

/-- Shared terminal extraction retains the exact common scale after summing all labels and choosing the limiting axis. -/
theorem permutedRetention_scale {T : Type*} [Fintype T] (axes : T → Equiv.Perm (Fin 3))
    (error : ℝ) (extreme middle : T → ℕ) (repetitions : ℕ) (positive : 0 < repetitions) :
    permutedRetention axes error (fun type => repetitions*extreme type) (fun type => repetitions*middle type) =
      permutedRetention axes error extreme middle*repetitions := by
  unfold permutedRetention
  simp_rw [permutedRate_scale _ _ _ _ repetitions positive]
  simp only [Mixed.mixedRetention, ← Finset.sum_mul,
    min_mul_of_nonneg _ _ (Nat.cast_nonneg repetitions : (0 : ℝ) ≤ _)]

end
end MatrixBounds.Tensor.CW.Terminal
