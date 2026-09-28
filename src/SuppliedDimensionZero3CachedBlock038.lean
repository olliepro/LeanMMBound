import SuppliedDimensionZero3InputBlock038

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock038
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(136595615373 : ℚ) / 4398046511104, (-894441595231955901814383669543 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(169808951101 : ℚ) / 4398046511104, (-331196789230928557003075011545 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(334128563421 : ℚ) / 4398046511104, (-651687126490508043935685405945 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(1620727949029 : ℚ) / 4398046511104, (-10612686858271275224556897275439 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(1320361473351 : ℚ) / 2199023255552, (-8645857477064539972033700397141 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(1947054498291 : ℚ) / 2199023255552, (-3797551272241608717076900915095 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2 : ℚ) / 1, (10612686858271275224556897275439 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(4 : ℚ) / 1, (9965122779822221036257797132443 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(5 : ℚ) / 1, (66592760764737192846836238900743 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(8 : ℚ) / 1, (651687126490508043935685405945 : ℚ) / 42535295865117307932921825928971026432⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock038.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 38) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock038.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock038
