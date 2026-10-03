module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange06 : allRange childChk 3 42 7 = true := by decide +kernel

theorem childOK06 : ∀ i < 7, ChildOK (42 + i) := childOK_of_range 3 42 7 childRange06

end MatrixBounds.Numeric.FKLHier4
