import SuppliedDimensionZero4InputBlock000

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock000
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(10746832249 : ℚ) / 4398046511104, (-1088127512043499 : ℚ) / 19342813113834066795298816⟩,
  ⟨(23158257133 : ℚ) / 4398046511104, (-2344796692973383 : ℚ) / 19342813113834066795298816⟩,
  ⟨(24292190919 : ℚ) / 4398046511104, (-51426568175523 : ℚ) / 19342813113834066795298816⟩,
  ⟨(94588708615 : ℚ) / 4398046511104, (-9577201335977365 : ℚ) / 19342813113834066795298816⟩,
  ⟨(335938427937 : ℚ) / 4398046511104, (-34014101767049187 : ℚ) / 19342813113834066795298816⟩,
  ⟨(376342484397 : ℚ) / 4398046511104, (-796717039468449 : ℚ) / 19342813113834066795298816⟩,
  ⟨(255782155195 : ℚ) / 1099511627776, (-541490822547815 : ℚ) / 4835703278458516698824704⟩,
  ⟨(1162382329713 : ℚ) / 4398046511104, (-117692373265770963 : ℚ) / 19342813113834066795298816⟩,
  ⟨(2771231955457 : ℚ) / 4398046511104, (-280590006721976707 : ℚ) / 19342813113834066795298816⟩,
  ⟨(92946350469 : ℚ) / 137438953472, (-196767423942873 : ℚ) / 604462909807314587353088⟩,
  ⟨(4 : ℚ) / 1, (796717039468449 : ℚ) / 19342813113834066795298816⟩,
  ⟨(5 : ℚ) / 1, (332141895044606411 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (37469152718837005 : ℚ) / 19342813113834066795298816⟩,
  ⟨(16 : ℚ) / 1, (63166863762458141 : ℚ) / 9671406556917033397649408⟩,
  ⟨(32 : ℚ) / 1, (36270901007244259 : ℚ) / 2417851639229258349412352⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero4InputBlock000.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero4BlockExpression 0) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero4InputBlock000.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock000
