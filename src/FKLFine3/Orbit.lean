module

public import OrbitLogExpressions
public import VerifiedOrbitLevel3
public import FKL.FineRole

/-! The generic role builder computes the exact value of one level-three paired-fine role:
`rawValue (roleB …) = value (scaleLogExpression (sourceMass3 …) (sourceExpression3 …))`,
given pointwise equalities between the builder's data functions and the semantic tables. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Entropy
open scoped BigOperators

/-- Orbit mass entropy of a `Fin`-indexed rational mass vector equals `omReal`. -/
theorem omReal_of {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) (a : ℕ → ℝ) (sz : ℕ → ℕ)
    (ha : ∀ i : Fin n, ((mass i : ℚ) : ℝ) = a i) (hs : ∀ i : Fin n, sizes i = sz i) :
    rationalLogValue (orbitMassEntropyExpression mass sizes) = omReal n a sz := by
  simp only [orbitMassEntropyExpression, rationalLogValue_append, massEntropyLogExpression_value,
    orbitCorrectionExpression_value, massEntropy, entropy, omReal, ← Finset.sum_range (fun i => a i * Real.log (a i)),
    ← Finset.sum_range (fun i => a i), ← Finset.sum_range (fun i => a i * Real.log (sz i)), ha, hs]

/-- Parent orbit entropy value as a range sum. -/
theorem parentEntropy_real (P : Fin 21 → ℤ) (par : ℕ → ℕ) (hp : ∀ o : Fin 21, ((par o : ℕ) : ℤ) = P o)
    (sz3 : ℕ → ℕ) (h3 : ∀ o : Fin 21, sz3 o = OrbitLevel3.sizes o) :
    rationalLogValue (orbitEntropyExpression (fun orbit => (P orbit : ℚ) / ((2 ^ 134 : ℕ) : ℚ)) OrbitLevel3.sizes) =
      ∑ o ∈ Finset.range 21, (-((par o : ℝ) / 2 ^ 134 * Real.log ((par o : ℝ) / 2 ^ 134)) +
        (par o : ℝ) / 2 ^ 134 * Real.log (sz3 o)) := by
  have hcast : ∀ o : Fin 21, (((P o : ℚ) / ((2 ^ 134 : ℕ) : ℚ) : ℚ) : ℝ) = (par o : ℝ) / 2 ^ 134 := by
    intro o; rw [← hp o]; push_cast; ring
  simp only [orbitEntropyExpression, rationalLogValue_append, entropyLogExpression_value,
    orbitCorrectionExpression_value, entropy, hcast, h3]
  rw [Finset.sum_range (fun o => -((par o : ℝ) / 2 ^ 134 * Real.log ((par o : ℝ) / 2 ^ 134)) +
    (par o : ℝ) / 2 ^ 134 * Real.log (sz3 o)), Finset.sum_add_distrib, Finset.sum_neg_distrib]
  simp only [h3]

end MatrixBounds.Numeric.FKLFine3
