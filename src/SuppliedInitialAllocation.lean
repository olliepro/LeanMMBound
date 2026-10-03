module

public import SuppliedAllocationWindows
public import SuppliedRootPopulation
public import SuppliedChildEquivalences
public import HeterogeneousProductRegrouping
public import CWPhysicalWindowFamilies
public import SuppliedStagePresentations
public import HeterogeneousDependentSum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original root-child windows split into waiting zero-coordinate factors and
the exact allocated positive level-four parents, preserving all source labels. -/
namespace MatrixBounds.Numeric.SuppliedInitialAllocation

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedAllocationWindows
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K : Type} [CommRing K]

/-- Original positive hierarchy labels recover their complete source shape columns exactly. -/
theorem positive_child (parent : Fin 105) :
    SuppliedChildKinds.child4Equiv.symm (Sum.inr parent) = shapeColumnEquiv 16 (rootColumn parent) := by
  apply SuppliedChildKinds.child4Equiv.injective
  rw [Equiv.apply_symm_apply]
  simpa only [SuppliedChildKinds.child4Equiv, Equiv.trans_apply, Equiv.ofBijective_apply,
    (shapeColumnEquiv 16).symm_apply_apply (rootColumn parent)] using!
    (SuppliedShapeInterfaceBindings.root_kind parent).symm

/-- One original complete root-child window at its exact fixed coefficient. -/
def childWindow (size : ℕ) (tolerance : ℝ) (child : ShapeAlphabet 16) :=
  window (K := K) 8 child.val (SuppliedRootPopulation.weight child*size) (SuppliedHigherLaws.root4 child) tolerance

/-- All original complete root-child factors before further allocation. -/
def unallocated (size : ℕ) (tolerance : ℝ) := heterogeneous (childWindow (K := K) size tolerance)

/-- Every original zero-coordinate root child is retained as a separately labelled waiting factor. -/
def waiting (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun zero : Fin 48 => childWindow (K := K) size tolerance (SuppliedChildKinds.child4Equiv.symm (.inl zero)))

/-- Positive root children before the supplied physical-role allocation. -/
def positive (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun parent : Fin 105 => parent4 (K := K) parent (parent4Weight parent*size) tolerance)

/-- Positive source role sectors with exactly the labels used by the checked level-four stage. -/
def active (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun label : SuppliedFixedStages.Labels4 =>
    parent4 (K := K) label.val.1 (role4Weight label.val*size) tolerance)

/-- Each original positive child window is exactly the next hierarchy parent's complete source window. -/
def positiveChildRestriction (size : ℕ) (tolerance : ℝ) (parent : Fin 105) :
    CoordinateRestriction
      (childWindow (K := K) size tolerance (SuppliedChildKinds.child4Equiv.symm (.inr parent)))
      (parent4 (K := K) parent (parent4Weight parent*size) tolerance) := by
  rw [positive_child]
  unfold childWindow
  rw [SuppliedRootPopulation.positive_weight, SuppliedShapeInterfaceBindings.root_shape]
  have laws : SuppliedHigherLaws.root4 (shapeColumnEquiv 16 (rootColumn parent)) = SuppliedHigherLaws.parent4 parent :=
    funext (SuppliedShapeInterfaceBindings.root_law parent)
  rw [laws]
  exact CoordinateRestriction.refl _

/-- Reindex and separate all root children, with no discarded zero-coordinate factor. -/
def splitRestriction (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (unallocated (K := K) size tolerance)
      (product (waiting (K := K) size tolerance) (positive (K := K) size tolerance)) := by
  have rename := reindexRestriction SuppliedChildKinds.child4Equiv.symm (childWindow (K := K) size tolerance)
  have split := splitSumRestriction
    (fun label : Fin 48 ⊕ Fin 105 => childWindow (K := K) size tolerance (SuppliedChildKinds.child4Equiv.symm label))
  have restore := (CoordinateRestriction.refl (waiting (K := K) size tolerance)).product
    (CoordinateRestriction.heterogeneous (positiveChildRestriction (K := K) size tolerance))
  exact (rename.trans split).trans restore

/-- All actual role allocations compose and omit only neutral zero-population sectors. -/
theorem allocate_positive {size : ℕ} (sizePositive : 0 < size) {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (positive (K := K) size tolerance) (active (K := K) size tolerance) 1 := by
  have allocation := ContextReduction.heterogeneous (fun _ : Fin 105 => 1)
    (fun parent => allocate4 (K := K) parent sizePositive nonnegative)
  have flatten := (flattenProductRestriction
    (fun parent role => parent4 (K := K) parent (role4Weight (parent, role)*size) tolerance)).context
  have retain := (dropZeroWeightRestriction role4Weight size
    (fun label => constituent (K := K) 5 8 (SuppliedHierarchyParents.parent4 label.1))
    (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
    (fun label => SuppliedHigherLaws.parent4 label.1 0) (fun label => SuppliedHigherLaws.parent4 label.1 1)
    (fun label => SuppliedHigherLaws.parent4 label.1 2) (fun _ => tolerance)).context
  simpa only [Finset.prod_const_one, one_mul, mul_one] using! (allocation.trans flatten).trans retain

/-- Complete root children actually produce all waiting zero factors and all active first-stage parents at unit cost. -/
theorem allocate_all {size : ℕ} (sizePositive : 0 < size) {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (unallocated (K := K) size tolerance)
      (product (waiting (K := K) size tolerance) (active (K := K) size tolerance)) 1 := by
  exact (splitRestriction (K := K) size tolerance).context.trans
    ((allocate_positive (K := K) sizePositive nonnegative).keep_left (waiting (K := K) size tolerance))

end
end MatrixBounds.Numeric.SuppliedInitialAllocation
