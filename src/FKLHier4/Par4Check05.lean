module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range05 : allRange par4Chk 3 35 7 = true := by decide +kernel

theorem par4OK05 : ∀ i < 7, Par4OK (35 + i) := par4OK_of_range 3 35 7 par4Range05

end MatrixBounds.Numeric.FKLHier4
