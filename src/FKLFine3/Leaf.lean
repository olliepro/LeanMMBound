module

public import FKLFine3.Static
public import FKLBridge.Dyadic
public import FKLBridge.Idx.DyadicLeafzero
public import FKLBridge.Idx.TerminalLookup

/-! Fast level-two leaf masses: zero-coordinate rows and terminal parameters read from packed tables. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine

/-- Zero-leaf numerator `(zero2 n z s).numerator o`. -/
noncomputable def fZ2 (n z s o : ℕ) : ℕ :=
  FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicLeafzero.tree 7 14
    (Nat.add (Nat.mul (Nat.add (Nat.mul n 12) z) 6) s)) o

/-- Terminal parameter numerator `μ`. -/
noncomputable def fMu (n t s : ℕ) : ℕ :=
  ptGet FKLBridge.Idx.TerminalLookup.tree 8 43 (Nat.add (Nat.mul (Nat.add (Nat.mul n 3) t) 6) s)

/-- Leaf numerator at denominator `2^44` (all leaf numerators are nonnegative). -/
noncomputable def fLeaf (n s c p o : ℕ) : ℕ :=
  (fun k => cond (Nat.blt k 12)
    (cond (Nat.beq p (zAx c)) (cond (Nat.beq o 0) 17592186044416 0)
      (cond (Nat.beq p (pAx c)) (fZ2 n k s o) (fZ2 n k s (oComp o))))
    ((fun t => cond (Nat.beq (cAx t p) 2)
        (cond (Nat.beq o 2) (Nat.mul 2 (fMu n t s))
          (cond (Nat.beq o 3) (Nat.sub 17592186044416 (Nat.mul 2 (fMu n t s))) 0))
        (cond (Nat.beq o 1) 17592186044416 0)) (Nat.sub k 12))) (kindT c)

theorem flat3_val (n : Fin 945) (z : Fin 12) (s : Fin 6) :
    (SuppliedParameters.flat2 (SuppliedParameters.flat2 n z) s).val = Nat.add (Nat.mul (Nat.add (Nat.mul n.val 12) z.val) 6) s.val := by
  rw [SuppliedParameters.flat2_val, SuppliedParameters.flat2_val]; rfl

theorem fZ2_eq (n : Fin 945) (z : Fin 12) (s : Fin 6) (o : Fin 6) :
    fZ2 n z s o = (SuppliedTypedParameters.zero2 n z s).numerator o := by
  have hw := (SuppliedTypedParameters.zero2 n z s).width_eq
  unfold fZ2
  rw [← flat3_val, ← FKLBridge.Idx.DyadicLeafzero.get_eq]
  rw [FKLBridge.Dyadic.cell_eq _ o (by
    change o.val < (SuppliedTypedParameters.zero2 n z s).row.width; rw [hw]; exact o.isLt)]
  rfl

theorem fMu_eq (n : Fin 945) (t : Fin 3) (s : Fin 6) :
    fMu n t s = SuppliedRootFineTerminalLookup.numerator n t s := by
  unfold fMu SuppliedRootFineTerminalLookup.numerator
  have : (SuppliedParameters.flat2 (SuppliedParameters.flat2 n t) s).val =
      Nat.add (Nat.mul (Nat.add (Nat.mul n.val 3) t.val) 6) s.val := by
    rw [SuppliedParameters.flat2_val, SuppliedParameters.flat2_val]; rfl
  rw [← this, ← FKLBridge.Idx.TerminalLookup.get_eq]

theorem twoMu_le (n : Fin 945) (t : Fin 3) (s : Fin 6) : 2 * fMu n t s ≤ 17592186044416 := by
  have := SuppliedParameters.terminalCounts_population n t s
  rw [fMu_eq, SuppliedRootFineTerminalLookup.numerator_eq]
  omega

theorem fLeaf_eq (n : Fin 945) (s : Fin 6) (c : Fin 15) (p : Fin 3) (o : Fin 6) :
    ((fLeaf n s c p o : ℕ) : ℤ) = SuppliedRootFineParent3Columns.leaf n s c p o := by
  have hk := kindT_eq c
  unfold SuppliedRootFineParent3Columns.leaf fLeaf
  rcases hkind : SuppliedChildKinds.kind2 c with z | t
  · have e : kindT c = z.val := by rw [hk]; simp [kindV, hkind]
    simp only [e, cond_blt, cond_beq, show z.val < 12 from z.isLt, if_true]
    unfold SuppliedRootFineLeafIntegers.zero
    rw [show (shapes 4)[c.val] = shape4 c from rfl, zAx_eq c, pAx_eq c]
    by_cases h1 : p = SuppliedLeafLaws.zeroAxis (shape4 c)
    · have : p.val = (SuppliedLeafLaws.zeroAxis (shape4 c)).val := by rw [h1]
      simp only [this, if_true, h1]
      by_cases h0 : o = 0
      · subst h0; simp
      · have : o.val ≠ 0 := fun h => h0 (Fin.ext h)
        simp [this, h0]
    · have : p.val ≠ (SuppliedLeafLaws.zeroAxis (shape4 c)).val := fun h => h1 (Fin.ext h)
      simp only [this, if_false, h1]
      by_cases h2 : p = SuppliedLeafLaws.positiveAxis (shape4 c)
      · have : p.val = (SuppliedLeafLaws.positiveAxis (shape4 c)).val := by rw [h2]
        simp only [this, if_true, h2]
        rw [fZ2_eq n z s o]
      · have : p.val ≠ (SuppliedLeafLaws.positiveAxis (shape4 c)).val := fun h => h2 (Fin.ext h)
        simp only [this, if_false, h2]
        rw [oComp_eq o, fZ2_eq n z s (OrbitLevel2.complement o)]
  · have e : kindT c = 12 + t.val := by rw [hk]; simp [kindV, hkind]
    have hlt : ¬ (12 + t.val < 12) := by omega
    have e2 : Nat.sub (12 + t.val) 12 = t.val := by rw [raw_sub]; omega
    simp only [e, cond_blt, cond_beq, hlt, if_false, e2, raw_mul, raw_sub]
    unfold SuppliedRootFineLeafIntegers.terminal
    rw [cAx_eq t p]
    have hmu := twoMu_le n t s
    rw [fMu_eq] at hmu ⊢
    by_cases h1 : SuppliedTerminalLaws.childAxes t p = 2
    · have : (SuppliedTerminalLaws.childAxes t p).val = 2 := by rw [h1]; rfl
      simp only [this, if_true, h1]
      by_cases h2 : o = 2
      · subst h2; simp
      · have : o.val ≠ 2 := fun h => h2 (Fin.ext h)
        simp only [this, if_false, h2]
        by_cases h3 : o = 3
        · subst h3; rw [if_pos (by decide), if_pos (by decide)]; push_cast [Nat.cast_sub hmu]; ring
        · have : o.val ≠ 3 := fun h => h3 (Fin.ext h)
          simp [this, h3]
    · have : (SuppliedTerminalLaws.childAxes t p).val ≠ 2 := fun h => h1 (Fin.ext h)
      simp only [this, if_false, h1]
      by_cases h2 : o = 1
      · subst h2; simp
      · have : o.val ≠ 1 := fun h => h2 (Fin.ext h)
        simp [this, h2]

end MatrixBounds.Numeric.FKLFine3
