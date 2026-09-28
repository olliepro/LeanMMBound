import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock006
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 4 → ℕ := ![10260820, 147632136, 147656352, 1003929256]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 4 → Fin 231 → ℕ := ![
  ![0, 0, 0, 0, 0, 2653074440, 0, 0, 0, 263762612692, 0, 5182499448, 122664163112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 422509845280, 0, 0, 761387494408, 8015169722144, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8345966868, 196717342688, 0, 0, 303434279080, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1159575714244, 0, 0, 3578112853132, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2752670476880, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 8867025372, 0, 0, 17171491520, 0, 0, 214058837492, 0, 0, 0, 0, 0, 0, 0, 0, 11638220584, 0, 0, 0, 999433150796, 0, 21561535064, 473973398792, 0, 0, 2431656600772, 0, 0, 0, 0, 0, 0, 0, 22719679968, 0, 0, 37409350356, 370291794712, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 277875386996, 0, 0, 459960632204, 4582373799464, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 410978252252, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 666770477072, 6585446411000, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7148325420, 0, 0, 14296604212, 0, 0, 178707071544, 0, 0, 0, 0, 0, 0, 0, 0, 12346420680, 0, 0, 0, 1041327069620, 0, 21891929104, 488089720356, 0, 0, 2472105592468, 0, 0, 0, 0, 0, 0, 0, 21452073272, 0, 0, 36728461056, 367111254292, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 268150870920, 0, 0, 459105726656, 4588890508956, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 420424023328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 668667090716, 6525743301816, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 872244696, 0, 0, 10566557392, 21498605308, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 43132531560, 0, 0, 85153963716, 0, 0, 915572377040, 0, 0, 0, 0, 0, 0, 0, 1102886152, 0, 0, 0, 72190436848, 0, 1814340516, 35410766628, 0, 0, 165597247180, 0, 0, 0, 0, 0, 0, 0, 13065858500, 0, 0, 0, 875045899136, 0, 22473340736, 427262445816, 0, 0, 2018127249748, 0, 0, 0, 0, 0, 26075714360, 0, 0, 80287884056, 778590163652, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 18263151244, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1236401338804, 0, 30955462052, 614979833408, 0, 0, 2949615055344, 0, 0, 0, 0, 0, 62574086508, 1214464717192, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5871091886824, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    zero4InputPopulation (finProdFinEquiv ((6 : Fin 12), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero4InputNumerator (finProdFinEquiv ((6 : Fin 12), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 1 (populations offset)
    (probabilities offset) OrbitLevel4.sizes OrbitLevel4.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero4BlockExpression 6) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero4InputBlock_value 6

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock006
