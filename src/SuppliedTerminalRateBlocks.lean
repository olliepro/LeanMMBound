import SuppliedTerminalRateFastExpression

/-! Small disjoint original-source blocks for bounded exact terminal checks. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open scoped BigOperators
noncomputable section

/-- Original node at its unique seven-node block and within-block position. -/
def blockNode (block : Fin 135) (offset : Fin 7) : Fin 945 :=
  finProdFinEquiv (block, offset)

/-- All child and strategy contributions belonging to seven original source nodes. -/
def blockExpression (block : Fin 135) (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (sourceMass (source (blockNode block offset) child strategy))
      (fastSourceExpression (source (blockNode block offset) child strategy) axis))))

/-- The 135 disjoint blocks enumerate every original node, child, and strategy exactly once. -/
theorem expression_blocks_value (axis : Fin 3) :
    rationalLogValue (expression axis) = ∑ block, rationalLogValue (blockExpression block axis) := by
  rw [← fast_expression_eq]
  simp only [fastExpression, blockExpression, finiteLogSum_value]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 135 × Fin 7 ≃ Fin 945)]
  rw [Fintype.sum_prod_type]
  rfl

/-- Merging and combining two literal summaries retains their complete real logarithmic sum. -/
def mergeSummaries (left right : RationalLogExpression) : RationalLogExpression :=
  coalesceLogExpression (kernelMergeLogTerms (left.length + right.length) left right)

/-- A bounded merge may replace two summaries without changing their exact semantic value. -/
theorem mergeSummaries_value (left right : RationalLogExpression) :
    rationalLogValue (mergeSummaries left right) = rationalLogValue left + rationalLogValue right := by
  rw [mergeSummaries, coalesceLogExpression_value,
    rationalLogValue_perm (kernelMergeLogTerms_perm _ _ _), rationalLogValue_append]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
