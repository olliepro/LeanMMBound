import SuppliedDimensionZero4InputBlock011

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock011
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(42953662715 : ℚ) / 4398046511104, (-11898164572055 : ℚ) / 2417851639229258349412352⟩,
  ⟨(529467140775 : ℚ) / 4398046511104, (-146662397994675 : ℚ) / 2417851639229258349412352⟩,
  ⟨(1123371362439 : ℚ) / 4398046511104, (-311173867395603 : ℚ) / 2417851639229258349412352⟩,
  ⟨(2702254345175 : ℚ) / 4398046511104, (-748524453613475 : ℚ) / 2417851639229258349412352⟩,
  ⟨(4 : ℚ) / 1, (146662397994675 : ℚ) / 2417851639229258349412352⟩,
  ⟨(5 : ℚ) / 1, (1225877050396777 : ℚ) / 1208925819614629174706176⟩,
  ⟨(8 : ℚ) / 1, (181052347376853 : ℚ) / 1208925819614629174706176⟩,
  ⟨(16 : ℚ) / 1, (748524453613475 : ℚ) / 2417851639229258349412352⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero4InputBlock011.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero4BlockExpression 11) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero4InputBlock011.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero4CachedBlock011
