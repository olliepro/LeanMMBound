module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange08 : allRange childChk 3 56 7 = true := by decide +kernel

theorem childOK08 : ∀ i < 7, ChildOK (56 + i) := childOK_of_range 3 56 7 childRange08

end MatrixBounds.Numeric.FKLHier4
