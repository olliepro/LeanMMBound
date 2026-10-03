module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range11 : allRange par4Chk 3 77 7 = true := by decide +kernel

theorem par4OK11 : ∀ i < 7, Par4OK (77 + i) := par4OK_of_range 3 77 7 par4Range11

end MatrixBounds.Numeric.FKLHier4
