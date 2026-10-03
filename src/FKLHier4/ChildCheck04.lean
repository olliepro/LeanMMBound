module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange04 : allRange childChk 3 28 7 = true := by decide +kernel

theorem childOK04 : ∀ i < 7, ChildOK (28 + i) := childOK_of_range 3 28 7 childRange04

end MatrixBounds.Numeric.FKLHier4
