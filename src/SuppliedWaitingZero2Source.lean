module

public import SuppliedLevel3Transition
public import WaitingZeroMatrixOrientation
public import ZeroWindowOrientation

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual level-three waiting children keep their complete original source,
strategy, child, and two preceding role labels and exact source windows. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2

open Tensor Tensor.CW Interface Entropy SuppliedPopulationPaths WaitingZeroMatrix DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 2000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- A complete preceding source/strategy/two-role history and its original zero leaf. -/
abbrev Label := Label3 × Fin 12

/-- Original complete child shape of a source zero-leaf column. -/
def child (zero : Fin 12) : ShapeAlphabet 4 := SuppliedChildKinds.child2Equiv.symm (.inl zero)

/-- Original source shape read from the complete supplied zero-child subarray. -/
def shape (zero : Fin 12) : Shape :=
  SuppliedShapeIndices.shapeAt 4 ((SuppliedShapeIndices.childColumns 4 false)[zero.val]?.getD 0)

/-- The original complete child classification names exactly its source zero leaf. -/
theorem child_kind (zero : Fin 12) : SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm (child zero)) = .inl zero := by
  have selected := SuppliedChildKinds.child2Equiv.apply_symm_apply (.inl zero)
  simpa only [SuppliedChildKinds.child2Equiv, Equiv.trans_apply, Equiv.ofBijective_apply] using! selected

/-- Original zero-leaf source shape agrees with its complete child shape in the checked transition. -/
theorem child_shape (zero : Fin 12) : (child zero).val = shape zero := by
  have selected := SuppliedNodeLookup.shapeAt_column 4 (child zero)
  have correct := SuppliedChildKinds.kind2_correct ((shapeColumnEquiv 4).symm (child zero))
  rw [child_kind] at correct
  have column := congrArg (fun entry : Option ℕ => entry.getD 0) correct
  unfold shape
  rw [column]
  exact selected.symm

/-- Exact doubled leaf coefficient after the original strategy and both role allocations. -/
def weight (label : Label) : ℕ := SuppliedLevel3Transition.childWeight label.1 (child label.2)

/-- Retain precisely the original strictly positive waiting coefficients before scaling. -/
abbrev Active := PositiveWeight weight

/-- Original complete zero-leaf law on each of its physical source axes. -/
def law (label : Label) (axis : Fin 3) : (Fin 2 → Fin 3) → ℝ :=
  OrbitLevel2.orbits.decode (fun orbit => (SuppliedLeafLaws.zeroMass label.1.source.1 label.2
    label.1.source.2 (shape label.2) axis orbit : ℝ))

/-- Actual source child fine laws coincide on all complete words and physical axes. -/
theorem child_law (label : Label) (axis : Fin 3) :
    SuppliedLeafLaws.law label.1.source.1 label.1.source.2 (child label.2) axis = law label axis := by
  unfold SuppliedLeafLaws.law SuppliedLeafLaws.mass
  simp only [child_kind, child_shape]
  rfl

/-- Complete source waiting window at the original population and inherited tolerance. -/
def sourceWindow {K : Type} [CommRing K] (label : Label) (size : ℕ) (tolerance : ℝ) :=
  SuppliedAllocationWindows.window (K := K) 2 (shape label.2) (weight label*size) (law label) tolerance

/-- The actual transition child has exactly the source zero-leaf window, without loosening a fine constraint. -/
def sourceRestriction {K : Type} [CommRing K] (label : Label) (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (SuppliedLevel3Transition.childWindow (K := K) label.1 (child label.2) size tolerance)
      (sourceWindow (K := K) label size tolerance) := by
  unfold SuppliedLevel3Transition.childWindow
  rw [child_shape]
  have laws : (fun axis => SuppliedLeafLaws.law label.1.source.1 label.1.source.2 (child label.2) axis) = law label :=
    funext (child_law label)
  rw [laws]
  exact CoordinateRestriction.refl _

/-- The full word expansion denominator already divides every actual original waiting coefficient. -/
theorem weight_divisible (label : Label) : 17592186044416*2 ∣ weight label := by
  unfold weight SuppliedLevel3Transition.childWeight weight3
  erw [child_scaled]
  unfold scaled
  exact dvd_mul_of_dvd_left (by norm_num [denominator] : 17592186044416*2 ∣ denominator^2) _

/-- Every growing original leaf population has integral complete-word counts. -/
theorem population_divisible (label : Label) (size : ℕ) : 17592186044416*2 ∣ weight label*size :=
  dvd_mul_of_dvd_left (weight_divisible label) size

/-- Canonical physical order that places this original leaf's zero coordinate last. -/
def order (label : Label) : AxisOrder :=
  zeroCanonicalOrder (SuppliedLeafLaws.zeroAxis (shape label.2)) (SuppliedLeafLaws.positiveAxis (shape label.2))

end
end MatrixBounds.Numeric.SuppliedWaitingZero2
