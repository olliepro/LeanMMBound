import SuppliedDimensionRootLookup
import TerminalRateInputCache

/-! Exact integer source inputs separate finite lookup checks from logarithm normalization. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open DyadicPopulationArithmetic
noncomputable section

/-- Complete integer data determining one original zero2 dimension contribution. -/
structure Zero2Input where
  population : ℕ
  orbit0 : ℕ
  orbit1 : ℕ
  orbit2 : ℕ
  orbit3 : ℕ
  orbit4 : ℕ
  orbit5 : ℕ
  deriving DecidableEq

/-- Complete integer data determining one original terminal volume contribution. -/
structure TerminalInput where
  population : ℕ
  mu : ℕ
  deriving DecidableEq

/-- Original zero2 probability numerator through its proved balanced source reference. -/
def zero2OrbitNumerator (source : SuppliedStage3.Source) (child : Fin 12) (orbit : Fin 6) : ℕ :=
  (IndexedCertificateRows.dyadic (SuppliedWaitingZero2TargetTables.references.get
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 source.1 child) source.2))).val.orbitNumerator orbit

/-- Select every exact integer input from its complete original zero2 source row. -/
def zero2Input (source : SuppliedStage3.Source) (child : Fin 12) : Zero2Input :=
  if zero2InputPopulation source child = 0 then ⟨0, 0, 0, 0, 0, 0, 0⟩ else
  ⟨zero2InputPopulation source child, zero2OrbitNumerator source child 0,
    zero2OrbitNumerator source child 1, zero2OrbitNumerator source child 2,
    zero2OrbitNumerator source child 3, zero2OrbitNumerator source child 4,
    zero2OrbitNumerator source child 5⟩

/-- Select every exact integer input from its complete original terminal source. -/
def terminalInput (source : SuppliedTerminalScaling.Source) : TerminalInput :=
  if terminalInputPopulation source = 0 then ⟨0, 0⟩ else
  ⟨terminalInputPopulation source,
    SuppliedRootFineTerminalLookup.numerator source.node source.child source.strategy⟩

/-- Evaluate one zero2 contribution using only its independently checked integer inputs. -/
def zero2InputExpression (input : Zero2Input) : RationalLogExpression :=
  weightedExpression ((input.population : ℚ) / (denominator^4 : ℕ))
    (zeroDimensionExpression 5
      (fun orbit => ((![input.orbit0, input.orbit1, input.orbit2,
        input.orbit3, input.orbit4, input.orbit5] orbit : ℕ) : ℚ)/denominator)
      OrbitLevel2.sizes OrbitLevel2.middle)

/-- Evaluate one full terminal volume using only its independently checked integer inputs. -/
def terminalInputExpression (input : TerminalInput) : RationalLogExpression :=
  weightedExpression ((input.population : ℚ) / (denominator^4 : ℕ))
    (logAtom 5 (2-2*((input.mu : ℚ)/denominator)))

/-- Integer input caching preserves every original zero2 logarithmic term exactly. -/
theorem zero2InputExpression_eq (source : SuppliedStage3.Source) (child : Fin 12) :
    zero2InputExpression (zero2Input source child) =
      weightedExpression (zero2Mass source child) (fastZero2Source source child) := by
  unfold zero2Input
  simp only [zero2InputPopulation_eq]
  split_ifs with empty
  · have massZero : zero2Mass source child = 0 := by
      simp only [zero2Mass, ← balancedZero2Numerator_eq, empty, Nat.cast_zero, zero_div]
    simp only [zero2InputExpression, massZero, Nat.cast_zero, zero_div, weightedExpression, ite_true]
  · unfold zero2InputExpression
    rw [balancedZero2Numerator_eq]
    congr 2
    funext orbit
    fin_cases orbit <;> rfl

/-- Integer input caching preserves every original terminal logarithmic term exactly. -/
theorem terminalInputExpression_eq (source : SuppliedTerminalScaling.Source) :
    terminalInputExpression (terminalInput source) =
      weightedExpression (SuppliedTerminalRates.sourceMass source) (fastTerminalSource source) := by
  rw [← SuppliedTerminalRates.balancedSourceMass_eq]
  unfold terminalInput
  simp only [terminalInputPopulation_eq]
  split_ifs with empty
  · simp only [terminalInputExpression, SuppliedTerminalRates.balancedSourceMass,
      empty, Nat.cast_zero, zero_div, weightedExpression, ite_true]
  · rfl

/-- Original zero2 source and child at one of 504 positions in a seven-node block. -/
def zero2InputRecord (block : Fin 135) (index : Fin 504) : SuppliedStage3.Source × Fin 12 :=
  let coordinates := (finProdFinEquiv : Fin 7 × Fin 72 ≃ Fin 504).symm index
  let childStrategy := (finProdFinEquiv : Fin 12 × Fin 6 ≃ Fin 72).symm coordinates.2
  ((finProdFinEquiv (block, coordinates.1), childStrategy.2), childStrategy.1)

/-- Every original zero2 integer input in source-offset, child, and strategy order. -/
def zero2InputBlock (block : Fin 135) (index : Fin 504) : Zero2Input :=
  zero2Input (zero2InputRecord block index).1 (zero2InputRecord block index).2

/-- Every original terminal integer input in source-offset, child, and strategy order. -/
def terminalInputBlock (block : Fin 135) (index : Fin 126) : TerminalInput :=
  terminalInput (SuppliedTerminalRates.inputRecord block index)

/-- The complete flat zero2 input block retains its exact original source logarithmic value. -/
theorem zero2InputBlock_value (block : Fin 135) :
    rationalLogValue (finiteLogSum (fun index => zero2InputExpression (zero2InputBlock block index))) =
      rationalLogValue (zero2BlockExpression block) := by
  simp only [finiteLogSum_value, zero2InputBlock, zero2InputExpression_eq, zero2BlockExpression]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 7 × Fin 72 ≃ Fin 504), Fintype.sum_prod_type]
  simp only [zero2InputRecord, Equiv.symm_apply_apply]
  congr 1
  funext offset
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 12 × Fin 6 ≃ Fin 72), Fintype.sum_prod_type]
  simp only [Equiv.symm_apply_apply]

/-- The complete flat terminal input block retains its exact original source logarithmic value. -/
theorem terminalInputBlock_value (block : Fin 135) :
    rationalLogValue (finiteLogSum (fun index => terminalInputExpression (terminalInputBlock block index))) =
      rationalLogValue (terminalBlockExpression block) := by
  simp only [finiteLogSum_value, terminalInputBlock, terminalInputExpression_eq, terminalBlockExpression]
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 7 × Fin 18 ≃ Fin 126), Fintype.sum_prod_type]
  simp only [SuppliedTerminalRates.inputRecord, Equiv.symm_apply_apply]
  congr 1
  funext offset
  rw [← Equiv.sum_comp (finProdFinEquiv : Fin 3 × Fin 6 ≃ Fin 18), Fintype.sum_prod_type]
  simp only [Equiv.symm_apply_apply, SuppliedTerminalRates.blockNode]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
