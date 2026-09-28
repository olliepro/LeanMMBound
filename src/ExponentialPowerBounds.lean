import Mathlib.Analysis.SpecialFunctions.Exp

/-! Raising an actual integer copy or overhead bound to a fixed finite power
multiplies its exponent by exactly that power. -/
namespace MatrixBounds

/-- Independent powers of an integer copy count retain the corresponding multiple of its exponential growth. -/
theorem exponential_power_lower {count : ℕ} {growth : ℝ} (bound : Real.exp growth ≤ count) (power : ℕ) :
    Real.exp ((power : ℝ)*growth) ≤ (count^power : ℕ) := by
  rw [Real.exp_nat_mul, Nat.cast_pow]
  exact pow_le_pow_left₀ (Real.exp_pos _).le bound power

/-- Independent powers of an integer overhead pay exactly the corresponding multiple of its exponential cost. -/
theorem exponential_power_upper {count : ℕ} {loss : ℝ} (bound : (count : ℝ) ≤ Real.exp loss) (power : ℕ) :
    (count^power : ℕ) ≤ Real.exp ((power : ℝ)*loss) := by
  rw [Real.exp_nat_mul, Nat.cast_pow]
  exact pow_le_pow_left₀ (Nat.cast_nonneg _) bound power

end MatrixBounds
