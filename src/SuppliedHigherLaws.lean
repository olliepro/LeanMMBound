module

public import SuppliedLeafLaws
public import SuppliedZeroLaws
public import SuppliedNodeLookup
public import SuppliedHierarchyParents
public import CWRationalSupportedTotals

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual complete fine laws throughout the original higher hierarchy. Missing
source children retain their original zero law and are proved irrelevant to normalized parents. -/
namespace MatrixBounds.Numeric.SuppliedHigherLaws

open Tensor.CW Entropy SuppliedLeafLaws
open scoped BigOperators
noncomputable section

/-- The supplied four-letter zero-coordinate law in its original physical-axis orientation. -/
def zero3 (node : Fin 840) (shape : Shape) (axis : Fin 3) : (Fin 4 → Fin 3) → ℝ :=
  (SuppliedTypedParameters.zero3 node).orientedLaw OrbitLevel3.orbits 0 OrbitLevel3.complement
    (zeroAxis shape) (positiveAxis shape) axis

/-- All actual four-letter zero laws have unit-interval coordinates. -/
theorem zero3_range (node : Fin 840) (shape : Shape) (axis : Fin 3) (word : Fin 4 → Fin 3) :
    0 ≤ zero3 node shape axis word ∧ zero3 node shape axis word ≤ 1 :=
  (SuppliedTypedParameters.zero3 node).orientedLaw_range (by decide) _ _ _ _ _ _ word

/-- All actual four-letter zero laws are normalized. -/
theorem zero3_total (node : Fin 840) (shape : Shape) (axis : Fin 3) :
    (∑ word, zero3 node shape axis word) = 1 :=
  (SuppliedTypedParameters.zero3 node).orientedLaw_total (by decide) _ _ _ _ _ _

/-- Complete source child law at a level-four parent, preserving absent pairs as zero. -/
def child3 (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) : (Fin 4 → Fin 3) → ℝ :=
  match SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => fun _ => 0
  | some (Sum.inl node) => mixed3 node axis
  | some (Sum.inr node) => zero3 node child.val axis

/-- Every source child fine-law coordinate is bounded, including absent pairs. -/
theorem child3_range (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3) (word : Fin 4 → Fin 3) :
    0 ≤ child3 parent child axis word ∧ child3 parent child axis word ≤ 1 := by
  unfold child3
  cases SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => exact ⟨le_refl 0, zero_le_one⟩
  | some node =>
    cases node with
    | inl node => exact mixed3_range node axis word
    | inr node => exact zero3_range node child.val axis word

/-- Every supported hierarchy child has unit total mass in the exact original law. -/
theorem child3_total (parent : Fin 105) (child : ShapeAlphabet 8) (axis : Fin 3)
    (fits : child.val.Fits (SuppliedHierarchyParents.parent4 parent)) :
    (∑ word, child3 parent child axis word) = 1 := by
  have existsNode := SuppliedNodeLookup.lookup_ne_none parent ((shapeColumnEquiv 8).symm child)
    (by simpa only [SuppliedNodeLookup.shapeAt_column] using fits)
  unfold child3
  cases found : SuppliedNodeLookup.lookup parent ((shapeColumnEquiv 8).symm child) with
  | none => exact False.elim (existsNode found)
  | some node =>
    cases node with
    | inl node => exact mixed3_total node axis
    | inr node => exact zero3_total node child.val axis

/-- Actual eight-letter positive parent law at its original source hierarchy index. -/
def parent4 (parent : Fin 105) (axis : Fin 3) : (Fin 8 → Fin 3) → ℝ :=
  (SuppliedTypedParameters.level4Split parent).parentLaw (fun child => child3 parent child axis)

/-- Every actual eight-letter positive parent coordinate lies in the probability interval. -/
theorem parent4_range (parent : Fin 105) (axis : Fin 3) (word : Fin 8 → Fin 3) :
    0 ≤ parent4 parent axis word ∧ parent4 parent axis word ≤ 1 :=
  (SuppliedTypedParameters.level4Split parent).parentLaw_range (by decide) _
    (fun child => child3_range parent child axis) word

/-- Every positive level-four parent is normalized; no premise is imposed on absent source children. -/
theorem parent4_total (parent : Fin 105) (axis : Fin 3) :
    (∑ word, parent4 parent axis word) = 1 := by
  apply (SuppliedTypedParameters.level4Split parent).parentLaw_total_supported (by decide)
  intro child fits
  apply child3_total parent child axis
  simpa only [SuppliedHierarchyParents.level4Split_parent] using fits

/-- The supplied eight-letter zero-coordinate law in its original physical-axis orientation. -/
def zero4 (child : Fin 48) (shape : Shape) (axis : Fin 3) : (Fin 8 → Fin 3) → ℝ :=
  (SuppliedTypedParameters.zero4 child).orientedLaw OrbitLevel4.orbits 0 OrbitLevel4.complement
    (zeroAxis shape) (positiveAxis shape) axis

/-- Actual eight-letter zero laws have unit-interval coordinates. -/
theorem zero4_range (child : Fin 48) (shape : Shape) (axis : Fin 3) (word : Fin 8 → Fin 3) :
    0 ≤ zero4 child shape axis word ∧ zero4 child shape axis word ≤ 1 :=
  (SuppliedTypedParameters.zero4 child).orientedLaw_range (by decide) _ _ _ _ _ _ word

/-- Actual eight-letter zero laws have unit total probability. -/
theorem zero4_total (child : Fin 48) (shape : Shape) (axis : Fin 3) :
    (∑ word, zero4 child shape axis word) = 1 :=
  (SuppliedTypedParameters.zero4 child).orientedLaw_total (by decide) _ _ _ _ _ _

/-- Complete source root-child laws for all 153 shapes in the original physical-axis order. -/
def root4 (child : ShapeAlphabet 16) (axis : Fin 3) : (Fin 8 → Fin 3) → ℝ :=
  match SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | Sum.inl zero => zero4 zero child.val axis
  | Sum.inr positive => parent4 positive axis

/-- Every actual source root-child law has bounded fine-word probabilities. -/
theorem root4_range (child : ShapeAlphabet 16) (axis : Fin 3) (word : Fin 8 → Fin 3) :
    0 ≤ root4 child axis word ∧ root4 child axis word ≤ 1 := by
  unfold root4
  cases SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | inl zero => exact zero4_range zero child.val axis word
  | inr positive => exact parent4_range positive axis word

/-- All original root-child laws are exactly normalized on their complete eight-letter fine-word alphabet. -/
theorem root4_total (child : ShapeAlphabet 16) (axis : Fin 3) :
    (∑ word, root4 child axis word) = 1 := by
  unfold root4
  cases SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm child) with
  | inl zero => exact zero4_total zero child.val axis
  | inr positive => exact parent4_total positive axis

end
end MatrixBounds.Numeric.SuppliedHigherLaws
