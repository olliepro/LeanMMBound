module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range01 : allRange par4Chk 3 7 7 = true := by decide +kernel

theorem par4OK01 : ∀ i < 7, Par4OK (7 + i) := par4OK_of_range 3 7 7 par4Range01

end MatrixBounds.Numeric.FKLHier4
