module

public import CWRootPrimeExtraction
public import SharedModulusRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A common bound on the three actual root degrees gives a complete finite
extraction with explicit prime size, retained copies, and repair overhead. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric HashCounting Extraction RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

omit [CommRing K] in
/-- The complete root graph has positive maximum coarse degree because the reference shares its own vertex. -/
theorem coarse_degree_positive (data : RootRestrictionData length) (reference : data.PrescribedEdges (P := P)) :
    0 < data.coarseDegree (P := P) := by
  let fiber := {other : data.Edges (P := P) //
    marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) reference.val}
  letI : Nonempty fiber := ⟨⟨reference.val, rfl⟩⟩
  apply (Nat.card_pos (α := fiber)).trans_le
  exact Finset.le_sup (f := fun edge : data.Edges (P := P) => Nat.card {other : data.Edges (P := P) //
    marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) edge})
    (Finset.mem_univ reference.val)

/-- Root degree rates yield complete child copies with a controlled prime and explicit subexponential losses. -/
theorem finite_rate_extraction (data : RootRestrictionData length) (q : ℕ)
    (reference : data.PrescribedEdges (P := P))
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ) (k bits edgeBits multiplier base : ℕ) (largeRepair : 3 ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale k) (baseLarge : 2 ≤ base) (lengthBound : 2*length ≤ base)
    (rate : ℝ)
    (boundX : (data.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ Real.exp (-rate))
    (boundY : (data.fineDegree (P := P) Shape.y yClass data.fineY : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ Real.exp (-rate))
    (boundZ : (data.fineDegree (P := P) Shape.z zClass data.fineZ : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ Real.exp (-rate)) :
    ∃ prime copies : ℕ, prime.Prime ∧
      (prime : ℝ) ≤ 2*modulusFactor base (scale k)*
        ((Fintype.card (TypedWord (P := P) data.split) : ℝ)*Real.exp (-rate)) ∧
      Real.exp rate/(12*modulusFactor base (scale k))*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      ContextReduction.{v} (rootPower (K := K) (P := P) q length)
        (directSum (fun _ : Fin copies => data.target (K := K) q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  letI : Nonempty (TypedWord (P := P) data.split) := ⟨data.prescribedWordEquiv reference⟩
  let dx := data.coarseDegree (P := P)
  let dy := data.fineDegree (P := P) Shape.y yClass data.fineY
  let dz := data.fineDegree (P := P) Shape.z zClass data.fineZ
  have requirements := sharedRequirement_bounds base (scale k) dx dy dz
  have requirementUpper := sharedRequirement_upper (base := base) (slack := scale k)
    Fintype.card_pos (data.coarse_degree_positive reference) boundX boundY boundZ
  obtain ⟨prime, copies, primality, lower, upper, retained, repaired⟩ :=
    finite_prime_extraction.{v} (K := K) data q reference supportY supportZ representativeX representativeY representativeZ
      k bits edgeBits multiplier (sharedRequirement base (scale k) dx dy dz) largeRepair alphabet shapes population
      (baseLarge.trans requirements.1) (lengthBound.trans requirements.1)
      requirements.2.1 requirements.2.2.1 requirements.2.2.2
  have primeUpper : (prime : ℝ) ≤ 2*modulusFactor base (scale k)*
      ((Fintype.card (TypedWord (P := P) data.split) : ℝ)*Real.exp (-rate)) := by
    have upperReal : (prime : ℝ) ≤ 2*(sharedRequirement base (scale k) dx dy dz : ℝ) := by exact_mod_cast upper
    exact upperReal.trans (by simpa only [mul_assoc] using
      mul_le_mul_of_nonneg_left requirementUpper (by norm_num : (0 : ℝ) ≤ 2))
  have factorPositive : 0 < 2*modulusFactor base (scale k) := by unfold modulusFactor; positivity
  have result := shared_modulus_retention Fintype.card_pos primality.pos factorPositive primeUpper retained
  refine ⟨prime, copies, primality, primeUpper, ?_, repaired⟩
  convert result using 1
  ring

end
end MatrixBounds.Tensor.CW.RootRestrictionData
