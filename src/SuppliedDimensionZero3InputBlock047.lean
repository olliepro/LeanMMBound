import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock047
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![32398999089598166832, 2573646079047509907264, 32398999089598166832, 27296080470078010324224, 89421815727645324432, 37437963337598736167280, 97927478736160071234192]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 17592186044416, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 593042458804, 7406923369404, 0, 0, 9592220216208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 776070434080, 0, 0, 1280890595728, 15535225014608, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 1182581586780, 0, 0, 1658628930184, 14750975527452, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 68848105568, 0, 0, 0, 4504348524084, 0, 147567199988, 2275721867620, 0, 0, 10595700347156, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85600793872, 0, 0, 0, 4598108288984, 0, 127889630660, 2368366040436, 0, 0, 10412221290464, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 83395547536, 0, 0, 0, 4587076314384, 0, 124871470604, 2368118565576, 0, 0, 10428724146316, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((47 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((47 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 47) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 47

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock047
