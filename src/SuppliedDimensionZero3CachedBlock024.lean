import SuppliedDimensionZero3InputBlock024

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock024
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(66680379155 : ℚ) / 2199023255552, (-149663804110566179076552819845 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(66680379209 : ℚ) / 2199023255552, (-149663804231768930536381012991 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(99727913675 : ℚ) / 274877906944, (-223838843236263449562879901325 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(1595646620467 : ℚ) / 4398046511104, (-3581421495521789020478922828133 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(2669039132219 : ℚ) / 4398046511104, (-5990646047757314371726491917981 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(1334519566997 : ℚ) / 2199023255552, (-2995323025870646851059496355603 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(2 : ℚ) / 1, (7162842987302004213485001249333 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(4 : ℚ) / 1, (24059520116721409627673434779083 : ℚ) / 21267647932558653966460912964485513216⟩,
  ⟨(5 : ℚ) / 1, (3110490185883709744328940890079 : ℚ) / 1329227995784915872903807060280344576⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock024.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 24) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock024.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock024
