module

public import RationalOrbitArithmetic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Probability validity transfers between exact rational orbit masses and the
actual complete fine laws, with no numerical approximation. -/
namespace MatrixBounds.Entropy.OrbitMap

open scoped BigOperators
noncomputable section

/-- Nonnegative decoded probabilities force nonnegative masses at every actual orbit representative. -/
theorem mass_nonnegative_of_decode {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]
    (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (nonnegative : ∀ word, 0 ≤ partition.decode mass word) (orbit : Orbit) : 0 ≤ mass orbit := by
  rw [← partition.encode_decode mass]
  exact mul_nonneg (Nat.cast_nonneg _) (nonnegative (partition.representative orbit))

/-- Exact rational masses form a probability row whenever their actual complete decoded law does. -/
theorem rational_valid_of_decode {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]
    (partition : OrbitMap Word Orbit) (mass : Orbit → ℚ)
    (nonnegative : ∀ word, 0 ≤ partition.decode (fun orbit => (mass orbit : ℝ)) word)
    (normalized : (∑ word, partition.decode (fun orbit => (mass orbit : ℝ)) word) = 1) :
    (∀ orbit, 0 ≤ mass orbit) ∧ ∑ orbit, mass orbit = 1 := by
  constructor
  · intro orbit
    exact_mod_cast partition.mass_nonnegative_of_decode (fun orbit => (mass orbit : ℝ)) nonnegative orbit
  · rw [partition.decode_total] at normalized
    exact_mod_cast normalized

end
end MatrixBounds.Entropy.OrbitMap
