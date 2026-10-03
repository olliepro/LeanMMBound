module

public import CWRootRationalData
public import FiniteOrbitData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Root extraction uses single child multiplicities. Its complete mixture
and every compatibility pool have exact compressed orbit formulas. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Numeric Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length orbits : ℕ}

/-- Compressed root masses include each selected root child exactly once. -/
def orbitLawMass (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (selected : ShapeAlphabet (2*length) → Prop)
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℝ) (orbit : Fin orbits) : ℝ :=
  ∑ child, if selected child then ((numerator child : ℝ)/denominator)*mass child orbit else 0

/-- The actual complete root mixture is exactly the expansion of the compressed root masses. -/
theorem rationalLawMass_decode (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (selected : ShapeAlphabet (2*length) → Prop) (mass : ShapeAlphabet (2*length) → Fin orbits → ℝ) :
    rationalLawMass numerator denominator selected (fun child => partition.decode (mass child)) =
      partition.decode (orbitLawMass numerator denominator selected mass) := by
  funext word
  simp only [rationalLawMass, OrbitMap.decode, orbitLawMass, Finset.sum_div,
    ite_div, zero_div, mul_div_assoc]

/-- The fixed root fine-retention formula using only the verified smaller orbit alphabet. -/
def orbitFineRetention (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℝ) : ℝ :=
  entropy (orbitLawMass numerator denominator (fun _ => True) mass) +
    (∑ orbit, orbitLawMass numerator denominator (fun _ => True) mass orbit*Real.log (partition.size orbit)) -
    ∑ sector, (massEntropy (orbitLawMass numerator denominator (fun child => axisClass child = sector) mass) +
      ∑ orbit, orbitLawMass numerator denominator (fun child => axisClass child = sector) mass orbit*Real.log (partition.size orbit))

/-- The root's full fine-axis entropy rate is exactly its compressed single-multiplicity expression. -/
theorem rationalFineRetention_orbits (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℝ) :
    rationalFineRetention numerator denominator axisClass (fun child => partition.decode (mass child)) =
      orbitFineRetention numerator denominator partition axisClass mass := by
  unfold rationalFineRetention orbitFineRetention
  simp_rw [rationalLawMass_decode numerator denominator partition, OrbitMap.decode_entropy, OrbitMap.decode_massEntropy]

end
end MatrixBounds.Tensor.CW.RootRestrictionData
