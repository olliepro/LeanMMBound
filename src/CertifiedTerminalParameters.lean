import TerminalParameterData
import CWTerminalProbabilities

/-! Every exported terminal parameter supplies positive integer split counts,
with exactly its original dyadic value and the stated parent population. -/
namespace MatrixBounds.Numeric.TerminalParameterData

open Tensor.CW.Terminal
noncomputable section

/-- The complementary middle count representing a terminal parameter with denominator 2^44. -/
def middleCount (numerator : ℕ) : ℕ := denominator/2-numerator

/-- The checked strict interval gives positive extreme and middle split counts. -/
theorem split_counts_positive (numerator : ℕ) (present : numerator ∈ numerators) :
    0 < numerator ∧ 0 < middleCount numerator := by
  have bounds := numerator_bounds numerator present
  unfold middleCount denominator at *
  omega

/-- Every supplied dyadic parameter is realized at exactly the common denominator population. -/
theorem split_population (numerator : ℕ) (present : numerator ∈ numerators) :
    2*(numerator+middleCount numerator) = denominator := by
  have bounds := numerator_bounds numerator present
  unfold middleCount denominator at *
  omega

/-- Normalizing the actual integer split gives exactly the original exported dyadic parameter. -/
theorem parameter_exact (numerator : ℕ) (present : numerator ∈ numerators) :
    parameter numerator (middleCount numerator) = (numerator : ℝ)/denominator := by
  have population : 2*((numerator : ℝ)+middleCount numerator) = denominator := by
    exact_mod_cast split_population numerator present
  unfold parameter
  rw [population]

/-- Every supplied terminal parameter has the strictly positive Gibbs potentials needed by the extraction theorem. -/
theorem parameter_strictly_interior (numerator : ℕ) (present : numerator ∈ numerators) :
    0 < (numerator : ℝ)/denominator ∧ (numerator : ℝ)/denominator < 1/2 := by
  rw [← parameter_exact numerator present]
  exact parameter_interior (split_counts_positive numerator present).1 (split_counts_positive numerator present).2

end
end MatrixBounds.Numeric.TerminalParameterData
