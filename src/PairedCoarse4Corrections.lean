import TerminalRateWindowCorrection

namespace MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Corrections
open scoped BigOperators
set_option maxRecDepth 100000
set_option maxHeartbeats 256000000

/-- All exact source-window differences on shared logarithm arguments. -/
def corrections : Fin 15 → RationalLogExpression := ![
  [⟨(1 : ℚ) / 2, (14601339 : ℚ) / 4398046511104⟩],
  [⟨(259 : ℚ) / 4398046511104, (210727589065 : ℚ) / 2417851639229258349412352⟩, ⟨(1 : ℚ) / 2, (-4777089 : ℚ) / 4398046511104⟩],
  [],
  [⟨(1 : ℚ) / 2, (-4812567 : ℚ) / 4398046511104⟩],
  [],
  [],
  [],
  [⟨(4503599627370475 : ℚ) / 4503599627370496, (-275913221899911742685727 : ℚ) / 9671406556917033397649408⟩],
  [],
  [⟨(259 : ℚ) / 4398046511104, (-210727589065 : ℚ) / 2417851639229258349412352⟩, ⟨(4503599627370475 : ℚ) / 4503599627370496, (275797467058780482607177 : ℚ) / 9671406556917033397649408⟩],
  [],
  [],
  [],
  [⟨(4503599627370475 : ℚ) / 4503599627370496, (57877420565630039275 : ℚ) / 4835703278458516698824704⟩],
  [⟨(1 : ℚ) / 2, (-5011683 : ℚ) / 4398046511104⟩]
]
/-- Every shared-argument correction cancels exactly across the complete source partition. -/
theorem checked : mergeNormalizeLogExpression (finiteLogSum corrections) = [] := by decide +kernel
/-- The total real correction vanishes. -/
theorem cancelled : (∑ block, rationalLogValue (corrections block)) = 0 :=
  SuppliedTerminalRates.sum_corrections_zero corrections checked

end MatrixBounds.Numeric.SuppliedPairedCoarse.PairedCoarse4Corrections
