module

public import FKLTermData.MassTree
public import FKL.Range

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Mass

theorem chk0 : FKL.allRange nodeOK 8 0 189 = true := by decide +kernel

theorem chk1 : FKL.allRange nodeOK 8 189 189 = true := by decide +kernel

theorem chk2 : FKL.allRange nodeOK 8 378 189 = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Mass
