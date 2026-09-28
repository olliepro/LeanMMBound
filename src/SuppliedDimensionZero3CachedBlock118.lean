import SuppliedDimensionZero3InputBlock118

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock118
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(9398679027 : ℚ) / 274877906944, (-191692263220193706483914619 : ℚ) / 332306998946228968225951765070086144⟩,
  ⟨(1789027076461 : ℚ) / 4398046511104, (-36488388236669125716386623717 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(2458640570211 : ℚ) / 4398046511104, (-50145597481816649504726767467 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(2 : ℚ) / 1, (36488388236669125716386623717 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(4 : ℚ) / 1, (2606196525788128185926396563227 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (85195369485367499611254810757 : ℚ) / 166153499473114484112975882535043072⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock118.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 118) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock118.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock118
