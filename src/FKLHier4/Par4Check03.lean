module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range03 : allRange par4Chk 3 21 7 = true := by decide +kernel

theorem par4OK03 : ∀ i < 7, Par4OK (21 + i) := par4OK_of_range 3 21 7 par4Range03

end MatrixBounds.Numeric.FKLHier4
