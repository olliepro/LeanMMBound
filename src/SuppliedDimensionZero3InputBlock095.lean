import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock095
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![114091480665774120576, 851586583199088, 413890498046857216, 97831955488140108339456, 97831955488140108339456, 136135509869654459892992, 136131692169723262562176]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 17592186044416],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 4044446335536, 0, 0, 1980029163300, 0, 0, 11567710545580, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 84041471464, 0, 0, 0, 4589675692436, 0, 126471312328, 2372217904668, 0, 0, 10419779663520, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 84041441992, 0, 0, 0, 4589675800068, 0, 126471030460, 2372217551704, 0, 0, 10419780220192, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1182819388488, 0, 0, 1678180094368, 0, 0, 14731186561560, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1182818263476, 0, 0, 1678179259548, 0, 0, 14731188521392, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((95 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((95 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 95) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 95

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock095
