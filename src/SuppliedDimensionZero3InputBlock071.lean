import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock071
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![1715852640763268456288, 3452924960761917569472, 97609446143531253344, 1181626416302200666704, 4278163664959966908448, 1262664592196128968288, 14393626464882743143296]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 778456890564, 0, 0, 1504662758924, 0, 0, 15309066394928, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 452646355972, 0, 0, 5481591687400, 11657948001044, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 484877136216, 0, 0, 5452250863132, 11655058045068, 0, 0],
  ![0, 0, 0, 0, 482642981764, 0, 0, 1512519075144, 15597023987508, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 78437206964, 0, 0, 0, 4567215593948, 0, 122429353208, 2368829281112, 0, 0, 10455274609184, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1422965068648, 0, 0, 1670196036776, 0, 0, 14499024938992, 0, 0, 0, 0],
  ![0, 0, 0, 0, 1161231498456, 0, 0, 1699862158368, 14731092387592, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((71 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((71 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 71) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 71

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock071
