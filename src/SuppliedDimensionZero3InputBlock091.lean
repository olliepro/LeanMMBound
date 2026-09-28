import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock091
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![823552082080, 4286039395637950080, 1099554211253114393920, 46776880062675262094400, 315128623605111725972160, 146097178913847425954560, 8244379986317580064960]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 17592186044416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 17592186044416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 470119994968, 5878561907188, 0, 0, 11243504142260, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 671813648712, 0, 0, 1308941789228, 15611430606476, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 44076154904, 0, 0, 0, 4335780702600, 0, 88217007252, 1958514237984, 0, 0, 11165597941676, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 736650687156, 0, 0, 1147586317936, 0, 0, 15707949039324, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 340654406460, 0, 0, 5618467813672, 11633063824284, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((91 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((91 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 91) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 91

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock091
