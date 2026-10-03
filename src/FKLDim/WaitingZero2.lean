module

public import FKLDim.WZCore
public import FKLDimData.WZFlat
public import FKLBridge.Idx.WaitingZero2References
public import FKLBridge.Idx.WaitingZero2Targets
public import SuppliedWaitingZero2TargetPredicate

/-! Fast replacement of the waiting-zero2 support target certificate: one balanced kernel check walks
every packed leaf-reference chunk and reads the referenced support code from a flat packed copy of
the zero registry. -/

@[expose] public section

namespace MatrixBounds.Numeric.SuppliedWaitingZero2TargetCertificates

open FKL FKLDim SuppliedWaitingZero2TargetPredicate

/-- The twelve target codes, three-bit lanes. -/
def tgtP : Nat := 38021678732
def tgt (c : Nat) : Nat := lane tgtP 3 c

theorem tgt_eq : ∀ c : Fin 12, tgt c = target c := by decide +kernel

/-- Expected support code at flat leaf position `i`. -/
def expected (i : Nat) : Nat := Nat.add (tgt (Nat.mod (Nat.div i 6) 12)) 1

/-- All positions of leaf-reference chunk `k` (128 per chunk, 72 in the last). -/
noncomputable def chunkOK (k : Nat) : Bool :=
  walk FKLDimData.ZF 5 14 expected (cond (Nat.beq k 531) 72 128) (FKLBridge.Idx.DyadicLeafzero.tree.get k) (Nat.mul 128 k)

/-- The single balanced kernel check over all 68040 leaf positions. -/
theorem checked : allRange chunkOK 10 0 532 = true := by decide +kernel

theorem pos_ok (i : Nat) (hi : i < 68040) :
    lane FKLDimData.ZF 5 (ptGet FKLBridge.Idx.DyadicLeafzero.tree 7 14 i) = expected i := by
  have hk : i / 128 < 532 := by omega
  have h1 := allRange_sound chunkOK 10 0 532 checked (i / 128) hk
  rw [Nat.zero_add] at h1
  unfold chunkOK at h1
  have hn : i % 128 < cond (Nat.beq (i / 128) 531) 72 128 := by
    by_cases h : i / 128 = 531
    · rw [h]; show i % 128 < 72; omega
    · rw [nbeq_false_of_ne h]; show i % 128 < 128; omega
  have h2 := walk_sound _ 5 14 expected _ _ _ h1 (i % 128) hn
  rw [ptGet_eq, show (2 : ℕ) ^ 7 = 128 by norm_num, h2, raw_mul]
  congr 1; omega

theorem registry_flat (r : Nat) (hr : r < 15279) :
    ptGet FKLBridge.Idx.ZeroRegistry.tree 7 5 r = lane FKLDimData.ZF 5 r :=
  (flat_get FKLDimData.ZF 5 7 FKLBridge.Idx.ZeroRegistry.tree 120 FKLDimData.zf_checked r
    (by norm_num; omega)).symm

theorem valid_all (index : Fin ((945 * 12) * 6)) : valid index := by
  unfold valid
  have hr := FKLBridge.Idx.WaitingZero2References.get_eq index
  have ht : tgt (Nat.mod (Nat.div index.val 6) 12) = target index.divNat.modNat := by
    rw [← tgt_eq]; rfl
  rw [FKLBridge.Idx.WaitingZero2Targets.get_eq, hr,
    registry_flat _ (by rw [← hr]; exact (SuppliedWaitingZero2TargetTables.references.get index).isLt),
    pos_ok index.val index.isLt, expected, ht, raw_add]

/-- All original source leaf references pass the proved balanced target predicate. -/
theorem complete : IndexBlockCertificate valid 0 68040 :=
  ⟨by norm_num, fun index => valid_all _⟩

/-- Every original flat leaf position has its exact checked source support code. -/
theorem original_valid (index : Fin ((945*12)*6)) :
    (SuppliedZeroRegistry.table.get (ParameterIndexData.DyadicLeafzero.table.get index)).val =
      sourceTarget index.divNat.modNat+1 :=
  SuppliedWaitingZero2TargetPredicate.original_valid index (complete.complete index)

end MatrixBounds.Numeric.SuppliedWaitingZero2TargetCertificates
