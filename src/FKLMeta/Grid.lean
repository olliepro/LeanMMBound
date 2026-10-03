module

public import FKLMeta.Nodes
public import SuppliedHierarchyParentData

/-! Raw tests for the complete hierarchy grid `SuppliedNodeLookup` (parent × child column). -/

@[expose] public section

namespace FKLMeta.Grid

open MatrixBounds.Numeric SuppliedShapeIndices FKLMeta.Nodes

/-- Shape column `c` of the level-three alphabet fits root child `p`. -/
def fitsB (c p : ℕ) : Bool :=
  Bool.and (Nat.ble (FKL.lane sx8 5 c) (FKL.lane sx16 5 (FKL.lane colT16 8 p)))
  (Bool.and (Nat.ble (FKL.lane sy8 5 c) (FKL.lane sy16 5 (FKL.lane colT16 8 p)))
    (Nat.ble (FKL.lane sz8 5 c) (FKL.lane sz16 5 (FKL.lane colT16 8 p))))

theorem parent4_eq (p : Fin 105) (hb : FKL.lane colT16 8 p.val < 153) :
    SuppliedHierarchyParents.parent4 p = ⟨FKL.lane sx16 5 (FKL.lane colT16 8 p.val),
      FKL.lane sy16 5 (FKL.lane colT16 8 p.val), FKL.lane sz16 5 (FKL.lane colT16 8 p.val)⟩ := by
  unfold SuppliedHierarchyParents.parent4
  rw [colT16_get p.val p.isLt, Option.getD_some, shapeAt16 _ hb]

theorem fitsB_iff (c : ℕ) (hc : c < 45) (p : Fin 105) (hb : FKL.lane colT16 8 p.val < 153) :
    fitsB c p.val = true ↔ (shapeAt 8 c).Fits (SuppliedHierarchyParents.parent4 p) := by
  rw [parent4_eq p hb, shapeAt8 c hc]
  simp only [fitsB, Bool.and_eq_true, Nat.ble_eq, Shape.Fits]

/-- Grid cell test for code `code` at parent `p` and child column `c`. -/
def cellB (code p c : ℕ) : Bool :=
  Bool.and (Nat.blt (FKL.lane colT16 8 p) 153)
  (cond (Nat.beq code 0) (!fitsB c p)
    (cond (Nat.ble code 945)
      (Bool.and (Nat.beq (FKL.lane positiveP 7 (Nat.sub code 1)) p)
        (Bool.and (Nat.beq (FKL.lane positiveC 6 (Nat.sub code 1)) c) (fitsB c p)))
      (Bool.and (Nat.beq (FKL.lane zeroP 7 (Nat.sub code 946)) p)
        (Bool.and (Nat.beq (FKL.lane zeroC 6 (Nat.sub code 946)) c) (fitsB c p)))))

end FKLMeta.Grid
