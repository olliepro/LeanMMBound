module

public import SuppliedPairedFineSingletonLabels
public import SuppliedRoleIndex
public import FKLHier4.Static

/-! Static role labels of the level-four paired-fine computation: isolated columns and pool coordinates
for every role `r`, fine axis `a` and column `c` (index `(r*2+a)*45+c`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL Tensor Tensor.CW SuppliedPairedFine

def iso4P : Nat := 3463979493791403774118411558148819327706283140434151300099966630121816722609116475118925498941083923176116408142439556552824440630423579968636493129027966266835200
def iso4 (r a c : Nat) : Bool := Nat.beq (FKL.lane iso4P 1 (Nat.add (Nat.mul (Nat.add (Nat.mul r 2) a) 45) c)) 1

def coord4P : Nat := 88791164537852992300255223205998108911418933270259682995206910012998729063758091064979743744173778716074766743223650070199814642573291005241355970824525595547357561053251415333000181944387233614957286042270594476107937644332076772906198569754321523341023626919644883672367972768744477915617034065321934180556340955920263077018402957532598050583963724479536058432515510574908822428469213814258064064593227328232313402176284292407735708508151396763602386598676473305630987067822334858230073980581682842372713149266300070065340784106440416420762568974951487814567295101717139051027956234585546957994473236646478278611448069555842048324585409802461786640
def coord4 (r a c : Nat) : Nat := FKL.lane coord4P 4 (Nat.add (Nat.mul (Nat.add (Nat.mul r 2) a) 45) c)

/-- Membership of column `c` in pooled sector `s`. -/
def inSec4 (r a s c : Nat) : Bool := Bool.and (!(iso4 r a c)) (Nat.beq (coord4 r a c) s)

theorem iso4_eq : ∀ (r : Fin 6) (a : Fin 2) (c : Fin (shapes 8).length),
    iso4 r a c = isolatedColumn 8 (SuppliedRoleIndex.order r) a c := by decide +kernel

theorem coord4_eq : ∀ (r : Fin 6) (a : Fin 2) (c : Fin (shapes 8).length),
    coord4 r a c = (poolCoordinate 8 (SuppliedRoleIndex.order r) a c).val := by decide +kernel

theorem inSec4_eq (r : Fin 6) (a : Fin 2) (s : Fin 9) (c : Fin (shapes 8).length) : inSec4 r a s c =
    (!(isolatedColumn 8 (SuppliedRoleIndex.order r) a c) && decide (poolCoordinate 8 (SuppliedRoleIndex.order r) a c = s)) := by
  unfold inSec4
  rw [iso4_eq r a c, coord4_eq r a c]
  congr 1

end MatrixBounds.Numeric.FKLFine4
