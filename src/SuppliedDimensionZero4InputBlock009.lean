import SuppliedDimensionHigherInputCache

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock009
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Every complete original source population in this consecutive block. -/
def populations : Fin 4 → ℕ := ![971046096, 138975188, 140317544, 10561944]

/-- Every original probability numerator, with neutral entries only for empty source populations. -/
def probabilities : Fin 4 → Fin 231 → ℕ := ![
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 369262500, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4440374020, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 41378090700, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 906123572, 0, 0, 11029925168, 23450818128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6994088940, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 67531959136, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 655889716124, 0, 0, 0, 0, 0, 0, 54602246872, 0, 0, 667964541112, 1419693542124, 0, 0, 16884080240, 0, 0, 66510393508, 0, 0, 662145901824, 0, 0, 0, 0, 0, 0, 0, 1452870624, 0, 0, 17908245596, 38035374180, 0, 0, 0, 0, 26805662656, 0, 0, 331443637076, 703793879724, 0, 0, 65308702868, 0, 0, 1306300689464, 0, 0, 0, 0, 0, 122929524992, 0, 0, 0, 0, 0, 0, 0, 1527203211864, 3241365789424, 0, 0, 6509847391980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4567870632, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11567467048, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7797936208, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79943102720, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 814947363324, 0, 0, 0, 0, 0, 15889927480, 0, 0, 195470864984, 415165140736, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 21693775876, 0, 0, 0, 0, 0, 0, 0, 0, 408442533692, 0, 0, 28371881084, 0, 0, 349783432216, 742784962204, 0, 0, 0, 0, 318109450892, 0, 0, 0, 0, 0, 0, 0, 0, 1933381410260, 0, 0, 3919861761652, 8324407163408, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4964228772, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12594058504, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7967364356, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 79537251324, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 827388082064, 0, 0, 0, 0, 0, 15950108408, 0, 0, 196633404468, 417585086072, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 22230795872, 0, 0, 0, 0, 0, 0, 0, 0, 410894186508, 0, 0, 30071236504, 0, 0, 376448551776, 798569299816, 0, 0, 0, 0, 315163873680, 0, 0, 0, 0, 0, 0, 0, 0, 1919456074140, 0, 0, 3892227107876, 8264505334276, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  ![0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1903191904, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 142336719320, 0, 0, 0, 0, 0, 0, 0, 0, 0, 355530077880, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3795097792, 0, 0, 0, 0, 0, 0, 0, 0, 72139238400, 0, 0, 0, 0, 0, 0, 646309156676, 0, 5640770428, 0, 0, 138905379128, 295028127572, 0, 0, 0, 0, 0, 0, 0, 346499173740, 0, 0, 0, 7236586601104, 0, 855331241492, 3633457760844, 0, 0, 3858723508136, 0, 0, 0, 0, 0]
]

/-- Every population integer equals its complete original source coefficient. -/
theorem population_checked : ∀ offset, populations offset =
    zero4InputPopulation (finProdFinEquiv ((9 : Fin 12), offset)) := by decide +kernel

/-- Every nonempty source orbit integer equals its complete original probability entry. -/
theorem probability_checked : ∀ offset orbit, probabilities offset orbit =
    zero4InputNumerator (finProdFinEquiv ((9 : Fin 12), offset)) orbit := by decide +kernel

/-- Complete block evaluated solely from checked exact original integer inputs. -/
def expression : RationalLogExpression :=
  finiteLogSum (fun offset => higherInputExpression 1 (populations offset)
    (probabilities offset) OrbitLevel4.sizes OrbitLevel4.middle)

/-- Integer caching retains all original source contributions and their exact full logarithmic value. -/
theorem expression_value : rationalLogValue expression = rationalLogValue (zero4BlockExpression 9) := by
  have probabilities_eq := funext (fun offset => funext (probability_checked offset))
  simpa only [expression, funext population_checked, probabilities_eq] using zero4InputBlock_value 9

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4InputBlock009
