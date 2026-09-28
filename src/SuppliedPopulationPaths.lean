import SuppliedPopulationWeights

/-! Keep the full allocation history in every later population. These labelled
counts may be summed for rates; their actual tensor windows remain separate. -/
namespace MatrixBounds.Numeric.SuppliedPopulationPaths

open Tensor Tensor.CW Interface SuppliedPopulationWeights DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section

/-- A level-three role label retains the preceding level-four allocation. -/
structure Label3 where
  source : SuppliedStage3.Source
  previous : AxisOrder
  role : AxisOrder
  deriving DecidableEq, Fintype

/-- A terminal role label retains both preceding physical role allocations. -/
structure TerminalLabel where
  source : SuppliedTerminalScaling.Source
  previous4 : AxisOrder
  previous3 : AxisOrder
  selected : Fin 3
  deriving DecidableEq, Fintype

/-- Original level-four role numerator inherited by one source level-three node. -/
def inherited4 (node : Fin 945) (previous : AxisOrder) : ℕ :=
  SuppliedRoleIndex.allocation4 (nodeParent node) previous

/-- Level-three node population within its particular previous role sector. -/
def nodeWeight (node : Fin 945) (previous : AxisOrder) : ℕ :=
  scaled 5 (nodeNumerator node*inherited4 node previous)

/-- Strategy population retaining its particular previous role sector. -/
def strategyWeight (source : SuppliedStage3.Source) (previous : AxisOrder) : ℕ :=
  scaled 4 (strategyNumerator source*inherited4 source.1 previous)

/-- Level-three extraction coefficient with both physical role labels retained. -/
def weight3 (label : Label3) : ℕ :=
  scaled 3 (strategyNumerator label.source*inherited4 label.source.1 label.previous*
    SuppliedRoleIndex.allocation3 label.source.1 label.source.2 label.role)

/-- Terminal population retaining both earlier role labels before the terminal allocation. -/
def terminalParentWeight (source : SuppliedTerminalScaling.Source) (previous4 previous3 : AxisOrder) : ℕ :=
  scaled 2 (terminalNumerator source*inherited4 source.node previous4*
    SuppliedRoleIndex.allocation3 source.node source.strategy previous3)

/-- Terminal coefficient with its complete source and role history retained. -/
def terminalWeight (label : TerminalLabel) : ℕ :=
  scaled 1 (terminalNumerator label.source*inherited4 label.source.node label.previous4*
    SuppliedRoleIndex.allocation3 label.source.node label.source.strategy label.previous3*
    (SuppliedTerminalRoles.distribution label.source).numerator label.selected)

/-- The labelled node coefficient is the actual paired output of its previous role sector. -/
theorem node_split (node : Fin 945) (previous : AxisOrder) :
    (SuppliedTypedParameters.level4Split (nodeParent node)).childWeight
      (role4Weight (nodeParent node, previous)) (nodeChild node) = nodeWeight node previous := by
  rw [role4Weight, child_scaled]
  unfold nodeWeight nodeNumerator inherited4 scaled
  ring

/-- Strategy allocation consumes a denominator factor while retaining the previous role label. -/
theorem strategy_allocation (source : SuppliedStage3.Source) (previous : AxisOrder) :
    allocatedWeight (nodeWeight source.1 previous) denominator (SuppliedTypedParameters.strategies source.1).numerator source.2 =
      strategyWeight source previous := by
  rw [nodeWeight, allocate_scaled]
  unfold strategyWeight strategyNumerator scaled
  ring

/-- Level-three roles are allocated inside each previous labelled strategy sector. -/
theorem role3_allocation (label : Label3) :
    allocatedWeight (strategyWeight label.source label.previous) denominator
      (SuppliedRoleIndex.allocation3 label.source.1 label.source.2) label.role = weight3 label :=
  allocate_scaled 3 _ _ _

/-- Terminal parents inherit the exact doubled child population within each preceding role history. -/
theorem terminal_split (source : SuppliedTerminalScaling.Source) (previous4 previous3 : AxisOrder) :
    (SuppliedTypedParameters.level3Split source.node source.strategy).childWeight
      (weight3 ⟨(source.node, source.strategy), previous4, previous3⟩) (terminalChild source.child) =
      terminalParentWeight source previous4 previous3 := by
  rw [weight3, child_scaled]
  unfold terminalParentWeight terminalNumerator scaled
  ring

/-- Terminal role allocation preserves all preceding role labels. -/
theorem terminal_allocation (label : TerminalLabel) :
    allocatedWeight (terminalParentWeight label.source label.previous4 label.previous3) denominator
      (SuppliedTerminalRoles.distribution label.source).numerator label.selected = terminalWeight label :=
  allocate_scaled 1 _ _ _

/-- Every full-history level-three population is divisible before choosing the growing scale. -/
theorem weight3_divisible (label : Label3) : denominator ∣ weight3 label := scaled_divisible 2 _

/-- Every full-history terminal population is divisible before choosing the growing scale. -/
theorem terminal_divisible (label : TerminalLabel) : denominator ∣ terminalWeight label := scaled_divisible 0 _

/-- Summing inherited roles recovers the source coefficient used in the numerical rate sum. -/
theorem weight3_sum (source : SuppliedStage3.Source) (role : AxisOrder) :
    (∑ previous, weight3 ⟨source, previous, role⟩) = role3Weight (source, role) := by
  simp only [weight3, inherited4, scaled, ← Finset.mul_sum, ← Finset.sum_mul,
    SuppliedRoleIndex.allocation4_total]
  unfold role3Weight scaled denominator
  ring

/-- Summing both inherited roles recovers exactly the terminal population used by the numerical expressions. -/
theorem terminal_sum (source : SuppliedTerminalScaling.Source) (selected : Fin 3) :
    (∑ previous4, ∑ previous3, terminalWeight ⟨source, previous4, previous3, selected⟩) =
      terminalRoleWeight (source, selected) := by
  simp only [terminalWeight, inherited4, scaled, ← Finset.mul_sum, ← Finset.sum_mul,
    SuppliedRoleIndex.allocation3_total, SuppliedRoleIndex.allocation4_total]
  unfold terminalRoleWeight scaled denominator
  ring

end
end MatrixBounds.Numeric.SuppliedPopulationPaths
