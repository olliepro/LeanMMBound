module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange13 : allRange childChk 3 91 7 = true := by decide +kernel

theorem childOK13 : ∀ i < 7, ChildOK (91 + i) := childOK_of_range 3 91 7 childRange13

end MatrixBounds.Numeric.FKLHier4
