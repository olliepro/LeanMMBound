import SuppliedDimensionZero3InputBlock116

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock116
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(36677899073 : ℚ) / 1099511627776, (-229230843738904032228226790577 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(107450994471 : ℚ) / 2199023255552, (-108800479942199806904191634931 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(46233773789 : ℚ) / 549755813888, (-46814427381962630988257560929 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(1653301428631 : ℚ) / 4398046511104, (-10332862323589489365655897994919 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(2598033486181 : ℚ) / 4398046511104, (-16237282482125687684317000414869 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(1906637165925 : ℚ) / 2199023255552, (-1930582771704942647369666956425 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2 : ℚ) / 1, (10332862323589489365655897994919 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (97283641081532131542869499966281 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (2335365903869251954755544466171 : ℚ) / 664613997892457936451903530140172288⟩,
  ⟨(8 : ℚ) / 1, (46814427381962630988257560929 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock116.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 116) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock116.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock116
