import OrbitLogExpressions
import CWRootOrbitRates

/-! The unrestricted root has a symbolic full-law entropy expansion with one
copy of each child, retaining every compatibility sector and zero pool. -/
namespace MatrixBounds.Numeric

open Entropy Empirical Tensor.CW
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {length orbits : ℕ}

/-- Exact rational root mixture or pool with single child multiplicity. -/
def rootOrbitMass (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (selected : ShapeAlphabet (2*length) → Prop)
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℚ) (orbit : Fin orbits) : ℚ :=
  ∑ child, if selected child then ((numerator child : ℚ)/denominator)*mass child orbit else 0

/-- The rational root mixture is exactly the actual complete root orbit mass. -/
theorem rootOrbitMass_cast (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (selected : ShapeAlphabet (2*length) → Prop)
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℚ) (orbit : Fin orbits) :
    (rootOrbitMass numerator denominator selected mass orbit : ℝ) =
      RootRestrictionData.orbitLawMass numerator denominator selected
        (fun child label => (mass child label : ℝ)) orbit := by
  simp only [rootOrbitMass, RootRestrictionData.orbitLawMass, Rat.cast_sum, apply_ite,
    Rat.cast_mul, Rat.cast_div, Rat.cast_natCast, Rat.cast_zero]

/-- Expand the actual root fine-axis retention into exact rational logarithmic terms. -/
def rootFineRetentionExpression (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    {sectors : ℕ} (enumeration : Fin sectors ≃ CompatibilityClass (2*length)) : RationalLogExpression :=
  orbitEntropyExpression (rootOrbitMass numerator denominator (fun _ => True) mass) partition.size++
    scaleLogExpression (-1) (finiteLogSum (fun sector =>
      orbitMassEntropyExpression (rootOrbitMass numerator denominator (fun child => axisClass child = enumeration sector) mass)
        partition.size))

/-- The root expression equals the actual single-multiplicity full-law extraction retention. -/
theorem rootFineRetentionExpression_value (numerator : ShapeAlphabet (2*length) → ℕ) (denominator : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (mass : ShapeAlphabet (2*length) → Fin orbits → ℚ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    {sectors : ℕ} (enumeration : Fin sectors ≃ CompatibilityClass (2*length)) :
    rationalLogValue (rootFineRetentionExpression numerator denominator partition mass axisClass enumeration) =
      RootRestrictionData.rationalFineRetention numerator denominator axisClass
        (fun child => partition.decode (fun orbit => (mass child orbit : ℝ))) := by
  rw [RootRestrictionData.rationalFineRetention_orbits numerator denominator partition]
  simp only [rootFineRetentionExpression, orbitEntropyExpression, orbitMassEntropyExpression,
    rationalLogValue_append, scaleLogExpression_value, finiteLogSum_value,
    entropyLogExpression_value, massEntropyLogExpression_value, orbitCorrectionExpression_value,
    Rat.cast_neg, Rat.cast_one, neg_one_mul, RootRestrictionData.orbitFineRetention]
  simp_rw [rootOrbitMass_cast]
  have sumIdentity := Equiv.sum_comp enumeration (fun sector =>
    massEntropy (RootRestrictionData.orbitLawMass numerator denominator (fun child => axisClass child = sector)
      (fun child label => (mass child label : ℝ)))+
      ∑ orbit, RootRestrictionData.orbitLawMass numerator denominator (fun child => axisClass child = sector)
        (fun child label => (mass child label : ℝ)) orbit*Real.log (partition.size orbit))
  simp only [sub_eq_add_neg]
  congr 1
  exact congrArg Neg.neg sumIdentity

end
end MatrixBounds.Numeric
