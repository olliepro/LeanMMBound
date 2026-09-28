import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock046
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![3591857788816759571200, 3492292620866663454400, 37437963337598736167280, 373211755002454657526880, 213077460114197915126352, 13039674008710014987264, 89421815727645324432]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 84598834068, 0, 0, 0, 4586363775100, 0, 114478597332, 2433411982644, 0, 0, 10373332855272, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 84651766432, 0, 0, 0, 4599948603996, 0, 129838767744, 2324295526128, 0, 0, 10453451380116, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 775107153236, 0, 0, 1650130757120, 15166948134060, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85753629016, 0, 0, 0, 4598831194192, 0, 127936284500, 2369018851976, 0, 0, 10410646084732, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1183804634596, 0, 0, 1659045945364, 0, 0, 14749335464456, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 592469226288, 0, 0, 7407485116496, 9592231701632, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((46 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((46 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 46) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 46

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock046
