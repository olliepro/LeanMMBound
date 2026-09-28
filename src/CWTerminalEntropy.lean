import CWTerminalLaws

/-! The terminal maximum-entropy problem has a unique feasible point.
Its Gibbs certificate is exact, and the statement also covers endpoint laws. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Entropy
open scoped BigOperators
noncomputable section

/-- Any real mass vector with the terminal marginals equals the prescribed split law. -/
theorem splitLaw_unique (mu : ℝ) (law : Symbol → ℝ)
    (sameX : marginal law splitXIndex = marginal (splitLaw mu) splitXIndex)
    (sameY : marginal law splitYIndex = marginal (splitLaw mu) splitYIndex)
    (sameZ : marginal law splitZIndex = marginal (splitLaw mu) splitZIndex) : law = splitLaw mu := by
  apply joint_of_marginals law (splitLaw mu)
  · exact congrFun sameX
  · exact congrFun sameY
  · exact congrFun sameZ

/-- The terminal entropy penalty is zero for every feasible competitor, including both endpoints. -/
theorem terminal_entropy_penalty_zero (mu : ℝ) (law : Symbol → ℝ)
    (sameX : marginal law splitXIndex = marginal (splitLaw mu) splitXIndex)
    (sameY : marginal law splitYIndex = marginal (splitLaw mu) splitYIndex)
    (sameZ : marginal law splitZIndex = marginal (splitLaw mu) splitZIndex) :
    entropy law-entropy (splitLaw mu) = 0 := by
  rw [splitLaw_unique mu law sameX sameY sameZ, sub_self]

/-- The coordinate-potential Gibbs expression equals the actual split entropy exactly. -/
theorem terminal_gibbs_exact (mu : ℝ) :
    Real.log (∑ child : Symbol, zPotential mu (splitZIndex child)) -
      ∑ value : Fin 3, marginal (splitLaw mu) splitZIndex value*Real.log (zPotential mu value) =
      entropy (splitLaw mu) := by
  have total : (∑ child : Symbol, zPotential mu (splitZIndex child)) = 1 := by
    simpa only [one_mul] using zPotential_partition mu
  rw [total, Real.log_one, zero_sub, ← expectation_marginal]
  rfl

/-- Removing the exact Gibbs penalty leaves the balanced X marginal entropy rate. -/
theorem terminal_coarse_retention (mu : ℝ) :
    entropy (marginal (splitLaw mu) splitXIndex) + entropy (splitLaw mu) -
      (Real.log (∑ child : Symbol, zPotential mu (splitZIndex child)) -
        ∑ value : Fin 3, marginal (splitLaw mu) splitZIndex value*Real.log (zPotential mu value)) =
      Real.log 2 := by
  rw [terminal_gibbs_exact, add_sub_cancel_right]
  exact (splitLaw_binary_entropies mu).1

end
end MatrixBounds.Tensor.CW.Terminal
