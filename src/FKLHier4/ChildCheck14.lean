module

public import FKLHier4.ChildTable

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem childRange14 : allRange childChk 3 98 7 = true := by decide +kernel

theorem childOK14 : ∀ i < 7, ChildOK (98 + i) := childOK_of_range 3 98 7 childRange14

end MatrixBounds.Numeric.FKLHier4
