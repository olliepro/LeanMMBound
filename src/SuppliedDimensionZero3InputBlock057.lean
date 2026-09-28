import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock057
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![89914731182826572000, 37424449514554255032000, 32608196817634548000, 1190528373512417347968, 26302402694321092566528, 73231152347234024090304, 13731523794105779127648]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 68849901936, 0, 0, 0, 4504510953880, 0, 147513368116, 2275485213456, 0, 0, 10595826607028, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 775203400540, 0, 0, 1650448538928, 0, 0, 15166534104948, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 776036023796, 0, 0, 1316654447544, 0, 0, 15499495573076, 0, 0, 0, 0],
  ![0, 0, 333156030612, 5010034443596, 0, 0, 12248995570208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 694172324232, 0, 0, 1620265503776, 15277748216408, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 83464946832, 0, 0, 0, 4586242244872, 0, 125548484208, 2381200170920, 0, 0, 10415730197584, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1185389849612, 0, 0, 1704807350888, 0, 0, 14701988843916, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((57 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((57 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 57) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 57

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock057
