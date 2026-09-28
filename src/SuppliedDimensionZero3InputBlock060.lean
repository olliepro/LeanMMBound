import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock060
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![4301227957399245639168, 73337044866587989309968, 1293795243612983659632, 13480162824347901966432, 37427753690887016693984, 27293063973050423572128, 2532357658206097598432]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 0, 79300280760, 0, 0, 0, 4565645007056, 0, 125789344936, 2376880199272, 0, 0, 10444571212392, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85807228464, 0, 0, 0, 4595663145436, 0, 126443043796, 2393688740796, 0, 0, 10390583885924, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1022824080640, 0, 0, 1647152308560, 0, 0, 14922209655216, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 760742011864, 0, 0, 1680464261000, 0, 0, 15150979771552, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85601518056, 0, 0, 0, 4598113432464, 0, 127888073580, 2368363990964, 0, 0, 10412219029352, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1182586227500, 0, 0, 1658644218912, 0, 0, 14750955598004, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 601480368064, 0, 0, 7155742684860, 9834962991492, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((60 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((60 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 60) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 60

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock060
