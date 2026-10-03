module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range07 : allRange par4Chk 3 49 7 = true := by decide +kernel

theorem par4OK07 : ∀ i < 7, Par4OK (49 + i) := par4OK_of_range 3 49 7 par4Range07

end MatrixBounds.Numeric.FKLHier4
