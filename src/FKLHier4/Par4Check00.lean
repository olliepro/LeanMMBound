module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range00 : allRange par4Chk 3 0 7 = true := by decide +kernel

theorem par4OK00 : ∀ i < 7, Par4OK (0 + i) := par4OK_of_range 3 0 7 par4Range00

end MatrixBounds.Numeric.FKLHier4
