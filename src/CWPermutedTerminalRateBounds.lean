import CWPermutedTerminalExtraction
import CWTerminalRateBounds

/-! The actual mixed physical terminal retention has uniform loss and lower
bounds, without comparing axes before their global sums have been formed. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy RepairRates
open scoped BigOperators
noncomputable section
variable {T : Type*} [Fintype T]

/-- Every physical terminal entropy entry is nonnegative, including endpoint laws. -/
theorem axisEntropy_nonnegative (extreme middle : ℕ) (positive : 0 < extreme+middle) (axis : Fin 3) :
    0 ≤ axisEntropy extreme middle axis := by
  unfold axisEntropy
  split_ifs
  · exact terminal_entropy_nonnegative extreme middle positive
  · exact Real.log_nonneg (by norm_num)

/-- Summing the per-position loss commutes with choosing the limiting physical axis. -/
theorem permutedRetention_loss (axes : T → Equiv.Perm (Fin 3)) (error : ℝ) (extreme middle : T → ℕ) :
    permutedRetention axes error extreme middle = permutedRetention axes 0 extreme middle-
      error*(∑ type, 2*((extreme type : ℝ)+middle type)) := by
  have rates (axis : Fin 3) :
      (∑ type, permutedRate (axes type) error (extreme type) (middle type) axis) =
      (∑ type, permutedRate (axes type) 0 (extreme type) (middle type) axis)-
        error*(∑ type, 2*((extreme type : ℝ)+middle type)) := by
    simp only [permutedRate, sub_zero, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum]
    congr 1
    apply Finset.sum_congr rfl
    intro type _
    ring
  unfold permutedRetention Mixed.mixedRetention
  rw [rates 0, rates 1, rates 2, min_sub_sub_right, min_sub_sub_right]

/-- Every zero-loss mixed terminal retention is nonnegative under arbitrary physical assignments. -/
theorem permutedRetention_nonnegative (axes : T → Equiv.Perm (Fin 3)) (extreme middle : T → ℕ)
    (positive : ∀ type, 0 < extreme type+middle type) : 0 ≤ permutedRetention axes 0 extreme middle := by
  have rates (axis : Fin 3) : 0 ≤ ∑ type, permutedRate (axes type) 0 (extreme type) (middle type) axis := by
    apply Finset.sum_nonneg
    intro type _
    unfold permutedRate
    rw [sub_zero]
    exact mul_nonneg (by positivity) (axisEntropy_nonnegative _ _ (positive type) (axes type axis))
  exact le_min (rates 0) (le_min (rates 1) (rates 2))

/-- One common linear lower bound controls every mixed physical terminal rate at a repair scale. -/
theorem permutedRetention_lower (axes : T → Equiv.Perm (Fin 3)) (extreme middle : T → ℕ)
    (positive : ∀ type, 0 < extreme type+middle type) {error : ℝ} (nonnegative : 0 ≤ error)
    (multiplier : T → ℕ) (k : ℕ)
    (upper : ∀ type, 2*(extreme type+middle type) ≤ multiplier type*scale k) :
    -(error*(∑ type, (multiplier type : ℝ))*scale k) ≤ permutedRetention axes error extreme middle := by
  have population : (∑ type, 2*((extreme type : ℝ)+middle type)) ≤
      (∑ type, (multiplier type : ℝ))*scale k := by
    rw [Finset.sum_mul]
    apply Finset.sum_le_sum
    intro type _
    exact_mod_cast upper type
  rw [permutedRetention_loss]
  have zeroRate := permutedRetention_nonnegative axes extreme middle positive
  have loss := mul_le_mul_of_nonneg_left population nonnegative
  nlinarith

end
end MatrixBounds.Tensor.CW.Terminal
