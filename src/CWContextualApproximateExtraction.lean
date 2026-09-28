import CWContextualNearbyExtraction
import CWContextualProfileGluing

/-! Complete finite approximate mixed extraction. One fixed nominal parent
tensor supplies a common batch in every context of the full accepted child interface.
All exact types, including zero and empty sectors, are accounted for. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v u
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {Positions : T → Type u}
variable [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- A nominal parent tensor supplies complete approximate mixed child batches in every context, with explicit retention, repair, and gluing costs. -/
theorem finite_contextual_approximate_extraction (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (q : ℕ) (reference : PrescribedEdges Positions data)
    {error : ℝ} (positiveError : 0 < error) (wide : T → ℝ)
    (parameters : ∀ type, SplitRestrictionData.NearbyParameters.{u} (length type) positiveError (wide type))
    (populationLarge : ∀ type, (parameters type).control.threshold ≤ Fintype.card (Positions type))
    (lawX lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (rangeX : ∀ type child symbol, 0 ≤ lawX type child symbol ∧ lawX type child symbol ≤ 1)
    (rangeY : ∀ type child symbol, 0 ≤ lawY type child symbol ∧ lawY type child symbol ≤ 1)
    (rangeZ : ∀ type child symbol, 0 ≤ lawZ type child symbol ∧ lawZ type child symbol ≤ 1)
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (positiveX : ∀ type b, 0 < ux type b) (positiveY : ∀ type b, 0 < uy type b) (positiveZ : ∀ type b, 0 < uz type b)
    (k bits base : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier (fun type => (parameters type).control.tolerance)+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base) :
    ContextReduction.{v} (parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX wide) (nominalWindows (Positions := Positions) data lawY wide)
      (nominalWindows (Positions := Positions) data lawZ wide))
      (directSum (fun _ : Fin (nominalCopies (Positions := Positions) data base k
      (nominalRetention (Positions := Positions) data ux uy uz lawY lawZ error)) =>
      approximateTarget (K := K) data q lawX lawY lawZ (fun type => (parameters type).delta)))
      ((Fintype.card (ChildProfileTuple data))^3 *
        2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  apply contextReduction_glue_mixed_profiles
  intro profileX profileY profileZ valid acceptedX acceptedY acceptedZ
  exact finite_contextual_nearby_profile_batch data symmetric q reference positiveError wide parameters populationLarge
    lawX lawY lawZ rangeX rangeY rangeZ ux uy uz positiveX positiveY positiveZ
    k bits base edgeBits multiplier positive largeRepair alphabet shapes
    populationLower populationUpper baseLarge lengthBound
    profileX profileY profileZ valid acceptedX acceptedY acceptedZ

end
end MatrixBounds.Tensor.CW.Mixed
