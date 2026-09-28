import SuppliedDimensionZero3InputBlock012

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock012
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(1109484767 : ℚ) / 34359738368, (-47618056994338393469638875 : ℚ) / 83076749736557242056487941267521536⟩,
  ⟨(1773514191645 : ℚ) / 4398046511104, (-76117583918139179134754660625 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2482518269283 : ℚ) / 4398046511104, (-106547381227996798162337067375 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2 : ℚ) / 1, (76117583918139179134754660625 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(4 : ℚ) / 1, (492655372698441122819769458415 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(5 : ℚ) / 1, (2911495353388441269091804965 : ℚ) / 41538374868278621028243970633760768⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock012.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 12) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock012.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock012
