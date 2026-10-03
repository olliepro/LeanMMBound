module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange00 : allRange childChk 3 0 7 = true := by decide +kernel

theorem childOK00 : ∀ i < 7, ChildOK (0 + i) := childOK_of_range 3 0 7 childRange00

end MatrixBounds.Numeric.FKLHier4
