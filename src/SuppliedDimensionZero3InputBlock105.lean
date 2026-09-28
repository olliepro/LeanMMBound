import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock105
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![35184173283239646825408, 590559435191309751680, 939994297605351572960, 2383791097409848768, 3085495970829639591792, 80022294371116265680608, 197780612190326831047648]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 591487835984, 0, 0, 7160184887124, 9840513321308, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416],
  ![0, 0, 0, 0, 647006188484, 0, 0, 1284380497628, 15660799358304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 42036311948, 0, 0, 0, 4160003147124, 0, 84134686840, 1945184080920, 0, 0, 11360827817584, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 775445048480, 0, 0, 1154851118544, 0, 0, 15661889877392, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((105 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((105 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 105) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 105

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock105
