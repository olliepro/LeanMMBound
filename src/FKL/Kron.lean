module

public import Mathlib.Analysis.SpecialFunctions.Log.Basic
public import Mathlib.Algebra.BigOperators.Intervals

/-! Bucketed comparison of two finite lists of dyadic logarithmic terms.

Each raw term `±mag/2^T · log(key/2^S)` is assigned a slot `j` by a search function; the kernel checks
that the slot's packed key equals the term's key, and adds `mag·2^(L·j)` to one of two natural-number
accumulators. When both lists have been folded (the second with opposite signs), equal accumulators and
a total magnitude below `2^L` force every slot's signed coefficient sum to vanish, so the two lists have
the same real value. -/

@[expose] public section

namespace FKL

open scoped BigOperators

/-- Bits `[w*i, w*i+w)` of `d`, written with raw `Nat` operations. -/
def lane (d w i : Nat) : Nat := Nat.land (Nat.shiftRight d (Nat.mul w i)) (Nat.sub (Nat.shiftLeft 1 w) 1)

/-- One raw dyadic logarithmic term: coefficient `±mag/2^T`, argument `key/2^S`. -/
structure Raw where
  key : Nat
  mag : Nat
  neg : Bool

/-- The signed integer coefficient numerator. -/
def Raw.coef (t : Raw) : ℤ := cond t.neg (-(t.mag : ℤ)) t.mag

/-- The real value of a raw term at argument scale `2^S` and coefficient scale `2^T`. -/
noncomputable def Raw.value (S T : ℕ) (t : Raw) : ℝ :=
  (t.coef : ℝ) / 2 ^ T * Real.log ((t.key : ℝ) / 2 ^ S)

/-- The real value of a list of raw terms. -/
noncomputable def rawValue (S T : ℕ) (l : List Raw) : ℝ := (l.map (Raw.value S T)).sum

/-- The same term with its sign reversed. -/
def Raw.flip (t : Raw) : Raw := ⟨t.key, t.mag, !t.neg⟩

/-- Accumulator state: positive digits, negative digits, total magnitude, and key checks. -/
structure Acc where
  p : Nat
  n : Nat
  m : Nat
  ok : Bool

/-- Bucket term `t` (sign flipped when `f`) into slot `slot t.key`. -/
def step (L K kw nk : Nat) (slot : Nat → Nat) (f : Bool) (a : Acc) (t : Raw) : Acc :=
  (fun j => Acc.mk
    (cond (Bool.xor t.neg f) a.p (Nat.add a.p (Nat.shiftLeft t.mag (Nat.mul L j))))
    (cond (Bool.xor t.neg f) (Nat.add a.n (Nat.shiftLeft t.mag (Nat.mul L j))) a.n)
    (Nat.add a.m t.mag)
    (Bool.and a.ok (Bool.and (Nat.beq (lane K kw j) t.key) (Nat.blt j nk)))) (slot t.key)

/-- Fold a list of raw terms into the accumulator with raw `List.rec`. -/
def kron (L K kw nk : Nat) (slot : Nat → Nat) (f : Bool) (l : List Raw) : Acc → Acc :=
  List.rec (motive := fun _ => Acc → Acc) (fun a => a) (fun t _ rec a => rec (step L K kw nk slot f a t)) l

/-- The executable acceptance test for two folded lists. -/
def accepted (L : Nat) (a : Acc) : Bool :=
  Bool.and a.ok (Bool.and (Nat.beq a.p a.n) (Nat.blt a.m (Nat.shiftLeft 1 L)))

theorem kron_nil (L K kw nk : Nat) (slot : Nat → Nat) (f : Bool) (a : Acc) :
    kron L K kw nk slot f [] a = a := rfl

theorem kron_cons (L K kw nk : Nat) (slot : Nat → Nat) (f : Bool) (t : Raw) (l : List Raw) (a : Acc) :
    kron L K kw nk slot f (t :: l) a = kron L K kw nk slot f l (step L K kw nk slot f a t) := rfl

theorem kron_flip (L K kw nk : Nat) (slot : Nat → Nat) (l : List Raw) (a : Acc) :
    kron L K kw nk slot true l a = kron L K kw nk slot false (l.map Raw.flip) a := by
  induction l generalizing a with
  | nil => rfl
  | cons t l ih =>
    rw [kron_cons, List.map_cons, kron_cons, ih]
    congr 1
    cases t with
    | mk key mag neg => cases neg <;> rfl

theorem kron_append (L K kw nk : Nat) (slot : Nat → Nat) (l₁ l₂ : List Raw) (a : Acc) :
    kron L K kw nk slot false (l₁ ++ l₂) a = kron L K kw nk slot false l₂ (kron L K kw nk slot false l₁ a) := by
  induction l₁ generalizing a with
  | nil => rfl
  | cons t l ih => rw [List.cons_append, kron_cons, kron_cons, ih]

/-! ### Semantics of the fold -/

section Semantics

variable (L K kw nk : Nat) (slot : Nat → Nat)

/-- Positive-side digit of slot `j`. -/
def posDigit (l : List Raw) (j : Nat) : Nat :=
  (l.map (fun t => if t.neg = false ∧ slot t.key = j then t.mag else 0)).sum

/-- Negative-side digit of slot `j`. -/
def negDigit (l : List Raw) (j : Nat) : Nat :=
  (l.map (fun t => if t.neg = true ∧ slot t.key = j then t.mag else 0)).sum

/-- Total magnitude. -/
def magSum (l : List Raw) : Nat := (l.map Raw.mag).sum

/-- Every term's slot holds its key and lies in range. -/
def Keyed (l : List Raw) : Prop := ∀ t ∈ l, lane K kw (slot t.key) = t.key ∧ slot t.key < nk

theorem kron_spec (l : List Raw) (a : Acc) :
    let b := kron L K kw nk slot false l a
    b.p = a.p + (l.map (fun t => if t.neg = false then t.mag * 2 ^ (L * slot t.key) else 0)).sum ∧
    b.n = a.n + (l.map (fun t => if t.neg = true then t.mag * 2 ^ (L * slot t.key) else 0)).sum ∧
    b.m = a.m + magSum l ∧
    (b.ok = true ↔ a.ok = true ∧ Keyed K kw nk slot l) := by
  induction l generalizing a with
  | nil => simp [kron_nil, magSum, Keyed]
  | cons t l ih =>
    obtain ⟨hp, hn, hm, hok⟩ := ih (step L K kw nk slot false a t)
    simp only [kron_cons]
    refine ⟨?_, ?_, ?_, ?_⟩
    · rw [hp]; cases h : t.neg <;>
        simp [step, h, Nat.shiftLeft_eq, Nat.add_assoc]
    · rw [hn]; cases h : t.neg <;>
        simp [step, h, Nat.shiftLeft_eq, Nat.add_assoc, Nat.add_comm]
    · rw [hm]; simp [step, magSum, Nat.add_assoc]
    · rw [hok]
      simp only [step, Bool.and_eq_true, Nat.beq_eq, Nat.blt_eq, Keyed, List.mem_cons,
        forall_eq_or_imp]
      tauto

theorem sum_slots_pos (l : List Raw) (hk : Keyed K kw nk slot l) :
    (l.map (fun t => if t.neg = false then t.mag * 2 ^ (L * slot t.key) else 0)).sum =
      ∑ j ∈ Finset.range nk, posDigit slot l j * 2 ^ (L * j) := by
  induction l with
  | nil => simp [posDigit]
  | cons t l ih =>
    have hl : Keyed K kw nk slot l := fun u hu => hk u (List.mem_cons_of_mem _ hu)
    have ht := (hk t List.mem_cons_self).2
    simp only [List.map_cons, List.sum_cons, ih hl, posDigit, add_mul, Finset.sum_add_distrib]
    congr 1
    cases h : t.neg
    · simp only [true_and, ite_mul, zero_mul, ite_true]
      rw [Finset.sum_ite_eq (Finset.range nk) (slot t.key) (fun j => t.mag * 2 ^ (L * j))]
      simp [Finset.mem_range.mpr ht]
    · simp

theorem sum_slots_neg (l : List Raw) (hk : Keyed K kw nk slot l) :
    (l.map (fun t => if t.neg = true then t.mag * 2 ^ (L * slot t.key) else 0)).sum =
      ∑ j ∈ Finset.range nk, negDigit slot l j * 2 ^ (L * j) := by
  induction l with
  | nil => simp [negDigit]
  | cons t l ih =>
    have hl : Keyed K kw nk slot l := fun u hu => hk u (List.mem_cons_of_mem _ hu)
    have ht := (hk t List.mem_cons_self).2
    simp only [List.map_cons, List.sum_cons, ih hl, negDigit, add_mul, Finset.sum_add_distrib]
    congr 1
    cases h : t.neg
    · simp
    · simp only [true_and, ite_mul, zero_mul, ite_true]
      rw [Finset.sum_ite_eq (Finset.range nk) (slot t.key) (fun j => t.mag * 2 ^ (L * j))]
      simp [Finset.mem_range.mpr ht]

theorem posDigit_le (l : List Raw) (j : Nat) : posDigit slot l j ≤ magSum l := by
  induction l with
  | nil => simp [posDigit, magSum]
  | cons t l ih =>
    simp only [posDigit, magSum, List.map_cons, List.sum_cons] at ih ⊢
    split_ifs <;> omega

theorem negDigit_le (l : List Raw) (j : Nat) : negDigit slot l j ≤ magSum l := by
  induction l with
  | nil => simp [negDigit, magSum]
  | cons t l ih =>
    simp only [negDigit, magSum, List.map_cons, List.sum_cons] at ih ⊢
    split_ifs <;> omega

theorem rawValue_slots (S T : ℕ) (l : List Raw) (hk : Keyed K kw nk slot l) :
    rawValue S T l = ∑ j ∈ Finset.range nk,
      ((posDigit slot l j : ℝ) - negDigit slot l j) / 2 ^ T * Real.log ((lane K kw j : ℝ) / 2 ^ S) := by
  induction l with
  | nil => simp [rawValue, posDigit, negDigit]
  | cons t l ih =>
    have hl : Keyed K kw nk slot l := fun u hu => hk u (List.mem_cons_of_mem _ hu)
    obtain ⟨hkey, ht⟩ := hk t List.mem_cons_self
    have ih' := ih hl
    simp only [rawValue, List.map_cons, List.sum_cons] at ih' ⊢
    rw [ih']
    have single : Raw.value S T t = ∑ j ∈ Finset.range nk,
        (((if t.neg = false ∧ slot t.key = j then t.mag else 0 : ℕ) : ℝ) -
          ((if t.neg = true ∧ slot t.key = j then t.mag else 0 : ℕ) : ℝ)) / 2 ^ T *
          Real.log ((lane K kw j : ℝ) / 2 ^ S) := by
      rw [Finset.sum_eq_single (slot t.key)]
      · rw [hkey]
        cases h : t.neg <;> simp [Raw.value, Raw.coef, h]
      · intro j _ hj
        have : slot t.key ≠ j := fun e => hj e.symm
        simp [this]
      · intro hn; exact absurd (Finset.mem_range.mpr ht) hn
    rw [single, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro j _
    simp only [posDigit, negDigit, List.map_cons, List.sum_cons, Nat.cast_add]
    ring

end Semantics

/-- Equal sums of base-`B` digits below `B` have equal digits. -/
theorem digits_unique (B : ℕ) (hB : 0 < B) : ∀ (n : ℕ) (a b : ℕ → ℕ), (∀ j, a j < B) → (∀ j, b j < B) →
    ∑ j ∈ Finset.range n, a j * B ^ j = ∑ j ∈ Finset.range n, b j * B ^ j → ∀ j < n, a j = b j := by
  intro n
  induction n with
  | zero => intro a b _ _ _ j hj; omega
  | succ n ih =>
    intro a b ha hb h j hj
    rw [Finset.sum_range_succ', Finset.sum_range_succ'] at h
    have shift : ∀ c : ℕ → ℕ, ∑ i ∈ Finset.range n, c (i + 1) * B ^ (i + 1) =
        B * ∑ i ∈ Finset.range n, c (i + 1) * B ^ i := by
      intro c; rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro i _; ring
    rw [shift a, shift b, pow_zero, mul_one, mul_one] at h
    have key : ∀ X c, c < B → (B * X + c) % B = c := fun X c hc => by
      rw [Nat.add_comm, Nat.add_mul_mod_self_left, Nat.mod_eq_of_lt hc]
    have h0 : a 0 = b 0 := by
      have := congrArg (· % B) h
      simp only [key _ _ (ha 0), key _ _ (hb 0)] at this
      exact this
    have hrest : ∑ i ∈ Finset.range n, a (i + 1) * B ^ i = ∑ i ∈ Finset.range n, b (i + 1) * B ^ i := by
      rw [h0] at h
      exact Nat.eq_of_mul_eq_mul_left hB (Nat.add_right_cancel h)
    rcases j with _ | j
    · exact h0
    · exact ih (fun i => a (i + 1)) (fun i => b (i + 1)) (fun i => ha _) (fun i => hb _) hrest j (by omega)

/-- Reversing every sign negates the value. -/
theorem rawValue_flip (S T : ℕ) (l : List Raw) : rawValue S T (l.map Raw.flip) = -rawValue S T l := by
  induction l with
  | nil => simp [rawValue]
  | cons t r ih =>
    simp only [rawValue, List.map_cons, List.sum_cons, List.map_map] at ih ⊢
    rw [neg_add, ← ih]
    congr 1
    cases ht : t.neg <;> simp [Raw.value, Raw.flip, Raw.coef, ht] <;> ring

/-- Soundness of the bucketed comparison: accepted folds of `l₁` and the sign-reversed `l₂` give equal values. -/
theorem kron_sound (S T L K kw nk : Nat) (slot : Nat → Nat) (l₁ l₂ : List Raw)
    (h : accepted L (kron L K kw nk slot true l₂ (kron L K kw nk slot false l₁ ⟨0, 0, 0, true⟩)) = true) :
    rawValue S T l₁ = rawValue S T l₂ := by
  rw [kron_flip, ← kron_append] at h
  set l := l₁ ++ l₂.map Raw.flip with hl
  obtain ⟨hp, hn, hm, hok⟩ := kron_spec L K kw nk slot l ⟨0, 0, 0, true⟩
  simp only [accepted, Bool.and_eq_true, Nat.beq_eq_true_eq, Nat.blt_eq] at h
  obtain ⟨hok', heq, hlt⟩ := h
  have hk : Keyed K kw nk slot l := (hok.mp hok').2
  have hpn : (l.map (fun t => if t.neg = false then t.mag * 2 ^ (L * slot t.key) else 0)).sum =
      (l.map (fun t => if t.neg = true then t.mag * 2 ^ (L * slot t.key) else 0)).sum := by
    have := heq; rw [hp, hn] at this; simpa using this
  have hB : 0 < 2 ^ L := pow_pos (by norm_num) L
  have hm' : magSum l < 2 ^ L := by rw [hm] at hlt; simpa [Nat.shiftLeft_eq] using hlt
  have eqDigits := digits_unique (2 ^ L) hB nk (posDigit slot l) (negDigit slot l)
    (fun j => lt_of_le_of_lt (posDigit_le slot l j) hm') (fun j => lt_of_le_of_lt (negDigit_le slot l j) hm')
    (by
      rw [sum_slots_pos L K kw nk slot l hk, sum_slots_neg L K kw nk slot l hk] at hpn
      simpa only [pow_mul] using hpn)
  have zero : rawValue S T l = 0 := by
    rw [rawValue_slots K kw nk slot S T l hk]
    apply Finset.sum_eq_zero
    intro j hj
    rw [eqDigits j (Finset.mem_range.mp hj), sub_self, zero_div, zero_mul]
  have flipv := rawValue_flip S T l₂
  rw [hl, rawValue, List.map_append, List.sum_append] at zero
  have : rawValue S T l₁ + rawValue S T (l₂.map Raw.flip) = 0 := zero
  rw [flipv] at this
  linarith

end FKL
