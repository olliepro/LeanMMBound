module

public import SuppliedTerminalRateNodeBlocks
public import RootFineColumnConvolution

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Direct finite source columns avoid reconstructing shape alphabets during
exact terminal population arithmetic. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open Tensor.CW SuppliedPopulationWeights DyadicPopulationArithmetic
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 4000000

/-- Exact original level-four child numerator, read at its finite source column. -/
def nodeSplitNumerator (node : Fin 945) : ℕ :=
  (SuppliedParameters.alpha4 (nodeParent node)).val.row.atColumn
    (SuppliedShapeIndices.positiveNode node).child

/-- Direct source-column access equals the complete checked level-four split numerator. -/
theorem nodeSplitNumerator_eq (node : Fin 945) :
    nodeSplitNumerator node = (SuppliedTypedParameters.level4Split (nodeParent node)).numerator
      (nodeChild node) := by
  symm
  exact checkedSplit_numerator_column (length := 4)
    (SuppliedParameters.alpha4 (nodeParent node)).val
    (SuppliedParameters.alpha4 (nodeParent node)).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha4.table
      SuppliedParameterChecks.SplitAlpha4_metadata (nodeParent node))
    ⟨(SuppliedShapeIndices.positiveNode node).child,
      (SuppliedShapeIndices.positiveNode_bounds node).2.1⟩

/-- Exact original terminal child numerator, read at its finite source column. -/
def terminalSplitNumerator (record : SuppliedTerminalScaling.Source) : ℕ :=
  (SuppliedParameters.alpha3 record.node record.strategy).val.row.atColumn
    (terminalColumn record.child).val

/-- Direct source-column access equals the complete checked level-three split numerator. -/
theorem terminalSplitNumerator_eq (record : SuppliedTerminalScaling.Source) :
    terminalSplitNumerator record = (SuppliedTypedParameters.level3Split record.node record.strategy).numerator
      (terminalChild record.child) := by
  symm
  exact checkedSplit_numerator_column (length := 2)
    (SuppliedParameters.alpha3 record.node record.strategy).val
    (SuppliedParameters.alpha3 record.node record.strategy).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha3.table
      SuppliedParameterChecks.SplitAlpha3_metadata (SuppliedParameters.flat2 record.node record.strategy))
    (terminalColumn record.child)

/-- Exact root-normalized terminal mass using only original finite probability columns. -/
def columnSourceMass (record : SuppliedTerminalScaling.Source) : ℚ :=
  ((2 * (2 * rootNumerator (nodeParent record.node) * nodeSplitNumerator record.node) *
    (SuppliedTypedParameters.strategies record.node).numerator record.strategy *
    terminalSplitNumerator record : ℕ) : ℚ) / (denominator^4 : ℕ)

/-- Finite-column arithmetic preserves every complete original source population. -/
theorem columnSourceMass_eq (record : SuppliedTerminalScaling.Source) :
    columnSourceMass record = sourceMass record := by
  simp only [columnSourceMass, sourceMass, terminalNumerator, strategyNumerator, nodeNumerator,
    nodeSplitNumerator_eq, terminalSplitNumerator_eq]
  simp only [Nat.mul_assoc]

/-- One original terminal node evaluated entirely through direct finite columns. -/
def columnNodeExpression (node : Fin 945) (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (columnSourceMass (source node child strategy))
      (fastSourceExpression (source node child strategy) axis)))

/-- Direct finite columns preserve every term in the original terminal node. -/
theorem columnNodeExpression_eq (node : Fin 945) (axis : Fin 3) :
    columnNodeExpression node axis = nodeExpression node axis := by
  simp only [columnNodeExpression, nodeExpression, columnSourceMass_eq]

/-- A seven-node terminal expression evaluated entirely through direct finite columns. -/
def columnBlockExpression (block : Fin 135) (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (columnSourceMass (source (blockNode block offset) child strategy))
      (fastSourceExpression (source (blockNode block offset) child strategy) axis))))

/-- Direct finite column evaluation changes no original term, source label, or coefficient. -/
theorem columnBlockExpression_eq (block : Fin 135) (axis : Fin 3) :
    columnBlockExpression block axis = blockExpression block axis := by
  simp only [columnBlockExpression, blockExpression, columnSourceMass_eq]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
