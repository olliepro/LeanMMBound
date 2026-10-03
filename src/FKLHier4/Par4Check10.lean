module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range10 : allRange par4Chk 3 70 7 = true := by decide +kernel

theorem par4OK10 : ∀ i < 7, Par4OK (70 + i) := par4OK_of_range 3 70 7 par4Range10

end MatrixBounds.Numeric.FKLHier4
