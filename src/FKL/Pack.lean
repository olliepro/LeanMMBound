module

public import FKL.Build
public import Mathlib.Algebra.BigOperators.Intervals

/-! Packed vectors as base-`2^W` numbers: lane extraction, linearity, and outer products by one
multiplication. -/

@[expose] public section

namespace FKL

open scoped BigOperators

/-- `Σ_{o<m} f o · 2^(W·o)`, computed with raw recursion. -/
def packN (W m : Nat) (f : Nat → Nat) : Nat :=
  sumN m (fun o => Nat.shiftLeft (f o) (Nat.mul W o))

theorem packN_eq (W m : Nat) (f : Nat → Nat) : packN W m f = ∑ o ∈ Finset.range m, f o * 2 ^ (W * o) := by
  simp only [packN, sumN_eq, raw_shiftLeft, raw_mul, Nat.shiftLeft_eq]

/-- Lane `o` of a packed vector whose entries fit is the entry. -/
theorem lane_packN (W m : Nat) (f : Nat → Nat) (hf : ∀ o < m, f o < 2 ^ W) (o : Nat) (ho : o < m) :
    lane (packN W m f) W o = f o := by
  rw [packN_eq, lane_eq]
  induction m generalizing o with
  | zero => omega
  | succ m ih =>
    rw [Finset.sum_range_succ]
    rcases Nat.lt_succ_iff_lt_or_eq.mp ho with h | h
    · -- the top term is a multiple of 2^(W*(o+1)), so it does not affect lane o
      have hsmall : (∑ i ∈ Finset.range m, f i * 2 ^ (W * i)) < 2 ^ (W * m) := by
        clear ih h ho
        induction m with
        | zero => simp
        | succ m ihm =>
          rw [Finset.sum_range_succ]
          have := ihm (fun i hi => hf i (by omega))
          have hm := hf m (by omega)
          calc (∑ i ∈ Finset.range m, f i * 2 ^ (W * i)) + f m * 2 ^ (W * m)
              < 2 ^ (W * m) + f m * 2 ^ (W * m) := by omega
            _ = (f m + 1) * 2 ^ (W * m) := by ring
            _ ≤ 2 ^ W * 2 ^ (W * m) := Nat.mul_le_mul_right _ hm
            _ = 2 ^ (W * (m + 1)) := by rw [← pow_add]; ring_nf
      have key : (f m * 2 ^ (W * m)) = (f m * 2 ^ (W * (m - o - 1))) * 2 ^ W * 2 ^ (W * o) := by
        rw [mul_assoc, mul_assoc, ← pow_add, ← pow_add]; congr 2
        have : m - o - 1 + 1 = m - o := by omega
        calc W * m = W * (m - o - 1) + W + W * o := by
              rw [← Nat.mul_add_one, ← Nat.mul_add, this, Nat.sub_add_cancel (by omega)]
          _ = W * (m - o - 1) + (W + W * o) := by ring
      rw [key, Nat.add_mul_div_right _ _ (Nat.two_pow_pos _), Nat.add_mul_mod_self_right]
      exact ih (fun i hi => hf i (by omega)) o h
    · subst h
      have hsmall : (∑ i ∈ Finset.range o, f i * 2 ^ (W * i)) < 2 ^ (W * o) := by
        clear ih ho
        induction o with
        | zero => simp
        | succ m ihm =>
          rw [Finset.sum_range_succ]
          have := ihm (fun i hi => hf i (by omega))
          have hm := hf m (by omega)
          calc (∑ i ∈ Finset.range m, f i * 2 ^ (W * i)) + f m * 2 ^ (W * m)
              < 2 ^ (W * m) + f m * 2 ^ (W * m) := by omega
            _ = (f m + 1) * 2 ^ (W * m) := by ring
            _ ≤ 2 ^ W * 2 ^ (W * m) := Nat.mul_le_mul_right _ hm
            _ = 2 ^ (W * (m + 1)) := by rw [← pow_add]; ring_nf
      rw [Nat.add_mul_div_right _ _ (Nat.two_pow_pos _), Nat.div_eq_of_lt hsmall, Nat.zero_add,
        Nat.mod_eq_of_lt (hf o (by omega))]

/-- Scaled sums of packed vectors are the packed scaled sums. -/
theorem sum_packN (W m n : Nat) (k : Nat → Nat) (v : Nat → Nat → Nat) :
    (∑ c ∈ Finset.range n, k c * packN W m (v c)) = packN W m (fun o => ∑ c ∈ Finset.range n, k c * v c o) := by
  simp only [packN_eq, Finset.mul_sum, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl; intro o _
  apply Finset.sum_congr rfl; intro c _
  ring

/-- One multiplication computes the packed outer product (row-major, `6 × 6` generalised to `m × m`). -/
theorem packN_mul (W m : Nat) (a b : Nat → Nat) :
    packN (m * W) m a * packN W m b = packN W (m * m) (fun t => a (t / m) * b (t % m)) := by
  rcases Nat.eq_zero_or_pos m with hm | hm
  · subst hm; simp [packN_eq]
  simp only [packN_eq, Finset.sum_mul, Finset.mul_sum]
  rw [← Finset.sum_product']
  rw [show m * m = m * m from rfl]
  refine (Finset.sum_nbij' (fun p => p.2 * m + p.1) (fun t => (t % m, t / m)) ?_ ?_ ?_ ?_ ?_)
  · intro p hp
    simp only [Finset.mem_product, Finset.mem_range] at hp ⊢
    nlinarith [hp.1, hp.2]
  · intro t ht
    simp only [Finset.mem_product, Finset.mem_range] at ht ⊢
    exact ⟨Nat.mod_lt _ hm, Nat.div_lt_of_lt_mul ht⟩
  · intro p hp
    simp only [Finset.mem_product, Finset.mem_range] at hp
    have h1 : (p.2 * m + p.1) / m = p.2 := by
      rw [Nat.add_comm, Nat.add_mul_div_right _ _ hm, Nat.div_eq_of_lt hp.1, Nat.zero_add]
    have h2 : (p.2 * m + p.1) % m = p.1 := by
      rw [Nat.add_comm, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hp.1]
    ext
    · simp [h2]
    · simp [h1]
  · intro t ht
    simp only
    rw [Nat.mul_comm]; exact Nat.div_add_mod t m
  · intro p hp
    simp only [Finset.mem_product, Finset.mem_range] at hp
    have h1 : (p.2 * m + p.1) / m = p.2 := by
      rw [Nat.add_comm, Nat.add_mul_div_right _ _ hm, Nat.div_eq_of_lt hp.1, Nat.zero_add]
    have h2 : (p.2 * m + p.1) % m = p.1 := by
      rw [Nat.add_comm, Nat.add_mul_mod_self_right, Nat.mod_eq_of_lt hp.1]
    rw [h1, h2, show W * (p.2 * m + p.1) = m * W * p.2 + W * p.1 by ring, pow_add]
    ring

/-- Mixed-radix reindexing of a range sum. -/
theorem sum_range_mul {M : Type*} [AddCommMonoid M] (a b : ℕ) (F : ℕ → M) :
    (∑ k ∈ Finset.range (a * b), F k) = ∑ i ∈ Finset.range a, ∑ j ∈ Finset.range b, F (i * b + j) := by
  induction a with
  | zero => simp
  | succ a ih => rw [Nat.succ_mul, Finset.sum_range_add, ih, Finset.sum_range_succ]

/-- Nested raw sums are a single range sum in mixed radix. -/
theorem sumN_nest (a b : ℕ) (F : ℕ → ℕ) :
    sumN a (fun i => sumN b (fun j => F (Nat.add (Nat.mul i b) j))) = sumN (a * b) F := by
  simp only [sumN_eq, raw_add, raw_mul]
  rw [sum_range_mul]

theorem mod_div_mod (q a b c : Nat) (h : b + c ≤ a) : q % 2 ^ a / 2 ^ b % 2 ^ c = q / 2 ^ b % 2 ^ c := by
  have hb : 0 < 2 ^ b := Nat.two_pow_pos b
  have e : 2 ^ a = 2 ^ b * (2 ^ c * 2 ^ (a - b - c)) := by
    rw [← pow_add, ← pow_add]; congr 1; omega
  conv_rhs => rw [← Nat.mod_add_div q (2 ^ a), e, Nat.mul_assoc, Nat.add_mul_div_left _ _ hb,
    Nat.mul_assoc, Nat.add_mul_mod_self_left]
  rw [e]

/-- A lane of a wide lane is a lane of the original number. -/
theorem lane_lane (d w k i j : Nat) (hj : j < k) : lane (lane d (w * k) i) w j = lane d w (k * i + j) := by
  rw [lane_eq, lane_eq, lane_eq, mod_div_mod _ _ _ _ (by nlinarith)]
  rw [Nat.div_div_eq_div_mul, ← pow_add]
  congr 2
  ring

end FKL
