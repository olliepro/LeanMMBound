module

public import FKLHier4.Par4Table

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL

theorem par4Range09 : allRange par4Chk 3 63 7 = true := by decide +kernel

theorem par4OK09 : ∀ i < 7, Par4OK (63 + i) := par4OK_of_range 3 63 7 par4Range09

end MatrixBounds.Numeric.FKLHier4
