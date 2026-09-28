import SuppliedDimensionZero3InputBlock099

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock099
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(89803339611 : ℚ) / 4398046511104, (-17998462180880455572748764669969 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(117467009951 : ℚ) / 4398046511104, (-504601717541151672613886500845 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(699295115109 : ℚ) / 2199023255552, (-140153325445171916288253681316911 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(367137908729 : ℚ) / 1099511627776, (-1577110197973017111632794513755 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(2812027866237 : ℚ) / 4398046511104, (-12079596574975989806447225871015 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(2909652941275 : ℚ) / 4398046511104, (-583155132647327095253034552078225 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2 : ℚ) / 1, (146461766237063984734784859371931 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (317855208001455561766980301129317 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (904932070566241689210526252947477 : ℚ) / 5316911983139663491615228241121378304⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock099.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 99) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock099.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock099
