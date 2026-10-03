module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange03 : allRange childChk 3 21 7 = true := by decide +kernel

theorem childOK03 : ∀ i < 7, ChildOK (21 + i) := childOK_of_range 3 21 7 childRange03

end MatrixBounds.Numeric.FKLHier4
