import SuppliedDimensionZero3InputBlock089

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock089
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(45650434035 : ℚ) / 2199023255552, (-2191317754113037637421885522345 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(15765963021 : ℚ) / 549755813888, (-3250328708218841378671934259 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(679530145017 : ℚ) / 2199023255552, (-140092700681012688379351977543 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(698158925553 : ℚ) / 2199023255552, (-33513110687705894085953419155651 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(363803473991 : ℚ) / 549755813888, (-17463339142696039897571524106597 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(1456429258451 : ℚ) / 2199023255552, (-300259097647744248008379221229 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(2 : ℚ) / 1, (16826601694193453387166385566597 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(4 : ℚ) / 1, (36901866215572891701060331768955 : ℚ) / 2658455991569831745807614120560689152⟩,
  ⟨(5 : ℚ) / 1, (104529717903702793893072054096267 : ℚ) / 2658455991569831745807614120560689152⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock089.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 89) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock089.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock089
