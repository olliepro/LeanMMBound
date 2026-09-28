import SuppliedNodePartialIndexing
import SuppliedAllocationWindows
import PartialWindowReindexing
import SuppliedPhysicalZero3
import SuppliedShapeInterfaceBindings

/-! Complete original level-four children retain the previous physical role
when reindexed into their exact original positive or zero-coordinate nodes. -/
namespace MatrixBounds.Numeric.SuppliedLevel4Transition

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedPopulationPaths
noncomputable section
variable {K : Type} [CommRing K]

/-- One complete original child window, with its previous role kept explicit. -/
def childWindow (previous : AxisOrder) (pair : Fin 105 × Fin 45) (size : ℕ) (tolerance : ℝ) :=
  SuppliedAllocationWindows.window (K := K) 4 (shapeColumnEquiv 8 pair.2).val
    (SuppliedNodePartialIndexing.childWeight (fun parent => role4Weight (parent, previous)) pair*size)
    (fun axis => SuppliedHigherLaws.child3 pair.1 (shapeColumnEquiv 8 pair.2) axis) tolerance

/-- Every complete child label, including empty and zero-coordinate factors. -/
def fullChildren (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun previous : AxisOrder => heterogeneous (fun pair : Fin 105 × Fin 45 =>
    childWindow (K := K) previous pair size (tolerance (pair.1, previous))))

/-- Every original source hierarchy node, preserving its preceding role. -/
def nodeChildren (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun previous : AxisOrder => heterogeneous (fun label : Fin 945 ⊕ Fin 840 =>
    childWindow (K := K) previous (SuppliedNodePartialIndexing.decode label) size
      (tolerance ((SuppliedNodePartialIndexing.decode label).1, previous))))

/-- The original lookup reindexes every actual child window and removes only proved-empty absent cells. -/
def lookupRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction (fullChildren (K := K) size tolerance) (nodeChildren (K := K) size tolerance) :=
  CoordinateRestriction.heterogeneous (fun previous =>
    SuppliedNodePartialIndexing.indexing.windowRestriction
      (SuppliedNodePartialIndexing.childWeight (fun parent => role4Weight (parent, previous)))
      (SuppliedNodePartialIndexing.child_supported (fun parent => role4Weight (parent, previous))) size
      (fun pair => constituent (K := K) 5 4 (shapeColumnEquiv 8 pair.2).val)
      (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
      (fun pair => SuppliedHigherLaws.child3 pair.1 (shapeColumnEquiv 8 pair.2) 0)
      (fun pair => SuppliedHigherLaws.child3 pair.1 (shapeColumnEquiv 8 pair.2) 1)
      (fun pair => SuppliedHigherLaws.child3 pair.1 (shapeColumnEquiv 8 pair.2) 2)
      (fun pair => tolerance (pair.1, previous)))

/-- Each positive node's decoded child is exactly its next complete mixed-strategy source window. -/
theorem positive_node (node : Fin 945) (previous : AxisOrder) (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v}
      (childWindow (K := K) previous (SuppliedNodePartialIndexing.decode (.inl node)) size tolerance)
      (SuppliedAllocationWindows.node3 (K := K) node (nodeWeight node previous*size) tolerance) 1 := by
  change ContextReduction
    (SuppliedAllocationWindows.window (K := K) 4 (nodeChild node).val
      ((SuppliedTypedParameters.level4Split (nodeParent node)).childWeight
        (role4Weight (nodeParent node, previous)) (nodeChild node)*size)
      (fun axis => SuppliedHigherLaws.child3 (nodeParent node) (nodeChild node) axis) tolerance)
    _ 1
  rw [SuppliedPopulationPaths.node_split, SuppliedShapeInterfaceBindings.node_shape]
  simp only [SuppliedShapeInterfaceBindings.node_law]
  exact ContextReduction.refl _

/-- Actual integer population of a zero-coordinate node in its preceding role sector. -/
def zeroWeight (node : Fin 840) (previous : AxisOrder) : ℕ :=
  SuppliedNodePartialIndexing.childWeight (fun parent => role4Weight (parent, previous))
    (SuppliedNodePartialIndexing.decode (.inr node))

/-- Each zero-coordinate node's decoded child is its actual physical source window. -/
theorem zero_node (node : Fin 840) (previous : AxisOrder) (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v}
      (childWindow (K := K) previous (SuppliedNodePartialIndexing.decode (.inr node)) size tolerance)
      (SuppliedPhysicalZero3.sourceWindow (K := K) node (zeroWeight node previous*size) tolerance) 1 := by
  unfold childWindow SuppliedPhysicalZero3.sourceWindow SuppliedAllocationWindows.window
  unfold SuppliedHigherLaws.child3
  have lookup : SuppliedNodeLookup.lookup (SuppliedNodePartialIndexing.decode (.inr node)).1
      (SuppliedNodePartialIndexing.decode (.inr node)).2 = some (.inr node) :=
    SuppliedNodePartialIndexing.indexing.encode_decode (.inr node)
  simp only [Equiv.symm_apply_apply, lookup]
  have shape := SuppliedNodeLookup.shapeAt_column 8
    (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2)
  rw [Equiv.symm_apply_apply] at shape
  change _ = _ at shape
  change ContextReduction
    (windowedPower (P := Fin (zeroWeight node previous*size))
      (constituent (K := K) 5 4 (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2).val)
      (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
      (SuppliedHigherLaws.zero3 node (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2).val 0)
      (SuppliedHigherLaws.zero3 node (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2).val 1)
      (SuppliedHigherLaws.zero3 node (shapeColumnEquiv 8 (SuppliedNodePartialIndexing.decode (.inr node)).2).val 2) tolerance) _ 1
  rw [← shape]
  exact ContextReduction.refl _

end
end MatrixBounds.Numeric.SuppliedLevel4Transition
