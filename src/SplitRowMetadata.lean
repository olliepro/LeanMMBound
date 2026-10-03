module

public import IndexedCertificateRows
public import FiniteIndexBlockComposition
public import FKLMeta.MetaExp
public import FKLMeta.SpWalk

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact metadata of the original accepted rows. Each bounded check reduces
only the row's actual metadata, reusing its separately checked probability data. -/
namespace MatrixBounds.Numeric.SplitRowMetadata
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000

/-- Exact alphabet size determined by the original deduplicated row regions. -/
def expected (index : ℕ) : ℕ :=
  if index < 5437 then 4 else 8

/-- Metadata assertion at an original accepted row. -/
def predicate (index : Fin 5542) : Prop :=
  (IndexedCertificateRows.split index).val.childTotal = expected index.val


/-- Raw form of `expected` (FKLMeta). -/
theorem fkl_exp (i : ℕ) : FKLMeta.MetaExp.spExp i = expected i := by
  simp only [FKLMeta.MetaExp.spExp, expected, FKLMeta.MetaExp.cond_blt]

/-- Fast check of the metadata of every literal source row (FKLMeta). -/
theorem fkl_checked : FKLMeta.SpWalk.allRows (fun r row => Nat.beq row.childTotal (FKLMeta.MetaExp.spExp r)) = true := by
  decide +kernel

/-- Every source row satisfies the metadata predicate. -/
theorem fkl_all (index : Fin 5542) : predicate index := by
  have h := Nat.eq_of_beq_eq_true (FKLMeta.SpWalk.allRows_sound _ fkl_checked index)
  unfold predicate; rw [← fkl_exp]; exact h

/-- Independent kernel check of row metadata at indices 0 through 255. -/
theorem block000 : IndexBlockCertificate predicate 0 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 256 through 511. -/
theorem block001 : IndexBlockCertificate predicate 256 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 512 through 767. -/
theorem block002 : IndexBlockCertificate predicate 512 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 768 through 1023. -/
theorem block003 : IndexBlockCertificate predicate 768 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 1024 through 1279. -/
theorem block004 : IndexBlockCertificate predicate 1024 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 1280 through 1535. -/
theorem block005 : IndexBlockCertificate predicate 1280 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 1536 through 1791. -/
theorem block006 : IndexBlockCertificate predicate 1536 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 1792 through 2047. -/
theorem block007 : IndexBlockCertificate predicate 1792 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 2048 through 2303. -/
theorem block008 : IndexBlockCertificate predicate 2048 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 2304 through 2559. -/
theorem block009 : IndexBlockCertificate predicate 2304 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 2560 through 2815. -/
theorem block010 : IndexBlockCertificate predicate 2560 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 2816 through 3071. -/
theorem block011 : IndexBlockCertificate predicate 2816 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 3072 through 3327. -/
theorem block012 : IndexBlockCertificate predicate 3072 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 3328 through 3583. -/
theorem block013 : IndexBlockCertificate predicate 3328 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 3584 through 3839. -/
theorem block014 : IndexBlockCertificate predicate 3584 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 3840 through 4095. -/
theorem block015 : IndexBlockCertificate predicate 3840 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 4096 through 4351. -/
theorem block016 : IndexBlockCertificate predicate 4096 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 4352 through 4607. -/
theorem block017 : IndexBlockCertificate predicate 4352 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 4608 through 4863. -/
theorem block018 : IndexBlockCertificate predicate 4608 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 4864 through 5119. -/
theorem block019 : IndexBlockCertificate predicate 4864 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 5120 through 5375. -/
theorem block020 : IndexBlockCertificate predicate 5120 256 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- Independent kernel check of row metadata at indices 5376 through 5541. -/
theorem block021 : IndexBlockCertificate predicate 5376 166 :=
  ⟨by decide +kernel, fun _ => fkl_all _⟩

/-- The bounded checks cover every accepted row, including the final partial block. -/
theorem complete : IndexBlockCertificate predicate 0 5542 :=
  (((((((((((((((((((((block000).append block001).append block002).append block003).append block004).append block005).append block006).append block007).append block008).append block009).append block010).append block011).append block012).append block013).append block014).append block015).append block016).append block017).append block018).append block019).append block020).append block021

/-- Every actual source row has its exact declared alphabet size. -/
theorem metadata (index : Fin 5542) : predicate index := complete.complete index

end MatrixBounds.Numeric.SplitRowMetadata
