module

public import SuppliedLevel4TransitionWindows
public import HeterogeneousDependentSum

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Reindex the actual level-four children and perform both prescribed positive
node allocations, retaining every previous role and every waiting zero factor. -/
namespace MatrixBounds.Numeric.SuppliedLevel4Transition

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
variable {K : Type} [CommRing K]

/-- All positive mixed-strategy nodes, still separated by their previous role. -/
def mixedChildren (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun previous : AxisOrder => heterogeneous (fun node : Fin 945 =>
    SuppliedAllocationWindows.node3 (K := K) node (nodeWeight node previous*size)
      (tolerance (nodeParent node, previous))))

/-- Every zero-coordinate child is retained as its actual original source window. -/
def waiting3 (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun previous : AxisOrder => heterogeneous (fun node : Fin 840 =>
    SuppliedPhysicalZero3.sourceWindow (K := K) node (zeroWeight node previous*size)
      (tolerance ((SuppliedNodePartialIndexing.decode (.inr node)).1, previous))))

/-- All next-stage windows have their full original node, strategy, and previous/current role labels. -/
def active3 (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun label : Label3 => SuppliedAllocationWindows.strategy3 (K := K) label.source
    (weight3 label*size) (tolerance (nodeParent label.source.1, label.previous)))

/-- Separate positive children from waiting zero children without changing any role-labelled factor. -/
def separateNodesRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction (nodeChildren (K := K) size tolerance)
      (product
        (heterogeneous (fun previous : AxisOrder => heterogeneous (fun node : Fin 945 =>
          childWindow (K := K) previous (SuppliedNodePartialIndexing.decode (.inl node)) size
            (tolerance (nodeParent node, previous)))))
        (heterogeneous (fun previous : AxisOrder => heterogeneous (fun node : Fin 840 =>
          childWindow (K := K) previous (SuppliedNodePartialIndexing.decode (.inr node)) size
            (tolerance ((SuppliedNodePartialIndexing.decode (.inr node)).1, previous)))))) where
  left entries previous node := by cases node with | inl node => exact entries.1 previous node | inr node => exact entries.2 previous node
  middle entries previous node := by cases node with | inl node => exact entries.1 previous node | inr node => exact entries.2 previous node
  right entries previous node := by cases node with | inl node => exact entries.1 previous node | inr node => exact entries.2 previous node
  coefficient x y z := by
    simp only [nodeChildren, heterogeneous, Fintype.prod_sum_type, Finset.prod_mul_distrib, product]
    rfl

/-- Complete reindexed child windows are exactly the positive mixed sources and all waiting physical zero sources. -/
theorem identify_nodes (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    ContextReduction.{v} (nodeChildren (K := K) size tolerance)
      (product (mixedChildren (K := K) size tolerance) (waiting3 (K := K) size tolerance)) 1 := by
  have positives := ContextReduction.heterogeneous (fun _ : AxisOrder => 1) (fun previous => by
    simpa only [Finset.prod_const_one] using ContextReduction.heterogeneous (fun _ : Fin 945 => 1)
      (fun node => positive_node (K := K) node previous size (tolerance (nodeParent node, previous))))
  have zeros := ContextReduction.heterogeneous (fun _ : AxisOrder => 1) (fun previous => by
    simpa only [Finset.prod_const_one] using ContextReduction.heterogeneous (fun _ : Fin 840 => 1)
      (fun node => zero_node (K := K) node previous size
        (tolerance ((SuppliedNodePartialIndexing.decode (.inr node)).1, previous))))
  simpa only [Finset.prod_const_one, one_mul] using!
    (separateNodesRestriction (K := K) size tolerance).context.trans (positives.product zeros)

/-- Reassociate all allocated source labels into their declared next-stage history type. -/
def allocatedRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun previous : AxisOrder => heterogeneous (fun node : Fin 945 =>
        heterogeneous (fun strategy : Fin 6 => heterogeneous (fun role : AxisOrder =>
          SuppliedAllocationWindows.strategy3 (K := K) (node, strategy)
            (weight3 ⟨(node, strategy), previous, role⟩*size) (tolerance (nodeParent node, previous)))))))
      (active3 (K := K) size tolerance) where
  left entries previous node strategy role := entries ⟨(node, strategy), previous, role⟩
  middle entries previous node strategy role := entries ⟨(node, strategy), previous, role⟩
  right entries previous node strategy role := entries ⟨(node, strategy), previous, role⟩
  coefficient x y z := by
    let labels : (AxisOrder × Fin 945 × Fin 6 × AxisOrder) ≃ Label3 := {
      toFun := fun index => ⟨(index.2.1, index.2.2.1), index.1, index.2.2.2⟩
      invFun := fun label => (label.previous, label.source.1, label.source.2, label.role)
      left_inv := by intro index; rfl
      right_inv := by intro label; rfl }
    have equal := Equiv.prod_comp labels (fun label => SuppliedAllocationWindows.strategy3 (K := K) label.source
      (weight3 label*size) (tolerance (nodeParent label.source.1, label.previous)) (x label) (y label) (z label))
    simpa only [active3, heterogeneous, Fintype.prod_prod_type] using! equal

/-- Both actual positive-node allocations produce precisely the full-history next-stage windows. -/
theorem allocate_positive {size : ℕ} (sizePositive : 0 < size)
    (tolerance : Fin 105 × AxisOrder → ℝ) (nonnegative : ∀ label, 0 ≤ tolerance label) :
    ContextReduction.{v} (mixedChildren (K := K) size tolerance) (active3 (K := K) size tolerance) 1 := by
  have allocations := ContextReduction.heterogeneous (fun _ : AxisOrder => 1) (fun previous => by
    simpa only [Finset.prod_const_one] using ContextReduction.heterogeneous (fun _ : Fin 945 => 1)
      (fun node => SuppliedAllocationWindows.allocate_node3 (K := K) node previous sizePositive
        (nonnegative (nodeParent node, previous))))
  simpa only [Finset.prod_const_one, mul_one] using!
    allocations.trans (allocatedRestriction (K := K) size tolerance).context

/-- The complete level-four output gives every allocated next-stage source and every waiting zero factor at unit cost. -/
theorem full_transition {size : ℕ} (sizePositive : 0 < size)
    (tolerance : Fin 105 × AxisOrder → ℝ) (nonnegative : ∀ label, 0 ≤ tolerance label) :
    ContextReduction.{v} (fullChildren (K := K) size tolerance)
      (product (active3 (K := K) size tolerance) (waiting3 (K := K) size tolerance)) 1 := by
  have allocation := (allocate_positive (K := K) sizePositive tolerance nonnegative).product
    (ContextReduction.refl (waiting3 (K := K) size tolerance))
  simpa only [one_mul] using ((lookupRestriction (K := K) size tolerance).context.trans
    (identify_nodes (K := K) size tolerance)).trans allocation

end
end MatrixBounds.Numeric.SuppliedLevel4Transition
