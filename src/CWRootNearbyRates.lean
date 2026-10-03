module

public import CWRootDegreeControl
public import CWRootRetentionContinuity
public import CWRootProfiles

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One child-window tolerance and population threshold control the real
collision degrees of every accepted exact tuple against fixed nominal laws. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Nominal root retention expressed in fixed child laws, independently of an exact profile tuple. -/
def nominalRetention (data : RootRestrictionData length) (ux uy uz : Fin (2*length+1) → ℝ)
    (lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  min (data.coarseRetention (P := P) ux uy uz)
    (min (data.lawRetention (P := P) yClass lawY) (data.lawRetention (P := P) zClass lawZ))

/-- An accepted root profile is coordinatewise close to its nominal law in every nonempty child pool. -/
theorem accepted_childLaw_close (data : RootRestrictionData length) (profiles : data.ChildProfileTuple)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (tolerance : ℝ)
    (accepted : data.profilesAccepted law tolerance profiles) (child : ShapeAlphabet (2*length))
    (nonempty : data.split child ≠ 0) (symbol : Fin length → Fin 3) :
    |data.childLaw (data.profileCounts profiles) child symbol-law child symbol| ≤ tolerance := by
  have positive : Fintype.card (data.ChildPositions child) ≠ 0 := by
    simpa only [ChildPositions, Fintype.card_fin] using nonempty
  simpa only [childLaw, profileCounts, ChildPositions, Fintype.card_fin] using (accepted child).resolve_left positive symbol

set_option maxHeartbeats 2000000 in
/-- Uniform nearby root profiles obey the same three degree bounds with only a prescribed positive rate loss. -/
theorem exists_nearby_degree_rate (length : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0, ∀ (P : Type*) [Fintype P] [Nonempty P], threshold ≤ Fintype.card P →
      ∀ (data : RootRestrictionData length) (_reference : data.PrescribedEdges (P := P))
        (ux uy uz : Fin (2*length+1) → ℝ), (∀ b, 0 < ux b) → (∀ b, 0 < uy b) → (∀ b, 0 < uz b) →
      ∀ (lawY lawZ : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ),
      (∀ child symbol, 0 ≤ lawY child symbol ∧ lawY child symbol ≤ 1) →
      (∀ child symbol, 0 ≤ lawZ child symbol ∧ lawZ child symbol ≤ 1) →
      ∀ (profileX profileY profileZ : data.ChildProfileTuple) (valid : data.ValidProfiles profileX profileY profileZ),
      data.profilesAccepted lawY delta profileY → data.profilesAccepted lawZ delta profileZ →
      let revised := data.reprofile profileX profileY profileZ valid
      let bound := Real.exp (-((Fintype.card P : ℝ)*(data.nominalRetention (P := P) ux uy uz lawY lawZ-error)))
      (revised.coarseDegree (P := P) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound ∧
      (revised.fineDegree (P := P) Shape.y yClass revised.fineY : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound ∧
      (revised.fineDegree (P := P) Shape.z zClass revised.fineZ : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound := by
  obtain ⟨coarseThreshold, coarse⟩ := exists_uniform_coarse_rate length positive
  obtain ⟨fineThreshold, fine⟩ := exists_uniform_fine_rate length (half_pos positive)
  obtain ⟨delta, positiveDelta, continuity⟩ := exists_uniform_retention_tolerance length (half_pos positive)
  refine ⟨max coarseThreshold fineThreshold, delta, positiveDelta, ?_⟩
  intro P finite nonempty large data reference ux uy uz positiveX positiveY positiveZ lawY lawZ rangeY rangeZ
    profileX profileY profileZ valid acceptedY acceptedZ revised bound
  obtain ⟨_, ⟨representativeY⟩, ⟨representativeZ⟩⟩ := data.valid_profiles_representatives profileX profileY profileZ valid
  have hx := coarse P ((le_max_left _ _).trans large) data reference ux uy uz positiveX positiveY positiveZ
  have fineBound (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
      (profiles : data.ChildProfileTuple) (representative : data.TargetParts (data.profileCounts profiles))
      (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
      (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
      (accepted : data.profilesAccepted law delta profiles) :
      (revised.fineDegree (P := P) axis axisClass (data.profileCounts profiles) : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤
        Real.exp (-(Fintype.card P : ℝ)*(data.lawRetention (P := P) axisClass law-error)) := by
    have counts := fine P ((le_max_right _ _).trans large) revised (data.prescribedWordEquiv reference)
      axis axisClass (data.profileCounts profiles) representative
    have changeRate := continuity P data (data.prescribedWordEquiv reference) axisClass
      (data.childLaw (data.profileCounts profiles)) law (data.childLaw_range _ representative) range
      (data.accepted_childLaw_close profiles law delta accepted)
    rw [← data.fineRetention_childLaw axisClass _ representative] at changeRate
    apply counts.trans
    apply Real.exp_le_exp.mpr
    have lower := (abs_lt.mp changeRate).1
    have multiplied := mul_le_mul_of_nonneg_left lower.le (Nat.cast_nonneg (Fintype.card P) : (0 : ℝ) ≤ _)
    nlinarith
  have hy := fineBound Shape.y yClass profileY representativeY lawY rangeY acceptedY
  have hz := fineBound Shape.z zClass profileZ representativeZ lawZ rangeZ acceptedZ
  have liftRate {degree : ℕ} {rate : ℝ}
      (pointwise : (degree : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ Real.exp (-(Fintype.card P : ℝ)*(rate-error)))
      (smaller : data.nominalRetention (P := P) ux uy uz lawY lawZ ≤ rate) :
      (degree : ℝ)/Fintype.card (TypedWord (P := P) data.split) ≤ bound := by
    apply pointwise.trans
    apply Real.exp_le_exp.mpr
    have multiplied := mul_le_mul_of_nonneg_left smaller (Nat.cast_nonneg (Fintype.card P) : (0 : ℝ) ≤ _)
    nlinarith
  exact ⟨liftRate hx (min_le_left _ _), liftRate hy ((min_le_right _ _).trans (min_le_left _ _)),
    liftRate hz ((min_le_right _ _).trans (min_le_right _ _))⟩

end
end MatrixBounds.Tensor.CW.RootRestrictionData
