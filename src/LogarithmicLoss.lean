module

public import BehrendRetention
public import Mathlib.Algebra.Order.Archimedean.Real.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit thresholds make the finite logarithmic counting errors arbitrarily
small relative to the parent size. No informal asymptotic notation is needed. -/
namespace MatrixBounds.Selection

/-- A positive argument has logarithm at most twice its square root. -/
theorem log_le_two_sqrt {value : ℝ} (positive : 0 < value) : Real.log value ≤ 2*Real.sqrt value := by
  have logarithm := Real.log_pow (Real.sqrt value) 2
  rw [Real.sq_sqrt positive.le] at logarithm
  have bound := Real.log_le_sub_one_of_pos (Real.sqrt_pos.mpr positive)
  norm_num only [Nat.cast_ofNat] at logarithm
  linarith

/-- An explicit quadratic threshold absorbs a fixed multiple of log(linear size)+1. -/
theorem logarithmic_error_small {constant growth size epsilon : ℝ}
    (constantNonnegative : 0 ≤ constant) (growthNonnegative : 0 ≤ growth) (sizeLarge : 1 ≤ size)
    (epsilonPositive : 0 < epsilon) (large : 9*constant^2*(growth+1) ≤ epsilon^2*size) :
    constant*(Real.log (growth*size+1)+1) ≤ epsilon*size := by
  have sizePositive : 0 < size := by linarith
  have argumentPositive : 0 < growth*size+1 := by positivity
  have rootBound : Real.sqrt (growth*size+1) ≤ Real.sqrt ((growth+1)*size) := by
    apply Real.sqrt_le_sqrt
    nlinarith
  have rootOne : 1 ≤ Real.sqrt ((growth+1)*size) := by
    rw [Real.le_sqrt (by norm_num) (by positivity)]
    nlinarith
  have logarithm := log_le_two_sqrt argumentPositive
  have before : constant*(Real.log (growth*size+1)+1) ≤ 3*constant*Real.sqrt ((growth+1)*size) := by
    have inside : Real.log (growth*size+1)+1 ≤ 3*Real.sqrt ((growth+1)*size) := by linarith
    nlinarith [mul_le_mul_of_nonneg_left inside constantNonnegative]
  apply before.trans
  apply (sq_le_sq₀ (by positivity : 0 ≤ 3*constant*Real.sqrt ((growth+1)*size))
    (mul_nonneg epsilonPositive.le sizePositive.le)).mp
  have square := Real.sq_sqrt (show 0 ≤ (growth+1)*size by positivity)
  have scaled := mul_le_mul_of_nonneg_right large sizePositive.le
  nlinarith

/-- For every positive rate loss, all sufficiently large integer parent sizes satisfy the finite error bound. -/
theorem logarithmic_error_eventually {constant growth epsilon : ℝ}
    (constantNonnegative : 0 ≤ constant) (growthNonnegative : 0 ≤ growth) (epsilonPositive : 0 < epsilon) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      constant*(Real.log (growth*size+1)+1) ≤ epsilon*size := by
  let threshold := ⌈max 1 (9*constant^2*(growth+1)/epsilon^2)⌉₊
  refine ⟨threshold, ?_⟩
  intro size large
  have lower : max 1 (9*constant^2*(growth+1)/epsilon^2) ≤ (size : ℝ) :=
    (Nat.le_ceil _).trans (by exact_mod_cast large)
  have sizeLarge := (le_max_left 1 (9*constant^2*(growth+1)/epsilon^2)).trans lower
  have thresholdBound := (le_max_right 1 (9*constant^2*(growth+1)/epsilon^2)).trans lower
  rw [div_le_iff₀ (sq_pos_of_pos epsilonPositive)] at thresholdBound
  apply logarithmic_error_small constantNonnegative growthNonnegative sizeLarge epsilonPositive
  nlinarith

end MatrixBounds.Selection
