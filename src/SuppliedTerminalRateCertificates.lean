module

public import SuppliedTerminalRateExpression
public import CertifiedTerminalRate0
public import CertifiedTerminalRate1
public import CertifiedTerminalRate2
public import RootFineKernelMergeNormalization

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete terminal certificate blocks and their exact rational expressions. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

/-- Concatenate every monomial of a complete list of independently certified numerical blocks. -/
def blocksExpression (blocks : List CertifiedLogBlock) : RationalLogExpression :=
  sumLogExpressions (blocks.map (fun block => block.terms.map IntegerLogTerm.monomial))

/-- Concatenating complete certified blocks preserves their exact actual logarithmic value. -/
theorem blocksExpression_value (blocks : List CertifiedLogBlock) :
    rationalLogValue (blocksExpression blocks) = certifiedBlocksValue blocks := by
  induction blocks with
  | nil => rfl
  | cons block rest induction =>
    simp only [blocksExpression, List.map_cons, sumLogExpressions, rationalLogValue_append,
      ← integerLogValue_expression, certifiedBlocksValue] at induction ⊢
    rw [induction]

/-- All original numerical blocks for one terminal physical-axis retention rate. -/
def certificateBlocks (axis : Fin 3) : List CertifiedLogBlock :=
  ![CertifiedTerminalRate0.blocks, CertifiedTerminalRate1.blocks, CertifiedTerminalRate2.blocks] axis

/-- Every original numerical coefficient and argument of one complete terminal certificate. -/
def certificateExpression (axis : Fin 3) : RationalLogExpression := blocksExpression (certificateBlocks axis)

/-- Complete certificate values in the same order as the actual physical extraction axes. -/
noncomputable def certificateValue (axis : Fin 3) : ℝ :=
  ![CertifiedTerminalRate0.value, CertifiedTerminalRate1.value, CertifiedTerminalRate2.value] axis

/-- The complete rational certificate expression has exactly the independently certified real value. -/
theorem certificateExpression_value (axis : Fin 3) :
    rationalLogValue (certificateExpression axis) = certificateValue axis := by
  rw [certificateExpression, blocksExpression_value]
  fin_cases axis <;> rfl

end MatrixBounds.Numeric.SuppliedTerminalRates
