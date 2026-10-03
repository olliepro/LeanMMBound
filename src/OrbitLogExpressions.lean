module

public import RationalLogExpressions
public import CWZeroOrbitDimensions
public import CWRationalOrbitRates
public import RationalOrbitArithmetic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Symbolic expressions for actual compressed compatibility-pool entropies,
paired fine retention, and zero-leaf matrix dimensions. -/
namespace MatrixBounds.Numeric

open Entropy Empirical Tensor.CW
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Symbolic full-word unnormalized entropy of a compressed compatibility pool. -/
def orbitMassEntropyExpression {n : ℕ} (mass : Fin n → ℚ) (sizes : Fin n → ℕ) : RationalLogExpression :=
  massEntropyLogExpression mass++orbitCorrectionExpression mass sizes

/-- Every symbolic pool expression equals its actual complete-word unnormalized entropy. -/
theorem orbitMassEntropyExpression_value {Word : Type*} [Fintype Word] {n : ℕ}
    (partition : OrbitMap Word (Fin n)) (mass : Fin n → ℚ) :
    rationalLogValue (orbitMassEntropyExpression mass partition.size) =
      massEntropy (partition.decode (fun index => (mass index : ℝ))) := by
  rw [partition.decode_massEntropy]
  simp only [orbitMassEntropyExpression, rationalLogValue_append,
    massEntropyLogExpression_value, orbitCorrectionExpression_value]

/-- Exact symbolic matrix-dimension expression for a complete zero-coordinate leaf. -/
def zeroDimensionExpression {n : ℕ} (q : ℕ) (mass : Fin n → ℚ) (sizes middle : Fin n → ℕ) :
    RationalLogExpression :=
  orbitEntropyExpression mass sizes++logAtom q (∑ index, mass index*middle index)

/-- Zero-leaf symbolic dimensions equal the actual complete decoded entropy and middle-symbol dimension. -/
theorem zeroDimensionExpression_value {length n : ℕ} (q denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin n)) (numerator middle : Fin n → ℕ) :
    rationalLogValue (zeroDimensionExpression q (fun index => (numerator index : ℚ)/denominator)
      partition.size middle) = orbitZeroDimensionRate q denominator partition numerator middle := by
  simp only [zeroDimensionExpression, orbitEntropyExpression, rationalLogValue_append,
    entropyLogExpression_value, orbitCorrectionExpression_value, logAtom_value,
    Rat.cast_div, Rat.cast_natCast, Rat.cast_sum, Rat.cast_mul, orbitZeroDimensionRate]

variable {length denominator children parents : ℕ}

/-- The exact rational compressed parent masses computed from the actual supplied split and child masses. -/
def splitParentMass (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ) : Fin parents → ℚ :=
  OrbitArithmetic.parentMass (fun child => (split.numerator child : ℚ)/denominator)
    (complementEquiv split.parent (2*length) split.balanced) partition.size
    (encoding.wordOrbits partition).size encoding.columns mass

/-- Computed parent masses are the exact actual parent-law orbit masses. -/
theorem splitParentMass_cast (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ) (orbit : Fin parents) :
    (splitParentMass split encoding partition mass orbit : ℝ) =
      split.orbitParentMass encoding partition (fun child label => (mass child label : ℝ)) orbit :=
  OrbitArithmetic.cast_parentMass split encoding partition _ _ (fun _ => rfl) (fun _ => rfl) mass orbit

/-- Exact rational compatibility-pool masses retain both child multiplicities and every original label. -/
def splitPoolMass (split : RationalSplit length denominator)
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (sector : CompatibilityClass (2*length)) (orbit : Fin children) : ℚ :=
  ∑ child, if axisClass child = sector then 2*((split.numerator child : ℚ)/denominator)*mass child orbit else 0

/-- Computed rational pool masses agree with the complete actual paired compatibility pools. -/
theorem splitPoolMass_cast (split : RationalSplit length denominator)
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (sector : CompatibilityClass (2*length)) (orbit : Fin children) :
    (splitPoolMass split mass axisClass sector orbit : ℝ) =
      split.orbitPooledMass (fun child label => (mass child label : ℝ)) axisClass sector orbit := by
  simp only [splitPoolMass, RationalSplit.orbitPooledMass, Rat.cast_sum, apply_ite,
    Rat.cast_mul, Rat.cast_div, Rat.cast_natCast, Rat.cast_ofNat, Rat.cast_zero]

/-- Expand an actual paired fine-axis retention into exact rational logarithmic terms. -/
def splitFineRetentionExpression (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    {sectors : ℕ} (enumeration : Fin sectors ≃ CompatibilityClass (2*length)) : RationalLogExpression :=
  orbitEntropyExpression (splitParentMass split encoding partition mass) (encoding.wordOrbits partition).size++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (splitPoolMass split mass axisClass (enumeration sector)) partition.size))

/-- Symbolic fine retention equals the actual full-law tensor-extraction rate, including every compatibility sector. -/
theorem splitFineRetentionExpression_value (split : RationalSplit length denominator) (encoding : PairEncoding children parents)
    (partition : OrbitMap (Fin length → Fin 3) (Fin children))
    (mass : ShapeAlphabet (2*length) → Fin children → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    {sectors : ℕ} (enumeration : Fin sectors ≃ CompatibilityClass (2*length)) :
    rationalLogValue (splitFineRetentionExpression split encoding partition mass axisClass enumeration) =
      split.fineRetention axisClass (fun child => partition.decode (fun orbit => (mass child orbit : ℝ))) := by
  rw [split.fineRetention_orbits encoding partition]
  simp only [splitFineRetentionExpression, orbitEntropyExpression, orbitMassEntropyExpression,
    rationalLogValue_append, scaleLogExpression_value, finiteLogSum_value, entropyLogExpression_value,
    massEntropyLogExpression_value, orbitCorrectionExpression_value, Rat.cast_neg, Rat.cast_one,
    neg_one_mul, RationalSplit.orbitFineRetention]
  simp_rw [splitParentMass_cast, splitPoolMass_cast]
  have sumIdentity := Equiv.sum_comp enumeration (fun sector =>
    massEntropy (split.orbitPooledMass (fun child label => (mass child label : ℝ)) axisClass sector)+
      ∑ orbit, split.orbitPooledMass (fun child label => (mass child label : ℝ)) axisClass sector orbit*
        Real.log (partition.size orbit))
  simp only [sub_eq_add_neg]
  congr 1
  exact congrArg Neg.neg sumIdentity

end
end MatrixBounds.Numeric
