import CWRootNearbyRates
import CWRootRateExtraction
import ContextUniformCopies

/-! Every nearby exact root profile is extracted from the same unrestricted
source. A common copy count permits their full contextual gluing. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric RepairRates Selection
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- The common retained root batch depends only on nominal data, never on the selected exact fine tuple. -/
def nominalCopies {P : Type*} [Fintype P] {length : ℕ} (data : RootRestrictionData length)
    (base k : ℕ) (rate : ℝ) : ℕ :=
  retainedCopies (12*modulusFactor base (scale k)) rate
    (2*modulusFactor base (scale k)*((Fintype.card (TypedWord (P := P) data.split) : ℝ)*Real.exp (-rate)))

set_option maxHeartbeats 3000000 in
/-- One positive output window gives a full approximate root extraction for every feasible split population.
The finite rank overhead includes all exact-profile gluing and all hole repair. -/
theorem exists_finite_approximate_extraction (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ (P : Type*) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
      ∀ (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P))
        (ux uy uz : Fin (2*length+1) → ℝ), (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      ∀ (lawX lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ lawY child symbol ∧ lawY child symbol ≤ 1) →
      (∀ child symbol, 0 ≤ lawZ child symbol ∧ lawZ child symbol ≤ 1) →
      ∀ (q k bits edgeBits multiplier base : ℕ), 3 ≤ k → q+2 ≤ 2^bits →
      Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits → Fintype.card P ≤ multiplier*scale k →
      2 ≤ base → 2*length ≤ base →
      ContextReduction.{v} (rootPower (K := K) (P := P) q length)
        (directSum (fun _ : Fin (data.nominalCopies (P := P) base k
          ((Fintype.card P : ℝ)*(data.nominalRetention (P := P) ux uy uz lawY lawZ-error))) =>
          data.approximateTarget (K := K) q lawX lawY lawZ delta))
        ((Fintype.card data.ChildProfileTuple)^3*2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  obtain ⟨threshold, delta, positiveDelta, degrees⟩ := exists_nearby_degree_rate length positive
  refine ⟨threshold, delta, positiveDelta, ?_⟩
  intro P finite nonempty large data reference ux uy uz positiveX positiveY positiveZ lawX lawY lawZ rangeY rangeZ
    q k bits edgeBits multiplier base largeRepair alphabet shapes population baseLarge lengthBound
  apply contextReduction_glue_profiles
  intro profileX profileY profileZ valid _acceptedX acceptedY acceptedZ
  obtain ⟨⟨representativeX⟩, ⟨representativeY⟩, ⟨representativeZ⟩⟩ := data.valid_profiles_representatives profileX profileY profileZ valid
  let revised := data.reprofile profileX profileY profileZ valid
  have degreeBounds := degrees P large data reference ux uy uz positiveX positiveY positiveZ lawY lawZ rangeY rangeZ
    profileX profileY profileZ valid acceptedY acceptedZ
  have extraction := finite_rate_extraction.{v} (K := K) revised q reference
    (fun child => (valid child).supportY) (fun child => (valid child).supportZ)
    representativeX representativeY representativeZ k bits edgeBits multiplier base largeRepair alphabet shapes population
    baseLarge lengthBound ((Fintype.card P : ℝ)*(data.nominalRetention (P := P) ux uy uz lawY lawZ-error))
    degreeBounds.1 degreeBounds.2.1 degreeBounds.2.2
  apply contextReduction_uniform_retained_batch _ _ (by unfold modulusFactor; positivity)
  obtain ⟨prime, copies, primality, primeBound, countBound, extracted⟩ := extraction
  refine ⟨prime, copies, primality.pos, primeBound, countBound, ?_⟩
  exact extracted

end
end MatrixBounds.Tensor.CW.RootRestrictionData
