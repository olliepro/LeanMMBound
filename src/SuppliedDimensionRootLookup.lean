module

public import SuppliedDimensionLeafArithmetic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact positive root source columns avoid rebuilding the complete shape enumeration. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open SuppliedPopulationWeights
noncomputable section

/-- Complete original positive-root source columns in their unchanged source order. -/
def positiveRootColumn : Fin 105 → Fin 153 := ![18,19,20,21,22,23,24,25,26,27,28,29,30,31,34,35,36,37,38,39,40,41,42,43,44,45,46,49,50,51,52,53,54,55,56,57,58,59,60,63,64,65,66,67,68,69,70,71,72,73,76,77,78,79,80,81,82,83,84,85,88,89,90,91,92,93,94,95,96,99,100,101,102,103,104,105,106,109,110,111,112,113,114,115,118,119,120,121,122,123,126,127,128,129,130,133,134,135,136,139,140,141,144,145,148]

/-- Every cached root column has exactly its original source-node classification. -/
theorem positiveRootColumn_kind : ∀ parent : Fin 105,
    SuppliedChildKinds.kind4 (positiveRootColumn parent) = .inr parent := by decide +kernel

/-- The finite root column cache is exactly the original complete shape enumeration. -/
theorem positiveRootColumn_eq (parent : Fin 105) : positiveRootColumn parent = rootColumn parent :=
  SuppliedChildKinds.kind4_bijective.injective
    ((positiveRootColumn_kind parent).trans (SuppliedShapeInterfaceBindings.root_kind parent).symm)

/-- Exact original root probability numerator selected through its proved finite source column. -/
def fastRootNumerator (parent : Fin 105) : ℕ :=
  SuppliedTypedParameters.rootDistribution.numerator (positiveRootColumn parent)

/-- The cached finite source column preserves the complete original root numerator. -/
theorem fastRootNumerator_eq (parent : Fin 105) : fastRootNumerator parent = rootNumerator parent := by
  simp only [fastRootNumerator, rootNumerator, positiveRootColumn_eq]

/-- Exact original zero2 population with balanced metadata and cached original root columns. -/
def zero2InputPopulation (source : SuppliedStage3.Source) (child : Fin 12) : ℕ :=
  2 * (2 * fastRootNumerator (SuppliedTerminalRates.balancedParent source.1) *
      SuppliedTerminalRates.balancedNodeSplit source.1) *
    (SuppliedTypedParameters.strategies source.1).numerator source.2 * zero2SplitNumerator source child

/-- Cached root columns preserve the original full zero2 source coefficient. -/
theorem zero2InputPopulation_eq (source : SuppliedStage3.Source) (child : Fin 12) :
    zero2InputPopulation source child = balancedZero2Numerator source child := by
  simp only [zero2InputPopulation, balancedZero2Numerator, fastRootNumerator_eq]

/-- Exact original terminal population with balanced metadata and cached original root columns. -/
def terminalInputPopulation (source : SuppliedTerminalScaling.Source) : ℕ :=
  2 * (2 * fastRootNumerator (SuppliedTerminalRates.balancedParent source.node) *
      SuppliedTerminalRates.balancedNodeSplit source.node) *
    (SuppliedTypedParameters.strategies source.node).numerator source.strategy *
      SuppliedTerminalRates.terminalSplitNumerator source

/-- Cached root columns preserve the original full terminal source coefficient. -/
theorem terminalInputPopulation_eq (source : SuppliedTerminalScaling.Source) :
    terminalInputPopulation source = SuppliedTerminalRates.balancedNumerator source := by
  simp only [terminalInputPopulation, SuppliedTerminalRates.balancedNumerator, fastRootNumerator_eq]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
