import SuppliedDimensionHigherArithmetic

/-! Exact integer caches for the original higher zero-coordinate dimension factors. -/
namespace MatrixBounds.Numeric.SuppliedDimensionRates

open DyadicPopulationArithmetic
noncomputable section

/-- Full zero-coordinate contribution from an exact population and every original orbit numerator. -/
def higherInputExpression {count : ℕ} (consumed population : ℕ) (numerators : Fin count → ℕ)
    (sizes middle : Fin count → ℕ) : RationalLogExpression :=
  weightedExpression ((population : ℚ)/(denominator^consumed : ℕ))
    (zeroDimensionExpression 5 (fun orbit => (numerators orbit : ℚ)/denominator) sizes middle)

/-- A zero source population permits neutral cached orbit entries without changing any contribution. -/
theorem higherInputExpression_zero {count : ℕ} (consumed population : ℕ) (numerators : Fin count → ℕ)
    (sizes middle : Fin count → ℕ) :
    higherInputExpression consumed population (fun orbit => if population = 0 then 0 else numerators orbit) sizes middle =
      higherInputExpression consumed population numerators sizes middle := by
  by_cases empty : population = 0
  · simp only [higherInputExpression, empty, Nat.cast_zero, zero_div, weightedExpression, ite_true]
  · simp only [if_neg empty]

/-- Complete original root zero-factor population numerator. -/
def zero4InputPopulation (node : Fin 48) : ℕ :=
  SuppliedTypedParameters.rootDistribution.numerator (zero4Column node)

/-- Complete original root zero-factor orbit numerator; empty populations have neutral cached inputs. -/
def zero4InputNumerator (node : Fin 48) (orbit : Fin 231) : ℕ :=
  if zero4InputPopulation node = 0 then 0 else (SuppliedTypedParameters.zero4 node).numerator orbit

/-- Complete original zero3 orbit numerator; empty populations have neutral cached inputs. -/
def zero3InputNumerator (node : Fin 840) (orbit : Fin 21) : ℕ :=
  if balancedZero3Numerator node = 0 then 0 else (SuppliedTypedParameters.zero3 node).numerator orbit

/-- The root zero-factor integer cache preserves every complete original logarithmic term. -/
theorem zero4InputExpression_eq (node : Fin 48) :
    higherInputExpression 1 (zero4InputPopulation node) (zero4InputNumerator node)
      OrbitLevel4.sizes OrbitLevel4.middle = weightedExpression (zero4Mass node) (fastZero4Source node) := by
  unfold zero4InputNumerator
  rw [higherInputExpression_zero]
  rfl

/-- The hierarchy zero-factor integer cache preserves every complete original logarithmic term. -/
theorem zero3InputExpression_eq (node : Fin 840) :
    higherInputExpression 2 (balancedZero3Numerator node) (zero3InputNumerator node)
      OrbitLevel3.sizes OrbitLevel3.middle = weightedExpression (zero3Mass node) (fastZero3Source node) := by
  unfold zero3InputNumerator
  rw [higherInputExpression_zero, balancedZero3Numerator_eq]
  rfl

/-- Four complete root zero-factor caches give precisely their original block value. -/
theorem zero4InputBlock_value (block : Fin 12) :
    rationalLogValue (finiteLogSum (fun offset : Fin 4 =>
      higherInputExpression 1 (zero4InputPopulation (finProdFinEquiv (block, offset)))
        (zero4InputNumerator (finProdFinEquiv (block, offset))) OrbitLevel4.sizes OrbitLevel4.middle)) =
      rationalLogValue (zero4BlockExpression block) := by
  simp only [zero4InputExpression_eq, zero4BlockExpression]

/-- Seven complete hierarchy zero-factor caches give precisely their original block value. -/
theorem zero3InputBlock_value (block : Fin 120) :
    rationalLogValue (finiteLogSum (fun offset : Fin 7 =>
      higherInputExpression 2 (balancedZero3Numerator (finProdFinEquiv (block, offset)))
        (zero3InputNumerator (finProdFinEquiv (block, offset))) OrbitLevel3.sizes OrbitLevel3.middle)) =
      rationalLogValue (zero3BlockExpression block) := by
  simp only [zero3InputExpression_eq, zero3BlockExpression]

end
end MatrixBounds.Numeric.SuppliedDimensionRates
