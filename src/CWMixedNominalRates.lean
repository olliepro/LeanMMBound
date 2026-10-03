module

public import CWMixedProfileFacts
public import CWNearbyParameters
public import CWMixedRateExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every accepted valid exact tuple has the same nominal degree-rate bounds.
The entropy rates depend on the fixed nominal child laws and coarse data,
not on the particular nearby integer profile tuple. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type*} {Positions : T → Type u} [∀ type, Fintype (Positions type)]
variable [∀ type, Nonempty (Positions type)] {length : T → ℕ}

/-- Coarse retention contribution of each parent type at the prescribed total entropy loss. -/
def nominalCoarseRate (data : ∀ type, SplitRestrictionData (length type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ) (error : ℝ) (type : T) : ℝ :=
  (Fintype.card (Positions type) : ℝ)*((data type).coarseRetention (P := Positions type) (ux type) (uy type) (uz type)-error)

/-- Fine retention contribution of each parent type at its fixed nominal child law. -/
def nominalFineRate (data : ∀ type, SplitRestrictionData (length type))
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) (type : T) : ℝ :=
  (Fintype.card (Positions type) : ℝ)*((data type).lawRetention (P := Positions type) (axisClass type) (law type)-error)

/-- Actual reprofiled coarse degrees satisfy the nominal coarse contribution, uniformly over every valid tuple. -/
theorem reprofile_coarse_rate (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) {error : ℝ} (positive : 0 < error) (wide : T → ℝ)
    (parameters : ∀ type, SplitRestrictionData.NearbyParameters.{u} (length type) positive (wide type))
    (large : ∀ type, (parameters type).control.threshold ≤ Fintype.card (Positions type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (positiveX : ∀ type b, 0 < ux type b) (positiveY : ∀ type b, 0 < uy type b) (positiveZ : ∀ type b, 0 < uz type b)
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ) (type : T) :
    ((reprofile data profileX profileY profileZ valid type).coarseDegree (P := Positions type) : ℝ)/
      Fintype.card (TypedWord (P := Positions type) (data type).split) ≤
      Real.exp (-nominalCoarseRate (Positions := Positions) data ux uy uz error type) := by
  have bound := (parameters type).control.coarse (Positions type) (large type) (data type) (reference type)
    (ux type) (uy type) (uz type) (positiveX type) (positiveY type) (positiveZ type)
  apply bound.trans
  apply Real.exp_le_exp.mpr
  unfold nominalCoarseRate
  have population : (0 : ℝ) ≤ Fintype.card (Positions type) := Nat.cast_nonneg _
  nlinarith

/-- Actual reprofiled accepted fine degrees satisfy the fixed nominal-law contribution for all nearby profiles. -/
theorem reprofile_fine_rate (data : ∀ type, SplitRestrictionData (length type))
    (symmetric : ∀ type, (data type).Symmetric) (reference : PrescribedEdges Positions data)
    {error : ℝ} (positive : 0 < error) (wide : T → ℝ)
    (parameters : ∀ type, SplitRestrictionData.NearbyParameters.{u} (length type) positive (wide type))
    (large : ∀ type, (parameters type).control.threshold ≤ Fintype.card (Positions type))
    (profileX profileY profileZ : ChildProfileTuple data) (valid : ValidProfiles data profileX profileY profileZ)
    (axis : Shape → ℕ) (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profiles : ChildProfileTuple data) (representative : TargetParts data (profileCounts data profiles))
    (support : ∀ type child block, fineTotal block ≠ axis child.val → profileCounts data profiles type child block = 0)
    (law : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (range : ∀ type child symbol, 0 ≤ law type child symbol ∧ law type child symbol ≤ 1)
    (accepted : profilesAccepted data law (fun type => (parameters type).delta) profiles) (type : T) :
    ((reprofile data profileX profileY profileZ valid type).windowDegree axis (axisClass type) (profileCounts data profiles type)
      ((data type).parentWindow (P := Positions type) (profileCounts data profiles type) (parameters type).control.tolerance) : ℝ)/
      Fintype.card (TypedWord (P := Positions type) (data type).split) ≤
      Real.exp (-nominalFineRate (Positions := Positions) data axisClass law error type) := by
  have close := accepted_childLaw_close data profiles representative law (fun type => (parameters type).delta)
    (fun type => (parameters type).positiveDelta.le) accepted type
  have bound := (parameters type).degree_bound (Positions type) (large type) (data type) (symmetric type) (reference type)
    axis additive (axisClass type) (profileCounts data profiles type) (support type) (representative type)
    ((data type).activeLaw (law type)) ((data type).activeLaw_range (law type) (range type)) close
  rw [(data type).lawRetention_active (symmetric type) (axisClass type) (law type)] at bound
  simpa only [nominalFineRate, neg_mul] using! bound

end
end MatrixBounds.Tensor.CW.Mixed
