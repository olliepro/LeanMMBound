import MassEntropy

/-! Exact entropy of distributions supported at one symbol, including empty
mass. This removes the terminal one-letter compatibility penalty. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {A : Type*} [Fintype A]

/-- A finite sum supported at one symbol equals its value there. -/
theorem sum_single_support (mass : A → ℝ) (point : A)
    (supported : ∀ symbol, symbol ≠ point → mass symbol = 0) :
    ∑ symbol, mass symbol = mass point := by
  classical
  exact Finset.sum_eq_single point (fun symbol _ different => supported symbol different) (by simp)

/-- A mass vector supported on a single symbol has zero unnormalized entropy. -/
theorem massEntropy_single_support (mass : A → ℝ) (point : A)
    (supported : ∀ symbol, symbol ≠ point → mass symbol = 0) : massEntropy mass = 0 := by
  unfold massEntropy entropy
  rw [sum_single_support mass point supported,
    sum_single_support (fun symbol => mass symbol*Real.log (mass symbol)) point
      (fun symbol different => by simp only [supported symbol different, zero_mul])]
  ring

/-- A normalized distribution supported on one symbol has zero Shannon entropy. -/
theorem entropy_single_support (mass : A → ℝ) (point : A)
    (supported : ∀ symbol, symbol ≠ point → mass symbol = 0)
    (normalized : ∑ symbol, mass symbol = 1) : entropy mass = 0 := by
  rw [← massEntropy_of_normalized mass normalized]
  exact massEntropy_single_support mass point supported

end
end MatrixBounds.Entropy
