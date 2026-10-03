module

public import SuppliedPairedFineBlocks
public import FKL.Lane

/-! Small static tables of the level-three paired-fine computation, checked once against their
semantic definitions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine

def kindTP : Nat := 840359446635098640
def kindT (c : Nat) : Nat := FKL.lane kindTP 4 (c)

def shXP : Nat := 19467226873856
def shX (c : Nat) : Nat := FKL.lane shXP 3 (c)

def shYP : Nat := 568064231048
def shY (c : Nat) : Nat := FKL.lane shYP 3 (c)

def shZP : Nat := 70064374428
def shZ (c : Nat) : Nat := FKL.lane shZP 3 (c)

def zAxP : Nat := 430351360
def zAx (c : Nat) : Nat := FKL.lane zAxP 2 (c)

def pAxP : Nat := 342
def pAx (c : Nat) : Nat := FKL.lane pAxP 2 (c)

def cAxP : Nat := 26148
def cAx (t p : Nat) : Nat := FKL.lane cAxP 2 (Nat.add (Nat.mul t 3) p)

def oCompP : Nat := 5797
def oComp (o : Nat) : Nat := FKL.lane oCompP 3 (o)

def col1P : Nat := 6420841298313609216
def col1 (o : Nat) : Nat := FKL.lane col1P 3 (o)

def col2P : Nat := 6569755928097638024
def col2 (o : Nat) : Nat := FKL.lane col2P 3 (o)

def wscP : Nat := 2454
def wsc (o : Nat) : Nat := FKL.lane wscP 2 (o)

def sz3P : Nat := 1530712301618332220793921
def sz3 (o : Nat) : Nat := FKL.lane sz3P 4 (o)

def sz2P : Nat := 1641
def sz2 (o : Nat) : Nat := FKL.lane sz2P 2 (o)

def physP : Nat := 1321065
def phys (r a : Nat) : Nat := FKL.lane physP 2 (Nat.add (Nat.mul r 2) a)

def isoP : Nat := 1474924113784995716141927906149023196607630093320186128
def iso (r a c : Nat) : Bool := Nat.beq (FKL.lane isoP 1 (Nat.add (Nat.mul (Nat.add (Nat.mul r 2) a) 15) c)) 1

def inSecP : Nat := 246007719108810198186429168536627669445026059254181949448349946258129794454760607189316238538106070731417556115469574232476849823422070708909385435842376295682606021272135384028924839522332471517401162764735879915933904248413825687500051525419995800556550558241
def inSec (r a s c : Nat) : Bool := Nat.beq (FKL.lane inSecP 1 (Nat.add (Nat.mul (Nat.add (Nat.mul (Nat.add (Nat.mul r 2) a) 5) s) 15) c)) 1

def kindV (c : Fin 15) : Nat := match SuppliedChildKinds.kind2 c with | .inl z => z.val | .inr t => 12 + t.val

theorem kindT_eq : ∀ c : Fin 15, kindT c = kindV c := by decide +kernel
theorem shape_eq : ∀ c : Fin 15, ((shapes 4)[c.val]?).map (fun sh => (sh.x, sh.y, sh.z)) = some (shX c, shY c, shZ c) := by
  decide +kernel
theorem cAx_eq : ∀ t p : Fin 3, cAx t p = (SuppliedTerminalLaws.childAxes t p).val := by decide +kernel
theorem oComp_eq : ∀ o : Fin 6, oComp o = (OrbitLevel2.complement o).val := by decide +kernel
theorem cols_eq : ∀ o : Fin 21, col1 o = (OrbitLevel3.encoding.columns o).1.val ∧
    col2 o = (OrbitLevel3.encoding.columns o).2.val := by decide +kernel
theorem wsc_eq : ∀ o : Fin 6, wsc o = SuppliedRootFineParent3Integers.wordScale o := by decide +kernel
theorem sz3_eq : ∀ o : Fin 21, sz3 o = OrbitLevel3.sizes o := by decide +kernel
theorem sz2_eq : ∀ o : Fin 6, sz2 o = OrbitLevel2.sizes o := by decide +kernel
theorem phys_eq : ∀ (r : Fin 6) (a : Fin 2), phys r a = ((SuppliedRoleIndex.order r).permutation (physicalAxis a)).val := by
  decide +kernel
theorem iso_eq : ∀ (r : Fin 6) (a : Fin 2) (c : Fin (shapes 4).length), iso r a c = isolatedColumn 4 (SuppliedRoleIndex.order r) a c := by
  decide +kernel
theorem inSec_eq : ∀ (r : Fin 6) (a : Fin 2) (s : Fin 5) (c : Fin (shapes 4).length), inSec r a s c =
    (!(isolatedColumn 4 (SuppliedRoleIndex.order r) a c) && decide (poolCoordinate 4 (SuppliedRoleIndex.order r) a c = s)) := by
  decide +kernel

theorem shapes4_length : (shapes 4).length = 15 := by decide +kernel

/-- The `c`-th original two-letter shape. -/
def shape4 (c : Fin 15) : Shape := (shapes 4)[c.val]'(lt_of_lt_of_eq c.isLt shapes4_length.symm)

theorem zAx_eq : ∀ c : Fin 15, zAx c = (SuppliedLeafLaws.zeroAxis (shape4 c)).val := by decide +kernel
theorem pAx_eq : ∀ c : Fin 15, pAx c = (SuppliedLeafLaws.positiveAxis (shape4 c)).val := by decide +kernel

theorem cond_beq {α : Type*} (a b : ℕ) (x y : α) : cond (Nat.beq a b) x y = if a = b then x else y := by
  by_cases h : a = b
  · subst h; have : Nat.beq a a = true := Nat.beq_eq.mpr rfl
    simp [this]
  · have : Nat.beq a b = false := by
      cases hb : Nat.beq a b
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true hb) h
    simp [this, h]

theorem cond_blt {α : Type*} (a b : ℕ) (x y : α) : cond (Nat.blt a b) x y = if a < b then x else y := by
  by_cases h : a < b
  · have : Nat.blt a b = true := Nat.blt_eq.mpr h
    simp [this, h]
  · have : Nat.blt a b = false := by
      cases hb : Nat.blt a b
      · rfl
      · exact absurd (Nat.blt_eq.mp hb) h
    simp [this, h]

end MatrixBounds.Numeric.FKLFine3
