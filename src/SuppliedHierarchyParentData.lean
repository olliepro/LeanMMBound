module

public import SuppliedParameterRows
public import FiniteIndexBlockComposition
public import FKL.Range
public import FKLMeta.Flat.SplitAlpha4
public import FKLMeta.Flat.SplitAlpha3
public import FKLMeta.SplitParents
public import FKLMeta.Nodes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Parent-shape bindings connect the actual accepted split records to the
complete original hierarchy, retaining every source node and strategy label. -/
namespace MatrixBounds.Numeric.SuppliedHierarchyParents
set_option maxRecDepth 100000
set_option maxHeartbeats 32000000

/-- Original positive level-four parent in the complete shape alphabet. -/
def parent4 (node : Fin 105) : Shape :=
  SuppliedShapeIndices.shapeAt 16 ((SuppliedShapeIndices.childColumns 16 true)[node.val]?.getD 0)

/-- Original level-three parent named by a complete supplied positive hierarchy node. -/
def parent3 (node : Fin 945) : Shape :=
  SuppliedShapeIndices.shapeAt 8 (SuppliedShapeIndices.positiveNode node).child

/-- The contextual source row and the original hierarchy name the same parent shape. -/
def predicate3 (index : Fin (945*6)) : Prop :=
  (SuppliedParameters.alpha3 index.divNat index.modNat).val.parent = parent3 index.divNat

/-- Fast check of all level-three parent bindings (FKLMeta). -/
theorem fkl_checked : FKL.allRange (fun i =>
    Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div i 6)) 45)
    (Bool.and (Nat.beq (FKL.lane FKLMeta.SplitParents.parX 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 i))
        (FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div i 6))))
    (Bool.and (Nat.beq (FKL.lane FKLMeta.SplitParents.parY 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 i))
        (FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div i 6))))
      (Nat.beq (FKL.lane FKLMeta.SplitParents.parZ 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 i))
        (FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div i 6))))))) 13 0 5670 = true := by
  decide +kernel

/-- Every flat node/strategy position satisfies the parent binding. -/
theorem fkl_all (index : Fin (945*6)) : predicate3 index := by
  have h := FKL.allRange_sound _ 13 0 5670 fkl_checked index.val index.isLt
  simp only [Nat.zero_add, Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨hc, hx, hy, hz⟩ := h
  have e1 : parent3 index.divNat = ⟨FKL.lane FKLMeta.Nodes.sx8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div index.val 6)),
      FKL.lane FKLMeta.Nodes.sy8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div index.val 6)),
      FKL.lane FKLMeta.Nodes.sz8 5 (FKL.lane FKLMeta.Nodes.positiveC 6 (Nat.div index.val 6))⟩ := by
    unfold parent3; rw [FKLMeta.Nodes.positiveNode_eq]; exact FKLMeta.Nodes.shapeAt8 _ hc
  have hflat : (SuppliedParameters.flat2 index.divNat index.modNat).val = index.val := by
    rw [SuppliedParameters.flat2_val]; exact Nat.div_add_mod' index.val 6
  have e2 : (SuppliedParameters.alpha3 index.divNat index.modNat).val.parent =
      ⟨FKL.lane FKLMeta.SplitParents.parX 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 index.val),
       FKL.lane FKLMeta.SplitParents.parY 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 index.val),
       FKL.lane FKLMeta.SplitParents.parZ 5 (FKL.lane FKLMeta.Flat.SplitAlpha3.flat 13 index.val)⟩ := by
    unfold SuppliedParameters.alpha3
    rw [FKLMeta.SplitParents.parent_eq, FKLMeta.Flat.SplitAlpha3.get_eq, hflat]
  unfold predicate3
  rw [e1, e2, hx, hy, hz]

/-- Fast check of all level-four parent bindings (FKLMeta). -/
theorem fkl_checked4 : FKL.allRange (fun k =>
    Bool.and (Nat.blt (FKL.lane FKLMeta.Nodes.colT16 8 k) 153)
    (Bool.and (Nat.beq (FKL.lane FKLMeta.SplitParents.parX 5 (FKL.lane FKLMeta.Flat.SplitAlpha4.flat 13 k))
        (FKL.lane FKLMeta.Nodes.sx16 5 (FKL.lane FKLMeta.Nodes.colT16 8 k)))
    (Bool.and (Nat.beq (FKL.lane FKLMeta.SplitParents.parY 5 (FKL.lane FKLMeta.Flat.SplitAlpha4.flat 13 k))
        (FKL.lane FKLMeta.Nodes.sy16 5 (FKL.lane FKLMeta.Nodes.colT16 8 k)))
      (Nat.beq (FKL.lane FKLMeta.SplitParents.parZ 5 (FKL.lane FKLMeta.Flat.SplitAlpha4.flat 13 k))
        (FKL.lane FKLMeta.Nodes.sz16 5 (FKL.lane FKLMeta.Nodes.colT16 8 k)))))) 7 0 105 = true := by
  decide +kernel

/-- Exact parent bindings for flat node/strategy positions 0 through 127. -/
theorem block000 : IndexBlockCertificate predicate3 0 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 128 through 255. -/
theorem block001 : IndexBlockCertificate predicate3 128 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 256 through 383. -/
theorem block002 : IndexBlockCertificate predicate3 256 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 384 through 511. -/
theorem block003 : IndexBlockCertificate predicate3 384 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 512 through 639. -/
theorem block004 : IndexBlockCertificate predicate3 512 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 640 through 767. -/
theorem block005 : IndexBlockCertificate predicate3 640 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 768 through 895. -/
theorem block006 : IndexBlockCertificate predicate3 768 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 896 through 1023. -/
theorem block007 : IndexBlockCertificate predicate3 896 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1024 through 1151. -/
theorem block008 : IndexBlockCertificate predicate3 1024 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1152 through 1279. -/
theorem block009 : IndexBlockCertificate predicate3 1152 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1280 through 1407. -/
theorem block010 : IndexBlockCertificate predicate3 1280 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1408 through 1535. -/
theorem block011 : IndexBlockCertificate predicate3 1408 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1536 through 1663. -/
theorem block012 : IndexBlockCertificate predicate3 1536 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1664 through 1791. -/
theorem block013 : IndexBlockCertificate predicate3 1664 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1792 through 1919. -/
theorem block014 : IndexBlockCertificate predicate3 1792 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 1920 through 2047. -/
theorem block015 : IndexBlockCertificate predicate3 1920 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2048 through 2175. -/
theorem block016 : IndexBlockCertificate predicate3 2048 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2176 through 2303. -/
theorem block017 : IndexBlockCertificate predicate3 2176 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2304 through 2431. -/
theorem block018 : IndexBlockCertificate predicate3 2304 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2432 through 2559. -/
theorem block019 : IndexBlockCertificate predicate3 2432 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2560 through 2687. -/
theorem block020 : IndexBlockCertificate predicate3 2560 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2688 through 2815. -/
theorem block021 : IndexBlockCertificate predicate3 2688 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2816 through 2943. -/
theorem block022 : IndexBlockCertificate predicate3 2816 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 2944 through 3071. -/
theorem block023 : IndexBlockCertificate predicate3 2944 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3072 through 3199. -/
theorem block024 : IndexBlockCertificate predicate3 3072 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3200 through 3327. -/
theorem block025 : IndexBlockCertificate predicate3 3200 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3328 through 3455. -/
theorem block026 : IndexBlockCertificate predicate3 3328 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3456 through 3583. -/
theorem block027 : IndexBlockCertificate predicate3 3456 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3584 through 3711. -/
theorem block028 : IndexBlockCertificate predicate3 3584 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3712 through 3839. -/
theorem block029 : IndexBlockCertificate predicate3 3712 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3840 through 3967. -/
theorem block030 : IndexBlockCertificate predicate3 3840 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 3968 through 4095. -/
theorem block031 : IndexBlockCertificate predicate3 3968 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4096 through 4223. -/
theorem block032 : IndexBlockCertificate predicate3 4096 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4224 through 4351. -/
theorem block033 : IndexBlockCertificate predicate3 4224 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4352 through 4479. -/
theorem block034 : IndexBlockCertificate predicate3 4352 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4480 through 4607. -/
theorem block035 : IndexBlockCertificate predicate3 4480 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4608 through 4735. -/
theorem block036 : IndexBlockCertificate predicate3 4608 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4736 through 4863. -/
theorem block037 : IndexBlockCertificate predicate3 4736 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4864 through 4991. -/
theorem block038 : IndexBlockCertificate predicate3 4864 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 4992 through 5119. -/
theorem block039 : IndexBlockCertificate predicate3 4992 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 5120 through 5247. -/
theorem block040 : IndexBlockCertificate predicate3 5120 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 5248 through 5375. -/
theorem block041 : IndexBlockCertificate predicate3 5248 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 5376 through 5503. -/
theorem block042 : IndexBlockCertificate predicate3 5376 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 5504 through 5631. -/
theorem block043 : IndexBlockCertificate predicate3 5504 128 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Exact parent bindings for flat node/strategy positions 5632 through 5669. -/
theorem block044 : IndexBlockCertificate predicate3 5632 38 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- All original level-three split records are bound to their intended hierarchy parents. -/
theorem complete3 : IndexBlockCertificate predicate3 0 5670 :=
  ((((((((((((((((((((((((((((((((((((((((((((block000).append block001).append block002).append block003).append block004).append block005).append block006).append block007).append block008).append block009).append block010).append block011).append block012).append block013).append block014).append block015).append block016).append block017).append block018).append block019).append block020).append block021).append block022).append block023).append block024).append block025).append block026).append block027).append block028).append block029).append block030).append block031).append block032).append block033).append block034).append block035).append block036).append block037).append block038).append block039).append block040).append block041).append block042).append block043).append block044

/-- Every original level-four split has exactly the corresponding positive root-child parent. -/
theorem alpha4_parent : ∀ node : Fin 105,
    (SuppliedParameters.alpha4 node).val.parent = parent4 node := by
  intro node
  have h := FKL.allRange_sound _ 7 0 105 fkl_checked4 node.val node.isLt
  simp only [Nat.zero_add, Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨hc, hx, hy, hz⟩ := h
  unfold parent4 SuppliedParameters.alpha4
  rw [FKLMeta.SplitParents.parent_eq, FKLMeta.Flat.SplitAlpha4.get_eq, FKLMeta.Nodes.colT16_get node.val node.isLt,
    Option.getD_some, FKLMeta.Nodes.shapeAt16 _ hc, hx, hy, hz]

end MatrixBounds.Numeric.SuppliedHierarchyParents
