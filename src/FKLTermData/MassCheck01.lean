module

public import FKLTermData.MassTree
public import FKL.Range

@[expose] public section

namespace MatrixBounds.Numeric.FKLTermData.Mass

theorem chk3 : FKL.allRange nodeOK 8 567 189 = true := by decide +kernel

theorem chk4 : FKL.allRange nodeOK 8 756 189 = true := by decide +kernel

end MatrixBounds.Numeric.FKLTermData.Mass
