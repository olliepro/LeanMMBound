import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock001
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 4 → ℕ := ![10293308, 137122056, 960138280, 3324807768]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 4 → Fin 231 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 62243447368, 0, 1572401800, 33816369532, 0, 0, 196401329080, 0, 0, 0, 0, 0, 0, 0, 0, 315371336572, 0, 0, 610444096304, 7262913703952, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4763556528, 125255380128, 0, 0, 298646275004, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 805867876624, 0, 0, 3738088116716, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4136802154808, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1497004060, 0, 0, 2986422812, 0, 0, 30314465408, 0, 0, 0, 0, 0, 0, 0, 0, 10387391024, 0, 0, 0, 746992286524, 0, 19292868840, 379481058900, 0, 0, 1882258609020, 0, 0, 0, 0, 0, 0, 0, 13388336124, 0, 0, 27918490080, 312347136940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 167476988304, 0, 0, 351653420100, 3865113028436, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 404002592800, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 806125260352, 8570950684692, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 675302856, 605470328, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 36857922852, 0, 0, 60460455368, 0, 0, 615667463932, 0, 0, 0, 0, 0, 0, 0, 696332304, 0, 0, 0, 51438732508, 0, 1266282484, 25367495872, 0, 0, 121922579440, 0, 0, 0, 0, 0, 0, 0, 8848498828, 0, 0, 0, 633799875228, 0, 15673817752, 316114806536, 0, 0, 1518752191584, 0, 0, 0, 0, 0, 13566059764, 0, 0, 60803305112, 642574916304, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22027368968, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1417819957240, 0, 36947750348, 703199192028, 0, 0, 3296014732984, 0, 0, 0, 0, 0, 63330168596, 1306670373868, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6621084991332, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 903126936, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4277039972, 0, 0, 52740483624, 79214864200, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3816084068, 0, 0, 6182470808, 0, 0, 60489970520, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48190187920, 0, 0, 77687787632, 0, 0, 760829365856, 0, 0, 0, 0, 0, 2610465564, 0, 0, 0, 163897806352, 0, 4183343944, 81265582232, 0, 0, 379635358512, 0, 0, 0, 0, 0, 0, 0, 5104880624, 54465762036, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 105024303108, 0, 0, 168272383548, 0, 0, 1639462458820, 0, 0, 0, 0, 0, 0, 324880489016, 0, 8228432368, 159863913984, 0, 0, 748153183632, 0, 0, 0, 0, 0, 0, 3313371118552, 0, 87417283924, 1644615470484, 0, 0, 7607402426180, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    zero4InputPopulation (finProdFinEquiv ((1 : Fin 12), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero4InputNumerator (finProdFinEquiv ((1 : Fin 12), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 1 (populations offset)
    (probabilities offset) OrbitLevel4.sizes OrbitLevel4.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero4BlockExpression 1) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero4InputBlock_value 1

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock001
