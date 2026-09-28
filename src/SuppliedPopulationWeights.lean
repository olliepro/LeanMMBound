import SuppliedRationalStages
import SuppliedTerminalRoles
import SuppliedRoleIndex
import SuppliedNodeLookup
import DyadicPopulationArithmetic

/-! Fixed integer populations from the original source hierarchy. Eight reserve
denominator powers clear every split, strategy allocation, and physical role. -/
namespace MatrixBounds.Numeric.SuppliedPopulationWeights

open Tensor Tensor.CW Interface DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- Original complete root column of a positive level-four node. -/
def rootColumn (parent : Fin 105) : Fin 153 :=
  ⟨((SuppliedShapeIndices.childColumns 16 true)[parent.val]?.getD 0), by
    have all : ∀ parent : Fin 105,
        ((SuppliedShapeIndices.childColumns 16 true)[parent.val]?.getD 0) < 153 := by decide +kernel
    exact all parent⟩

/-- Original level-four parent index of a source level-three node. -/
def nodeParent (node : Fin 945) : Fin 105 :=
  ⟨(SuppliedShapeIndices.positiveNode node).parent, (SuppliedShapeIndices.positiveNode_bounds node).1⟩

/-- Original complete level-three child shape at one positive source node. -/
def nodeChild (node : Fin 945) : ShapeAlphabet 8 :=
  shapeColumnEquiv 8 ⟨(SuppliedShapeIndices.positiveNode node).child,
    (SuppliedShapeIndices.positiveNode_bounds node).2.1⟩

/-- Original complete level-two column of a positive terminal child. -/
def terminalColumn (child : Fin 3) : Fin 15 := ![6,7,10] child

/-- The selected terminal columns are exactly the original positive child subarray. -/
theorem terminalColumn_correct : ∀ child : Fin 3,
    (SuppliedShapeIndices.childColumns 4 true)[child.val]? = some (terminalColumn child).val := by decide +kernel

/-- Original terminal child as a member of the complete shape alphabet. -/
def terminalChild (child : Fin 3) : ShapeAlphabet 4 := shapeColumnEquiv 4 (terminalColumn child)

/-- Exact original root mass numerator of a positive level-four constituent. -/
def rootNumerator (parent : Fin 105) : ℕ := SuppliedTypedParameters.rootDistribution.numerator (rootColumn parent)

/-- Doubled original split mass of a positive level-three node, before the strategy allocation. -/
def nodeNumerator (node : Fin 945) : ℕ :=
  2*rootNumerator (nodeParent node)*(SuppliedTypedParameters.level4Split (nodeParent node)).numerator (nodeChild node)

/-- Original source mass numerator after the six-strategy mixture is allocated. -/
def strategyNumerator (source : SuppliedStage3.Source) : ℕ :=
  nodeNumerator source.1*(SuppliedTypedParameters.strategies source.1).numerator source.2

/-- Original terminal mass numerator after both paired child doublings. -/
def terminalNumerator (source : SuppliedTerminalScaling.Source) : ℕ :=
  2*strategyNumerator (source.node, source.strategy)*
    (SuppliedTypedParameters.level3Split source.node source.strategy).numerator (terminalChild source.child)

/-- Fixed source population coefficient shared by every root batch. -/
def rootWeight : ℕ := denominator^8

/-- Positive level-four parent population before its physical roles are allocated. -/
def parent4Weight (parent : Fin 105) : ℕ := scaled 7 (rootNumerator parent)

/-- Actual population of an original level-four source and physical role. -/
def role4Weight (label : SuppliedStage4.Source × AxisOrder) : ℕ :=
  scaled 6 (rootNumerator label.1*SuppliedRoleIndex.allocation4 label.1 label.2)

/-- Positive level-three parent population before its six strategies are allocated. -/
def node3Weight (node : Fin 945) : ℕ := scaled 6 (nodeNumerator node)

/-- Actual source and strategy population before its physical roles are allocated. -/
def strategy3Weight (source : SuppliedStage3.Source) : ℕ := scaled 5 (strategyNumerator source)

/-- Actual population of an original level-three source, strategy, and physical role. -/
def role3Weight (label : SuppliedStage3.Source × AxisOrder) : ℕ :=
  scaled 4 (strategyNumerator label.1*SuppliedRoleIndex.allocation3 label.1.1 label.1.2 label.2)

/-- Original terminal population before choosing its ternary extraction axis. -/
def terminalWeight (source : SuppliedTerminalScaling.Source) : ℕ := scaled 4 (terminalNumerator source)

/-- Actual population of an original terminal source and its three-way physical role choice. -/
def terminalRoleWeight (label : SuppliedTerminalScaling.Source × Fin 3) : ℕ :=
  scaled 3 (terminalNumerator label.1*(SuppliedTerminalRoles.distribution label.1).numerator label.2)

/-- Actual level-four role populations are the prescribed exact rational allocation of their parents. -/
theorem role4_allocation (parent : Fin 105) (role : AxisOrder) :
    allocatedWeight (parent4Weight parent) denominator (SuppliedRoleIndex.allocation4 parent) role =
      role4Weight (parent, role) := allocate_scaled 6 _ _ _

/-- Actual source level-three nodes are the exact child populations of their level-four parents. -/
theorem node3_split (node : Fin 945) :
    (SuppliedTypedParameters.level4Split (nodeParent node)).childWeight
      (parent4Weight (nodeParent node)) (nodeChild node) = node3Weight node := child_scaled _ 6 _ _

/-- The original strategy populations agree exactly with allocating the node's six-way mixture. -/
theorem strategy3_allocation (source : SuppliedStage3.Source) :
    allocatedWeight (node3Weight source.1) denominator (SuppliedTypedParameters.strategies source.1).numerator source.2 =
      strategy3Weight source := allocate_scaled 5 _ _ _

/-- Actual level-three role populations are precisely the supplied role allocation of their strategy parents. -/
theorem role3_allocation (source : SuppliedStage3.Source) (role : AxisOrder) :
    allocatedWeight (strategy3Weight source) denominator (SuppliedRoleIndex.allocation3 source.1 source.2) role =
      role3Weight (source, role) := allocate_scaled 4 _ _ _

/-- Actual terminal populations are the original strategy child populations with their exact doubled multiplicity. -/
theorem terminal_split (source : SuppliedTerminalScaling.Source) :
    (SuppliedTypedParameters.level3Split source.node source.strategy).childWeight
      (strategy3Weight (source.node, source.strategy)) (terminalChild source.child) = terminalWeight source :=
  child_scaled _ 4 _ _

/-- Actual terminal role populations use the original policy's exact rational allocation. -/
theorem terminal_allocation (source : SuppliedTerminalScaling.Source) (selected : Fin 3) :
    allocatedWeight (terminalWeight source) denominator (SuppliedTerminalRoles.distribution source).numerator selected =
      terminalRoleWeight (source, selected) := allocate_scaled 3 _ _ _

/-- Every retained level-four role population is divisible before taking any growing scale. -/
theorem role4_divisible (label : SuppliedStage4.Source × AxisOrder) : denominator ∣ role4Weight label :=
  scaled_divisible 5 _

/-- Every retained level-three role population is divisible before taking any growing scale. -/
theorem role3_divisible (label : SuppliedStage3.Source × AxisOrder) : denominator ∣ role3Weight label :=
  scaled_divisible 3 _

/-- Every retained terminal role population is divisible before taking any growing scale. -/
theorem terminalRole_divisible (label : SuppliedTerminalScaling.Source × Fin 3) : denominator ∣ terminalRoleWeight label :=
  scaled_divisible 2 _

end
end MatrixBounds.Numeric.SuppliedPopulationWeights
