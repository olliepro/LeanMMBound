module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range13 : allRange par4Chk 3 91 7 = true := by decide +kernel

theorem par4OK13 : ∀ i < 7, Par4OK (91 + i) := par4OK_of_range 3 91 7 par4Range13

end MatrixBounds.Numeric.FKLHier4
