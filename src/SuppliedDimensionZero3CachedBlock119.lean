import SuppliedDimensionZero3InputBlock119

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock119
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(18797403057 : ℚ) / 549755813888, (-3072799175009754433964186043 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(1788980942517 : ℚ) / 4398046511104, (-292443543802573606747446644583 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(2458686344131 : ℚ) / 4398046511104, (-401919847488722494200411071169 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(2 : ℚ) / 1, (292443543802573606747446644583 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (1918036102168449120841329078425 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (180016290241390049566557496901 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock119.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 119) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock119.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock119
