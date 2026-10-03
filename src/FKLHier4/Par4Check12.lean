module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range12 : allRange par4Chk 3 84 7 = true := by decide +kernel

theorem par4OK12 : ∀ i < 7, Par4OK (84 + i) := par4OK_of_range 3 84 7 par4Range12

end MatrixBounds.Numeric.FKLHier4
