module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange01 : allRange childChk 3 7 7 = true := by decide +kernel

theorem childOK01 : ∀ i < 7, ChildOK (7 + i) := childOK_of_range 3 7 7 childRange01

end MatrixBounds.Numeric.FKLHier4
