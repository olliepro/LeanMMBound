import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock085
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![33555723462504142800, 37455327220920331698160, 37455327220920331698160, 370900598030962853824720, 27361619381689837044960, 206558231242714504438240, 2502781705388641300400]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 800506833172, 0, 0, 1433196253716, 0, 0, 15358482957528, 0, 0, 0, 0],
  ![0, 0, 0, 0, 802307379932, 0, 0, 1435894875360, 15353983789124, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 86103374144, 0, 0, 0, 4605910725852, 0, 148654130696, 2301888684872, 0, 0, 10449629128852, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 78173174252, 0, 0, 0, 4625856054760, 0, 133376274828, 2211160226872, 0, 0, 10543620313704, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 778056109316, 0, 0, 1514475055732, 0, 0, 15299654879368, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 778752381548, 0, 0, 1461088467708, 0, 0, 15352345195160, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 452824957812, 0, 0, 5481860628772, 11657500457832, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((85 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((85 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 85) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 85

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock085
