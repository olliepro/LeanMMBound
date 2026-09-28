import SuppliedDimensionZero3InputBlock001

namespace MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock001
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- Complete exact rational logarithm coefficients. -/
def summary : RationalLogExpression := [
  ⟨(142016962611 : ℚ) / 4398046511104, (-1828705633587760029765724930143 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(3073511161 : ℚ) / 68719476736, (-12735646803505890611811651033 : ℚ) / 1329227995784915872903807060280344576⟩,
  ⟨(354458438345 : ℚ) / 4398046511104, (-1468762350553959500416193359785 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(1639886080677 : ℚ) / 4398046511104, (-21116272725747641395823568042201 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(327017933477 : ℚ) / 549755813888, (-4210902178436657553839023888601 : ℚ) / 10633823966279326983230456482242756608⟩,
  ⟨(3846883358455 : ℚ) / 4398046511104, (-15940253729752903261099255470615 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(2 : ℚ) / 1, (21116272725747641395823568042201 : ℚ) / 85070591730234615865843651857942052864⟩,
  ⟨(4 : ℚ) / 1, (89693613045343004396205537602495 : ℚ) / 42535295865117307932921825928971026432⟩,
  ⟨(5 : ℚ) / 1, (17926722071634159875476211360567 : ℚ) / 5316911983139663491615228241121378304⟩,
  ⟨(8 : ℚ) / 1, (1468762350553959500416193359785 : ℚ) / 85070591730234615865843651857942052864⟩
]

/-- The complete original cached inputs reduce to their exact full rational logarithm summary. -/
theorem checked : mergeNormalizeLogExpression SuppliedDimensionZero3InputBlock001.expression = summary := by decide +kernel

/-- The original complete source block has exactly its checked summarized logarithmic value. -/
theorem value : rationalLogValue (zero3BlockExpression 1) = rationalLogValue summary := by
  rw [← SuppliedDimensionZero3InputBlock001.expression_value, ← mergeNormalizeLogExpression_value, checked]

end MatrixBounds.Numeric.SuppliedDimensionRates.SuppliedDimensionZero3CachedBlock001
