import SuppliedTerminalRateBlocks

namespace MatrixBounds.Numeric.SuppliedTerminalRates
open scoped BigOperators
noncomputable section

/-- The complete terminal contribution at one original node, including all children and strategies. -/
def nodeExpression (node : Fin 945) (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (sourceMass (source node child strategy))
      (fastSourceExpression (source node child strategy) axis)))

/-- Small node summaries compose to the unchanged seven-node original-source block. -/
theorem block_nodes_value (block : Fin 135) (axis : Fin 3) :
    rationalLogValue (blockExpression block axis) =
      ∑ offset, rationalLogValue (nodeExpression (blockNode block offset) axis) := by
  exact finiteLogSum_value _

end
end MatrixBounds.Numeric.SuppliedTerminalRates
