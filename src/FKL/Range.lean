module

public import FKL.Lane

/-! Balanced range checks: `allRange f d lo len` tests `f (lo + i)` for `i < len` with recursion depth `d`
(logarithmic in `len`), so large checks never nest deeply in the kernel. -/

@[expose] public section

namespace FKL

/-- Split `[lo, lo + len)` in halves `d` times; at depth 0 test at most one point. -/
def allRange (f : Nat → Bool) (d : Nat) : Nat → Nat → Bool :=
  Nat.rec (motive := fun _ => Nat → Nat → Bool)
    (fun lo len => cond (Nat.beq len 0) true (Bool.and (Nat.beq len 1) (f lo)))
    (fun _ rec lo len => (fun h => Bool.and (rec lo h) (rec (Nat.add lo h) (Nat.sub len h))) (Nat.shiftRight len 1)) d

theorem allRange_zero (f : Nat → Bool) (lo len : Nat) :
    allRange f 0 lo len = cond (Nat.beq len 0) true (Bool.and (Nat.beq len 1) (f lo)) := rfl

theorem allRange_succ (f : Nat → Bool) (d lo len : Nat) :
    allRange f (d + 1) lo len = Bool.and (allRange f d lo (Nat.shiftRight len 1))
      (allRange f d (Nat.add lo (Nat.shiftRight len 1)) (Nat.sub len (Nat.shiftRight len 1))) := rfl

theorem allRange_sound (f : Nat → Bool) : ∀ (d lo len : Nat), allRange f d lo len = true →
    ∀ i < len, f (lo + i) = true := by
  intro d
  induction d with
  | zero =>
    intro lo len h i hi
    rw [allRange_zero] at h
    by_cases h0 : len = 0
    · omega
    · have hb : Nat.beq len 0 = false := by
        cases hb : Nat.beq len 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true hb) h0
      rw [hb] at h
      simp only [Bool.cond_false, Bool.and_eq_true, Nat.beq_eq] at h
      obtain ⟨h1, h2⟩ := h
      have : i = 0 := by omega
      subst this; simpa using h2
  | succ d ih =>
    intro lo len h i hi
    rw [allRange_succ] at h
    have h' : allRange f d lo (len >>> 1) = true ∧ allRange f d (lo + (len >>> 1)) (len - (len >>> 1)) = true := by
      simpa [raw_add, raw_sub, raw_shiftRight] using h
    by_cases hlt : i < len >>> 1
    · exact ih lo _ h'.1 i hlt
    · have := ih _ _ h'.2 (i - (len >>> 1)) (by omega)
      rwa [show lo + (len >>> 1) + (i - (len >>> 1)) = lo + i by omega] at this

end FKL
