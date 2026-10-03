module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range02 : allRange par4Chk 3 14 7 = true := by decide +kernel

theorem par4OK02 : ∀ i < 7, Par4OK (14 + i) := par4OK_of_range 3 14 7 par4Range02

end MatrixBounds.Numeric.FKLHier4
