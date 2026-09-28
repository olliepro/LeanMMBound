import CWTerminalCenters
import CWTerminalMatrixRates
import CertifiedTerminalParameters

/-! The terminal integer construction realizes one fixed rational law at
arbitrarily large common multiples, with exact parent centers and dimensions. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Numeric
noncomputable section

/-- Repeating the four split counts preserves the normalized terminal parameter. -/
theorem parameter_scale (extreme middle repetitions : ℕ) (positive : 0 < repetitions) :
    parameter (repetitions*extreme) (repetitions*middle) = parameter extreme middle := by
  have nonzero : (repetitions : ℝ) ≠ 0 := by exact_mod_cast positive.ne'
  unfold parameter
  push_cast
  rw [← mul_add, ← mul_assoc, mul_comm (2 : ℝ) (repetitions : ℝ), mul_assoc,
    mul_div_mul_left _ _ nonzero]

/-- The parent population scales by exactly the same integer repetition. -/
theorem population_scale (extreme middle repetitions : ℕ) :
    2*(repetitions*extreme+repetitions*middle) = repetitions*(2*(extreme+middle)) := by ring

/-- Every exported terminal parameter is realized unchanged at every positive repetition. -/
theorem certified_parameter_scale (numerator repetitions : ℕ)
    (present : numerator ∈ TerminalParameterData.numerators) (positive : 0 < repetitions) :
    parameter (repetitions*numerator) (repetitions*TerminalParameterData.middleCount numerator) =
      (numerator : ℝ)/TerminalParameterData.denominator := by
  rw [parameter_scale _ _ _ positive, TerminalParameterData.parameter_exact numerator present]

/-- The certified dyadic law uses precisely denominator times repetition many parent positions. -/
theorem certified_population_scale (numerator repetitions : ℕ)
    (present : numerator ∈ TerminalParameterData.numerators) :
    2*(repetitions*numerator+repetitions*TerminalParameterData.middleCount numerator) =
      repetitions*TerminalParameterData.denominator := by
  rw [population_scale, TerminalParameterData.split_population numerator present]

/-- At every positive repetition the actual ternary window is centered at the original exported law. -/
theorem certified_center_z (numerator repetitions : ℕ)
    (present : numerator ∈ TerminalParameterData.numerators) (positive : 0 < repetitions) :
    (data (counts (repetitions*numerator) (repetitions*TerminalParameterData.middleCount numerator))).parentCenter
      (P := Fin (2*(repetitions*numerator+repetitions*TerminalParameterData.middleCount numerator)))
      (data (counts (repetitions*numerator) (repetitions*TerminalParameterData.middleCount numerator))).fineZ =
      ternaryParentLaw ((numerator : ℝ)/TerminalParameterData.denominator) := by
  have countsPositive := TerminalParameterData.split_counts_positive numerator present
  have sumPositive : 0 < repetitions*numerator+repetitions*TerminalParameterData.middleCount numerator :=
    Nat.add_pos_left (Nat.mul_pos positive countsPositive.1) _
  rw [terminal_center_z _ _ sumPositive, certified_parameter_scale numerator repetitions present positive]

/-- The exported law's row dimension has exactly the verifier's logarithmic rate at every positive repetition. -/
theorem certified_outer_log_dimension (q numerator repetitions : ℕ)
    (present : numerator ∈ TerminalParameterData.numerators) (positive : 0 < repetitions) :
    Real.log ((q^(2*(repetitions*TerminalParameterData.middleCount numerator)) : ℕ) : ℝ) =
      ((repetitions*TerminalParameterData.denominator : ℕ) : ℝ)*
        ((1-2*((numerator : ℝ)/TerminalParameterData.denominator))*Real.log q) := by
  have countsPositive := TerminalParameterData.split_counts_positive numerator present
  have sumPositive : 0 < repetitions*numerator+repetitions*TerminalParameterData.middleCount numerator :=
    Nat.add_pos_left (Nat.mul_pos positive countsPositive.1) _
  rw [terminal_outer_log_dimension q (repetitions*numerator)
    (repetitions*TerminalParameterData.middleCount numerator) sumPositive,
    certified_parameter_scale numerator repetitions present positive]
  have population := certified_population_scale numerator repetitions present
  have castPopulation : 2*((repetitions*numerator : ℕ)+(repetitions*TerminalParameterData.middleCount numerator : ℕ) : ℝ) =
      ((repetitions*TerminalParameterData.denominator : ℕ) : ℝ) := by exact_mod_cast population
  rw [castPopulation]

end
end MatrixBounds.Tensor.CW.Terminal
