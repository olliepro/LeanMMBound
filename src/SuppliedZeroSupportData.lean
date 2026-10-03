module

public import SuppliedLeafLaws
public import ZeroOrbitLawData
public import VerifiedOrbitSupportTables
public import FiniteIndexBlockComposition
public import FKL.Range
public import SuppliedZeroRegistryChecks
public import FKLMeta.Flat.DyadicZero4
public import FKLMeta.Flat.DyadicZero3
public import FKLMeta.ZeroCodes
public import FKLMeta.Nodes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact coarse support of the higher zero-coordinate rows at their original
source positions, using the actual complete fine-orbit total statistics. -/
namespace MatrixBounds.Numeric.SuppliedZeroSupport

open SuppliedLeafLaws
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- The exact original shape named by a zero-coordinate level-three hierarchy node. -/
def shape3 (node : Fin 840) : Shape :=
  SuppliedShapeIndices.shapeAt 8 (SuppliedShapeIndices.zeroNode node).child

/-- The original zero-coordinate root-child shape at its source zero-column index. -/
def shape4 (child : Fin 48) : Shape :=
  SuppliedShapeIndices.shapeAt 16 ((SuppliedShapeIndices.childColumns 16 false)[child.val]?.getD 0)

/-- Actual source zero row and the coarse total of its first nonzero physical coordinate. -/
def entry3 (node : Fin 840) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero3 node).row, Shape.coordinates (shape3 node) (positiveAxis (shape3 node))⟩

/-- Actual source root zero row and the coarse total of its first nonzero physical coordinate. -/
def entry4 (child : Fin 48) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero4 child).row, Shape.coordinates (shape4 child) (positiveAxis (shape4 child))⟩

/-- Decidable complete validity and exact coarse support of one supplied level-three zero row. -/
def valid3 (node : Fin 840) : Prop := (entry3 node).check 21 17592186044416 OrbitLevel3.totalAt = true

/-- The first positive coordinate, in raw form (FKLMeta). -/
theorem fkl_target (s : Shape) :
    Shape.coordinates s (positiveAxis s) = cond (Nat.blt 0 s.x) s.x (cond (Nat.blt 0 s.y) s.y s.z) := by
  by_cases h1 : 0 < s.x
  · rw [show Nat.blt 0 s.x = true from Nat.blt_eq.mpr h1, cond_true]; simp [positiveAxis, h1, Shape.coordinates]
  · rw [show Nat.blt 0 s.x = false from Bool.eq_false_iff.mpr (fun h => h1 (Nat.blt_eq.mp h)), cond_false]
    by_cases h2 : 0 < s.y
    · rw [show Nat.blt 0 s.y = true from Nat.blt_eq.mpr h2, cond_true]; simp [positiveAxis, h1, h2, Shape.coordinates]
    · rw [show Nat.blt 0 s.y = false from Bool.eq_false_iff.mpr (fun h => h2 (Nat.blt_eq.mp h)), cond_false]
      simp [positiveAxis, h1, h2, Shape.coordinates]

/-- Every level-three zero row is registered with its first positive coordinate (FKLMeta). -/
theorem fkl_checked : FKL.allRange (fun n => Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.zeroC 6 n) 45)
    (Nat.beq (FKL.lane FKLMeta.ZeroCodes.flat 5 (FKL.lane FKLMeta.Flat.DyadicZero3.flat 14 n)) (Nat.add (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n))) (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n))) (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)) (FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 n)))) 1)))
    10 0 840 = true := by
  decide +kernel

theorem fkl_all (node : Fin 840) : valid3 node := by
  have h := FKL.allRange_sound _ 10 0 840 fkl_checked node.val node.isLt
  simp only [Nat.zero_add, Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨hc, hcode⟩ := h
  have hcode' : (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicZero3.table.get node)).val =
      Nat.add (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val))) (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val)) (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val))) (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val)) (FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val)))) 1 := by
    rw [FKLMeta.ZeroCodes.get_eq, FKLMeta.Flat.DyadicZero3.get_eq]; exact hcode
  have hv := SuppliedZeroRegistry.validComplete.complete (ParameterIndexData.DyadicZero3.table.get node)
  have hw : (IndexedCertificateRows.dyadic (ParameterIndexData.DyadicZero3.table.get node)).val.width = 21 :=
    (SuppliedTypedParameters.zero3 node).width_eq
  unfold SuppliedZeroRegistry.valid SuppliedZeroRegistry.check at hv
  simp only [hcode', hw, FKL.raw_add, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel] at hv
  have hs : shape3 node = ⟨FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val), FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val), FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.zeroC 6 node.val)⟩ := by
    unfold shape3; rw [FKLMeta.Nodes.zeroNode_eq]; exact FKLMeta.Nodes.shapeAt8 _ hc
  unfold valid3 entry3 ZeroOrbitRow.check
  simp only [Bool.and_eq_true, decide_eq_true_eq]
  refine ⟨⟨(SuppliedTypedParameters.zero3 node).accepted, (SuppliedTypedParameters.zero3 node).width_eq⟩, ?_⟩
  rw [hs, fkl_target]
  exact hv

/-- Every root zero row is registered with its first positive coordinate (FKLMeta). -/
theorem fkl_checked4 : FKL.allRange (fun k => Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.colF16 8 k) 153)
    (Nat.beq (FKL.lane FKLMeta.ZeroCodes.flat 5 (FKL.lane FKLMeta.Flat.DyadicZero4.flat 14 k)) (Nat.add (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k))) (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k))) (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)) (FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 k)))) 1)))
    6 0 48 = true := by
  decide +kernel

/-- Complete source-row support at positions zero through 127. -/
theorem block000 : IndexBlockCertificate valid3 0 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at positions 128 through 255. -/
theorem block001 : IndexBlockCertificate valid3 128 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at positions 256 through 383. -/
theorem block002 : IndexBlockCertificate valid3 256 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at positions 384 through 511. -/
theorem block003 : IndexBlockCertificate valid3 384 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at positions 512 through 639. -/
theorem block004 : IndexBlockCertificate valid3 512 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at positions 640 through 767. -/
theorem block005 : IndexBlockCertificate valid3 640 128 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Complete source-row support at the remaining original positions 768 through 839. -/
theorem block006 : IndexBlockCertificate valid3 768 72 := ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- All 840 original higher zero rows have exact normalized probability and actual coarse support. -/
theorem complete3 : IndexBlockCertificate valid3 0 840 :=
  (((((block000.append block001).append block002).append block003).append block004).append block005).append block006

/-- Every source root zero row has the required exact coarse support and probability normalization. -/
theorem checked4 : ∀ child : Fin 48, (entry4 child).check 231 17592186044416 OrbitLevel4.totalAt = true := by
  intro child
  have h := FKL.allRange_sound _ 6 0 48 fkl_checked4 child.val child.isLt
  simp only [Nat.zero_add, Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨hc, hcode⟩ := h
  have hcode' : (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicZero4.table.get child)).val =
      Nat.add (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val))) (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val)) (cond (Nat.blt 0 (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val))) (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val)) (FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val)))) 1 := by
    rw [FKLMeta.ZeroCodes.get_eq, FKLMeta.Flat.DyadicZero4.get_eq]; exact hcode
  have hv := SuppliedZeroRegistry.validComplete.complete (ParameterIndexData.DyadicZero4.table.get child)
  have hw : (IndexedCertificateRows.dyadic (ParameterIndexData.DyadicZero4.table.get child)).val.width = 231 :=
    (SuppliedTypedParameters.zero4 child).width_eq
  unfold SuppliedZeroRegistry.valid SuppliedZeroRegistry.check at hv
  simp only [hcode', hw, FKL.raw_add, Nat.add_one_ne_zero, ↓reduceIte, Nat.add_sub_cancel] at hv
  have hs : shape4 child = ⟨FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val), FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val), FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colF16 8 child.val)⟩ := by
    unfold shape4; rw [FKLMeta.Nodes.colF16_get child.val child.isLt, Option.getD_some]
    exact FKLMeta.Nodes.shapeAt16 _ hc
  unfold entry4 ZeroOrbitRow.check
  simp only [Bool.and_eq_true, decide_eq_true_eq]
  refine ⟨⟨(SuppliedTypedParameters.zero4 child).accepted, (SuppliedTypedParameters.zero4 child).width_eq⟩, ?_⟩
  rw [hs, fkl_target]
  exact hv

end MatrixBounds.Numeric.SuppliedZeroSupport
