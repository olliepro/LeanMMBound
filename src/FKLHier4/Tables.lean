module

public import FKLHier4.Par4All

/-! Public interface of the verified level-four hierarchy tables:
`childT p c a o` (child numerators at `2^178`) and `par4T p a o` (parent numerators at `2^406`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL Tensor Tensor.CW

theorem childT_int (p : Fin 105) (c : Fin 45) (a : Fin 3) (o : Fin 21) :
    ((childT p c a o : ℕ) : ℤ) = RootFineCachedParent4.child SuppliedRootFineParent3Integers.numerator p c a o := by
  rw [childT_eq p (child_all p p.isLt) c a o c.isLt a.isLt o.isLt]
  exact fChild_eq p c a o

theorem childT_num (p : Fin 105) (c : Fin 45) (a : Fin 3) (o : Fin 21) :
    ((childT p c a o : ℕ) : ℤ) = SuppliedRootFineChild3Integers.numerator p (shapeColumnEquiv 8 c) a o := by
  rw [childT_int]
  exact RootFineCachedParent4.child_eq _ (fun _ _ _ _ => rfl) p c a o

theorem childT_lt (p : Fin 105) (c a o : ℕ) (hc : c < 45) (ha : a < 3) (ho : o < 21) :
    childT p c a o < 2 ^ 180 := by
  rw [childT_eq p (child_all p p.isLt) c a o hc ha ho]
  exact fChild_lt p c a o hc ha ho

theorem par4T_int (p : Fin 105) (a : Fin 3) (o : Fin 231) :
    ((par4T p a o : ℕ) : ℤ) = SuppliedRootFineParent4Integers.numerator p a o := by
  rw [par4T_eq p (par4_all p p.isLt) a o]
  exact fPar4_eq p a o

end MatrixBounds.Numeric.FKLHier4
