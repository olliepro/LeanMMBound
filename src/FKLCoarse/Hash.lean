module

public import FKL.Kron

/-! Two-level hashed slot function for `FKL.kron`.

Bucket `key mod M1` of the packed table `P` (32-bit lanes) holds `off + 2^16 * m`; the slot of `key` is
`off + key mod m`. Soundness never depends on the hash (the kernel checks every slot's packed key), so
`check2H` is sound for any `P`, `M1`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL

/-- Hashed slot of a key. -/
def slotH (P M1 : Nat) (key : Nat) : Nat :=
  (fun e => Nat.add (Nat.land e 65535) (Nat.mod key (Nat.shiftRight e 16))) (lane P 32 (Nat.mod key M1))

/-- The complete acceptance test for two raw lists against a hashed packed key array. -/
def check2H (L K kw nk P M1 : Nat) (l₁ l₂ : List Raw) : Bool :=
  accepted L (kron L K kw nk (slotH P M1) true l₂ (kron L K kw nk (slotH P M1) false l₁ ⟨0, 0, 0, true⟩))

theorem check2H_sound (S T L K kw nk P M1 : Nat) (l₁ l₂ : List Raw) (h : check2H L K kw nk P M1 l₁ l₂ = true) :
    rawValue S T l₁ = rawValue S T l₂ :=
  kron_sound S T L K kw nk (slotH P M1) l₁ l₂ h

/-- Raw conjunction over `0 … n-1`. -/
def allN (n : Nat) (f : Nat → Bool) : Bool :=
  Nat.rec (motive := fun _ => Bool) true (fun i acc => Bool.and acc (f i)) n

theorem allN_sound (f : Nat → Bool) : ∀ n, allN n f = true → ∀ i < n, f i = true := by
  intro n
  induction n with
  | zero => intro _ i hi; omega
  | succ n ih =>
    intro h i hi
    have h' : allN n f = true ∧ f n = true := by simpa [allN] using h
    rcases Nat.lt_succ_iff_lt_or_eq.mp hi with hlt | rfl
    · exact ih h'.1 i hlt
    · exact h'.2

end MatrixBounds.Numeric.FKLCoarse
