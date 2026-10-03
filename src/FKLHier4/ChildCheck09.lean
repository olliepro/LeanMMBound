module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange09 : allRange childChk 3 63 7 = true := by decide +kernel

theorem childOK09 : ∀ i < 7, ChildOK (63 + i) := childOK_of_range 3 63 7 childRange09

end MatrixBounds.Numeric.FKLHier4
