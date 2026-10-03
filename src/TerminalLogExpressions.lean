module

public import RationalLogExpressions
public import CertifiedTerminalParameters
public import CWTerminalRetention
public import CWTerminalMatrixRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Symbolic terminal entropy and matrix-volume expressions are connected to
the supplied dyadic parameters and the actual integer terminal matrix factors. -/
namespace MatrixBounds.Numeric

open Entropy Empirical Tensor.CW Tensor.CW.Terminal
open scoped BigOperators

/-- Exact ternary entropy expression of the complete terminal fine law. -/
def terminalEntropyExpression (mu : ℚ) : RationalLogExpression :=
  entropyLogExpression (![mu, 1-2*mu, mu] : Fin 3 → ℚ)

/-- The terminal symbolic entropy equals its complete actual real ternary entropy. -/
theorem terminalEntropyExpression_value (mu : ℚ) :
    rationalLogValue (terminalEntropyExpression mu) =
      entropy (![ (mu : ℝ), 1-2*(mu : ℝ), (mu : ℝ)] : Fin 3 → ℝ) := by
  rw [terminalEntropyExpression, entropyLogExpression_value]
  congr 1
  funext index
  fin_cases index <;> simp [Rat.cast_sub, Rat.cast_mul]

/-- Exact role-weighted terminal retention, including its binary contribution. -/
def terminalRetentionExpression (mu role : ℚ) : RationalLogExpression :=
  logAtom 2 (1-role)++scaleLogExpression role (terminalEntropyExpression mu)

/-- The expanded role expression equals its full weighted binary/ternary terminal retention. -/
theorem terminalRetentionExpression_value (mu role : ℚ) :
    rationalLogValue (terminalRetentionExpression mu role) =
      (1-(role : ℝ))*Real.log 2+(role : ℝ)*
        entropy (![(mu : ℝ), 1-2*(mu : ℝ), (mu : ℝ)] : Fin 3 → ℝ) := by
  simp only [terminalRetentionExpression, rationalLogValue_append, logAtom_value,
    scaleLogExpression_value, terminalEntropyExpression_value, Rat.cast_sub, Rat.cast_one, Rat.cast_ofNat]

/-- Exact total terminal matrix-volume expression per original parent position. -/
def terminalVolumeExpression (q : ℕ) (mu : ℚ) : RationalLogExpression :=
  logAtom q (2-2*mu)

/-- The terminal volume expression equals the sum of its three actual side exponents. -/
theorem terminalVolumeExpression_value (q : ℕ) (mu : ℚ) :
    rationalLogValue (terminalVolumeExpression q mu) = (2-2*(mu : ℝ))*Real.log q := by
  simp only [terminalVolumeExpression, logAtom_value, Rat.cast_sub, Rat.cast_mul, Rat.cast_ofNat, Rat.cast_natCast]

/-- Every checked terminal parameter's actual complete nominal Z law has exactly its symbolic entropy. -/
theorem supplied_terminal_entropy (numerator : ℕ) (present : numerator ∈ TerminalParameterData.numerators) :
    (data (counts numerator (TerminalParameterData.middleCount numerator))).lawRetention
      (P := Fin (2*(numerator+TerminalParameterData.middleCount numerator))) zClass
      (fun child => oneLetterLaw (shapeZIndex child)) =
      rationalLogValue (terminalEntropyExpression ((numerator : ℚ)/TerminalParameterData.denominator)) := by
  have positive := TerminalParameterData.split_counts_positive numerator present
  rw [terminal_z_law_retention numerator _ (by omega),
    TerminalParameterData.parameter_exact numerator present, terminalEntropyExpression_value]
  simp only [Rat.cast_div, Rat.cast_natCast]

/-- Supplied dyadic terminal parameters give the exact symbolic logarithm of a genuine integer matrix volume. -/
theorem supplied_terminal_volume (q numerator : ℕ) (positiveQ : 0 < q)
    (present : numerator ∈ TerminalParameterData.numerators) :
    Real.log (((q^(2*TerminalParameterData.middleCount numerator)*q^(2*numerator)*
      q^(2*TerminalParameterData.middleCount numerator) : ℕ) : ℝ)) =
      (TerminalParameterData.denominator : ℝ)*
        rationalLogValue (terminalVolumeExpression q ((numerator : ℚ)/TerminalParameterData.denominator)) := by
  have positive := TerminalParameterData.split_counts_positive numerator present
  have volume := terminal_log_volume q numerator (TerminalParameterData.middleCount numerator) positiveQ (by omega)
  have population : 2*((numerator : ℝ)+TerminalParameterData.middleCount numerator) =
      TerminalParameterData.denominator := by
    exact_mod_cast TerminalParameterData.split_population numerator present
  rw [population, TerminalParameterData.parameter_exact numerator present] at volume
  simpa only [terminalVolumeExpression_value, Rat.cast_div, Rat.cast_natCast] using volume

end MatrixBounds.Numeric
