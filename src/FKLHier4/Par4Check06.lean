module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range06 : allRange par4Chk 3 42 7 = true := by decide +kernel

theorem par4OK06 : ∀ i < 7, Par4OK (42 + i) := par4OK_of_range 3 42 7 par4Range06

end MatrixBounds.Numeric.FKLHier4
