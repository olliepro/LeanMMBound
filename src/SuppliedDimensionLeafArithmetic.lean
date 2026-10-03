module

public import SuppliedDimensionBlocks
public import TerminalRateBalancedInputs

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Direct source columns retain the exact original zero2 population arithmetic. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open Tensor.CW SuppliedPopulationWeights DyadicPopulationArithmetic
noncomputable section

/-- Original zero2 child numerator, read directly at its proved finite source column. -/
def zero2SplitNumerator (source : SuppliedStage3.Source) (child : Fin 12) : ℕ :=
  (SuppliedParameters.alpha3 source.1 source.2).val.row.atColumn (zero2Column child).val

/-- Direct source-column access preserves the original checked level-three split numerator. -/
theorem zero2SplitNumerator_eq (source : SuppliedStage3.Source) (child : Fin 12) :
    zero2SplitNumerator source child =
      (SuppliedTypedParameters.level3Split source.1 source.2).numerator
        (shapeColumnEquiv 4 (zero2Column child)) := by
  symm
  exact checkedSplit_numerator_column (length := 2)
    (SuppliedParameters.alpha3 source.1 source.2).val
    (SuppliedParameters.alpha3 source.1 source.2).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha3.table
      SuppliedParameterChecks.SplitAlpha3_metadata (SuppliedParameters.flat2 source.1 source.2))
    (zero2Column child)

/-- Original zero2 population numerator with balanced metadata and direct source columns. -/
def balancedZero2Numerator (source : SuppliedStage3.Source) (child : Fin 12) : ℕ :=
  2 * (2 * rootNumerator (SuppliedTerminalRates.balancedParent source.1) *
      SuppliedTerminalRates.balancedNodeSplit source.1) *
    (SuppliedTypedParameters.strategies source.1).numerator source.2 * zero2SplitNumerator source child

/-- Balanced finite input arithmetic retains the complete original zero2 population. -/
theorem balancedZero2Numerator_eq (source : SuppliedStage3.Source) (child : Fin 12) :
    balancedZero2Numerator source child = zero2Numerator source child := by
  simp only [balancedZero2Numerator, zero2Numerator, strategyNumerator, nodeNumerator,
    SuppliedTerminalRates.balancedParent_eq, SuppliedTerminalRates.balancedNodeSplit_eq,
    SuppliedTerminalRates.nodeSplitNumerator_eq, zero2SplitNumerator_eq, Nat.mul_assoc]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
