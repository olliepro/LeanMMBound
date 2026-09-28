import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock044
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![2541563530423564039200, 27335223587846150484480, 32625425183683656960, 37454236873531027207200, 89983405019536259760, 3492292620866663454400, 134181550413311815870400]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 601995426092, 7155463573728, 0, 0, 9834727044596, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 1182607360128, 0, 0, 1659589883820, 14749988800468, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 776053496884, 0, 0, 1282865710948, 15533266836584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85619230868, 0, 0, 0, 4598110285680, 0, 128077682832, 2368801599172, 0, 0, 10411577245864, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 68840076552, 0, 0, 0, 4504419217428, 0, 147498424928, 2275439802792, 0, 0, 10595988522716, 0, 0, 0, 0, 0],
  ![0, 0, 452207101384, 5483078826516, 0, 0, 11656900116516, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 776344295288, 0, 0, 1594162068976, 15221679680152, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((44 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((44 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 44) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 44

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock044
