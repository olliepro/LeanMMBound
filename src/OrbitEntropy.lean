module

public import EntropyBounds
public import MassEntropy

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact entropy of distributions uniform inside finite orbits. This permits
the numerical certificate to use orbit masses rather than expanded word arrays. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
variable {Orbit : Type*} [Fintype Orbit] {Fiber : Orbit → Type*}
variable [∀ orbit, Fintype (Fiber orbit)] [∀ orbit, Nonempty (Fiber orbit)]

/-- Spread an orbit's total mass uniformly over its finite nonempty coordinate fiber. -/
def uniformOrbit (mass : Orbit → ℝ) (entry : (orbit : Orbit) × Fiber orbit) : ℝ :=
  mass entry.1 / Fintype.card (Fiber entry.1)

/-- Uniform expansion preserves the sum of orbit masses exactly. -/
theorem uniform_orbit_total (mass : Orbit → ℝ) :
    (∑ entry, uniformOrbit (Fiber := Fiber) mass entry) = ∑ orbit, mass orbit := by
  rw [Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro orbit _
  have positive : (0 : ℝ) < Fintype.card (Fiber orbit) := by exact_mod_cast Fintype.card_pos
  simp +instances only [uniformOrbit, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  field_simp

omit [Fintype Orbit] [∀ orbit, Fintype (Fiber orbit)] [∀ orbit, Nonempty (Fiber orbit)] in
/-- One nonempty orbit contributes minus p*log p plus p*log size, including zero mass. -/
theorem uniform_fiber_entropy (mass size : ℝ) (positive : 0 < size) :
    -(size*((mass/size)*Real.log (mass/size))) = -(mass*Real.log mass)+mass*Real.log size := by
  by_cases zero : mass = 0
  · simp [zero]
  · rw [Real.log_div zero positive.ne']
    field_simp
    ring

/-- Expanded entropy equals orbit-mass entropy plus the expected logarithm of orbit size. -/
theorem uniform_orbit_entropy (mass : Orbit → ℝ) :
    entropy (uniformOrbit (Fiber := Fiber) mass) =
      entropy mass + ∑ orbit, mass orbit*Real.log (Fintype.card (Fiber orbit)) := by
  unfold entropy
  rw [Fintype.sum_sigma]
  simp +instances only [uniformOrbit, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  rw [← Finset.sum_neg_distrib]
  have term (orbit : Orbit) := uniform_fiber_entropy (mass orbit) (Fintype.card (Fiber orbit))
    (by exact_mod_cast Fintype.card_pos : (0 : ℝ) < Fintype.card (Fiber orbit))
  simp_rw [term]
  rw [Finset.sum_add_distrib, Finset.sum_neg_distrib]

/-- A verified orbit enumeration transfers the compressed entropy formula to the original word alphabet. -/
theorem entropy_of_orbit_equiv {Word : Type*} [Fintype Word]
    (enumeration : ((orbit : Orbit) × Fiber orbit) ≃ Word)
    (probability : Word → ℝ) (mass : Orbit → ℝ)
    (uniform : ∀ entry, probability (enumeration entry) = uniformOrbit mass entry) :
    entropy probability = entropy mass + ∑ orbit, mass orbit*Real.log (Fintype.card (Fiber orbit)) := by
  rw [← uniform_orbit_entropy (Fiber := Fiber) mass]
  unfold entropy
  congr 1
  have reindexed := Equiv.sum_comp enumeration (fun word => probability word*Real.log (probability word))
  simpa only [uniform] using reindexed.symm

/-- The same orbit compression formula applies to unnormalized pooled masses. -/
theorem uniform_orbit_massEntropy (mass : Orbit → ℝ) :
    massEntropy (uniformOrbit (Fiber := Fiber) mass) =
      massEntropy mass + ∑ orbit, mass orbit*Real.log (Fintype.card (Fiber orbit)) := by
  unfold massEntropy
  rw [uniform_orbit_entropy, uniform_orbit_total]
  ring

/-- A verified word/orbit enumeration also preserves the compressed pooled-mass entropy formula. -/
theorem massEntropy_of_orbit_equiv {Word : Type*} [Fintype Word]
    (enumeration : ((orbit : Orbit) × Fiber orbit) ≃ Word)
    (probability : Word → ℝ) (mass : Orbit → ℝ)
    (uniform : ∀ entry, probability (enumeration entry) = uniformOrbit mass entry) :
    massEntropy probability = massEntropy mass + ∑ orbit, mass orbit*Real.log (Fintype.card (Fiber orbit)) := by
  have total : (∑ word, probability word) = ∑ orbit, mass orbit := by
    rw [← Equiv.sum_comp enumeration probability]
    simp only [uniform, uniform_orbit_total]
  unfold massEntropy
  rw [entropy_of_orbit_equiv enumeration probability mass uniform, total]
  ring

end
end MatrixBounds.Entropy
