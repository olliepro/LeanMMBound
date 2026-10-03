module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange02 : allRange childChk 3 14 7 = true := by decide +kernel

theorem childOK02 : ∀ i < 7, ChildOK (14 + i) := childOK_of_range 3 14 7 childRange02

end MatrixBounds.Numeric.FKLHier4
