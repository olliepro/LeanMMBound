import SuppliedDimensionZero3InputBlock000

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock000
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(142014791603 : ℚ) / 4398046511104, (-6118884780491806165304470827 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(886761667659 : ℚ) / 2199023255552, (-38207234689541779261124128131 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(2482508384183 : ℚ) / 4398046511104, (-106961976269940732248987908047 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2 : ℚ) / 1, (38207234689541779261124128131 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (249142005927248318764790436477 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (375978021051056340328880411349 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock000.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 0) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock000.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock000
