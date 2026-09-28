import SuppliedHigherLaws
import SuppliedLeafOrbitMass
import RationalOrbitValidity

/-! Exact rational orbit masses at every higher source hierarchy position,
proved to decode to the corresponding actual complete tensor laws. -/
namespace MatrixBounds.Numeric.SuppliedHigherOrbitMass

open Tensor.CW Entropy SuppliedLeafLaws
open scoped BigOperators
noncomputable section

/-- Exact four-letter zero-orbit masses in the original physical orientation. -/
def zero3 (node : Fin 840) (shape : Shape) (axis : Fin 3) : Fin 21 → ℚ :=
  (SuppliedTypedParameters.zero3 node).orientedOrbitMass 0 OrbitLevel3.complement
    (zeroAxis shape) (positiveAxis shape) axis

/-- Complete exact rational child masses, retaining the original absent-pair zero entries. -/
def child3 (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) : Fin 21 → ℚ :=
  match SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => fun _ => 0
  | some (Sum.inl node) => SuppliedLeafOrbitMass.mixed3 node axis
  | some (Sum.inr node) => zero3 node child.val axis

/-- The rational hierarchy child row decodes to the complete actual source law at every pair. -/
theorem child3_decode (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) :
    SuppliedHigherLaws.child3 parent child axis =
      OrbitLevel3.orbits.decode (fun orbit => (child3 parent child axis orbit : ℝ)) := by
  unfold SuppliedHigherLaws.child3 child3
  cases SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => funext word; simp only [Rat.cast_zero, OrbitMap.decode, zero_div]
  | some node =>
    cases node with
    | inl node => exact SuppliedLeafOrbitMass.mixed3_decode node axis
    | inr node => rfl

/-- Every supported rational hierarchy child row is a complete nonnegative probability distribution. -/
theorem child3_valid (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3)
    (fits : child.val.Fits (SuppliedHierarchyParents.parent4 parent)) :
    (∀ orbit, 0 ≤ child3 parent child axis orbit) ∧ ∑ orbit, child3 parent child axis orbit = 1 := by
  apply OrbitLevel3.orbits.rational_valid_of_decode
  · intro word
    rw [← child3_decode]
    exact (SuppliedHigherLaws.child3_range parent child axis word).1
  · rw [← child3_decode]
    exact SuppliedHigherLaws.child3_total parent child axis fits

/-- Exact rational compressed eight-letter parent masses, using only the original rational split and child laws. -/
def parent4 (parent : Fin 105) (axis : Fin 3) : Fin 231 → ℚ :=
  splitParentMass (SuppliedTypedParameters.level4Split parent) OrbitLevel4.encoding
    OrbitLevel3.orbits (fun child => child3 parent child axis)

/-- The exact rational parent row decodes to the actual complete eight-letter extraction parent. -/
theorem parent4_decode (parent : Fin 105) (axis : Fin 3) :
    SuppliedHigherLaws.parent4 parent axis =
      OrbitLevel4.orbits.decode (fun orbit => (parent4 parent axis orbit : ℝ)) := by
  unfold parent4 SuppliedHigherLaws.parent4
  simp_rw [child3_decode, splitParentMass_cast]
  exact (SuppliedTypedParameters.level4Split parent).parentLaw_decode OrbitLevel4.encoding OrbitLevel3.orbits
    (fun child orbit => (child3 parent child axis orbit : ℝ))

/-- Every original rational eight-letter parent row is a nonnegative probability distribution. -/
theorem parent4_valid (parent : Fin 105) (axis : Fin 3) :
    (∀ orbit, 0 ≤ parent4 parent axis orbit) ∧ ∑ orbit, parent4 parent axis orbit = 1 := by
  apply OrbitLevel4.orbits.rational_valid_of_decode
  · intro word
    rw [← parent4_decode]
    exact (SuppliedHigherLaws.parent4_range parent axis word).1
  · rw [← parent4_decode]
    exact SuppliedHigherLaws.parent4_total parent axis

/-- Exact eight-letter zero-orbit masses in the original physical orientation. -/
def zero4 (child : Fin 48) (shape : Shape) (axis : Fin 3) : Fin 231 → ℚ :=
  (SuppliedTypedParameters.zero4 child).orientedOrbitMass 0 OrbitLevel4.complement
    (zeroAxis shape) (positiveAxis shape) axis

/-- Complete exact source root-child masses over all 153 original shape columns. -/
def root4 (child : ShapeAlphabet 16) (axis : Fin 3) : Fin 231 → ℚ :=
  match SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | Sum.inl zero => zero4 zero child.val axis
  | Sum.inr positive => parent4 positive axis

/-- Exact rational root-child masses decode to the actual complete supplied root-child laws. -/
theorem root4_decode (child : ShapeAlphabet 16) (axis : Fin 3) :
    SuppliedHigherLaws.root4 child axis =
      OrbitLevel4.orbits.decode (fun orbit => (root4 child axis orbit : ℝ)) := by
  unfold root4 SuppliedHigherLaws.root4
  cases SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | inl zero => rfl
  | inr positive => exact parent4_decode positive axis

/-- Every complete rational root-child row is nonnegative and exactly normalized. -/
theorem root4_valid (child : ShapeAlphabet 16) (axis : Fin 3) :
    (∀ orbit, 0 ≤ root4 child axis orbit) ∧ ∑ orbit, root4 child axis orbit = 1 := by
  apply OrbitLevel4.orbits.rational_valid_of_decode
  · intro word
    rw [← root4_decode]
    exact (SuppliedHigherLaws.root4_range child axis word).1
  · rw [← root4_decode]
    exact SuppliedHigherLaws.root4_total child axis

/-- The actual eight-letter positive parent entropy has an exact rational logarithmic expansion. -/
theorem parent4_entropy (parent : Fin 105) (axis : Fin 3) :
    rationalLogValue (orbitEntropyExpression (parent4 parent axis) OrbitLevel4.orbits.size) =
      entropy (SuppliedHigherLaws.parent4 parent axis) := by
  rw [parent4_decode]
  exact orbitEntropyExpression_value OrbitLevel4.orbits (parent4 parent axis)

/-- The actual complete source root-child entropy has an exact rational logarithmic expansion. -/
theorem root4_entropy (child : ShapeAlphabet 16) (axis : Fin 3) :
    rationalLogValue (orbitEntropyExpression (root4 child axis) OrbitLevel4.orbits.size) =
      entropy (SuppliedHigherLaws.root4 child axis) := by
  rw [root4_decode]
  exact orbitEntropyExpression_value OrbitLevel4.orbits (root4 child axis)

end
end MatrixBounds.Numeric.SuppliedHigherOrbitMass
