module

public import OrbitEntropy
public import Mathlib.Logic.Equiv.Sum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit finite orbit labels with representatives connect compressed
probability arrays to their complete word distributions and exact entropies. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- An explicit partition of words into nonempty labelled fibers with one representative per label. -/
structure OrbitMap (Word Orbit : Type*) where
  label : Word → Orbit
  representative : Orbit → Word
  representative_label : ∀ orbit, label (representative orbit) = orbit

namespace OrbitMap
variable {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]

/-- The actual words belonging to one orbit label. -/
abbrev Fiber (partition : OrbitMap Word Orbit) (orbit : Orbit) := {word // partition.label word = orbit}

/-- Every orbit contains its designated representative. -/
instance fiberNonempty (partition : OrbitMap Word Orbit) (orbit : Orbit) : Nonempty (partition.Fiber orbit) :=
  ⟨⟨partition.representative orbit, partition.representative_label orbit⟩⟩

/-- The exact cardinality of the orbit's complete word fiber. -/
def size (partition : OrbitMap Word Orbit) (orbit : Orbit) : ℕ := Fintype.card (partition.Fiber orbit)

omit [Fintype Orbit] in
/-- Every declared orbit size is strictly positive. -/
theorem size_positive (partition : OrbitMap Word Orbit) (orbit : Orbit) : 0 < partition.size orbit := Fintype.card_pos

/-- Expand each orbit's total mass uniformly over its actual words. -/
def decode (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) (word : Word) : ℝ :=
  mass (partition.label word)/partition.size (partition.label word)

/-- Compress an orbit-constant law by multiplying its representative value by its exact fiber size. -/
def encode (partition : OrbitMap Word Orbit) (probability : Word → ℝ) (orbit : Orbit) : ℝ :=
  (partition.size orbit : ℝ)*probability (partition.representative orbit)

omit [Fintype Orbit] in
/-- The expanded probability at a labelled fiber word agrees with the abstract uniform-fiber distribution. -/
theorem decode_fiber (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (entry : (orbit : Orbit) × partition.Fiber orbit) :
    partition.decode mass (Equiv.sigmaFiberEquiv partition.label entry) = uniformOrbit mass entry := by
  change mass (partition.label entry.2.val)/partition.size (partition.label entry.2.val) = _
  rw [entry.2.property]
  rfl

/-- Decoding preserves the exact total mass of the supplied compressed row. -/
theorem decode_total (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) :
    (∑ word, partition.decode mass word) = ∑ orbit, mass orbit := by
  rw [← Equiv.sum_comp (Equiv.sigmaFiberEquiv partition.label)]
  simp only [partition.decode_fiber, uniform_orbit_total]

/-- The entropy of the actual expanded word law is its compressed entropy plus the exact orbit-size correction. -/
theorem decode_entropy (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) :
    entropy (partition.decode mass) = entropy mass + ∑ orbit, mass orbit*Real.log (partition.size orbit) :=
  entropy_of_orbit_equiv (Equiv.sigmaFiberEquiv partition.label) (partition.decode mass) mass (partition.decode_fiber mass)

/-- The same exact correction holds for every unnormalized compatibility pool. -/
theorem decode_massEntropy (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) :
    massEntropy (partition.decode mass) = massEntropy mass + ∑ orbit, mass orbit*Real.log (partition.size orbit) :=
  massEntropy_of_orbit_equiv (Equiv.sigmaFiberEquiv partition.label) (partition.decode mass) mass (partition.decode_fiber mass)

omit [Fintype Orbit] in
/-- Compressing a decoded row recovers every supplied orbit mass exactly. -/
theorem encode_decode (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ) :
    partition.encode (partition.decode mass) = mass := by
  funext orbit
  have nonzero : (partition.size orbit : ℝ) ≠ 0 := by exact_mod_cast (partition.size_positive orbit).ne'
  simp only [encode, decode, partition.representative_label, mul_div_cancel₀ _ nonzero]

omit [Fintype Orbit] in
/-- A complete law constant on the verified fibers is exactly the expansion of its compressed masses. -/
theorem decode_encode (partition : OrbitMap Word Orbit) (probability : Word → ℝ)
    (invariant : ∀ word, probability word = probability (partition.representative (partition.label word))) :
    partition.decode (partition.encode probability) = probability := by
  funext word
  have nonzero : (partition.size (partition.label word) : ℝ) ≠ 0 := by
    exact_mod_cast (partition.size_positive (partition.label word)).ne'
  simp only [decode, encode, mul_div_cancel_left₀ _ nonzero, invariant word]

omit [Fintype Orbit] in
/-- Weighted strategy mixtures and compatibility pools can be assembled directly in compressed coordinates. -/
theorem decode_mixture {T : Type*} [Fintype T] (partition : OrbitMap Word Orbit)
    (weight : T → ℝ) (mass : T → Orbit → ℝ) :
    partition.decode (fun orbit => ∑ type, weight type*mass type orbit) =
      fun word => ∑ type, weight type*partition.decode (mass type) word := by
  funext word
  simp only [decode, Finset.sum_div, mul_div_assoc]

end OrbitMap
end
end MatrixBounds.Entropy
