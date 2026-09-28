import SuppliedDimensionSourceExpressions

/-! Actual complete matrix volumes, retaining every original tensor factor,
equal the exact finite source logarithm expression at the reserved root scale. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 1000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- A zero3 dimension depends only on its original source row, while its population retains the previous role. -/
theorem zero3_rate (label : SuppliedWaitingZero3.Label) :
    SuppliedWaitingZero3.rate label = SuppliedWaitingZero3.rate (.xyz, label.2) := rfl

/-- A zero2 dimension depends only on the actual source, strategy, and child. -/
theorem zero2_rate (label : SuppliedWaitingZero2.Label) :
    SuppliedWaitingZero2.rate label = zero2Rate label.1.source label.2 := rfl

/-- Enumerate all actual zero2 histories while placing source and child before the two original physical roles. -/
def zero2LabelEquiv : (SuppliedStage3.Source × Fin 12) × (AxisOrder × AxisOrder) ≃ SuppliedWaitingZero2.Label where
  toFun label := (⟨label.1.1, label.2.1, label.2.2⟩, label.1.2)
  invFun label := ((label.1.source, label.2), (label.1.previous, label.1.role))
  left_inv _ := rfl
  right_inv _ := rfl

/-- The actual complete zero4 matrix volume has exactly its original source expression and root scale. -/
theorem zero4_volume_expression : SuppliedWaitingZero4.volumeRate = (rootWeight : ℝ)*rationalLogValue zero4Expression := by
  simp only [SuppliedWaitingZero4.volumeRate, zero4Expression_value, Finset.mul_sum, ← mul_assoc, zero4_root_mass]

/-- Summing old role sectors in the complete zero3 matrix changes neither its original weight nor its dimension. -/
theorem zero3_volume_expression : SuppliedWaitingZero3.volumeRate = (rootWeight : ℝ)*rationalLogValue zero3Expression := by
  unfold SuppliedWaitingZero3.volumeRate
  simp only [Fintype.sum_prod_type, SuppliedWaitingZero3.weight, zero3_rate]
  rw [Finset.sum_comm]
  simp only [← Finset.sum_mul, ← Nat.cast_sum, zero3_weight_sum,
    zero3Expression_value, Finset.mul_sum, ← mul_assoc, zero3_root_mass]

/-- All original zero2 histories sum to precisely the source matrix expression with its two child doublings. -/
theorem zero2_volume_expression : SuppliedWaitingZero2.volumeRate = (rootWeight : ℝ)*rationalLogValue zero2Expression := by
  unfold SuppliedWaitingZero2.volumeRate
  rw [← Equiv.sum_comp zero2LabelEquiv (fun label => (SuppliedWaitingZero2.weight label : ℝ)*SuppliedWaitingZero2.rate label)]
  simp only [Fintype.sum_prod_type, zero2LabelEquiv, Equiv.coe_fn_mk, zero2_rate]
  simp only [← Finset.sum_mul, ← Nat.cast_sum, zero2_weight_sum,
    zero2Expression_value, Finset.mul_sum, ← mul_assoc, zero2_root_mass, Fintype.sum_prod_type]

/-- The terminal volume sums every positive history and recovers the entire original source population. -/
theorem terminal_volume_expression : SuppliedTerminalMatrix.volumeRate = (rootWeight : ℝ)*rationalLogValue terminalExpression := by
  unfold SuppliedTerminalMatrix.volumeRate SuppliedTerminalRationalChildren.volumeRate
  simp only [mul_assoc]
  change (∑ label : SuppliedPathStages.TerminalLabels,
    (SuppliedPopulationPaths.terminalWeight label.val : ℝ)*terminalRate label.val.source) = _
  rw [sum_positive_weights SuppliedPopulationPaths.terminalWeight (fun label => terminalRate label.source),
    sum_terminal (fun source _ => terminalRate source)]
  simp only [← Finset.sum_mul, ← Nat.cast_sum, terminal_role_sum,
    terminalExpression_value, Finset.mul_sum, ← mul_assoc, SuppliedTerminalRates.rootWeight_mass]

/-- Every actual matrix contribution equals the common root scale times the complete original source logarithm expression. -/
theorem scaled_volume :
    SuppliedWaitingZero4.volumeRate + SuppliedWaitingZero3.volumeRate + SuppliedWaitingZero2.volumeRate +
      SuppliedTerminalMatrix.volumeRate = (rootWeight : ℝ)*rationalLogValue expression := by
  rw [zero4_volume_expression, zero3_volume_expression, zero2_volume_expression, terminal_volume_expression]
  simp only [expression, rationalLogValue_append]
  ring

/-- The normalized actual complete matrix volume is exactly the full original source logarithm expression. -/
theorem normalized_volume :
    (SuppliedWaitingZero4.volumeRate + SuppliedWaitingZero3.volumeRate + SuppliedWaitingZero2.volumeRate +
      SuppliedTerminalMatrix.volumeRate)/(rootWeight : ℝ) = rationalLogValue expression := by
  rw [scaled_volume]
  have nonzero : (rootWeight : ℝ) ≠ 0 := by norm_num [rootWeight, DyadicPopulationArithmetic.denominator]
  exact mul_div_cancel_left₀ _ nonzero

end
end MatrixBounds.Numeric.SuppliedDimensionRates
