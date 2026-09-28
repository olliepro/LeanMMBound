import SuppliedPairedFineNodes
import SuppliedPairedFineStageExpressions
import RootFineKernelMergeNormalization

/-! Bounded paired fine source sums: every original source, strategy, and physical role is retained,
omitting only exactly zero populations, and independently checked summaries compose exactly. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000

/-- Avoid evaluating an unused expression when its exact original source weight is zero. -/
def supportedScale (weight : ℚ) (expression : RationalLogExpression) : RationalLogExpression :=
  if weight = 0 then [] else scaleLogExpression weight expression

/-- Removing zero populations preserves the full real logarithmic expression. -/
theorem supportedScale_value (weight : ℚ) (expression : RationalLogExpression) :
    rationalLogValue (supportedScale weight expression) =
      rationalLogValue (scaleLogExpression weight expression) := by
  unfold supportedScale
  split_ifs with zero
  · rw [scaleLogExpression_value, zero, Rat.cast_zero, zero_mul]
    rfl
  · rfl

/-- One original level-four source with all six physical roles. -/
def sourceSum4 (node : Fin 105) (axis : Fin 2) : RationalLogExpression :=
  finiteLogSum (fun role : Fin 6 => scaleLogExpression (sourceMass4 (node, SuppliedRoleIndex.order role))
    (sourceExpression4 node (SuppliedRoleIndex.order role) axis))

/-- One original level-three node with all six strategies and physical roles. -/
def sourceSum3 (node : Fin 945) (axis : Fin 2) : RationalLogExpression :=
  finiteLogSum (fun strategy : Fin 6 => finiteLogSum (fun role : Fin 6 =>
    scaleLogExpression (sourceMass3 ((node, strategy), SuppliedRoleIndex.order role))
      (sourceExpression3 (node, strategy) (SuppliedRoleIndex.order role) axis)))

/-- The complete level-four fine expression is the sum of fifteen seven-source blocks. -/
theorem expression4_blocks (axis : Fin 2) : rationalLogValue (expression4 axis) =
    ∑ block : Fin 15, ∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) axis) := by
  have nodes : rationalLogValue (expression4 axis) = ∑ node : Fin 105, rationalLogValue (sourceSum4 node axis) :=
    finiteLogSum_value (fun node => sourceSum4 node axis)
  rw [nodes]
  simpa only [Fintype.sum_prod_type] using
    ((finProdFinEquiv : Fin 15 × Fin 7 ≃ Fin 105).sum_comp
      (fun node => rationalLogValue (sourceSum4 node axis))).symm

/-- The complete level-three fine expression is the sum of 135 seven-node blocks. -/
theorem expression3_blocks (axis : Fin 2) : rationalLogValue (expression3 axis) =
    ∑ block : Fin 135, ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv (block, offset)) axis) := by
  have nodes : rationalLogValue (expression3 axis) = ∑ node : Fin 945, rationalLogValue (sourceSum3 node axis) :=
    finiteLogSum_value (fun node => sourceSum3 node axis)
  rw [nodes]
  simpa only [Fintype.sum_prod_type] using
    ((finProdFinEquiv : Fin 135 × Fin 7 ≃ Fin 945).sum_comp
      (fun node => rationalLogValue (sourceSum3 node axis))).symm

/-- One level-four physical role evaluated from integer caches, omitting an exactly zero population. -/
def cachedRole4 (parents : ParentValues4) (children : ChildValues4)
    (node : Fin 105) (role : Fin 6) (axis : Fin 2) : RationalLogExpression :=
  supportedScale (sourceMass4 (node, SuppliedRoleIndex.order role))
    (nodeExpression4 parents children node (SuppliedRoleIndex.order role) axis)

/-- Independently checked role summaries retain the complete original level-four source value. -/
theorem roles4_value (parents : ParentValues4)
    (sourceEq4 : ∀ source axis orbit, parents source axis orbit =
      SuppliedRootFineParent4Integers.numerator source axis orbit)
    (children : ChildValues4) (node : Fin 105)
    (childrenEq : ∀ column axis orbit, children column axis orbit =
      SuppliedRootFineChild3Integers.numerator node (shapeColumnEquiv 8 column) axis orbit)
    (axis : Fin 2) (summaries : Fin 6 → RationalLogExpression)
    (checked : ∀ role, mergeNormalizeLogExpression (cachedRole4 parents children node role axis) = summaries role) :
    rationalLogValue (finiteLogSum summaries) = rationalLogValue (sourceSum4 node axis) := by
  simp only [sourceSum4, finiteLogSum_value]
  apply Finset.sum_congr rfl
  intro role _
  rw [← checked role, mergeNormalizeLogExpression_value, cachedRole4, supportedScale_value,
    scaleLogExpression_value, scaleLogExpression_value,
    nodeExpression4_value parents sourceEq4 children node childrenEq]

/-- One level-three strategy with all six physical roles evaluated from integer caches. -/
def cachedStrategy3 (parents : ParentValues3) (node : Fin 945) (strategy : Fin 6) (axis : Fin 2) :
    RationalLogExpression :=
  finiteLogSum (fun role : Fin 6 => supportedScale (sourceMass3 ((node, strategy), SuppliedRoleIndex.order role))
    (nodeExpression3 parents (node, strategy) (SuppliedRoleIndex.order role) axis))

/-- One complete level-three node evaluated from integer caches. -/
def cachedNode3 (parents : ParentValues3) (node : Fin 945) (axis : Fin 2) : RationalLogExpression :=
  finiteLogSum (fun strategy : Fin 6 => cachedStrategy3 parents node strategy axis)

/-- Integer caches retain the complete original level-three strategy value. -/
theorem cachedStrategy3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (node : Fin 945) (strategy : Fin 6) (axis : Fin 2) :
    rationalLogValue (cachedStrategy3 parents node strategy axis) =
      ∑ role : Fin 6, rationalLogValue (scaleLogExpression (sourceMass3 ((node, strategy), SuppliedRoleIndex.order role))
        (sourceExpression3 (node, strategy) (SuppliedRoleIndex.order role) axis)) := by
  simp only [cachedStrategy3, finiteLogSum_value, supportedScale_value, scaleLogExpression_value,
    nodeExpression3_value parents sourceEq]

/-- Independently checked complete node summaries retain the original level-three node value. -/
theorem node3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (node : Fin 945) (axis : Fin 2) (summary : RationalLogExpression)
    (checked : mergeNormalizeLogExpression (cachedNode3 parents node axis) = summary) :
    rationalLogValue summary = rationalLogValue (sourceSum3 node axis) := by
  rw [← checked, mergeNormalizeLogExpression_value]
  simp only [cachedNode3, sourceSum3, finiteLogSum_value, cachedStrategy3_value parents sourceEq]

/-- Independently checked strategy summaries retain the original level-three node value. -/
theorem strategies3_value (parents : ParentValues3)
    (sourceEq : ∀ node strategy axis orbit, parents node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (node : Fin 945) (axis : Fin 2) (summaries : Fin 6 → RationalLogExpression)
    (checked : ∀ strategy, mergeNormalizeLogExpression (cachedStrategy3 parents node strategy axis) =
      summaries strategy) :
    rationalLogValue (finiteLogSum summaries) = rationalLogValue (sourceSum3 node axis) := by
  simp only [sourceSum3, finiteLogSum_value]
  apply Finset.sum_congr rfl
  intro strategy _
  rw [← checked strategy, mergeNormalizeLogExpression_value, cachedStrategy3_value parents sourceEq]

/-- Seven independently summarized nodes retain their whole seven-node block value. -/
theorem block3_value (block : Fin 135) (axis : Fin 2) (summaries : Fin 7 → RationalLogExpression)
    (checked : ∀ offset, rationalLogValue (summaries offset) =
      rationalLogValue (sourceSum3 (finProdFinEquiv (block, offset)) axis)) :
    rationalLogValue (finiteLogSum summaries) =
      ∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv (block, offset)) axis) := by
  simp only [finiteLogSum_value, checked]

/-- Seven independently summarized sources retain their whole seven-source block value. -/
theorem block4_value (block : Fin 15) (axis : Fin 2) (summaries : Fin 7 → RationalLogExpression)
    (checked : ∀ offset, rationalLogValue (summaries offset) =
      rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) axis)) :
    rationalLogValue (finiteLogSum summaries) =
      ∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (block, offset)) axis) := by
  simp only [finiteLogSum_value, checked]

end
end MatrixBounds.Numeric.SuppliedPairedFine
