import SuppliedLevel4TransitionWindows
import SuppliedStagePresentations
import CWRationalCanonicalInterfaces
import ZeroParentRestoration

/-! The actual positive-parent stage output restores precisely the empty
original parent sectors, then regroups its complete children without loss. -/
namespace MatrixBounds.Numeric.SuppliedLevel4Transition

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- Original complete child window before replacing its shape by a source column. -/
def shapeWindow (parent : Fin 105 × AxisOrder) (child : ShapeAlphabet 8) (size : ℕ) (tolerance : ℝ) :=
  SuppliedAllocationWindows.window (K := K) 4 child.val
    ((SuppliedTypedParameters.level4Split parent.1).childWeight (role4Weight parent) child*size)
    (fun axis => SuppliedHigherLaws.child3 parent.1 child axis) tolerance

/-- Complete original parent and shape labels are restored only at their proved-empty sectors. -/
def restoreParentRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction
      (SuppliedStagePresentations.level4.originalChildren (K := K) size 5 (fun label => tolerance label.val))
      (heterogeneous (fun parent : Fin 105 × AxisOrder => heterogeneous (fun child : ShapeAlphabet 8 =>
        shapeWindow (K := K) parent child size (tolerance parent)))) := by
  have restore := restoreZeroParentRestriction role4Weight
    (fun parent child => (SuppliedTypedParameters.level4Split parent.1).childWeight (role4Weight parent) child)
    (fun parent empty child => by simp only [RationalSplit.childWeight, empty, Nat.zero_div, zero_mul, mul_zero]) size
    (fun _ child => constituent (K := K) 5 4 child.val)
    (fun _ _ x => fineWord x.val) (fun _ _ y => fineWord y.val) (fun _ _ z => fineWord z.val)
    (fun parent child => SuppliedHigherLaws.child3 parent.1 child 0)
    (fun parent child => SuppliedHigherLaws.child3 parent.1 child 1)
    (fun parent child => SuppliedHigherLaws.child3 parent.1 child 2) (fun parent _ => tolerance parent)
  exact (unflattenRestriction (fun parent : SuppliedFixedStages.Labels4 =>
    fun child : ShapeAlphabet 8 => shapeWindow (K := K) parent.val child size (tolerance parent.val))).trans restore

/-- Reorder original parent/role/column labels while retaining each separate window. -/
def reorderChildRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun parent : Fin 105 × AxisOrder => heterogeneous (fun column : Fin 45 =>
        childWindow (K := K) parent.2 (parent.1, column) size (tolerance parent))))
      (fullChildren (K := K) size tolerance) where
  left entries parent column := entries parent.2 (parent.1, column)
  middle entries parent column := entries parent.2 (parent.1, column)
  right entries parent column := entries parent.2 (parent.1, column)
  coefficient x y z := by
    simp only [fullChildren, heterogeneous, Fintype.prod_prod_type]
    exact Finset.prod_comm

/-- Bind the checked canonical stage output to all actual original hierarchy cells. -/
def canonicalChildRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction
      (SuppliedStagePresentations.level4.originalChildren (K := K) size 5 (fun label => tolerance label.val))
      (fullChildren (K := K) size tolerance) :=
  ((restoreParentRestriction (K := K) size tolerance).trans
    (CoordinateRestriction.heterogeneous (fun parent : Fin 105 × AxisOrder =>
      reindexRestriction (shapeColumnEquiv 8)
        (fun child => shapeWindow (K := K) parent child size (tolerance parent))))).trans
    (reorderChildRestriction (K := K) size tolerance)

/-- Extend the actual positive-parent tolerances to unused empty parents by the positive value one. -/
def extendTolerance (tolerance : SuppliedFixedStages.Labels4 → ℝ) (parent : Fin 105 × AxisOrder) : ℝ :=
  if positive : 0 < role4Weight parent then tolerance ⟨parent, positive⟩ else 1

/-- The extension agrees exactly on every parent that appeared in the checked extraction. -/
theorem extendTolerance_value (tolerance : SuppliedFixedStages.Labels4 → ℝ) (parent : SuppliedFixedStages.Labels4) :
    extendTolerance tolerance parent.val = tolerance parent := by
  simp only [extendTolerance, dif_pos parent.property]

/-- Extending strictly positive actual widths preserves positivity at every original parent. -/
theorem extendTolerance_positive (tolerance : SuppliedFixedStages.Labels4 → ℝ)
    (positive : ∀ parent, 0 < tolerance parent) (parent : Fin 105 × AxisOrder) :
    0 < extendTolerance tolerance parent := by
  unfold extendTolerance
  split
  · exact positive _
  · exact zero_lt_one

/-- Arbitrary actual positive-parent widths restore to their exact full original family. -/
def originalChildRestriction (size : ℕ) (tolerance : SuppliedFixedStages.Labels4 → ℝ) :
    CoordinateRestriction
      (SuppliedStagePresentations.level4.originalChildren (K := K) size 5 tolerance)
      (fullChildren (K := K) size (extendTolerance tolerance)) := by
  have restriction := canonicalChildRestriction (K := K) size (extendTolerance tolerance)
  simpa only [extendTolerance_value] using restriction

end
end MatrixBounds.Numeric.SuppliedLevel4Transition
