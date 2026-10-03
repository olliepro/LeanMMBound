module

public import CWTerminalExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Quantitative lower bounds for the terminal retention exponent make its
shared-prime and Behrend losses uniformly subexponential. -/
namespace MatrixBounds.Entropy

open scoped BigOperators

/-- Any finite family of masses in [0,1] has nonnegative Shannon entropy. -/
theorem entropy_nonnegative {A : Type*} [Fintype A] (law : A → ℝ)
    (range : ∀ symbol, 0 ≤ law symbol ∧ law symbol ≤ 1) : 0 ≤ entropy law := by
  apply neg_nonneg.mpr
  apply Finset.sum_nonpos
  intro symbol _
  exact mul_nonpos_of_nonneg_of_nonpos (range symbol).1
    (Real.log_nonpos (range symbol).1 (range symbol).2)

end MatrixBounds.Entropy

namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy RepairRates
open scoped BigOperators
noncomputable section
variable {T : Type*} [Fintype T]

/-- The terminal ternary entropy is nonnegative, including either endpoint parameter. -/
theorem terminal_entropy_nonnegative (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    0 ≤ entropy (![parameter extreme middle, 1-2*parameter extreme middle,
      parameter extreme middle] : Fin 3 → ℝ) := by
  apply entropy_nonnegative
  intro symbol
  have range := parameter_range extreme middle positive
  fin_cases symbol <;> dsimp <;> constructor <;> linarith [range.1, range.2]

/-- The mixed finite retention exponent uses one comparison after the three summed rates. -/
def retention (error : ℝ) (extreme middle : T → ℕ) : ℝ :=
  Mixed.mixedRetention (fun type => binaryRate error (extreme type) (middle type))
    (fun type => binaryRate error (extreme type) (middle type))
    (fun type => ternaryRate error (extreme type) (middle type))

/-- Per-position loss is charged exactly once per terminal parent before taking the minimum. -/
theorem retention_loss (error : ℝ) (extreme middle : T → ℕ) :
    retention error extreme middle = retention 0 extreme middle-
      error*(∑ type, 2*((extreme type : ℝ)+middle type)) := by
  have binary : (∑ type, binaryRate error (extreme type) (middle type)) =
      (∑ type, binaryRate 0 (extreme type) (middle type))-
        error*(∑ type, 2*((extreme type : ℝ)+middle type)) := by
    simp only [binaryRate, sub_zero, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum]
    congr 1
    apply Finset.sum_congr rfl
    intro type _
    ring
  have ternary : (∑ type, ternaryRate error (extreme type) (middle type)) =
      (∑ type, ternaryRate 0 (extreme type) (middle type))-
        error*(∑ type, 2*((extreme type : ℝ)+middle type)) := by
    simp only [ternaryRate, sub_zero, mul_sub, Finset.sum_sub_distrib, Finset.mul_sum]
    congr 1
    apply Finset.sum_congr rfl
    intro type _
    ring
  unfold retention Mixed.mixedRetention
  rw [binary, ternary, min_sub_sub_right, min_sub_sub_right]

/-- Before its requested loss, every mixed terminal retention exponent is nonnegative. -/
theorem retention_nonnegative (extreme middle : T → ℕ)
    (positive : ∀ type, 0 < extreme type+middle type) : 0 ≤ retention 0 extreme middle := by
  have binary (type : T) : 0 ≤ binaryRate 0 (extreme type) (middle type) := by
    unfold binaryRate
    rw [sub_zero]
    exact mul_nonneg (by positivity) (Real.log_nonneg (by norm_num))
  have ternary (type : T) : 0 ≤ ternaryRate 0 (extreme type) (middle type) := by
    unfold ternaryRate
    rw [sub_zero]
    exact mul_nonneg (by positivity) (terminal_entropy_nonnegative _ _ (positive type))
  exact le_min (Finset.sum_nonneg (fun type _ => binary type))
    (le_min (Finset.sum_nonneg (fun type _ => binary type)) (Finset.sum_nonneg (fun type _ => ternary type)))

/-- One linear lower bound controls every feasible terminal retention at a common repair scale. -/
theorem retention_lower (extreme middle : T → ℕ) (positive : ∀ type, 0 < extreme type+middle type)
    {error : ℝ} (nonnegative : 0 ≤ error) (multiplier : T → ℕ) (k : ℕ)
    (upper : ∀ type, 2*(extreme type+middle type) ≤ multiplier type*scale k) :
    -(error*(∑ type, (multiplier type : ℝ))*scale k) ≤ retention error extreme middle := by
  have population : (∑ type, 2*((extreme type : ℝ)+middle type)) ≤
      (∑ type, (multiplier type : ℝ))*scale k := by
    rw [Finset.sum_mul]
    apply Finset.sum_le_sum
    intro type _
    exact_mod_cast upper type
  rw [retention_loss]
  have zeroRate := retention_nonnegative extreme middle positive
  have loss := mul_le_mul_of_nonneg_left population nonnegative
  nlinarith

end
end MatrixBounds.Tensor.CW.Terminal
