import CWRationalSplit
import FineWordOrbits
import FiniteOrbitReindexing

/-! Complete rational CW parent laws inherit the checked recursive orbit
symmetry. Their entropies are exactly computable from compressed orbit masses. -/
namespace MatrixBounds.Tensor.CW.RationalSplit

open Numeric Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length denominator children parents : ℕ}

/-- The complete parent-law probability at two specified child-orbit labels. -/
def orbitParentValue (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) (left right : Fin children) : ℝ :=
  ∑ child, ((split.numerator child : ℝ)/denominator)*
    ((mass child left/partition.size left)*
      (mass (complementEquiv split.parent (2*length) split.balanced child) right/partition.size right))

/-- Complete parent probabilities depend only on their two verified child-orbit labels. -/
theorem parentLaw_orbitValue (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) (word : Fin (length+length) → Fin 3) :
    split.parentLaw (fun child => partition.decode (mass child)) word =
      split.orbitParentValue partition mass (partition.label (leftHalf word)) (partition.label (rightHalf word)) := rfl

/-- Complementary split symmetry makes the actual parent probability symmetric in its two child-orbit labels. -/
theorem orbitParentValue_symmetric (split : RationalSplit length denominator)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) (left right : Fin children) :
    split.orbitParentValue partition mass left right = split.orbitParentValue partition mass right left := by
  let complement := complementEquiv split.parent (2*length) split.balanced
  have weights (child : ShapeAlphabet (2*length)) : split.numerator (complement child) = split.numerator child := by
    have symmetric := split.symmetric (complement child)
    simpa only [complement, Equiv.symm_apply_apply] using symmetric.symm
  have twice (child : ShapeAlphabet (2*length)) : complement (complement child) = child :=
    complementSymbol_involution split.parent (2*length) split.balanced child
  unfold orbitParentValue
  rw [← Equiv.sum_comp complement]
  apply Finset.sum_congr rfl
  intro child _
  change ((split.numerator (complement child) : ℝ)/denominator)*
    ((mass (complement child) left/partition.size left)*(mass (complement (complement child)) right/partition.size right)) = _
  rw [weights, twice]
  ring

/-- Exact compressed masses of the next-level parent law on its unordered pair orbits. -/
def orbitParentMass (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) : Fin parents → ℝ :=
  (encoding.pairOrbit partition).encode (fun word =>
    split.orbitParentValue partition mass (partition.label word.1) (partition.label word.2))

/-- Decoding the compressed parent gives the actual independent-concatenation parent law, on every complete word. -/
theorem parentLaw_decode (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) :
    split.parentLaw (fun child => partition.decode (mass child)) =
      (encoding.wordOrbits partition).decode (split.orbitParentMass encoding partition mass) := by
  have decoded := (encoding.pairOrbit partition).decode_encode
    (fun word => split.orbitParentValue partition mass (partition.label word.1) (partition.label word.2))
    (encoding.pairOrbit_invariant partition (split.orbitParentValue partition mass) (split.orbitParentValue_symmetric partition mass))
  funext word
  rw [PairEncoding.wordOrbits, OrbitMap.decode_reindex]
  change _ = (encoding.pairOrbit partition).decode _ (fineWordHalves length word)
  rw [orbitParentMass, decoded]
  rfl

/-- The compressed parent masses are obtained by evaluating only one supplied pair representative per orbit. -/
theorem orbitParentMass_formula (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) (orbit : Fin parents) :
    split.orbitParentMass encoding partition mass orbit =
      ((encoding.wordOrbits partition).size orbit : ℝ)*
        split.orbitParentValue partition mass (encoding.columns orbit).1 (encoding.columns orbit).2 := by
  rw [PairEncoding.wordOrbits_size]
  simp only [orbitParentMass, OrbitMap.encode, PairEncoding.pairOrbit, OrbitMap.compose,
    OrbitMap.product, PairEncoding.partition, partition.representative_label]

/-- Parent entropy is exactly the compressed entropy plus its checked finite fiber-size correction. -/
theorem parentLaw_orbit_entropy (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℝ) :
    entropy (split.parentLaw (fun child => partition.decode (mass child))) =
      entropy (split.orbitParentMass encoding partition mass) +
        ∑ orbit, split.orbitParentMass encoding partition mass orbit*Real.log ((encoding.wordOrbits partition).size orbit) := by
  rw [split.parentLaw_decode, OrbitMap.decode_entropy]

end
end MatrixBounds.Tensor.CW.RationalSplit
