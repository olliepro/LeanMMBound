module

public import CWTerminalMatrices
public import CWTerminalProbabilities

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The numerical terminal side exponents are exact logarithms of the
matrix dimensions supplied by the actual coordinate restrictions. -/
namespace MatrixBounds.Tensor.CW.Terminal

noncomputable section

/-- The row and column log dimension equals parent population times the verifier's (1-2 mu) log q rate. -/
theorem terminal_outer_log_dimension (q extreme middle : ℕ) (positive : 0 < extreme+middle) :
    Real.log ((q^(2*middle) : ℕ) : ℝ) =
      (2*((extreme : ℝ)+middle))*((1-2*parameter extreme middle)*Real.log q) := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  rw [Nat.cast_pow, Real.log_pow]
  unfold parameter
  push_cast
  field_simp
  ring

/-- The inner log dimension equals parent population times the verifier's 2 mu log q rate. -/
theorem terminal_inner_log_dimension (q extreme middle : ℕ) (positive : 0 < extreme+middle) :
    Real.log ((q^(2*extreme) : ℕ) : ℝ) =
      (2*((extreme : ℝ)+middle))*((2*parameter extreme middle)*Real.log q) := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  rw [Nat.cast_pow, Real.log_pow]
  unfold parameter
  push_cast
  field_simp

/-- The total logarithmic matrix volume is exactly the sum of the three certified terminal side rates. -/
theorem terminal_log_volume (q extreme middle : ℕ) (positiveQ : 0 < q) (positive : 0 < extreme+middle) :
    Real.log (((q^(2*middle) * q^(2*extreme) * q^(2*middle) : ℕ) : ℝ)) =
      (2*((extreme : ℝ)+middle))*((2-2*parameter extreme middle)*Real.log q) := by
  have positivePower (power : ℕ) : (0 : ℝ) < (q^power : ℕ) := by
    exact_mod_cast pow_pos positiveQ power
  simp only [Nat.cast_mul]
  rw [Real.log_mul (mul_pos (positivePower _) (positivePower _)).ne' (positivePower _).ne',
    Real.log_mul (positivePower _).ne' (positivePower _).ne',
    terminal_outer_log_dimension q extreme middle positive, terminal_inner_log_dimension q extreme middle positive]
  ring

end
end MatrixBounds.Tensor.CW.Terminal
