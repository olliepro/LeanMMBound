import SuppliedPairedCoarseColumns
import RootFineKernelMergeNormalization

/-! Bounded complete coarse source blocks, omitting only exactly zero population contributions. -/
namespace MatrixBounds.Numeric.SuppliedPairedCoarse

open scoped BigOperators
noncomputable section
set_option maxRecDepth 5000

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

/-- Seven consecutive original level-four parents. -/
def block4 (block : Fin 15) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 =>
    let source := finProdFinEquiv (block, offset)
    finiteLogSum (fun role => supportedScale (mass4 source role) (directExpression4 source role)))

/-- All six strategies and every physical role at one original level-three node. -/
def node3 (node : Fin 945) : RationalLogExpression :=
  finiteLogSum (fun strategy : Fin 6 => finiteLogSum (fun role =>
    supportedScale (mass3 (node, strategy) role) (directExpression3 (node, strategy) role)))

/-- Seven consecutive original level-three nodes, including every strategy and physical role. -/
def block3 (block : Fin 135) : RationalLogExpression :=
  finiteLogSum (fun offset : Fin 7 => node3 (finProdFinEquiv (block, offset)))

/-- The fifteen blocks retain the complete actual level-four coarse rate. -/
theorem blocks4_value : (∑ block, rationalLogValue (block4 block)) = rationalLogValue expression4 := by
  simp only [block4, expression4, finiteLogSum_value, supportedScale_value, ← directExpression4_eq]
  simpa only [Fintype.sum_prod_type] using
    (finProdFinEquiv : Fin 15 × Fin 7 ≃ Fin 105).sum_comp
      (fun source => ∑ role, rationalLogValue (scaleLogExpression (mass4 source role) (sourceExpression4 source role)))

/-- The 135 blocks retain every actual level-three coarse source contribution. -/
theorem blocks3_value : (∑ block, rationalLogValue (block3 block)) = rationalLogValue expression3 := by
  simp only [block3, node3, expression3, finiteLogSum_value, supportedScale_value, ← directExpression3_eq]
  simpa only [Fintype.sum_prod_type] using
    (finProdFinEquiv : Fin 135 × Fin 7 ≃ Fin 945).sum_comp
      (fun node => ∑ strategy : Fin 6, ∑ role,
        rationalLogValue (scaleLogExpression (mass3 (node, strategy) role) (sourceExpression3 (node, strategy) role)))

/-- Independently proved complete node summaries retain their whole original seven-node block. -/
theorem cachedBlock3_value (block : Fin 135) (summaries : Fin 7 → RationalLogExpression)
    (checked : ∀ offset, mergeNormalizeLogExpression (node3 (finProdFinEquiv (block, offset))) = summaries offset) :
    rationalLogValue (finiteLogSum summaries) = rationalLogValue (block3 block) := by
  simp only [block3, finiteLogSum_value]
  apply Finset.sum_congr rfl
  intro offset _
  rw [← checked offset, mergeNormalizeLogExpression_value]

end
end MatrixBounds.Numeric.SuppliedPairedCoarse
