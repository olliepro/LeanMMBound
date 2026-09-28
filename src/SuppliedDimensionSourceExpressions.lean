import SuppliedDimensionMasses
import OrbitLogExpressions
import SuppliedTerminalMatrix

/-! Exact executable logarithmic expressions for all original source matrix
dimensions, before numerical normalization or interval bounds are applied. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates
open Tensor Tensor.CW Entropy SuppliedPopulationWeights
open scoped BigOperators
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 1000000

/-- Scale an exact expression while omitting precisely a zero source population. -/
def weightedExpression (weight : ℚ) (expression : RationalLogExpression) : RationalLogExpression :=
  if weight = 0 then [] else scaleLogExpression weight expression

/-- Omitting a zero population preserves its exact weighted real contribution. -/
theorem weightedExpression_value (weight : ℚ) (expression : RationalLogExpression) :
    rationalLogValue (weightedExpression weight expression) = (weight : ℝ)*rationalLogValue expression := by
  unfold weightedExpression
  split_ifs with zero
  · simp only [zero, rationalLogValue, List.map_nil, List.sum_nil, Rat.cast_zero, zero_mul]
  · exact scaleLogExpression_value weight expression

/-- Complete original zero4 entropy and middle-symbol dimension expression. -/
def zero4SourceExpression (node : Fin 48) : RationalLogExpression :=
  zeroDimensionExpression 5 (SuppliedTypedParameters.zero4 node).rational OrbitLevel4.orbits.size OrbitLevel4.middle

/-- Complete original zero3 entropy and middle-symbol dimension expression. -/
def zero3SourceExpression (node : Fin 840) : RationalLogExpression :=
  zeroDimensionExpression 5 (SuppliedTypedParameters.zero3 node).rational OrbitLevel3.orbits.size OrbitLevel3.middle

/-- Complete original zero2 entropy and middle-symbol dimension expression. -/
def zero2SourceExpression (source : SuppliedStage3.Source) (child : Fin 12) : RationalLogExpression :=
  zeroDimensionExpression 5 (SuppliedTypedParameters.zero2 source.1 child source.2).rational
    OrbitLevel2.orbits.size OrbitLevel2.middle

/-- Complete actual zero2 matrix rate, independent of its inherited physical roles. -/
def zero2Rate (source : SuppliedStage3.Source) (child : Fin 12) : ℝ :=
  SuppliedWaitingZero2.rate (⟨source, .xyz, .xyz⟩, child)

/-- The zero4 source expression has exactly its actual complete fine-word dimension rate. -/
theorem zero4SourceExpression_value (node : Fin 48) :
    rationalLogValue (zero4SourceExpression node) = SuppliedWaitingZero4.rate node :=
  zeroDimensionExpression_value 5 17592186044416 OrbitLevel4.orbits _ OrbitLevel4.middle

/-- The zero3 source expression has exactly its actual complete fine-word dimension rate. -/
theorem zero3SourceExpression_value (node : Fin 840) :
    rationalLogValue (zero3SourceExpression node) = SuppliedWaitingZero3.rate (.xyz, node) :=
  zeroDimensionExpression_value 5 17592186044416 OrbitLevel3.orbits _ OrbitLevel3.middle

/-- The zero2 source expression has exactly its actual complete fine-word dimension rate. -/
theorem zero2SourceExpression_value (source : SuppliedStage3.Source) (child : Fin 12) :
    rationalLogValue (zero2SourceExpression source child) = zero2Rate source child :=
  zeroDimensionExpression_value 5 17592186044416 OrbitLevel2.orbits _ OrbitLevel2.middle

/-- Every root zero-coordinate constituent contributes its exact original source mass and full dimension. -/
def zero4Expression : RationalLogExpression :=
  finiteLogSum (fun node : Fin 48 => weightedExpression (zero4Mass node) (zero4SourceExpression node))

/-- Every zero3 hierarchy node contributes its exact original doubled source mass and full dimension. -/
def zero3Expression : RationalLogExpression :=
  finiteLogSum (fun node : Fin 840 => weightedExpression (zero3Mass node) (zero3SourceExpression node))

/-- Every original node, zero child, and strategy contributes its exact source zero2 matrix dimension. -/
def zero2Expression : RationalLogExpression :=
  finiteLogSum (fun node : Fin 945 => finiteLogSum (fun child : Fin 12 => finiteLogSum (fun strategy : Fin 6 =>
    weightedExpression (zero2Mass (node, strategy) child) (zero2SourceExpression (node, strategy) child))))

/-- The full actual terminal matrix volume rate of one original source. -/
def terminalRate (source : SuppliedTerminalScaling.Source) : ℝ :=
  (2-2*(SuppliedTerminalLaws.mu source.node source.child source.strategy : ℝ))*Real.log 5

/-- The exact full terminal dimension coefficient, summed across all three matrix axes. -/
def terminalSourceExpression (source : SuppliedTerminalScaling.Source) : RationalLogExpression :=
  logAtom 5 (2-2*SuppliedTerminalLaws.mu source.node source.child source.strategy)

/-- The terminal full-volume expression has its exact actual source rate. -/
theorem terminalSourceExpression_value (source : SuppliedTerminalScaling.Source) :
    rationalLogValue (terminalSourceExpression source) = terminalRate source := by
  simp only [terminalSourceExpression, logAtom_value, terminalRate, Rat.cast_sub, Rat.cast_mul, Rat.cast_ofNat]

/-- Every original node, positive child, and strategy contributes its complete terminal matrix volume. -/
def terminalExpression : RationalLogExpression :=
  finiteLogSum (fun node : Fin 945 => finiteLogSum (fun child : Fin 3 => finiteLogSum (fun strategy : Fin 6 =>
    weightedExpression (SuppliedTerminalRates.sourceMass (SuppliedTerminalRates.source node child strategy))
      (terminalSourceExpression (SuppliedTerminalRates.source node child strategy)))))

/-- The complete exact original source dimension expression for all four matrix families. -/
def expression : RationalLogExpression := zero4Expression++zero3Expression++zero2Expression++terminalExpression

/-- The zero4 finite expression is the sum of all its exact original source contributions. -/
theorem zero4Expression_value : rationalLogValue zero4Expression =
    ∑ node : Fin 48, (zero4Mass node : ℝ)*SuppliedWaitingZero4.rate node := by
  simp only [zero4Expression, finiteLogSum_value, weightedExpression_value, zero4SourceExpression_value]

/-- The zero3 finite expression is the sum of all its exact original source contributions. -/
theorem zero3Expression_value : rationalLogValue zero3Expression =
    ∑ node : Fin 840, (zero3Mass node : ℝ)*SuppliedWaitingZero3.rate (.xyz, node) := by
  simp only [zero3Expression, finiteLogSum_value, weightedExpression_value, zero3SourceExpression_value]

/-- The zero2 finite expression is the sum of its exact source/strategy and child contributions. -/
theorem zero2Expression_value : rationalLogValue zero2Expression =
    ∑ source : SuppliedStage3.Source, ∑ child : Fin 12, (zero2Mass source child : ℝ)*zero2Rate source child := by
  simp only [zero2Expression, finiteLogSum_value, weightedExpression_value, zero2SourceExpression_value,
    Fintype.sum_prod_type]
  exact Finset.sum_congr rfl (fun _ _ => Finset.sum_comm)

/-- The terminal finite expression is the sum of every exact original source contribution. -/
theorem terminalExpression_value : rationalLogValue terminalExpression =
    ∑ source : SuppliedTerminalScaling.Source, (SuppliedTerminalRates.sourceMass source : ℝ)*terminalRate source := by
  rw [← Equiv.sum_comp SuppliedTerminalRates.sourceEquiv (fun source =>
    (SuppliedTerminalRates.sourceMass source : ℝ)*terminalRate source)]
  simp only [terminalExpression, finiteLogSum_value, weightedExpression_value, terminalSourceExpression_value,
    Fintype.sum_prod_type, SuppliedTerminalRates.sourceEquiv, Equiv.coe_fn_mk]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
