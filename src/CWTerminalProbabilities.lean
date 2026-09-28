import CWTerminalCounts
import CWTerminalLaws

/-! Exact normalization of terminal integer counts and the resulting marginal
probability vectors used by the numerical certificate. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section

/-- Dividing an integer marginal by a common scale equals the marginal of the divided counts. -/
theorem marginalProfile_div {A B : Type*} [Fintype A] [DecidableEq B]
    (profile : A → ℕ) (index : A → B) (scale : ℝ) :
    (fun label => (marginalProfile profile index label : ℝ)/scale) =
      Entropy.marginal (fun symbol => (profile symbol : ℝ)/scale) index := by
  funext label
  simp only [marginalProfile, Entropy.marginal, Nat.cast_sum, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro symbol _
  split_ifs <;> simp

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Entropy
noncomputable section

/-- The exact real terminal parameter represented by the two nonnegative integer split counts. -/
def parameter (extreme middle : ℕ) : ℝ := (extreme : ℝ)/(2*((extreme : ℝ)+middle))

/-- A nonempty terminal population gives exactly the claimed normalized split law. -/
theorem counts_probability (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (fun child => (counts extreme middle child : ℝ)/(2*((extreme : ℝ)+middle))) =
      splitLaw (parameter extreme middle) := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  funext child
  unfold counts splitLaw parameter
  split_ifs
  · field_simp
    ring
  · rfl

/-- The normalized X and Y coarse marginals are exactly balanced binary laws. -/
theorem counts_binary_marginals (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (fun label => (marginalProfile (counts extreme middle) splitXIndex label : ℝ)/(2*((extreme : ℝ)+middle))) =
      (![1/2, 1/2, 0] : Fin 3 → ℝ) ∧
    (fun label => (marginalProfile (counts extreme middle) splitYIndex label : ℝ)/(2*((extreme : ℝ)+middle))) =
      (![1/2, 1/2, 0] : Fin 3 → ℝ) := by
  rw [marginalProfile_div, marginalProfile_div, counts_probability extreme middle positive,
    splitLaw_marginalX, splitLaw_marginalY]
  exact ⟨rfl, rfl⟩

/-- The normalized Z coarse marginal is the verifier's three-term terminal law. -/
theorem counts_z_marginal (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    (fun label => (marginalProfile (counts extreme middle) splitZIndex label : ℝ)/(2*((extreme : ℝ)+middle))) =
      (![parameter extreme middle, 1-2*parameter extreme middle, parameter extreme middle] : Fin 3 → ℝ) := by
  rw [marginalProfile_div, counts_probability extreme middle positive, splitLaw_marginalZ]

/-- Every nonempty integer profile gives a parameter in the full admissible interval. -/
theorem parameter_range (extreme middle : ℕ) (positive : 0 < extreme+middle) :
    0 ≤ parameter extreme middle ∧ parameter extreme middle ≤ 1/2 := by
  have sumPositive : 0 < (extreme : ℝ)+middle := by exact_mod_cast positive
  constructor
  · exact div_nonneg (Nat.cast_nonneg _) (by positivity)
  · unfold parameter
    apply (div_le_iff₀ (by positivity : 0 < 2*((extreme : ℝ)+middle))).mpr
    have := Nat.cast_nonneg middle (α := ℝ)
    linarith

/-- Positive counts for both pairs give an interior parameter for strictly positive Gibbs potentials. -/
theorem parameter_interior {extreme middle : ℕ} (positiveExtreme : 0 < extreme) (positiveMiddle : 0 < middle) :
    0 < parameter extreme middle ∧ parameter extreme middle < 1/2 := by
  have extremePositive : (0 : ℝ) < extreme := by exact_mod_cast positiveExtreme
  have middlePositive : (0 : ℝ) < middle := by exact_mod_cast positiveMiddle
  constructor
  · exact div_pos extremePositive (by positivity)
  · unfold parameter
    apply (div_lt_iff₀ (by positivity : 0 < 2*((extreme : ℝ)+middle))).mpr
    linarith

end
end MatrixBounds.Tensor.CW.Terminal
