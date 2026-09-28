import SuppliedTerminalRateMassArithmetic
import TerminalSourceNodeLookup

/-! Balanced metadata and finite columns give exact original terminal input arithmetic. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open SuppliedPopulationWeights DyadicPopulationArithmetic
noncomputable section

/-- Original positive parent selected through the balanced hierarchy table. -/
def balancedParent (node : Fin 945) : Fin 105 :=
  ⟨(TerminalSourceNodeLookup.table.lookup node).parent, by
    rw [TerminalSourceNodeLookup.lookup_eq]
    exact (SuppliedShapeIndices.positiveNode_bounds node).1⟩

/-- Balanced parent metadata equals the original source parent. -/
theorem balancedParent_eq (node : Fin 945) : balancedParent node = nodeParent node := by
  apply Fin.ext
  simp only [balancedParent, nodeParent, TerminalSourceNodeLookup.lookup_eq]

/-- Original level-four split numerator with balanced source metadata. -/
def balancedNodeSplit (node : Fin 945) : ℕ :=
  (SuppliedParameters.alpha4 (balancedParent node)).val.row.atColumn
    (TerminalSourceNodeLookup.table.lookup node).child

/-- Balanced metadata selects exactly the same original level-four probability entry. -/
theorem balancedNodeSplit_eq (node : Fin 945) : balancedNodeSplit node = nodeSplitNumerator node := by
  simp only [balancedNodeSplit, nodeSplitNumerator, balancedParent_eq, TerminalSourceNodeLookup.lookup_eq]

/-- Complete exact terminal source population numerator with direct column access. -/
def balancedNumerator (record : SuppliedTerminalScaling.Source) : ℕ :=
  2 * (2 * rootNumerator (balancedParent record.node) * balancedNodeSplit record.node) *
    (SuppliedTypedParameters.strategies record.node).numerator record.strategy *
    terminalSplitNumerator record

/-- Complete terminal source mass with original inputs and balanced metadata. -/
def balancedSourceMass (record : SuppliedTerminalScaling.Source) : ℚ :=
  (balancedNumerator record : ℚ) / (denominator^4 : ℕ)

/-- Balanced input dispatch preserves the exact original normalized source mass. -/
theorem balancedSourceMass_eq (record : SuppliedTerminalScaling.Source) :
    balancedSourceMass record = sourceMass record := by
  rw [← columnSourceMass_eq]
  simp only [balancedSourceMass, balancedNumerator, columnSourceMass, balancedParent_eq, balancedNodeSplit_eq]

/-- Seven complete original nodes evaluated with balanced metadata and direct probability columns. -/
def balancedBlockExpression (block : Fin 135) (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (balancedSourceMass (source (blockNode block offset) child strategy))
      (fastSourceExpression (source (blockNode block offset) child strategy) axis))))

/-- Balanced evaluation preserves the whole ordered list of original terminal block terms. -/
theorem balancedBlockExpression_eq (block : Fin 135) (axis : Fin 3) :
    balancedBlockExpression block axis = blockExpression block axis := by
  simp only [balancedBlockExpression, blockExpression, balancedSourceMass_eq]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
