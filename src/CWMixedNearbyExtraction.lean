import CWReprofiledSource
import UniformRetainedBatch

/-! Every accepted valid exact tuple receives the same retained-copy count and
rank budget from the fixed nominal source. The selected hash prime may vary,
but a single nominal prime cap removes that variation before type gluing. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K] {Positions : T → Type u}
variable [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Total nominal retention compares the three axes only after summing all type contributions. -/
def nominalRetention (data : ∀ type, SplitRestrictionData (length type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) : ℝ :=
  mixedRetention (nominalCoarseRate (Positions := Positions) data ux uy uz error)
    (nominalFineRate (Positions := Positions) data (fun _ => yClass) lawY error)
    (nominalFineRate (Positions := Positions) data (fun _ => zClass) lawZ error)

/-- One integer retained-copy count applies to all nearby profiles at the same nominal retention. -/
def nominalCopies (data : ∀ type, SplitRestrictionData (length type)) (base k : ℕ) (retention : ℝ) : ℕ :=
  retainedCopies (12*modulusFactor base (scale k)) retention
    (2*modulusFactor base (scale k)*((Fintype.card (PrescribedEdges Positions data) : ℝ)*Real.exp (-retention)))

/-- One fixed nominal source supplies a uniform batch for every accepted valid exact child tuple. -/
theorem finite_nearby_profile_batch (data : ∀ type, SplitRestrictionData (length type))
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
    (k bits rank degree base : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier (fun type => (parameters type).control.tolerance)+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (baseLarge : 2 ≤ base) (lengthBound : ∀ type, 2*length type ≤ base)
    (certificate : Degeneration.Certificate (parentInterface (K := K) data q
      (nominalWindows (Positions := Positions) data lawX wide) (nominalWindows (Positions := Positions) data lawY wide)
      (nominalWindows (Positions := Positions) data lawZ wide)) rank degree)
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ)
    (acceptedX : profilesAccepted data lawX (fun type => (parameters type).delta) profileX)
    (acceptedY : profilesAccepted data lawY (fun type => (parameters type).delta) profileY)
    (acceptedZ : profilesAccepted data lawZ (fun type => (parameters type).delta) profileZ) :
    RankLE (directSum (fun _ : Fin (nominalCopies (Positions := Positions) data base k
      (nominalRetention (Positions := Positions) data ux uy uz lawY lawZ error)) => profileTarget (K := K) data q profileX profileY profileZ))
      (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)*(rank*(degree+1)^2)) := by
  obtain ⟨⟨representativeX⟩, ⟨representativeY⟩, ⟨representativeZ⟩⟩ := valid_profiles_representatives data profileX profileY profileZ valid
  have source := reprofileSourceCertificate data symmetric q reference positiveError wide parameters lawX lawY lawZ
    rangeX rangeY rangeZ profileX profileY profileZ valid representativeX representativeY representativeZ acceptedX acceptedY acceptedZ certificate
  have output := finite_mixed_rate_extraction (reprofile data profileX profileY profileZ valid)
    (reprofile_symmetric data profileX profileY profileZ valid symmetric) q (reprofileReference data profileX profileY profileZ valid reference)
    (fun type child => (valid type child).supportY) (fun type child => (valid type child).supportZ)
    representativeX representativeY representativeZ (fun type => (parameters type).control.tolerance)
    (fun type => (parameters type).control.positiveTolerance) k bits rank degree base edgeBits multiplier positive largeRepair
    alphabet shapes populationLower populationUpper baseLarge lengthBound
    (nominalCoarseRate (Positions := Positions) data ux uy uz error)
    (nominalFineRate (Positions := Positions) data (fun _ => yClass) lawY error)
    (nominalFineRate (Positions := Positions) data (fun _ => zClass) lawZ error)
    (reprofile_coarse_rate data reference positiveError wide parameters populationLarge ux uy uz positiveX positiveY positiveZ profileX profileY profileZ valid)
    (reprofile_fine_rate data symmetric reference positiveError wide parameters populationLarge profileX profileY profileZ valid
      Shape.y (fun _ _ => rfl) (fun _ => yClass) profileY representativeY (fun type child => (valid type child).supportY) lawY rangeY acceptedY)
    (reprofile_fine_rate data symmetric reference positiveError wide parameters populationLarge profileX profileY profileZ valid
      Shape.z (fun _ _ => rfl) (fun _ => zClass) profileZ representativeZ (fun type child => (valid type child).supportZ) lawZ rangeZ acceptedZ) source
  apply rankLE_uniform_retained_batch _ (by unfold modulusFactor; positivity)
  obtain ⟨prime, copies, primality, cap, retained, repaired⟩ := output
  refine ⟨prime, copies, primality.pos, cap, retained, ?_⟩
  simpa only [target_reprofile] using repaired

end
end MatrixBounds.Tensor.CW.Mixed
