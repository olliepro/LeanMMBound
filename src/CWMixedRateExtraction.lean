import CWMixedPrimeExtraction
import CWMixedDegreeRates
import SharedModulusRates

/-! Finite heterogeneous extraction with quantified retention rates. One shared
modulus is constructed from the three product degrees; the retained exponent
is the minimum of the three sums, with explicit polynomial and Behrend losses. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction RepairRates Selection
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Retention compares axes after summing all heterogeneous parent contributions. -/
def mixedRetention (rateX rateY rateZ : T → ℝ) : ℝ :=
  min (∑ type, rateX type) (min (∑ type, rateY type) (∑ type, rateZ type))

/-- Local degree rates yield complete child copies with the minimum-after-summation exponent and explicit finite losses. -/
theorem finite_mixed_rate_extraction (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (q : ℕ) (reference : PrescribedEdges Positions data)
    (supportY : ∀ type child block, fineTotal block ≠ child.val.y → (data type).fineY child block = 0)
    (supportZ : ∀ type child block, fineTotal block ≠ child.val.z → (data type).fineZ child block = 0)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (tolerance : T → ℝ) (positiveTolerance : ∀ type, 0 < tolerance type)
    (k bits rank degree base : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier tolerance+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base)
    (rateX rateY rateZ : T → ℝ)
    (boundX : ∀ type, ((data type).coarseDegree (P := Positions type) : ℝ)/
      Fintype.card (TypedWord (P := Positions type) (data type).split) ≤ Real.exp (-rateX type))
    (boundY : ∀ type, ((data type).windowDegree Shape.y yClass (data type).fineY
      ((data type).parentWindow (P := Positions type) (data type).fineY (tolerance type)) : ℝ)/
      Fintype.card (TypedWord (P := Positions type) (data type).split) ≤ Real.exp (-rateY type))
    (boundZ : ∀ type, ((data type).windowDegree Shape.z zClass (data type).fineZ
      ((data type).parentWindow (P := Positions type) (data type).fineZ (tolerance type)) : ℝ)/
      Fintype.card (TypedWord (P := Positions type) (data type).split) ≤ Real.exp (-rateZ type))
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (parentWindows (Positions := Positions) data (fun type => (data type).fineX) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance)) rank degree) :
    ∃ prime copies : ℕ, prime.Prime ∧
      (prime : ℝ) ≤ 2*modulusFactor base (scale k)*
        ((Fintype.card (PrescribedEdges Positions data) : ℝ)*Real.exp (-mixedRetention rateX rateY rateZ)) ∧
      Real.exp (mixedRetention rateX rateY rateZ)/(12*modulusFactor base (scale k))*
        Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      RankLE (directSum (fun _ : Fin copies => target (K := K) data q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)*(rank*(degree+1)^2)) := by
  let dx := ∏ type, (data type).coarseDegree (P := Positions type)
  let dy := ∏ type, (data type).windowDegree Shape.y yClass (data type).fineY
    ((data type).parentWindow (P := Positions type) (data type).fineY (tolerance type))
  let dz := ∏ type, (data type).windowDegree Shape.z zClass (data type).fineZ
    ((data type).parentWindow (P := Positions type) (data type).fineZ (tolerance type))
  have hx := degree_product_retention data reference _ rateX boundX
    (min_le_left (∑ type, rateX type) (min (∑ type, rateY type) (∑ type, rateZ type)))
  have hy := degree_product_retention data reference _ rateY boundY
    ((min_le_right (∑ type, rateX type) _).trans (min_le_left (∑ type, rateY type) (∑ type, rateZ type)))
  have hz := degree_product_retention data reference _ rateZ boundZ
    ((min_le_right (∑ type, rateX type) _).trans (min_le_right (∑ type, rateY type) (∑ type, rateZ type)))
  have requirements := sharedRequirement_bounds base (scale k) dx dy dz
  have requirementUpper := sharedRequirement_upper (base := base) (slack := scale k)
    (prescribed_positive data reference) (coarse_product_positive data reference) hx hy hz
  obtain ⟨prime, copies, primality, lower, upper, retained, repaired⟩ :=
    finite_mixed_prime_extraction data symmetric q reference supportY supportZ representativeX representativeY representativeZ
      tolerance positiveTolerance k bits rank degree (sharedRequirement base (scale k) dx dy dz) edgeBits multiplier
      positive largeRepair alphabet shapes populationLower populationUpper (baseLarge.trans requirements.1)
      (fun type => (lengthBound type).trans requirements.1) requirements.2.1 requirements.2.2.1 requirements.2.2.2 certificate
  have primeUpper : (prime : ℝ) ≤ 2*modulusFactor base (scale k)*
      ((Fintype.card (PrescribedEdges Positions data) : ℝ)*Real.exp (-mixedRetention rateX rateY rateZ)) := by
    have upperReal : (prime : ℝ) ≤ 2*(sharedRequirement base (scale k) dx dy dz : ℝ) := by exact_mod_cast upper
    exact upperReal.trans (by simpa only [mul_assoc] using
      mul_le_mul_of_nonneg_left requirementUpper (by norm_num : (0 : ℝ) ≤ 2))
  have factorPositive : 0 < 2*modulusFactor base (scale k) := by unfold modulusFactor; positivity
  have result := shared_modulus_retention (prescribed_positive data reference) primality.pos factorPositive primeUpper retained
  refine ⟨prime, copies, primality, primeUpper, ?_, repaired⟩
  convert result using 1
  ring

end
end MatrixBounds.Tensor.CW.Mixed
