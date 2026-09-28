import SuppliedPathStages
import TerminalLogExpressions

/-! Exact original-source terminal logarithmic expressions, with the full
allocation-history stage rate and its root normalization proved symbolically. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRates

open Tensor Tensor.CW Terminal Entropy Empirical Interface SuppliedTerminalScaling
open SuppliedPopulationWeights DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- The source record at its original node/positive-child/strategy coordinates. -/
def source (node : Fin 945) (child : Fin 3) (strategy : Fin 6) : Source := ⟨node, child, strategy⟩

/-- The exact terminal population per original root position, including both paired child doublings. -/
def sourceMass (record : Source) : ℚ :=
  (terminalNumerator record : ℚ)/(denominator^4 : ℕ)

/-- Exact original role-weighted terminal expression at one source record. -/
def sourceExpression (record : Source) (axis : Fin 3) : RationalLogExpression :=
  terminalRetentionExpression (SuppliedTerminalLaws.mu record.node record.child record.strategy)
    ((SuppliedTerminalRoles.distribution record).rational axis)

/-- Full original terminal expression, indexed in the supplied node/child/strategy order. -/
def expression (axis : Fin 3) : RationalLogExpression :=
  finiteLogSum (fun node : Fin 945 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    scaleLogExpression (sourceMass (source node child strategy)) (sourceExpression (source node child strategy) axis))))

/-- Every original source record is enumerated exactly once by the supplied three finite coordinates. -/
def sourceEquiv : Fin 945 × Fin 3 × Fin 6 ≃ Source where
  toFun index := source index.1 index.2.1 index.2.2
  invFun record := (record.node, record.child, record.strategy)
  left_inv _ := rfl
  right_inv _ := rfl

/-- The exact source expression equals the actual role-allocated terminal entropy. -/
theorem sourceExpression_value (record : Source) (axis : Fin 3) :
    rationalLogValue (sourceExpression record axis) =
      ∑ selected, ((SuppliedTerminalRoles.distribution record).rational selected : ℝ)*
        axisEntropy (extreme record) (middle record)
          (axes record (SuppliedTerminalRoles.role record selected) axis) := by
  rw [SuppliedTerminalRoles.allocated_entropy, sourceExpression, terminalRetentionExpression_value]
  unfold SuppliedTerminalRoles.ternary extreme middle
  rw [SuppliedTerminalLaws.parameter_exact]

/-- Exact allocated integer coefficients equal the parent population times its original rational role probability. -/
theorem roleWeight_real (record : Source) (selected : Fin 3) :
    (terminalRoleWeight (record, selected) : ℝ) =
      (terminalWeight record : ℝ)*((SuppliedTerminalRoles.distribution record).rational selected : ℝ) := by
  simp only [terminalRoleWeight, terminalWeight, scaled, TypedProbabilityRow.rational,
    Nat.cast_mul, Nat.cast_pow, Rat.cast_div, Rat.cast_natCast]
  norm_num [denominator]
  ring

/-- Multiplying an original rational source mass by the reserved root population gives its exact integer terminal weight. -/
theorem rootWeight_mass (record : Source) :
    (rootWeight : ℝ)*(sourceMass record : ℝ) = (terminalWeight record : ℝ) := by
  simp only [rootWeight, sourceMass, terminalWeight, scaled, Nat.cast_mul, Nat.cast_pow,
    Rat.cast_div, Rat.cast_natCast]
  norm_num [denominator]
  ring

/-- The complete finite expression has exactly the sum of its original terminal source contributions. -/
theorem expression_value (axis : Fin 3) :
    rationalLogValue (expression axis) =
      ∑ record : Source, (sourceMass record : ℝ)*rationalLogValue (sourceExpression record axis) := by
  rw [← Equiv.sum_comp sourceEquiv (fun record =>
    (sourceMass record : ℝ)*rationalLogValue (sourceExpression record axis))]
  simp only [expression, finiteLogSum_value, scaleLogExpression_value, Fintype.sum_prod_type,
    sourceEquiv, Equiv.coe_fn_mk]

/-- The full-history terminal extraction rate is exactly its original role-weighted source expression, at the common root scale. -/
theorem stage_rate_expression (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis = (rootWeight : ℝ)*rationalLogValue (expression axis) := by
  rw [SuppliedPathStages.terminal_rates, SuppliedFixedStages.terminal,
    SuppliedTerminalRationalSplit.stage_rates]
  rw [sum_positive_weights terminalRoleWeight (fun label =>
    axisEntropy (extreme label.1) (middle label.1) (axes label.1 (SuppliedTerminalRoles.role label.1 label.2) axis))]
  rw [expression_value, Finset.mul_sum]
  simp only [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro record _
  rw [← mul_assoc, rootWeight_mass, sourceExpression_value, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro selected _
  rw [roleWeight_real, mul_assoc]

/-- The normalized actual terminal stage rate equals the exact source-indexed logarithmic expression. -/
theorem normalized_stage_rate (axis : Fin 3) :
    SuppliedPathStages.terminal.rates axis/(rootWeight : ℝ) = rationalLogValue (expression axis) := by
  rw [stage_rate_expression]
  have rootNonzero : (rootWeight : ℝ) ≠ 0 := by norm_num [rootWeight, denominator]
  exact mul_div_cancel_left₀ _ rootNonzero

end
end MatrixBounds.Numeric.SuppliedTerminalRates
