import TerminalRateBalancedInputs

/-! Exact integer terminal inputs can be checked once before symbolic normalization. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open DyadicPopulationArithmetic
noncomputable section

/-- All integer inputs controlling one complete terminal source contribution. -/
structure TerminalInput where
  mass : ℕ
  mu : ℕ
  role0 : ℕ
  role1 : ℕ
  role2 : ℕ
  deriving DecidableEq

/-- Every input is selected from its proved original source population and parameter rows. -/
def terminalInput (record : SuppliedTerminalScaling.Source) : TerminalInput :=
  ⟨balancedNumerator record,
    SuppliedRootFineTerminalLookup.numerator record.node record.child record.strategy,
    (SuppliedTerminalRoles.distribution record).numerator 0,
    (SuppliedTerminalRoles.distribution record).numerator 1,
    (SuppliedTerminalRoles.distribution record).numerator 2⟩

/-- Exact terminal contribution computed solely from independently checked integer inputs. -/
def inputExpression (input : TerminalInput) (axis : Fin 3) : RationalLogExpression :=
  scaleLogExpression ((input.mass : ℚ) / (denominator^4 : ℕ))
    (terminalRetentionExpression ((input.mu : ℚ) / denominator) (((![input.role0, input.role1, input.role2] axis) : ℚ) / denominator))

/-- Integer input caching retains the complete original source expression exactly. -/
theorem inputExpression_eq (record : SuppliedTerminalScaling.Source) (axis : Fin 3) :
    inputExpression (terminalInput record) axis =
      scaleLogExpression (sourceMass record) (fastSourceExpression record axis) := by
  rw [← balancedSourceMass_eq]
  fin_cases axis <;> rfl

/-- The original source at one of 126 positions inside a seven-node block. -/
def inputRecord (block : Fin 135) (index : Fin 126) : SuppliedTerminalScaling.Source :=
  let coordinates := (finProdFinEquiv : Fin 7 × Fin 18 ≃ Fin 126).symm index
  let childStrategy := (finProdFinEquiv : Fin 3 × Fin 6 ≃ Fin 18).symm coordinates.2
  source (blockNode block coordinates.1) childStrategy.1 childStrategy.2

/-- Complete source input block in its original offset/child/strategy order. -/
def inputBlock (block : Fin 135) (index : Fin 126) : TerminalInput :=
  terminalInput (inputRecord block index)

/-- A flat exact integer input block has precisely the original terminal expression value. -/
theorem inputBlock_value (block : Fin 135) (axis : Fin 3) :
    rationalLogValue (finiteLogSum (fun index => inputExpression (inputBlock block index) axis)) =
      rationalLogValue (blockExpression block axis) := by
  simp only [finiteLogSum_value, inputBlock, inputExpression_eq, blockExpression]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 7 × Fin 18 ≃ Fin 126), Fintype.sum_prod_type]
  simp only [inputRecord, Equiv.symm_apply_apply]
  congr 1
  funext offset
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 3 × Fin 6 ≃ Fin 18), Fintype.sum_prod_type]
  simp only [Equiv.symm_apply_apply]

end
end MatrixBounds.Numeric.SuppliedTerminalRates
