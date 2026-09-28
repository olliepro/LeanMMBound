import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock070
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 7 → ℕ := ![1534432136096197297888, 3452924960761917569472, 3602384053302497728704, 136024605977652221409472, 571058656899832338639040, 3602384053302497728704, 134134762281674849830336]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 7 → Fin 21 → ℕ := ![
  ![0, 0, 0, 0, 442748488, 0, 0, 1189555077328, 16402188218600, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 51846534560, 0, 0, 0, 4463461478580, 0, 96402919624, 2361378369028, 0, 0, 10619096742624, 0, 0, 0, 0, 0],
  ![0, 0, 537080721952, 6688094024376, 0, 0, 10367011298088, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 1038339112152, 0, 0, 1575755093880, 14978091838384, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 85940626124, 0, 0, 0, 4605368029992, 0, 130410249348, 2329350721272, 0, 0, 10441116417680, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 86229879360, 0, 0, 0, 4593430152788, 0, 114893378224, 2436977617204, 0, 0, 10360655016840, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 776581262320, 0, 0, 1594411523824, 0, 0, 15221193258272, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    balancedZero3Numerator (finProdFinEquiv ((70 : Fin 120), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero3InputNumerator (finProdFinEquiv ((70 : Fin 120), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 2 (populations offset)
    (probabilities offset) OrbitLevel3.sizes OrbitLevel3.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero3BlockExpression 70) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero3InputBlock_value 70

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3InputBlock070
