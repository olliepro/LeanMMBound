module

public import FKLFine3.Leaf
public import FKLFine3.Split3

/-! Every fast leaf numerator and split weight is at most `2^44`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine

theorem row_cell_le (row : DyadicRow) (h : row.check 17592186044416 = true) (c : ℕ) :
    row.atColumn c ≤ 17592186044416 := by
  have := (DyadicRow.check_sound h).2
  exact this ▸ FKLBridge.Rows.atColumn_le_mass row c

theorem fW_le (n : Fin 945) (s : Fin 6) (c : Fin 15) : fW n s c ≤ 17592186044416 := by
  rw [fW_eq]
  exact row_cell_le _ (SplitRow.check_sound (SuppliedParameters.alpha3 n s).property).1 c

theorem fZ2_le (n : Fin 945) (z : Fin 12) (s : Fin 6) (o : Fin 6) : fZ2 n z s o ≤ 17592186044416 := by
  rw [fZ2_eq]
  exact row_cell_le _ (SuppliedTypedParameters.zero2 n z s).accepted o

theorem fLeaf_le (n : Fin 945) (s : Fin 6) (c : Fin 15) (p : Fin 3) (o : Fin 6) :
    fLeaf n s c p o ≤ 17592186044416 := by
  have hk := kindT_eq c
  unfold fLeaf
  rcases hkind : SuppliedChildKinds.kind2 c with z | t
  · have e : kindT c = z.val := by rw [hk]; simp [kindV, hkind]
    simp only [e, cond_blt, cond_beq, show z.val < 12 from z.isLt, if_true]
    have hoc : oComp o < 6 := by rw [oComp_eq o]; exact (OrbitLevel2.complement o).isLt
    split_ifs
    · exact le_refl _
    · exact Nat.zero_le _
    · exact fZ2_le n z s o
    · exact fZ2_le n z s ⟨oComp o, hoc⟩
  · have e : kindT c = 12 + t.val := by rw [hk]; simp [kindV, hkind]
    have hlt : ¬ (12 + t.val < 12) := by omega
    have e2 : Nat.sub (12 + t.val) 12 = t.val := by rw [raw_sub]; omega
    simp only [e, cond_blt, cond_beq, hlt, if_false, e2, raw_mul, raw_sub]
    have := twoMu_le n t s
    split_ifs <;> omega

end MatrixBounds.Numeric.FKLFine3
