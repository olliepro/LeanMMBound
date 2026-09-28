import CWRationalOrbitParents

/-! Complete compatibility pools and fine retention rates have the exact
recursive orbit compression used by the numerical certificate. -/
namespace MatrixBounds.Tensor.CW.RationalSplit

open Numeric Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length denominator children parents : ℕ}

/-- Compressed compatibility mass retains the complete separately labelled sector and both child multiplicities. -/
def orbitPooledMass (split : RationalSplit length denominator)
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (sector : CompatibilityClass (2*length)) (orbit : Fin children) : ℝ :=
  ∑ child, if axisClass child = sector then (2*((split.numerator child : ℝ)/denominator))*mass child orbit else 0

/-- Each actual pooled law is exactly the uniform expansion of its compressed compatibility masses. -/
theorem pooledLaw_decode (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) (sector : CompatibilityClass (2*length)) :
    SplitRestrictionData.rationalPooledLaw split.numerator denominator axisClass (fun child => partition.decode (mass child)) sector =
      partition.decode (split.orbitPooledMass mass axisClass sector) := by
  funext word
  simp only [SplitRestrictionData.rationalPooledLaw, OrbitMap.decode, orbitPooledMass,
    Finset.sum_div, ite_div, zero_div, mul_div_assoc]

/-- The exact fine retention formula evaluated entirely in the smaller parent and child orbit alphabets. -/
def orbitFineRetention (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) : ℝ :=
  entropy (split.orbitParentMass encoding partition mass) +
    (∑ orbit, split.orbitParentMass encoding partition mass orbit*Real.log ((encoding.wordOrbits partition).size orbit)) -
    ∑ sector, (massEntropy (split.orbitPooledMass mass axisClass sector) +
      ∑ orbit, split.orbitPooledMass mass axisClass sector orbit*Real.log (partition.size orbit))

/-- The actual full fine-axis retention is exactly its compressed arithmetic expression. -/
theorem fineRetention_orbits (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length)) :
    split.fineRetention axisClass (fun child => partition.decode (mass child)) =
      split.orbitFineRetention encoding partition mass axisClass := by
  unfold fineRetention orbitFineRetention
  rw [split.parentLaw_orbit_entropy encoding partition mass]
  simp_rw [split.pooledLaw_decode partition mass axisClass, OrbitMap.decode_massEntropy]

end
end MatrixBounds.Tensor.CW.RationalSplit
