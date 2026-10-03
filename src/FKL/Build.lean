module

public import FKL.Lane

/-! Continuation-style builders of raw term lists, with their real values.

Every builder conses onto a given tail, so values are additive: `rawValue (b tail) = V + rawValue tail`.
Zero magnitudes are skipped; this never changes values. -/

@[expose] public section

namespace FKL

open scoped BigOperators

variable (S T : ℕ)

theorem rawValue_nil : rawValue S T [] = 0 := by simp [rawValue]

theorem rawValue_cons (t : Raw) (l : List Raw) : rawValue S T (t :: l) = t.value S T + rawValue S T l := by
  simp [rawValue]

theorem Raw.value_pos (key mag : Nat) :
    Raw.value S T ⟨key, mag, false⟩ = (mag : ℝ) / 2 ^ T * Real.log ((key : ℝ) / 2 ^ S) := by
  simp [Raw.value, Raw.coef]

theorem Raw.value_neg (key mag : Nat) :
    Raw.value S T ⟨key, mag, true⟩ = -((mag : ℝ) / 2 ^ T * Real.log ((key : ℝ) / 2 ^ S)) := by
  simp [Raw.value, Raw.coef, neg_div]

/-- Emit one term, skipping a zero magnitude and the argument `1` (key `2^S`). -/
def term (key mag : Nat) (neg : Bool) (tail : List Raw) : List Raw :=
  cond (Bool.or (Nat.beq mag 0) (Nat.beq key (Nat.shiftLeft 1 S))) tail (Raw.mk key mag neg :: tail)

theorem rawValue_term (key mag : Nat) (neg : Bool) (tail : List Raw) :
    rawValue S T (term S key mag neg tail) = Raw.value S T ⟨key, mag, neg⟩ + rawValue S T tail := by
  unfold term
  by_cases h : mag = 0
  · subst h; cases neg <;> simp [Raw.value, Raw.coef]
  · by_cases hk : key = 2 ^ S
    · have : Nat.beq key (Nat.shiftLeft 1 S) = true := by
        rw [Nat.beq_eq, raw_pow2]; exact hk
      rw [this, Bool.or_true, Bool.cond_true]
      have h1 : ((key : ℝ) / 2 ^ S) = 1 := by
        rw [hk]; push_cast; exact div_self (pow_ne_zero _ two_ne_zero)
      simp [Raw.value, h1]
    · have hm : Nat.beq mag 0 = false := by
        cases hb : Nat.beq mag 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true hb) h
      have hk' : Nat.beq key (Nat.shiftLeft 1 S) = false := by
        cases hb : Nat.beq key (Nat.shiftLeft 1 S)
        · rfl
        · exact absurd (by rw [← raw_pow2]; exact Nat.eq_of_beq_eq_true hb) hk
      rw [hm, hk']; exact rawValue_cons S T _ _

/-- Run `f 0`, …, `f (n-1)` (last index first) onto a tail. -/
def loopL (n : Nat) (f : Nat → List Raw → List Raw) (tail : List Raw) : List Raw :=
  Nat.rec (motive := fun _ => List Raw → List Raw) (fun t => t) (fun i rec t => rec (f i t)) n tail

theorem loopL_zero (f : Nat → List Raw → List Raw) (tail : List Raw) : loopL 0 f tail = tail := rfl

theorem loopL_succ (n : Nat) (f : Nat → List Raw → List Raw) (tail : List Raw) :
    loopL (n + 1) f tail = loopL n f (f n tail) := rfl

theorem rawValue_loopL (n : Nat) (f : Nat → List Raw → List Raw) (V : Nat → ℝ)
    (hf : ∀ i < n, ∀ t, rawValue S T (f i t) = V i + rawValue S T t) (tail : List Raw) :
    rawValue S T (loopL n f tail) = (∑ i ∈ Finset.range n, V i) + rawValue S T tail := by
  induction n generalizing tail with
  | zero => simp [loopL_zero]
  | succ n ih =>
    rw [loopL_succ, ih (fun i hi => hf i (by omega)), hf n (by omega), Finset.sum_range_succ]
    ring

/-- Raw natural-number sum `f 0 + … + f (n-1)`. -/
def sumN (n : Nat) (f : Nat → Nat) : Nat :=
  Nat.rec (motive := fun _ => Nat) 0 (fun i acc => Nat.add acc (f i)) n

theorem sumN_eq (n : Nat) (f : Nat → Nat) : sumN n f = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => rfl
  | succ n ih => rw [Finset.sum_range_succ, ← ih]; rfl

/-- Orbit mass entropy terms of the masses `get o` (`o < n`), with integer weight `k`:
argument keys `get o <<< ks`, sizes `sz o <<< S`, magnitudes `(k * get o) <<< ms`.
Signs: `+` on each mass, `-` on each size and on the total. -/
def orbitMassB (n : Nat) (get sz : Nat → Nat) (k ks ms : Nat) (tail : List Raw) : List Raw :=
  term S (Nat.shiftLeft (sumN n get) ks) (Nat.shiftLeft (Nat.mul k (sumN n get)) ms) true
    (loopL n (fun o t => term S (Nat.shiftLeft (get o) ks) (Nat.shiftLeft (Nat.mul k (get o)) ms) false
      (term S (Nat.shiftLeft (sz o) S) (Nat.shiftLeft (Nat.mul k (get o)) ms) true t)) tail)

theorem orbitMassB_value (n : Nat) (get sz : Nat → Nat) (k ks ms : Nat) (tail : List Raw) :
    rawValue S T (orbitMassB S n get sz k ks ms tail) =
      (k : ℝ) * 2 ^ ms / 2 ^ T *
        ((∑ o ∈ Finset.range n, (get o : ℝ) * Real.log ((get o : ℝ) * 2 ^ ks / 2 ^ S)) -
         (∑ o ∈ Finset.range n, (get o : ℝ) * Real.log (sz o : ℝ)) -
         (∑ o ∈ Finset.range n, (get o : ℝ)) * Real.log ((∑ o ∈ Finset.range n, (get o : ℝ)) * 2 ^ ks / 2 ^ S)) +
      rawValue S T tail := by
  have hS : (2 : ℝ) ^ S ≠ 0 := pow_ne_zero _ two_ne_zero
  unfold orbitMassB
  rw [rawValue_term, rawValue_loopL S T n _ (fun o => (k : ℝ) * 2 ^ ms / 2 ^ T *
      ((get o : ℝ) * Real.log ((get o : ℝ) * 2 ^ ks / 2 ^ S) - (get o : ℝ) * Real.log (sz o : ℝ)))]
  · rw [Raw.value_neg, sumN_eq]
    simp only [raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat,
      Nat.cast_sum, ← Finset.mul_sum, Finset.sum_sub_distrib]
    ring
  · intro o _ t
    rw [rawValue_term, rawValue_term, Raw.value_pos, Raw.value_neg]
    simp only [raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]
    rw [mul_div_assoc (sz o : ℝ), div_self hS, mul_one]
    ring

end FKL
