module

public import Mathlib.Data.Int.Basic
public import Mathlib.Tactic.Ring

/-! Raw `Nat`/`Int`/`Bool` helpers for fast kernel evaluation (one recursor step each), with their
propositional meanings. Kept free of project imports so every certificate module can use them. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLLog

noncomputable section

/-- `|z|` by raw recursion. -/
def iVal (z : ℤ) : Nat := Int.rec (fun n => n) (fun n => Nat.add n 1) z

/-- `z < 0` by raw recursion. -/
def iNeg (z : ℤ) : Bool := Int.rec (fun _ => false) (fun _ => true) z

/-- Raw Boolean selection `cond b t f` (one recursor step). -/
def sel (b : Bool) (t f : Nat) : Nat := Bool.rec f t b

/-- Raw conjunction. -/
def band (a b : Bool) : Bool := Bool.rec false b a

theorem raw_add (a b : Nat) : Nat.add a b = a + b := (rfl : Nat.add a b = Nat.add a b).trans rfl
theorem raw_mul (a b : Nat) : Nat.mul a b = a * b := (rfl : Nat.mul a b = Nat.mul a b).trans rfl
theorem raw_sub (a b : Nat) : Nat.sub a b = a - b := (rfl : Nat.sub a b = Nat.sub a b).trans rfl
theorem raw_div (a b : Nat) : Nat.div a b = a / b := (rfl : Nat.div a b = Nat.div a b).trans rfl

theorem sel_eq (b : Bool) (t f : Nat) : sel b t f = cond b t f := by cases b <;> rfl
theorem band_eq (a b : Bool) : band a b = (a && b) := by cases a <;> rfl
theorem brec_eq (b : Bool) : (Bool.rec true false b : Bool) = !b := by cases b <;> rfl

theorem iVal_ofNat (n : Nat) : iVal (Int.ofNat n) = n := rfl
theorem iVal_negSucc (n : Nat) : iVal (Int.negSucc n) = n + 1 := rfl
theorem iNeg_ofNat (n : Nat) : iNeg (Int.ofNat n) = false := rfl
theorem iNeg_negSucc (n : Nat) : iNeg (Int.negSucc n) = true := rfl

end

end MatrixBounds.Numeric.FKLLog
