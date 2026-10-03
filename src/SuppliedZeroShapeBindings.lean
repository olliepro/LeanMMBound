module

public import SuppliedZeroSupportData
public import OrientedZeroLawIdentities
public import FKLMeta.Nodes
public import FKL.Range

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original higher zero-coordinate shapes have the exact total and zero-axis
needed to orient their complete tensor windows into canonical matrix form. -/
namespace MatrixBounds.Numeric.SuppliedZeroShapeBindings

open Tensor SuppliedLeafLaws SuppliedZeroSupport
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

theorem fkl_shape_ok (x y z T : ℕ)
    (h : Bool.and (Nat.beq (Nat.add (Nat.add x y) z) T) (Bool.or (Nat.beq x 0) (Bool.or (Nat.beq y 0) (Nat.beq z 0))) = true) :
    (⟨x, y, z⟩ : Shape).total = T ∧ Shape.coordinates ⟨x, y, z⟩ (zeroAxis ⟨x, y, z⟩) = 0 := by
  simp only [Bool.and_eq_true, Bool.or_eq_true, Nat.beq_eq, FKL.raw_add] at h
  refine ⟨h.1, ?_⟩
  unfold zeroAxis
  by_cases hx : x = 0
  · simp [hx, Shape.coordinates]
  · by_cases hy : y = 0
    · simp [hx, hy, Shape.coordinates]
    · have hz : z = 0 := by omega
      simp [hx, hy, hz, Shape.coordinates]

/-- Fast check of all level-three zero-node shapes (FKLMeta). -/
theorem fkl_checked3 : FKL.allRange (fun n => Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.zeroC 6 n) 45) (Bool.and (Nat.beq (Nat.add (Nat.add (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n))) (FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n))) 8)
      (Bool.or (Nat.beq (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) 0) (Bool.or (Nat.beq (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) 0) (Nat.beq (FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) 0))))) 10 0 840 = true := by
  decide +kernel

/-- Every actual zero-node shape has the original four-letter total and its selected zero coordinate. -/
theorem shape3_valid : ∀ node : Fin 840,
    (shape3 node).total = 8 ∧ Shape.coordinates (shape3 node) (zeroAxis (shape3 node)) = 0 := by
  intro node
  have h := FKL.allRange_sound _ 10 0 840 fkl_checked3 node.val node.isLt
  rw [Nat.zero_add] at h
  have hc : FKL.lane FKLMeta.Nodes.zeroC 6 node.val < 45 := by
    simp only [Bool.and_eq_true, Nat.blt_eq] at h; exact h.1
  have hs : shape3 node = ⟨FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val), FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val), FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val)⟩ := by
    unfold shape3; rw [FKLMeta.Nodes.zeroNode_eq]; exact FKLMeta.Nodes.shapeAt8 _ hc
  rw [hs]
  exact fkl_shape_ok _ _ _ _ (by simp only [Bool.and_eq_true] at h ⊢; exact h.2)

/-- Fast check of all root zero-child shapes (FKLMeta). -/
theorem fkl_checked4 : FKL.allRange (fun k => Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.colF16 8 k) 153) (Bool.and (Nat.beq (Nat.add (Nat.add (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k))) (FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k))) 16)
      (Bool.or (Nat.beq (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) 0) (Bool.or (Nat.beq (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) 0) (Nat.beq (FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) 0))))) 6 0 48 = true := by
  decide +kernel

/-- Every actual zero root-child shape has the original eight-letter total and its selected zero coordinate. -/
theorem shape4_valid : ∀ child : Fin 48,
    (shape4 child).total = 16 ∧ Shape.coordinates (shape4 child) (zeroAxis (shape4 child)) = 0 := by
  intro child
  have h := FKL.allRange_sound _ 6 0 48 fkl_checked4 child.val child.isLt
  rw [Nat.zero_add] at h
  have hc : FKL.lane FKLMeta.Nodes.colF16 8 child.val < 153 := by
    simp only [Bool.and_eq_true, Nat.blt_eq] at h; exact h.1
  have hs : shape4 child = ⟨FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val), FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val), FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val)⟩ := by
    unfold shape4; rw [FKLMeta.Nodes.colF16_get child.val child.isLt, Option.getD_some]
    exact FKLMeta.Nodes.shapeAt16 _ hc
  rw [hs]
  exact fkl_shape_ok _ _ _ _ (by simp only [Bool.and_eq_true] at h ⊢; exact h.2)

/-- Canonical physical role for an actual original higher zero-node shape. -/
def order3 (node : Fin 840) : AxisOrder := zeroCanonicalOrder (zeroAxis (shape3 node)) (positiveAxis (shape3 node))

/-- Canonical physical role for an actual original zero root-child shape. -/
def order4 (child : Fin 48) : AxisOrder := zeroCanonicalOrder (zeroAxis (shape4 child)) (positiveAxis (shape4 child))

end
end MatrixBounds.Numeric.SuppliedZeroShapeBindings
