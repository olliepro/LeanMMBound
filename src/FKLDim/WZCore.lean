module

public import FKL.Table
public import FKL.Range

/-! Generic raw checks for the waiting-zero2 support targets: a flat packed copy of a chunked table,
and a lane walk through one packed chunk. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLDim

open FKL

theorem nbeq_false_of_ne {a b : Nat} (h : a ≠ b) : Nat.beq a b = false := by
  cases hb : Nat.beq a b
  · rfl
  · exact absurd (Nat.eq_of_beq_eq_true hb) h

/-- Chunks `0 … nch-1` of `t` (each `cw` bits) are the consecutive `cw`-bit slices of the flat constant `F`. -/
noncomputable def chunksAgree (F cw : Nat) (t : Tree) (nch : Nat) : Bool :=
  Nat.rec (motive := fun _ => Bool) true
    (fun k rec => Bool.and rec (Nat.beq (Nat.land (Nat.shiftRight F (Nat.mul cw k)) (Nat.sub (Nat.shiftLeft 1 cw) 1))
      (t.get k))) nch

theorem chunksAgree_sound (F cw : Nat) (t : Tree) : ∀ nch, chunksAgree F cw t nch = true →
    ∀ k < nch, F / 2 ^ (cw * k) % 2 ^ cw = t.get k := by
  intro nch
  induction nch with
  | zero => intro _ k hk; omega
  | succ n ih =>
    intro h k hk
    have h' : chunksAgree F cw t n = true ∧
        Nat.beq (Nat.land (Nat.shiftRight F (Nat.mul cw n)) (Nat.sub (Nat.shiftLeft 1 cw) 1)) (t.get n) = true := by
      simpa [chunksAgree] using h
    by_cases hlt : k < n
    · exact ih h'.1 k hlt
    · have hk' : k = n := by omega
      subst hk'
      have := Nat.eq_of_beq_eq_true h'.2
      rw [raw_land, raw_shiftRight, raw_sub, raw_mul, raw_pow2, Nat.shiftRight_eq_div_pow,
        Nat.and_two_pow_sub_one_eq_mod] at this
      exact this

/-- Lane `j` of a slice: reading inside the slice equals reading the flat constant. -/
theorem lane_slice (F w m k j : Nat) (hj : j < m) :
    lane F w (m * k + j) = lane (F / 2 ^ (w * m * k) % 2 ^ (w * m)) w j := by
  rw [lane_eq, lane_eq]
  have hsplit : w * (m * k + j) = w * m * k + w * j := by ring
  rw [hsplit, pow_add, ← Nat.div_div_eq_div_mul]
  set x := F / 2 ^ (w * m * k)
  have hm : w * m = w * j + (w * m - w * j) := by
    have : w * j ≤ w * m := Nat.mul_le_mul_left w hj.le
    omega
  rw [hm, pow_add, Nat.mod_mul_right_div_self, Nat.mod_mod_of_dvd]
  apply pow_dvd_pow
  have : w * (j + 1) ≤ w * m := Nat.mul_le_mul_left w hj
  rw [Nat.mul_add, Nat.mul_one] at this
  omega

/-- A chunked table read through a checked flat copy. -/
theorem flat_get (F w c : Nat) (t : Tree) (nch : Nat) (h : chunksAgree F (w * 2 ^ c) t nch = true)
    (i : Nat) (hi : i < nch * 2 ^ c) : lane F w i = ptGet t c w i := by
  have hc : 0 < 2 ^ c := Nat.two_pow_pos c
  have hk : i / 2 ^ c < nch := (Nat.div_lt_iff_lt_mul hc).mpr hi
  have hs := chunksAgree_sound F (w * 2 ^ c) t nch h (i / 2 ^ c) hk
  rw [ptGet_eq, ← hs]
  have := lane_slice F w (2 ^ c) (i / 2 ^ c) (i % 2 ^ c) (Nat.mod_lt _ hc)
  rwa [Nat.div_add_mod] at this

/-- Walk `n` lanes of width `w` of the chunk `d`, the first at flat position `i`, testing
`lane F fw (lane d w j) = g (i + j)`. -/
noncomputable def walk (F fw w : Nat) (g : Nat → Nat) : Nat → Nat → Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Bool) (fun _ _ => true)
    (fun _ rec d i => Bool.and (Nat.beq (lane F fw (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1))) (g i))
      (rec (Nat.shiftRight d w) (Nat.add i 1)))

theorem walk_succ (F fw w : Nat) (g : Nat → Nat) (n d i : Nat) :
    walk F fw w g (n + 1) d i = Bool.and (Nat.beq (lane F fw (Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1))) (g i))
      (walk F fw w g n (Nat.shiftRight d w) (Nat.add i 1)) := rfl

theorem walk_sound (F fw w : Nat) (g : Nat → Nat) : ∀ (n d i : Nat), walk F fw w g n d i = true →
    ∀ j < n, lane F fw (lane d w j) = g (i + j) := by
  intro n
  induction n with
  | zero => intro _ _ _ j hj; omega
  | succ n ih =>
    intro d i h j hj
    rw [walk_succ] at h
    simp only [Bool.and_eq_true, Nat.beq_eq] at h
    rcases j with _ | j
    · have : lane d w 0 = Nat.land d (Nat.sub (Nat.shiftLeft 1 w) 1) := by
        simp [lane]
      rw [this, h.1]; rfl
    · have := ih _ _ h.2 j (by omega)
      have hl : lane d w (j + 1) = lane (Nat.shiftRight d w) w j := by
        rw [lane_eq, lane_eq, raw_shiftRight, Nat.shiftRight_eq_div_pow, Nat.div_div_eq_div_mul, ← pow_add]
        congr 2; ring
      rw [hl, this, raw_add]; congr 1; omega

end MatrixBounds.Numeric.FKLDim
