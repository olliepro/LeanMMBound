module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range08 : allRange par4Chk 3 56 7 = true := by decide +kernel

theorem par4OK08 : ∀ i < 7, Par4OK (56 + i) := par4OK_of_range 3 56 7 par4Range08

end MatrixBounds.Numeric.FKLHier4
