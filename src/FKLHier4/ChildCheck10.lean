module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange10 : allRange childChk 3 70 7 = true := by decide +kernel

theorem childOK10 : ∀ i < 7, ChildOK (70 + i) := childOK_of_range 3 70 7 childRange10

end MatrixBounds.Numeric.FKLHier4
