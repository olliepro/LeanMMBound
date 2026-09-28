import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock073
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![3453975756835188688800, 1534870718078887062720, 97976373651806987520, 3603412020044074548960, 136050163808010855249600, 3603412020044074548960, 571238779454479727724960]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 51738154912, 0, 0, 0, 4462967666188, 0, 96368957744, 2361223170880, 0, 0, 10619888094692, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 486666668, 0, 0, 1192717774764, 0, 0, 16398981602984, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3819998736, 0, 0, 492818595396, 17095547450284, 0, 0],
  ![0, 0, 537155406368, 6686825758640, 0, 0, 10368204879408, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 1038039100960, 0, 0, 1575604910504, 14978542032952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 86229736364, 0, 0, 0, 4593420989804, 0, 114890851488, 2437008909288, 0, 0, 10360635557472, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85942133720, 0, 0, 0, 4605407716216, 0, 130374028144, 2329252706496, 0, 0, 10441209459840, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((73 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((73 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 73) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 73

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock073
