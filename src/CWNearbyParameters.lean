module

public import CWNearbyDegreeRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Fixed population-independent choices of parent and child tolerances for an
available nominal parent window. These choices are constructed for every
positive entropy loss and every positive available window width. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

universe u
open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Uniform child-law tolerance supplied by the proved nearby-degree theorem. -/
def nearbyTolerance (length : ℕ) {error : ℝ} (positive : 0 < error) : ℝ :=
  Classical.choose (exists_uniform_nearby_degree_rate.{u} length positive)

/-- The chosen uniform child tolerance is strictly positive. -/
theorem nearbyTolerance_positive (length : ℕ) {error : ℝ} (positive : 0 < error) :
    0 < nearbyTolerance.{u} length positive := (Classical.choose_spec (exists_uniform_nearby_degree_rate.{u} length positive)).1

/-- Fixed thresholds and tolerances satisfy both the nominal rate estimate and the available-window margin. -/
structure NearbyParameters (length : ℕ) {error : ℝ} (positive : 0 < error) (wide : ℝ) where
  /-- Uniform degree control with half of the total allowed rate loss. -/
  control : DegreeControl.{u} length (error/2)
  /-- Width of the accepted approximate child profiles. -/
  delta : ℝ
  /-- The output child window is nontrivial. -/
  positiveDelta : 0 < delta
  /-- Child profiles lie within the proved uniform entropy tolerance. -/
  uniform : delta ≤ nearbyTolerance.{u} length positive
  /-- Every nearby exact extraction window fits inside the available parent window. -/
  margin : control.tolerance+2*delta ≤ wide

/-- Construct fixed parent/child tolerances; for example any positive available width permits further extraction with a smaller positive child width. -/
def nearbyParameters (length : ℕ) {error wide : ℝ} (positive : 0 < error) (widePositive : 0 < wide) :
    NearbyParameters.{u} length positive wide := by
  let original : DegreeControl.{u} length (error/2) := degreeControl length (half_pos positive)
  let control := original.shrink (lt_min original.positiveTolerance (half_pos widePositive)) (min_le_left _ _)
  refine {
    control := control
    delta := min (nearbyTolerance.{u} length positive) (wide/4)
    positiveDelta := lt_min (nearbyTolerance_positive length positive) (by positivity)
    uniform := min_le_left _ _
    margin := ?_ }
  have parentBound : control.tolerance ≤ wide/2 := min_le_right _ _
  have childBound := min_le_right (nearbyTolerance.{u} length positive) (wide/4)
  linarith

/-- The selected parameters give the nominal fine-axis rate for all accepted nearby exact profiles. -/
theorem NearbyParameters.degree_bound {length : ℕ} {error wide : ℝ} {positive : 0 < error}
    (parameters : NearbyParameters.{u} length positive wide) (P : Type u) [Fintype P] [Nonempty P]
    (large : parameters.control.threshold ≤ Fintype.card P)
    (data : SplitRestrictionData length) (symmetric : data.Symmetric) (reference : data.PrescribedEdges (P := P))
    (axis : Shape → ℕ) (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (support : ∀ child block, fineTotal block ≠ axis child.val → profile child block = 0)
    (representative : data.TargetParts profile) (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
    (close : ∀ child symbol, |data.childLaw profile child symbol-law child symbol| ≤ parameters.delta) :
    (data.windowDegree axis axisClass profile (Within (P := P) (data.parentCenter (P := P) profile) parameters.control.tolerance) : ℝ)/
        Fintype.card (TypedWord (P := P) data.split) ≤
      Real.exp (-(Fintype.card P : ℝ)*(data.lawRetention (P := P) axisClass law-error)) := by
  exact (Classical.choose_spec (exists_uniform_nearby_degree_rate.{u} length positive)).2
    P parameters.control large data symmetric reference axis additive axisClass profile support representative law range
    (fun child symbol => (close child symbol).trans parameters.uniform)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
