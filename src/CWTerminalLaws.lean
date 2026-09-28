import CWTerminalAlphabet
import EntropyBounds

/-! Exact terminal split probabilities and their coarse marginal entropy.
The formulas include endpoint parameters without logarithm singularities. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section

/-- The symmetric terminal split law gives mass mu to 002 and 110, and 1/2-mu to 011 and 101. -/
def splitLaw (mu : ℝ) (child : Symbol) : ℝ :=
  if splitZIndex child = 1 then 1/2-mu else mu

/-- The Z-axis Gibbs potential reproduces the terminal split law; the other two potentials can be one. -/
def zPotential (mu : ℝ) (value : Fin 3) : ℝ := if value = 1 then 1/2-mu else mu

/-- The terminal split law is exactly the product of these coordinate potentials. -/
theorem splitLaw_gibbs (mu : ℝ) (child : Symbol) :
    splitLaw mu child = 1*1*zPotential mu (splitZIndex child) := by simp only [splitLaw, zPotential, one_mul]

/-- Every interior terminal parameter supplies strictly positive Gibbs potentials. -/
theorem zPotential_positive {mu : ℝ} (positive : 0 < mu) (belowHalf : mu < 1/2) (value : Fin 3) :
    0 < zPotential mu value := by
  unfold zPotential
  split_ifs
  · linarith
  · exact positive

/-- The complete terminal split law has total mass one. -/
theorem splitLaw_total (mu : ℝ) : (∑ child, splitLaw mu child) = 1 := by
  rw [← symbolEquiv.sum_comp]
  norm_num [symbolEquiv, symbol, splitLaw, splitZIndex, splitZ, Fin.sum_univ_succ, Fin.ext_iff]
  ring

/-- The allowed terminal parameter interval gives nonnegative probabilities, including both endpoints. -/
theorem splitLaw_nonnegative {mu : ℝ} (nonnegative : 0 ≤ mu) (atMostHalf : mu ≤ 1/2) (child : Symbol) :
    0 ≤ splitLaw mu child := by
  unfold splitLaw
  split_ifs
  · linarith
  · exact nonnegative

/-- The X marginal is the balanced binary distribution. -/
theorem splitLaw_marginalX (mu : ℝ) : marginal (splitLaw mu) splitXIndex = ![1/2, 1/2, 0] := by
  funext value
  unfold marginal
  rw [← symbolEquiv.sum_comp]
  fin_cases value <;>
    norm_num [symbolEquiv, symbol, splitLaw, splitXIndex, splitZIndex, splitX, splitZ, Fin.sum_univ_succ, Fin.ext_iff]

/-- The Y marginal is the same balanced binary distribution. -/
theorem splitLaw_marginalY (mu : ℝ) : marginal (splitLaw mu) splitYIndex = ![1/2, 1/2, 0] := by
  funext value
  unfold marginal
  rw [← symbolEquiv.sum_comp]
  fin_cases value <;>
    norm_num [symbolEquiv, symbol, splitLaw, splitYIndex, splitZIndex, splitY, splitZ, Fin.sum_univ_succ, Fin.ext_iff]

/-- The Z marginal has masses mu, 1-2*mu, mu. -/
theorem splitLaw_marginalZ (mu : ℝ) : marginal (splitLaw mu) splitZIndex = ![mu, 1-2*mu, mu] := by
  funext value
  unfold marginal
  rw [← symbolEquiv.sum_comp]
  fin_cases value <;>
    norm_num [symbolEquiv, symbol, splitLaw, splitZIndex, splitZ, Fin.sum_univ_succ, Fin.ext_iff]
  all_goals ring

/-- A balanced binary marginal has entropy log 2 in the natural-log convention used by the extraction. -/
theorem balanced_binary_entropy : entropy (![1/2, 1/2, 0] : Fin 3 → ℝ) = Real.log 2 := by
  norm_num [entropy, Fin.sum_univ_succ, Real.log_div]
  ring

/-- The X and Y marginal entropy rates are exactly log 2. -/
theorem splitLaw_binary_entropies (mu : ℝ) :
    entropy (marginal (splitLaw mu) splitXIndex) = Real.log 2 ∧
    entropy (marginal (splitLaw mu) splitYIndex) = Real.log 2 := by
  rw [splitLaw_marginalX, splitLaw_marginalY, balanced_binary_entropy]
  exact ⟨rfl, rfl⟩

/-- The Gibbs partition function is exactly one, so these potentials have no normalization loss. -/
theorem zPotential_partition (mu : ℝ) : (∑ child : Symbol, 1*1*zPotential mu (splitZIndex child)) = 1 := by
  simpa only [← splitLaw_gibbs] using splitLaw_total mu

end
end MatrixBounds.Tensor.CW.Terminal
