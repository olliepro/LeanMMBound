module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange12 : allRange childChk 3 84 7 = true := by decide +kernel

theorem childOK12 : ∀ i < 7, ChildOK (84 + i) := childOK_of_range 3 84 7 childRange12

end MatrixBounds.Numeric.FKLHier4
