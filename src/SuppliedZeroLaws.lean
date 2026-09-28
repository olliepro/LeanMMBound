import TypedParameterRows
import CWRationalLawValidity

/-! One reusable physical-axis construction for all supplied zero-coordinate
orbit laws, retaining their exact rational masses and complement permutations. -/
namespace MatrixBounds.Numeric.TypedProbabilityRow

open Entropy
open scoped BigOperators
noncomputable section

/-- Orient a supplied zero-coordinate orbit row along its original physical axes.
The zero axis uses its singleton orbit, and the other nonzero axis uses the exact complement. -/
def orientedOrbitMass {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) : Fin orbits → ℚ :=
  if axis = zeroAxis then fun orbit => if orbit = zeroOrbit then 1 else 0
  else if axis = positiveAxis then source.rational
  else fun orbit => source.rational (complement orbit)

/-- Every physical coordinate has a nonnegative normalized orbit law, at any supplied word level. -/
theorem orientedOrbitMass_valid {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (positive : 0 < denominator) (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) :
    (∀ orbit, 0 ≤ (source.orientedOrbitMass zeroOrbit complement zeroAxis positiveAxis axis orbit : ℝ)) ∧
      ∑ orbit, (source.orientedOrbitMass zeroOrbit complement zeroAxis positiveAxis axis orbit : ℝ) = 1 := by
  unfold orientedOrbitMass
  split_ifs
  · constructor
    · intro orbit
      dsimp
      split_ifs <;> norm_num
    · simp only [apply_ite, Rat.cast_one, Rat.cast_zero]
      simp
  · exact ⟨fun orbit => (source.real_range positive orbit).1, source.real_total positive⟩
  · exact ⟨fun orbit => (source.real_range positive (complement orbit)).1,
      (Equiv.sum_comp complement (fun orbit => (source.rational orbit : ℝ))).trans (source.real_total positive)⟩

/-- All oriented supplied orbit masses lie in the unit interval. -/
theorem orientedOrbitMass_range {orbits denominator : ℕ} (source : TypedProbabilityRow orbits denominator)
    (positive : 0 < denominator) (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) (orbit : Fin orbits) :
    0 ≤ (source.orientedOrbitMass zeroOrbit complement zeroAxis positiveAxis axis orbit : ℝ) ∧
      (source.orientedOrbitMass zeroOrbit complement zeroAxis positiveAxis axis orbit : ℝ) ≤ 1 := by
  obtain ⟨nonnegative, normalized⟩ := source.orientedOrbitMass_valid positive zeroOrbit complement zeroAxis positiveAxis axis
  refine ⟨nonnegative orbit, ?_⟩
  rw [← normalized]
  exact Finset.single_le_sum (fun index _ => nonnegative index) (Finset.mem_univ orbit)

/-- Expand the original oriented masses over their actual complete fine-word orbits. -/
def orientedLaw {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (partition : OrbitMap Word (Fin orbits))
    (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) : Word → ℝ :=
  partition.decode (fun orbit => (source.orientedOrbitMass zeroOrbit complement zeroAxis positiveAxis axis orbit : ℝ))

/-- Every actual fine-word coordinate of an oriented supplied zero law lies in the unit interval. -/
theorem orientedLaw_range {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (positive : 0 < denominator)
    (partition : OrbitMap Word (Fin orbits)) (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) (word : Word) :
    0 ≤ source.orientedLaw partition zeroOrbit complement zeroAxis positiveAxis axis word ∧
      source.orientedLaw partition zeroOrbit complement zeroAxis positiveAxis axis word ≤ 1 :=
  partition.decode_unit_range _ (source.orientedOrbitMass_range positive zeroOrbit complement zeroAxis positiveAxis axis) word

/-- Complete fine-word expansion preserves the exact unit mass of every original oriented zero law. -/
theorem orientedLaw_total {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (source : TypedProbabilityRow orbits denominator) (positive : 0 < denominator)
    (partition : OrbitMap Word (Fin orbits)) (zeroOrbit : Fin orbits) (complement : Equiv.Perm (Fin orbits))
    (zeroAxis positiveAxis axis : Fin 3) :
    (∑ word, source.orientedLaw partition zeroOrbit complement zeroAxis positiveAxis axis word) = 1 := by
  rw [orientedLaw, partition.decode_total]
  exact (source.orientedOrbitMass_valid positive zeroOrbit complement zeroAxis positiveAxis axis).2

end
end MatrixBounds.Numeric.TypedProbabilityRow
