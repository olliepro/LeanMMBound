import SuppliedLeafLaws
import OrbitLogExpressions

/-! Exact rational compressed masses of the actual supplied level-three laws,
with proved decoding and entropy identities. -/
namespace MatrixBounds.Numeric.SuppliedLeafOrbitMass

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section

/-- Exact rational orbit masses of one original level-three parent and strategy. -/
def parent3 (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) : Fin 21 → ℚ :=
  splitParentMass (SuppliedTypedParameters.level3Split node strategy) OrbitLevel3.encoding
    OrbitLevel2.orbits (fun child => SuppliedLeafLaws.mass node strategy child axis)

/-- The rational parent masses decode to the actual complete source parent law. -/
theorem parent3_decode (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    SuppliedLeafLaws.parent3 node strategy axis =
      OrbitLevel3.orbits.decode (fun orbit => (parent3 node strategy axis orbit : ℝ)) := by
  unfold parent3
  simp_rw [splitParentMass_cast]
  exact (SuppliedTypedParameters.level3Split node strategy).parentLaw_decode
    OrbitLevel3.encoding OrbitLevel2.orbits (fun child orbit => (SuppliedLeafLaws.mass node strategy child axis orbit : ℝ))

/-- Every computed parent mass is nonnegative and the complete rational orbit row sums exactly to one. -/
theorem parent3_valid (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    (∀ orbit, 0 ≤ parent3 node strategy axis orbit) ∧ ∑ orbit, parent3 node strategy axis orbit = 1 := by
  constructor
  · intro orbit
    have lower := (SuppliedTypedParameters.level3Split node strategy).orbitParentMass_nonnegative
      OrbitLevel3.encoding OrbitLevel2.orbits
      (fun child label => (SuppliedLeafLaws.mass node strategy child axis label : ℝ))
      (fun child => (SuppliedLeafLaws.mass_valid node strategy child axis).1) orbit
    rw [← splitParentMass_cast] at lower
    exact_mod_cast lower
  · have total := SuppliedLeafLaws.parent3_total node strategy axis
    rw [parent3_decode, OrbitMap.decode_total] at total
    exact_mod_cast total

/-- Exact rational mixture over all original six strategy labels. -/
def mixed3 (node : Fin 945) (axis : Fin 3) : Fin 21 → ℚ :=
  OrbitArithmetic.mixture (SuppliedTypedParameters.strategies node).rational
    (fun strategy => parent3 node strategy axis)

/-- The rational mixture decodes to the actual supplied complete strategy mixture. -/
theorem mixed3_decode (node : Fin 945) (axis : Fin 3) :
    SuppliedLeafLaws.mixed3 node axis =
      OrbitLevel3.orbits.decode (fun orbit => (mixed3 node axis orbit : ℝ)) := by
  unfold mixed3
  simp_rw [OrbitArithmetic.cast_mixture]
  rw [OrbitMap.decode_mixture]
  funext word
  unfold SuppliedLeafLaws.mixed3
  apply Finset.sum_congr rfl
  intro strategy _
  rw [parent3_decode]

/-- Exact supplied strategy mixing preserves rational nonnegativity and normalization. -/
theorem mixed3_valid (node : Fin 945) (axis : Fin 3) :
    (∀ orbit, 0 ≤ mixed3 node axis orbit) ∧ ∑ orbit, mixed3 node axis orbit = 1 := by
  constructor
  · intro orbit
    unfold mixed3 OrbitArithmetic.mixture
    apply Finset.sum_nonneg
    intro strategy _
    exact mul_nonneg ((SuppliedTypedParameters.strategies node).rational_range (by decide) strategy).1
      ((parent3_valid node strategy axis).1 orbit)
  · have total := SuppliedLeafLaws.mixed3_total node axis
    rw [mixed3_decode, OrbitMap.decode_total] at total
    exact_mod_cast total

/-- The exact parent entropy is the rational compressed entropy plus the verified orbit-size correction. -/
theorem parent3_entropy (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) :
    rationalLogValue (orbitEntropyExpression (parent3 node strategy axis) OrbitLevel3.orbits.size) =
      entropy (SuppliedLeafLaws.parent3 node strategy axis) := by
  rw [parent3_decode]
  exact orbitEntropyExpression_value OrbitLevel3.orbits (parent3 node strategy axis)

/-- Exact rational logarithmic terms represent the entropy of the actual supplied strategy mixture. -/
theorem mixed3_entropy (node : Fin 945) (axis : Fin 3) :
    rationalLogValue (orbitEntropyExpression (mixed3 node axis) OrbitLevel3.orbits.size) =
      entropy (SuppliedLeafLaws.mixed3 node axis) := by
  rw [mixed3_decode]
  exact orbitEntropyExpression_value OrbitLevel3.orbits (mixed3 node axis)

end
end MatrixBounds.Numeric.SuppliedLeafOrbitMass
