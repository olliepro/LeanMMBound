module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range14 : allRange par4Chk 3 98 7 = true := by decide +kernel

theorem par4OK14 : ∀ i < 7, Par4OK (98 + i) := par4OK_of_range 3 98 7 par4Range14

end MatrixBounds.Numeric.FKLHier4
