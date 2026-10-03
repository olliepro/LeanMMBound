module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange11 : allRange childChk 3 77 7 = true := by decide +kernel

theorem childOK11 : ∀ i < 7, ChildOK (77 + i) := childOK_of_range 3 77 7 childRange11

end MatrixBounds.Numeric.FKLHier4
