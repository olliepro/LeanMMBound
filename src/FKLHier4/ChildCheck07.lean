module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange07 : allRange childChk 3 49 7 = true := by decide +kernel

theorem childOK07 : ∀ i < 7, ChildOK (49 + i) := childOK_of_range 3 49 7 childRange07

end MatrixBounds.Numeric.FKLHier4
