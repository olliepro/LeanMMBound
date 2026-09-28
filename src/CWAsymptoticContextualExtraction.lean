import CWExtractionSchedule
import CWContextualApproximateExtraction

/-! Quantified complete mixed extraction. The child windows and threshold
are fixed before all populations and integer profiles. Actual approximate
CW tensors are produced with arbitrarily small retention and overhead rates in every tensor context. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v u
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]

/-- Every positive available parent window permits complete approximate mixed extraction, uniformly over large feasible populations; all finite costs have quantified vanishing rates. -/
theorem eventual_contextual_approximate_extraction (length : T → ℕ) (q : ℕ)
    {degreeError copyError costError rateGrowth : ℝ}
    (degreePositive : 0 < degreeError) (copyPositive : 0 < copyError) (costPositive : 0 < costError)
    (rateNonnegative : 0 ≤ rateGrowth) (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    (edgeBits multiplier : T → ℕ) (bits base : ℕ)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base)
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (rangeX : ∀ type child symbol, 0 ≤ lawX type child symbol ∧ lawX type child symbol ≤ 1)
    (rangeY : ∀ type child symbol, 0 ≤ lawY type child symbol ∧ lawY type child symbol ≤ 1)
    (rangeZ : ∀ type child symbol, 0 ≤ lawZ type child symbol ∧ lawZ type child symbol ≤ 1)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (positiveX : ∀ type b, 0 < ux type b) (positiveY : ∀ type b, 0 < uy type b) (positiveZ : ∀ type b, 0 < uz type b) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ, ∀ k : ℕ, threshold ≤ k →
      ∀ (Positions : T → Type u) [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)]
        (data : ∀ type, SplitRestrictionData (length type)) (_symmetric : ∀ type, (data type).Symmetric)
        (_reference : PrescribedEdges Positions data),
        (∀ type, scale k ≤ multiplier type*Fintype.card (Positions type)) →
        (∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k) →
        -(rateGrowth*scale k) ≤ nominalRetention (Positions := Positions) data ux uy uz lawY lawZ degreeError →
        ∃ copies overhead : ℕ,
          Real.exp (nominalRetention (Positions := Positions) data ux uy uz lawY lawZ degreeError-copyError*scale k) ≤ copies ∧
          (overhead : ℝ) ≤ Real.exp (costError*scale k) ∧
          ContextReduction.{v} (parentInterface (K := K) data q
            (nominalWindows (Positions := Positions) data lawX wide) (nominalWindows (Positions := Positions) data lawY wide)
            (nominalWindows (Positions := Positions) data lawZ wide))
            (directSum (fun _ : Fin copies => approximateTarget (K := K) data q lawX lawY lawZ delta)) overhead := by
  let parameters := fun type => SplitRestrictionData.nearbyParameters.{u} (length type) degreePositive (widePositive type)
  obtain ⟨threshold, schedule⟩ := exists_approximate_schedule length degreePositive copyPositive costPositive
    rateNonnegative wide parameters edgeBits multiplier bits base 0
  refine ⟨fun type => (parameters type).delta, fun type => (parameters type).positiveDelta, threshold, ?_⟩
  intro k large Positions finite nonempty data symmetric reference populationLower populationUpper retentionLower
  obtain ⟨positive, repairLarge, populationLarge, copiesBound, overheadBound⟩ := schedule k large
  let retention := nominalRetention (Positions := Positions) data ux uy uz lawY lawZ degreeError
  let overhead := extractionOverhead data (repairGrowth length edgeBits multiplier bits) 0 k
  refine ⟨nominalCopies (Positions := Positions) data base k retention, overhead,
    copiesBound Positions data reference retention shapes populationUpper retentionLower, ?_, ?_⟩
  · exact overheadBound 0 (Nat.zero_le _) Positions data reference populationUpper
  · have extraction := finite_contextual_approximate_extraction.{v} (K := K) data symmetric q reference degreePositive wide parameters
      (populationLarge Positions populationLower) lawX lawY lawZ rangeX rangeY rangeZ ux uy uz positiveX positiveY positiveZ
      k bits base edgeBits multiplier positive repairLarge alphabet shapes populationLower populationUpper
      baseLarge lengthBound
    convert extraction using 1
    unfold overhead extractionOverhead
    simp only [Nat.zero_add, one_pow, Nat.mul_one]

end
end MatrixBounds.Tensor.CW.Mixed
