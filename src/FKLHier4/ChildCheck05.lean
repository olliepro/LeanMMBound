module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange05 : allRange childChk 3 35 7 = true := by decide +kernel

theorem childOK05 : ∀ i < 7, ChildOK (35 + i) := childOK_of_range 3 35 7 childRange05

end MatrixBounds.Numeric.FKLHier4
