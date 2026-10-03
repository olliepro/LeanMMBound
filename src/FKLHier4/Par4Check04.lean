module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range04 : allRange par4Chk 3 28 7 = true := by decide +kernel

theorem par4OK04 : ∀ i < 7, Par4OK (28 + i) := par4OK_of_range 3 28 7 par4Range04

end MatrixBounds.Numeric.FKLHier4
