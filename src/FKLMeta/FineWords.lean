module

public import FKLMeta.Walk
public import FKL.Lane
public import FineWordOrbits
public import FKLBridge.Rows

/-! Index arithmetic of complete fine words (`fineWordColumns`) and their halves, the raw unordered pair
code of `PairEncoding`s, and links from literal arrays to packed lanes. -/

@[expose] public section

namespace FKLMeta.FineWords

open MatrixBounds.Entropy MatrixBounds.Tensor.CW

theorem fwc_val (n : ℕ) (i : Fin (3 ^ n)) (p : Fin n) :
    (fineWordColumns n i p).val = i.val / 3 ^ (n - 1 - p.val) % 3 := by
  simp only [fineWordColumns, reverseFineWord, Equiv.trans_apply, Equiv.coe_fn_mk,
    finFunctionFinEquiv_symm_apply_val, Fin.val_rev]
  congr 3
  omega

theorem fwc_left (n : ℕ) (i : Fin (3 ^ (n + n))) :
    leftHalf (fineWordColumns (n + n) i) =
      fineWordColumns n ⟨i.val / 3 ^ n, Nat.div_lt_of_lt_mul (by rw [← pow_add]; exact i.isLt)⟩ := by
  funext p
  apply Fin.ext
  simp only [leftHalf]
  rw [fwc_val, fwc_val, Fin.val_castAdd, Nat.div_div_eq_div_mul, ← pow_add]
  congr 3
  have := p.isLt
  omega

theorem fwc_right (n : ℕ) (i : Fin (3 ^ (n + n))) :
    rightHalf (fineWordColumns (n + n) i) =
      fineWordColumns n ⟨i.val % 3 ^ n, Nat.mod_lt _ (Nat.pow_pos (by norm_num))⟩ := by
  funext p
  apply Fin.ext
  simp only [rightHalf]
  rw [fwc_val, fwc_val, Fin.val_natAdd]
  have hp := p.isLt
  have e : n + n - 1 - (n + p.val) = n - 1 - p.val := by omega
  rw [e]
  have hsplit : 3 ^ n = 3 ^ (n - 1 - p.val) * 3 ^ (p.val + 1) := by rw [← pow_add]; congr 1; omega
  show _ = i.val % 3 ^ n / 3 ^ (n - 1 - p.val) % 3
  rw [hsplit, Nat.mod_mul_right_div_self, Nat.mod_mod_of_dvd _ (dvd_pow_self 3 (by omega))]

/-- Raw unordered pair code `(lo*k - lo*(lo+1)/2 + hi) % P`. -/
def rawCode (k a b P : ℕ) : ℕ :=
  Nat.mod (Nat.add (Nat.sub (Nat.mul (cond (Nat.ble a b) a b) k)
    (Nat.div (Nat.mul (cond (Nat.ble a b) a b) (Nat.add (cond (Nat.ble a b) a b) 1)) 2)) (cond (Nat.ble a b) b a)) P

theorem rawCode_eq (k a b P : ℕ) :
    rawCode k a b P = (min a b * k - min a b * (min a b + 1) / 2 + max a b) % P := by
  unfold rawCode
  by_cases h : a ≤ b
  · rw [show Nat.ble a b = true from Nat.ble_eq.mpr h, cond_true, cond_true, Nat.min_eq_left h, Nat.max_eq_right h]; rfl
  · rw [show Nat.ble a b = false from Bool.eq_false_iff.mpr (fun e => h (Nat.ble_eq.mp e)), cond_false, cond_false,
      Nat.min_eq_right (by omega), Nat.max_eq_left (by omega)]; rfl

/-- A literal array equals packed lanes `L` (width `w`) from offset `o`. -/
theorem arr_get (arr : Array ℕ) (L w o n : ℕ)
    (h : FKLMeta.walk (fun i v => Nat.beq v (FKL.lane L w i)) arr.toList o = true) (hlen : arr.toList.length = n)
    (j : ℕ) (hj : j < n) : arr[j]?.getD 0 = FKL.lane L w (o + j) := by
  have hj' : j < arr.toList.length := by rw [hlen]; exact hj
  have e := Nat.eq_of_beq_eq_true (FKLMeta.walk_sound _ _ o h j hj')
  rw [← Array.getElem?_toList, List.getElem?_eq_getElem hj', Option.getD_some, e]

theorem arr_get' (arr : Array ℕ) (L w : ℕ)
    (h : FKLMeta.walk (fun i v => Nat.beq v (FKL.lane L w i)) arr.toList 0 = true)
    (j : ℕ) (hj : j < arr.size) : arr[j] = FKL.lane L w j := by
  have hj' : j < arr.toList.length := by rw [Array.length_toList]; exact hj
  have e := Nat.eq_of_beq_eq_true (FKLMeta.walk_sound _ _ 0 h j hj')
  rw [Nat.zero_add] at e
  rw [← Array.getElem_toList hj', e]

/-- Raw natural-number sum `f 0 + … + f (n-1)`. -/
def sumN (n : ℕ) (f : ℕ → ℕ) : ℕ :=
  Nat.rec (motive := fun _ => ℕ) 0 (fun i acc => Nat.add acc (f i)) n

theorem sumN_eq (n : ℕ) (f : ℕ → ℕ) : sumN n f = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => rfl
  | succ n ih => rw [Finset.sum_range_succ, ← ih]; rfl

/-- Lane `o` of `Σ_p v p · 2^(L·code p)` is the mass of the fiber over `o`, when the total mass is below `2^L`. -/
theorem lane_fibers {P : Type} [Fintype P] {N : ℕ} (code : P → Fin N) (v : P → ℕ) (L : ℕ)
    (hb : ∑ p, v p < 2 ^ L) (o : Fin N) :
    FKL.lane (∑ p, v p * 2 ^ (L * (code p).val)) L o.val = ∑ p, if code p = o then v p else 0 := by
  classical
  let F : ℕ → ℕ := fun j => ∑ p, if (code p).val = j then v p else 0
  have h1 : ∑ p, v p * 2 ^ (L * (code p).val) = ∑ j ∈ Finset.range N, F j * 2 ^ (L * j) := by
    simp only [F, Finset.sum_mul]
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro p _
    simp only [ite_mul, zero_mul]
    rw [Finset.sum_ite_eq (Finset.range N) (code p).val (fun j => v p * 2 ^ (L * j))]
    simp [(code p).isLt]
  have hF : ∀ j, F j < 2 ^ L := by
    intro j
    refine lt_of_le_of_lt (Finset.sum_le_sum (fun p _ => ?_)) hb
    split_ifs <;> omega
  rw [h1, FKLBridge.Rows.lane_sum L N F hF o.val o.isLt]
  apply Finset.sum_congr rfl
  intro p _
  simp only [Fin.ext_iff]

theorem div_256 (k i : ℕ) (h1 : 256 * k ≤ i) (h2 : i < 256 * k + 256) : i / 256 = k := by omega

theorem mod_256 (k i : ℕ) (h1 : 256 * k ≤ i) (h2 : i < 256 * k + 256) : i % 256 = i - 256 * k := by omega

end FKLMeta.FineWords
