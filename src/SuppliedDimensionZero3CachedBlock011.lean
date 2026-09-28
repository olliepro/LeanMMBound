import SuppliedDimensionZero3InputBlock011

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock011
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(66711347999 : ℚ) / 2199023255552, (-23866377359825359803985623753 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(208472960057 : ℚ) / 549755813888, (-74582428376574608854981058079 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(1298420067325 : ℚ) / 2199023255552, (-464517420616546630830333529275 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(2 : ℚ) / 1, (74582428376574608854981058079 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (2667983661161572809166908514785 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (5854622557457804689266915214647 : ℚ) / 21267647932558653966460912964485513216⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock011.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 11) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock011.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock011
