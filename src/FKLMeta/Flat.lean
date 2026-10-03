module

public import FKL.Table
public import FKL.Pack
public import FKLMeta.Shapes
public import FKLBridge.IndexTable

/-! Flattening a chunked table: one literal `F` whose wide lanes are the tree's chunks, so an entry is
one lane read of `F` without tree descent. -/

@[expose] public section

namespace FKLMeta

/-- Chunk `k` of the tree is wide lane `k` of `F`, for `k < nch`. -/
noncomputable def flatOk (t : FKL.Tree) (W F nch : Nat) : Bool :=
  allN (fun k => Nat.beq (FKL.lane F W k) (t.get k)) nch

theorem flat_get (t : FKL.Tree) (c w F nch : Nat) (h : flatOk t (w * 2 ^ c) F nch = true) :
    ∀ i < nch * 2 ^ c, FKL.ptGet t c w i = FKL.lane F w i := by
  intro i hi
  have hp : 0 < 2 ^ c := Nat.two_pow_pos c
  have hk : i / 2 ^ c < nch := by
    rw [Nat.div_lt_iff_lt_mul hp]; exact hi
  have e := allN_sound _ _ h (i / 2 ^ c) hk
  simp only [Nat.beq_eq] at e
  rw [FKL.ptGet_eq, ← e, FKL.lane_lane F w (2 ^ c) (i / 2 ^ c) (i % 2 ^ c) (Nat.mod_lt _ hp),
    Nat.div_add_mod]

open MatrixBounds.Numeric in
/-- A table leaf equal to wide lane `k` of a flat literal reads its entries from the flat literal. -/
theorem reads_flat (w c F k : Nat) {n b : Nat} (T : CheckedIndexTable n b) (off : Nat)
    (hoff : off = k * 2 ^ c) (hn : n ≤ 2 ^ c)
    (h : FKLBridge.lanesEq w (2 ^ w - 1) T.entries (FKL.lane F (w * 2 ^ c) k) = true) :
    FKLBridge.Reads T (fun i => FKL.lane F w i) off := by
  intro i
  have hi : i.val < T.entries.length := by rw [T.length_eq]; exact i.isLt
  have e := FKLBridge.lane_of_lanesEq w (2 ^ w - 1) _ T.entries rfl h i.val hi
  rw [FKL.lane_lane F w (2 ^ c) k i.val (by have := i.isLt; omega)] at e
  rw [CheckedIndexTable.get_val, ← e, hoff, Nat.mul_comm]

end FKLMeta
