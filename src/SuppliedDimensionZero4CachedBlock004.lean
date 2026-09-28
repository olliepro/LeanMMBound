import SuppliedDimensionZero4InputBlock004

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock004
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(69290723477 : ℚ) / 4398046511104, (-74071783396913 : ℚ) / 9671406556917033397649408⟩,
  ⟨(799026802719 : ℚ) / 4398046511104, (-854159652106611 : ℚ) / 9671406556917033397649408⟩,
  ⟨(687734622707 : ℚ) / 2199023255552, (-735188311673783 : ℚ) / 4835703278458516698824704⟩,
  ⟨(1077129869747 : ℚ) / 2199023255552, (-1151451830759543 : ℚ) / 4835703278458516698824704⟩,
  ⟨(4 : ℚ) / 1, (854159652106611 : ℚ) / 9671406556917033397649408⟩,
  ⟨(5 : ℚ) / 1, (4694510146267599 : ℚ) / 4835703278458516698824704⟩,
  ⟨(8 : ℚ) / 1, (1678588825333151 : ℚ) / 9671406556917033397649408⟩,
  ⟨(16 : ℚ) / 1, (1151451830759543 : ℚ) / 4835703278458516698824704⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero4InputBlock004.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero4BlockExpression 4) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero4InputBlock004.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock004
