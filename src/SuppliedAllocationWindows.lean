module

public import SuppliedPopulationPaths
public import NamedPopulationAllocation
public import SuppliedStrategyAllocation
public import ContextHeterogeneousReductions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual original source windows, with exact separately labelled strategy
and role allocations at every population, including all empty sectors. -/
namespace MatrixBounds.Numeric.SuppliedAllocationWindows

universe v
open Tensor Tensor.CW Interface Empirical SuppliedPopulationWeights SuppliedPopulationPaths DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
variable {K : Type} [CommRing K]

/-- A complete original q=5 source window at its actual population. -/
def window (length : ℕ) (shape : Shape) (population : ℕ)
    (law : Fin 3 → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :=
  windowedPower (K := K) (P := Fin population) (constituent 5 length shape)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (law 0) (law 1) (law 2) tolerance

/-- Complete supplied positive root-child window before its role allocation. -/
def parent4 (parent : Fin 105) (population : ℕ) (tolerance : ℝ) :=
  window (K := K) 8 (SuppliedHierarchyParents.parent4 parent) population (SuppliedHigherLaws.parent4 parent) tolerance

/-- Complete supplied mixed node window before its six strategies are allocated. -/
def node3 (node : Fin 945) (population : ℕ) (tolerance : ℝ) :=
  window (K := K) 4 (SuppliedHierarchyParents.parent3 node) population (SuppliedLeafLaws.mixed3 node) tolerance

/-- One complete original strategy window, retaining its original source node. -/
def strategy3 (source : SuppliedStage3.Source) (population : ℕ) (tolerance : ℝ) :=
  window (K := K) 4 (SuppliedHierarchyParents.parent3 source.1) population (SuppliedLeafLaws.parent3 source.1 source.2) tolerance

/-- Every original level-four window gives its exact role-labelled child populations at unit cost. -/
theorem allocate4 (parent : Fin 105) {size : ℕ} (sizePositive : 0 < size) {tolerance : ℝ}
    (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (parent4 (K := K) parent (parent4Weight parent*size) tolerance)
      (heterogeneous (fun role => parent4 (K := K) parent (role4Weight (parent, role)*size) tolerance)) 1 :=
  contextReduction_allocate_named_roles (weight := parent4Weight parent) (size := size)
    (constituent (K := K) 5 8 (SuppliedHierarchyParents.parent4 parent))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedRoleIndex.allocation4 parent) (fun role => role4Weight (parent, role))
    (SuppliedRoleIndex.allocation4_total parent) (by decide) sizePositive (scaled_divisible 6 _)
    (role4_allocation parent) (SuppliedHigherLaws.parent4 parent 0) (SuppliedHigherLaws.parent4 parent 1)
    (SuppliedHigherLaws.parent4 parent 2) tolerance nonnegative

/-- Original strategy allocation retains the previous level-four role and its exact integer population. -/
theorem allocate_strategies (node : Fin 945) (previous : AxisOrder) {size : ℕ} (sizePositive : 0 < size)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (node3 (K := K) node (nodeWeight node previous*size) tolerance)
      (heterogeneous (fun strategy => strategy3 (K := K) (node, strategy) (strategyWeight (node, strategy) previous*size) tolerance)) 1 := by
  have allocation := contextReduction_allocate_named_weights (weight := nodeWeight node previous) (size := size)
    (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedTypedParameters.strategies node).numerator (fun strategy => strategyWeight (node, strategy) previous)
    (SuppliedTypedParameters.strategies node).numerator_total (by decide) sizePositive (scaled_divisible 4 _)
    (fun strategy => strategy_allocation (node, strategy) previous)
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 0)
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 1)
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 2) tolerance nonnegative
  simpa only [Nat.cast_ofNat, ← SuppliedStrategyAllocation.mixture_formula] using! allocation

/-- Original level-three role allocation retains the strategy and all previous role labels. -/
theorem allocate3 (source : SuppliedStage3.Source) (previous : AxisOrder) {size : ℕ} (sizePositive : 0 < size)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (strategy3 (K := K) source (strategyWeight source previous*size) tolerance)
      (heterogeneous (fun role => strategy3 (K := K) source (weight3 ⟨source, previous, role⟩*size) tolerance)) 1 :=
  contextReduction_allocate_named_roles (weight := strategyWeight source previous) (size := size)
    (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 source.1))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedRoleIndex.allocation3 source.1 source.2) (fun role => weight3 ⟨source, previous, role⟩)
    (SuppliedRoleIndex.allocation3_total source.1 source.2) (by decide) sizePositive (scaled_divisible 3 _)
    (fun role => SuppliedPopulationPaths.role3_allocation ⟨source, previous, role⟩)
    (SuppliedLeafLaws.parent3 source.1 source.2 0) (SuppliedLeafLaws.parent3 source.1 source.2 1)
    (SuppliedLeafLaws.parent3 source.1 source.2 2) tolerance nonnegative

/-- Both actual allocations compose while keeping every previous, strategy, and current role label separate. -/
theorem allocate_node3 (node : Fin 945) (previous : AxisOrder) {size : ℕ} (sizePositive : 0 < size)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (node3 (K := K) node (nodeWeight node previous*size) tolerance)
      (heterogeneous (fun strategy : Fin 6 => heterogeneous (fun role : AxisOrder =>
        strategy3 (K := K) (node, strategy) (weight3 ⟨(node, strategy), previous, role⟩*size) tolerance))) 1 := by
  have roles := ContextReduction.heterogeneous (fun _ : Fin 6 => 1)
    (fun strategy => allocate3 (K := K) (node, strategy) previous sizePositive nonnegative)
  simpa only [Finset.prod_const_one, one_mul] using
    (allocate_strategies (K := K) node previous sizePositive nonnegative).trans roles

/-- Original terminal parent window before its three-way extraction-role allocation. -/
def terminal (source : SuppliedTerminalScaling.Source) (population : ℕ) (tolerance : ℝ) :=
  window (K := K) 2 (SuppliedTerminalRationalSplit.split source .xyz).parent population
    (fun axis => (SuppliedTerminalRationalSplit.split source .xyz).parentLaw (SuppliedTerminalRationalSplit.law axis)) tolerance

/-- The supplied terminal policy is realized at its exact populations, retaining both previous role labels. -/
theorem allocate_terminal (source : SuppliedTerminalScaling.Source) (previous4 previous3 : AxisOrder)
    {size : ℕ} (sizePositive : 0 < size) {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (terminal (K := K) source (terminalParentWeight source previous4 previous3*size) tolerance)
      (heterogeneous (fun selected : Fin 3 => terminal (K := K) source
        (SuppliedPopulationPaths.terminalWeight ⟨source, previous4, previous3, selected⟩*size) tolerance)) 1 :=
  contextReduction_allocate_named_roles (weight := terminalParentWeight source previous4 previous3) (size := size)
    (constituent (K := K) 5 2 (SuppliedTerminalRationalSplit.split source .xyz).parent)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedTerminalRoles.distribution source).numerator
    (fun selected => SuppliedPopulationPaths.terminalWeight ⟨source, previous4, previous3, selected⟩)
    (SuppliedTerminalRoles.distribution source).numerator_total (by decide) sizePositive (scaled_divisible 1 _)
    (fun selected => SuppliedPopulationPaths.terminal_allocation ⟨source, previous4, previous3, selected⟩)
    ((SuppliedTerminalRationalSplit.split source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 0))
    ((SuppliedTerminalRationalSplit.split source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 1))
    ((SuppliedTerminalRationalSplit.split source .xyz).parentLaw (SuppliedTerminalRationalSplit.law 2)) tolerance nonnegative

end
end MatrixBounds.Numeric.SuppliedAllocationWindows
