module

public import FKLFine3.Leaf
public import FKLFine3.Weight3
public import FKLBridge.Idx.SplitAlpha3
public import FKLBridge.Idx.DyadicTerminalroles
public import SuppliedTerminalRateMassArithmetic
public import SuppliedTerminalRateBlocks

/-! Fast terminal source inputs read from the packed base tables, with equality lemmas against the
semantic accessors: source mass numerator `fMass` (denominator `2^176`), terminal parameter numerator
`FKLFine3.fMu` (denominator `2^44`) and role numerator `fRole` (denominator `2^44`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLTerm

open FKL FKLFine3 SuppliedTerminalRates SuppliedPopulationWeights

/-- Flat terminal index `6 (3 n + t) + s`. -/
def flatT (n t s : Nat) : Nat := Nat.add (Nat.mul (Nat.add (Nat.mul n 3) t) 6) s

theorem flatT_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    flatT n t s = (SuppliedParameters.flat2 (SuppliedParameters.flat2 n t) s).val := by
  rw [SuppliedParameters.flat2_val, SuppliedParameters.flat2_val]; rfl

/-! ### Terminal role policy -/

/-- Bit set of a list of indices. -/
def polBits (l : List Nat) : Nat :=
  List.rec (motive := fun _ => Nat) 0 (fun x _ r => Nat.lor r (Nat.shiftLeft 1 x)) l

theorem testBit_polBits (i : Nat) : ∀ l : List Nat, (polBits l).testBit i = decide (i ∈ l)
  | [] => by simp [polBits]
  | x :: l => by
    show (Nat.lor (polBits l) (Nat.shiftLeft 1 x)).testBit i = _
    rw [show Nat.lor (polBits l) (Nat.shiftLeft 1 x) = polBits l ||| 2 ^ x by
      rw [← Nat.one_shiftLeft]; rfl, Nat.testBit_or, testBit_polBits i l, Nat.testBit_two_pow]
    by_cases h : i = x
    · subst h; simp
    · have : x ≠ i := fun e => h e.symm
      simp [h, this]

/-- The exceptional terminal-policy positions as one bit set. -/
def polLit : Nat := 0x20000000000000000000000000000000000000000000000000000000000000000000000000fc00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000200000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000c0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000008000000000000000000000048000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d000000000000000000022000000000000000000000000000000000000000000

theorem polLit_eq : polLit = polBits SuppliedShapeIndices.terminalPolicyZero := by decide +kernel

theorem land_one (x i : Nat) : Nat.land (Nat.shiftRight x i) 1 = cond (x.testBit i) 1 0 := by
  rw [raw_land, raw_shiftRight, Nat.and_one_is_mod, Nat.shiftRight_eq_div_pow, Nat.testBit_eq_decide_div_mod_eq]
  rcases Nat.mod_two_eq_zero_or_one (x / 2 ^ i) with h | h <;> simp [h]

/-- Fast terminal policy row selector. -/
def fPol (i : Nat) : Nat := cond (Nat.beq (Nat.land (Nat.shiftRight polLit i) 1) 1) 0 1

theorem fPol_eq (i : Fin 17010) : fPol i.val = (SuppliedShapeIndices.terminalPolicy i).val := by
  unfold fPol SuppliedShapeIndices.terminalPolicy
  rw [land_one, polLit_eq, testBit_polBits]
  by_cases h : i.val ∈ SuppliedShapeIndices.terminalPolicyZero <;> simp [h]

/-- The two terminal role rows, three lanes of width 45 each. -/
def rolesP : Nat := 200456439201105962987683851715028083326305968036903664195575486641736744934135128

/-- The packed role rows agree with the bridged dyadic rows. -/
theorem rolesP_eq : ∀ (p : Fin 2) (a : Fin 3), lane rolesP 45 (Nat.add (Nat.mul p.val 3) a.val) =
    FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicTerminalroles.tree 1 14 p.val) a.val := by decide +kernel

/-- Fast role numerator of the selected terminal role row at physical axis `a`. -/
def fRole (n t s a : Nat) : Nat := lane rolesP 45 (Nat.add (Nat.mul (fPol (flatT n t s)) 3) a)

theorem fRole_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) (a : Fin 3) :
    fRole n t s a = (SuppliedTerminalRoles.distribution (source n t s)).numerator a := by
  set p := SuppliedShapeIndices.terminalPolicy (SuppliedParameters.flat2 (SuppliedParameters.flat2 n t) s)
  have hw := (SuppliedTypedParameters.terminalRoles p).width_eq
  have hp : fPol (flatT n t s) = p.val := by rw [flatT_eq, fPol_eq]
  unfold fRole
  rw [hp, rolesP_eq, ← FKLBridge.Idx.DyadicTerminalroles.get_eq, FKLBridge.Dyadic.cell_eq _ a (by
    change a.val < (SuppliedTypedParameters.terminalRoles p).row.width; rw [hw]; exact a.isLt)]
  rfl

/-! ### Small bounded loops -/

/-- `g 0 && … && g (n-1)` with raw recursion. -/
def allLt (n : Nat) (g : Nat → Bool) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i r => Bool.and r (g i)) n

theorem allLt_sound (g : Nat → Bool) : ∀ n, allLt n g = true → ∀ i < n, g i = true := by
  intro n
  induction n with
  | zero => intro _ i hi; omega
  | succ n ih =>
    intro h i hi
    have h' : allLt n g = true ∧ g n = true := by simpa [allLt] using h
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
    · exact ih h'.1 i hlt
    · exact h'.2

theorem fRole_le (n : Fin 945) (t : Fin 3) (s : Fin 6) (a : Fin 3) : fRole n t s a ≤ 17592186044416 := by
  rw [fRole_eq]
  set D := SuppliedTerminalRoles.distribution (source n t s)
  have h1 : D.numerator a ≤ ∑ x, D.numerator x :=
    Finset.single_le_sum (f := fun x => D.numerator x) (fun _ _ => Nat.zero_le _) (Finset.mem_univ a)
  exact h1.trans (le_of_eq D.numerator_total)

/-! ### Terminal split numerators -/

def tcolP : Nat := 2678
/-- Level-two column of a positive terminal child. -/
def tcol (t : Nat) : Nat := lane tcolP 4 t

theorem tcol_eq : ∀ t : Fin 3, tcol t = (terminalColumn t).val := by decide +kernel

/-- Every level-three split row has more than eleven columns. -/
theorem widths3 : allRange (fun i => Nat.blt 10 (FKLBridge.Split.width (ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 i)))
    13 0 5670 = true := by decide +kernel

theorem width3 (n : Fin 945) (s : Fin 6) : 10 < (SuppliedParameters.alpha3 n s).val.row.width := by
  have hi := allRange_sound _ 13 0 5670 widths3 (SuppliedParameters.flat2 n s).val (SuppliedParameters.flat2 n s).isLt
  simp only [Nat.zero_add, Nat.blt_eq] at hi
  rw [← FKLBridge.Idx.SplitAlpha3.get_eq, FKLBridge.Split.width_eq] at hi
  exact hi

/-- Fast terminal split numerator. -/
noncomputable def fSplit3 (n s t : Nat) : Nat :=
  FKLBridge.Split.cell (ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 (Nat.add (Nat.mul n 6) s)) (tcol t)

theorem fSplit3_eq (n : Fin 945) (s : Fin 6) (t : Fin 3) :
    fSplit3 n s t = terminalSplitNumerator (source n t s) := by
  have hi : Nat.add (Nat.mul n.val 6) s.val = (SuppliedParameters.flat2 n s).val := by
    rw [SuppliedParameters.flat2_val]; rfl
  have hc : (terminalColumn t).val < (SuppliedParameters.alpha3 n s).val.row.width := by
    have := width3 n s
    have : (terminalColumn t).val ≤ 10 := by revert t; decide
    omega
  unfold fSplit3 terminalSplitNumerator
  rw [hi, tcol_eq, ← FKLBridge.Idx.SplitAlpha3.get_eq, FKLBridge.Split.cell_eq _ _ hc]
  rfl

/-! ### Source masses -/

/-- Fast terminal source mass numerator at denominator `2^176`. -/
noncomputable def fMass (n t s : Nat) : Nat :=
  Nat.mul (Nat.mul (Nat.mul 2 (fNN n)) (FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicA3.tree 7 10 n) s))
    (fSplit3 n s t)

theorem fMass_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    (fMass n t s : ℝ) / 2 ^ 176 = (sourceMass (source n t s) : ℝ) := by
  have e : fMass n t s = terminalNumerator (source n t s) := by
    unfold fMass terminalNumerator strategyNumerator
    rw [fNN_eq, a3_eq, fSplit3_eq, terminalSplitNumerator_eq]
    simp only [raw_mul, source]
    ring
  rw [e, sourceMass]
  push_cast
  norm_num [DyadicPopulationArithmetic.denominator]

end MatrixBounds.Numeric.FKLTerm
