import SuppliedDimensionFastExpressions
import RootFineKernelMergeNormalization

/-! Small disjoint original-source blocks support bounded exact kernel checks
of the complete matrix dimension expression. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates
open scoped BigOperators
noncomputable section

/-- Four consecutive original root zero factors, with the exact original source rows. -/
def zero4BlockExpression (block : Fin 12) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 4 =>
    let node := finProdFinEquiv (block, offset)
    weightedExpression (zero4Mass node) (fastZero4Source node))

/-- Seven consecutive original zero3 hierarchy nodes, with their exact original source weights. -/
def zero3BlockExpression (block : Fin 120) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 =>
    let node := finProdFinEquiv (block, offset)
    weightedExpression (zero3Mass node) (fastZero3Source node))

/-- All zero2 source-child-strategy contributions belonging to seven consecutive original nodes. -/
def zero2BlockExpression (block : Fin 135) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => finiteLogSum (fun child : Fin 12 => finiteLogSum (fun strategy : Fin 6 =>
    let node := finProdFinEquiv (block, offset)
    weightedExpression (zero2Mass (node, strategy) child) (fastZero2Source (node, strategy) child))))

/-- All terminal source-child-strategy contributions belonging to seven consecutive original nodes. -/
def terminalBlockExpression (block : Fin 135) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    let source := SuppliedTerminalRates.source (finProdFinEquiv (block, offset)) child strategy
    weightedExpression (SuppliedTerminalRates.sourceMass source) (fastTerminalSource source))))

/-- Complete matrix dimension contributions of seven nodes, including both zero2 and terminal leaves. -/
def leafBlockExpression (block : Fin 135) : RationalLogExpression := zero2BlockExpression block++terminalBlockExpression block

/-- The twelve root blocks cover every original zero4 factor exactly once. -/
theorem zero4_blocks_value : rationalLogValue zero4Expression = ∑ block, rationalLogValue (zero4BlockExpression block) := by
  simp only [zero4Expression, zero4BlockExpression, finiteLogSum_value, fastZero4Source_eq]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 12 × Fin 4 ≃ Fin 48), Fintype.sum_prod_type]

/-- The120 hierarchy blocks cover every original zero3 node exactly once. -/
theorem zero3_blocks_value : rationalLogValue zero3Expression = ∑ block, rationalLogValue (zero3BlockExpression block) := by
  simp only [zero3Expression, zero3BlockExpression, finiteLogSum_value, fastZero3Source_eq]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 120 × Fin 7 ≃ Fin 840), Fintype.sum_prod_type]

/-- The135 source blocks cover every original zero2 node, child, and strategy exactly once. -/
theorem zero2_blocks_value : rationalLogValue zero2Expression = ∑ block, rationalLogValue (zero2BlockExpression block) := by
  simp only [zero2Expression, zero2BlockExpression, finiteLogSum_value, fastZero2Source_eq]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 135 × Fin 7 ≃ Fin 945), Fintype.sum_prod_type]

/-- The135 source blocks cover every original terminal node, child, and strategy exactly once. -/
theorem terminal_blocks_value : rationalLogValue terminalExpression = ∑ block, rationalLogValue (terminalBlockExpression block) := by
  simp only [terminalExpression, terminalBlockExpression, finiteLogSum_value, fastTerminalSource_eq]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 135 × Fin 7 ≃ Fin 945), Fintype.sum_prod_type]

/-- The complete original source expression is exactly the sum of every disjoint root, hierarchy, and leaf block. -/
theorem expression_blocks_value : rationalLogValue expression =
    (∑ block : Fin 12, rationalLogValue (zero4BlockExpression block)) +
    (∑ block : Fin 120, rationalLogValue (zero3BlockExpression block)) +
    (∑ block : Fin 135, rationalLogValue (leafBlockExpression block)) := by
  simp only [expression, rationalLogValue_append, zero4_blocks_value, zero3_blocks_value,
    leafBlockExpression, Finset.sum_add_distrib, zero2_blocks_value, terminal_blocks_value]
  ring

end
end MatrixBounds.Numeric.SuppliedDimensionRates
