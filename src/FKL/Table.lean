module

public import FKL.Lane

/-! Chunked packed tables: a balanced binary tree of `Nat` chunks (each holding `2^c` lanes of width
`w`), indexed by the low bits of the chunk number. Lookups cost one tree descent and one lane read. -/

@[expose] public section

namespace FKL

/-- A binary tree of packed chunks. -/
inductive Tree where
  | leaf : Nat → Tree
  | node : Tree → Tree → Tree

/-- Chunk lookup: bit 0 of `k` picks the branch at the root, bit 1 at the next level, and so on. -/
noncomputable def Tree.get (t : Tree) (k : Nat) : Nat :=
  Tree.rec (motive := fun _ => Nat → Nat) (fun v _ => v)
    (fun _ _ l r k => cond (Nat.beq (Nat.land k 1) 0) (l (Nat.shiftRight k 1)) (r (Nat.shiftRight k 1))) t k

/-- Entry `i` of a chunked table with chunks of `2^c` lanes of width `w`. -/
noncomputable def ptGet (t : Tree) (c w i : Nat) : Nat :=
  lane (t.get (Nat.shiftRight i c)) w (Nat.land i (Nat.sub (Nat.shiftLeft 1 c) 1))

theorem ptGet_eq (t : Tree) (c w i : Nat) : ptGet t c w i = lane (t.get (i / 2 ^ c)) w (i % 2 ^ c) := by
  simp only [ptGet, raw_shiftRight, raw_land, raw_sub, raw_pow2, Nat.shiftRight_eq_div_pow,
    Nat.and_two_pow_sub_one_eq_mod]

/-- Every one of the first `n` lanes of `d` is below `b`. -/
def lanesLt (d w b : Nat) (n : Nat) : Bool :=
  Nat.rec (motive := fun _ => Nat → Bool) (fun _ => true)
    (fun _ rec d => Bool.and (Nat.blt (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1)) b) (rec (Nat.shiftRight d w))) n d

theorem lanesLt_succ (d w b n : Nat) : lanesLt d w b (n + 1) =
    Bool.and (Nat.blt (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1)) b) (lanesLt (Nat.shiftRight d w) w b n) := rfl

theorem lanesLt_sound (w b : Nat) : ∀ (n d : Nat), lanesLt d w b n = true → ∀ j < n, lane d w j < b := by
  intro n
  induction n with
  | zero => intro d _ j hj; omega
  | succ n ih =>
    intro d h j hj
    rw [lanesLt_succ] at h
    simp only [Bool.and_eq_true, Nat.blt_eq] at h
    rcases j with _ | j
    · simpa [lane] using h.1
    · have := ih _ h.2 j (by omega)
      rw [lane_eq] at this ⊢
      rw [raw_shiftRight, Nat.shiftRight_eq_div_pow, Nat.div_div_eq_div_mul, ← pow_add] at this
      rw [Nat.mul_add, Nat.mul_one, Nat.add_comm (w * j) w]; exact this

/-- Executable bound check of chunks `0 … nch-1`. -/
noncomputable def chunksLt (t : Tree) (c w b : Nat) (nch : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun k rec => Bool.and rec (lanesLt (t.get k) w b (Nat.shiftLeft 1 c))) nch

theorem chunksLt_sound (t : Tree) (c w b : Nat) : ∀ nch, chunksLt t c w b nch = true →
    ∀ i < nch * 2 ^ c, ptGet t c w i < b := by
  intro nch
  induction nch with
  | zero => intro _ i hi; simp at hi
  | succ n ih =>
    intro h i hi
    have h' : chunksLt t c w b n = true ∧ lanesLt (t.get n) w b (Nat.shiftLeft 1 c) = true := by
      simpa [chunksLt] using h
    have hc : 0 < 2 ^ c := Nat.two_pow_pos c
    by_cases hin : i < n * 2 ^ c
    · exact ih h'.1 i hin
    · rw [ptGet_eq]
      have hk : i / 2 ^ c = n := by
        apply le_antisymm
        · exact Nat.lt_succ_iff.mp ((Nat.div_lt_iff_lt_mul hc).mpr (by rw [Nat.succ_mul] at hi ⊢; omega))
        · exact (Nat.le_div_iff_mul_le hc).mpr (by omega)
      rw [hk]
      exact lanesLt_sound w b _ _ h'.2 _ (by rw [raw_pow2]; exact Nat.mod_lt _ hc)

end FKL
