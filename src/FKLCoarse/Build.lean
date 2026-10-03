module

public import FKL.Build
public import FKLCoarse.Hash

/-! Generic raw builder of the six physical roles of one paired coarse source, with its real value.

Data of one source (all natural numbers): column masses `a c / 2^44` (`c < nC`), column coordinates
`sh b c` (axis `b < 3`), admissible columns `fit c`, Gibbs potentials `un b v / 2^(up b v)` (`v < nV`),
role weights `cr r / 2^TC` (`r < 6`) and the role's marginal-entropy axis `ax0 r`.

The six role expressions differ only in their marginal-entropy axis, so the builder emits the
common part once with the total weight `Σ cr r` and the marginal entropies with the per-axis weights. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCoarse

open FKL
open scoped BigOperators

/-- Marginal numerator of the coordinate value `v` on axis `b`. -/
noncomputable def marg (nC : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (b v : ℕ) : ℕ :=
  sumN nC (fun c => cond (Nat.beq (sh b c) v) (a c) 0)

/-- Gibbs normalizer numerator at scale `2^S`. -/
noncomputable def zKey (S nC : ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) : ℕ :=
  sumN nC (fun c => cond (fit c)
    (Nat.shiftLeft (Nat.mul (Nat.mul (un 0 (sh 0 c)) (un 1 (sh 1 c))) (un 2 (sh 2 c)))
      (Nat.sub S (Nat.add (Nat.add (up 0 (sh 0 c)) (up 1 (sh 1 c))) (up 2 (sh 2 c))))) 0)

/-- Total role weight. -/
noncomputable def wTot (cr : ℕ → ℕ) : ℕ := sumN 6 cr

/-- Weight of the roles whose marginal-entropy axis is `b`. -/
noncomputable def wAx (cr ax0 : ℕ → ℕ) (b : ℕ) : ℕ := sumN 6 (fun r => cond (Nat.beq (ax0 r) b) (cr r) 0)

/-- All raw terms of one source (six roles), consed onto `tail`. -/
noncomputable def srcB (S ms nC nV : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ)
    (cr ax0 : ℕ → ℕ) (tail : List Raw) : List Raw :=
  loopL 3 (fun b t => loopL nV (fun v t => term S (Nat.shiftLeft (marg nC a sh b v) (Nat.sub S 44))
      (Nat.shiftLeft (Nat.mul (wAx cr ax0 b) (marg nC a sh b v)) ms) true t) t)
  (loopL nC (fun c t => term S (Nat.shiftLeft (a c) (Nat.sub S 44)) (Nat.shiftLeft (Nat.mul (wTot cr) (a c)) ms) true t)
  (term S (zKey S nC sh fit un up) (Nat.shiftLeft (wTot cr) (Nat.add 44 ms)) true
  (loopL 3 (fun b t => loopL nV (fun v t => term S (Nat.shiftLeft (un b v) (Nat.sub S (up b v)))
      (Nat.shiftLeft (Nat.mul (wTot cr) (marg nC a sh b v)) ms) false t) t) tail)))

/-- Exactness test of the potential and normalizer keys of one source. -/
noncomputable def okSrc (S nC nV : ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (up : ℕ → ℕ → ℕ) : Bool :=
  Bool.and (allN 3 (fun b => allN nV (fun v => Nat.ble (up b v) S)))
    (allN nC (fun c => cond (fit c) (Nat.ble (Nat.add (Nat.add (up 0 (sh 0 c)) (up 1 (sh 1 c))) (up 2 (sh 2 c))) S) true))

/-! ### Real values -/

/-- Real marginal mass. -/
noncomputable def xm (nC : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (b v : ℕ) : ℝ := (marg nC a sh b v : ℝ) / 2 ^ 44

/-- Real Gibbs potential. -/
noncomputable def uR (un up : ℕ → ℕ → ℕ) (b v : ℕ) : ℝ := (un b v : ℝ) / 2 ^ up b v

/-- Real Gibbs normalizer. -/
noncomputable def zR (nC : ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) : ℝ :=
  ∑ c ∈ Finset.range nC, if fit c = true then uR un up 0 (sh 0 c) * uR un up 1 (sh 1 c) * uR un up 2 (sh 2 c) else 0

/-- Entropy of the marginal on axis `b`. -/
noncomputable def margEnt (nC nV : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (b : ℕ) : ℝ :=
  -∑ v ∈ Finset.range nV, xm nC a sh b v * Real.log (xm nC a sh b v)

/-- The role-independent part of the coarse expression. -/
noncomputable def common (nC nV : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) : ℝ :=
  -(∑ c ∈ Finset.range nC, (a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44)) - Real.log (zR nC sh fit un up) +
    ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range nV, xm nC a sh b v * Real.log (uR un up b v)

/-- Value of one complete role expression with marginal-entropy axis `b0`. -/
noncomputable def CR (nC nV : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ) (b0 : ℕ) : ℝ :=
  margEnt nC nV a sh b0 + common nC nV a sh fit un up

theorem cond_eq_ite {α : Type*} (b : Bool) (x y : α) : cond b x y = if b = true then x else y := by
  cases b <;> rfl

theorem cond_beq_ite {α : Type*} (a b : ℕ) (x y : α) : cond (Nat.beq a b) x y = if a = b then x else y := by
  by_cases h : a = b
  · subst h; have : Nat.beq a a = true := Nat.beq_eq.mpr rfl
    simp [this]
  · have : Nat.beq a b = false := by
      cases hb : Nat.beq a b
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true hb) h
    simp [this, h]

theorem sum_div' {ι : Type*} (s : Finset ι) (f : ι → ℝ) (d : ℝ) : (∑ i ∈ s, f i) / d = ∑ i ∈ s, f i / d := by
  simp only [div_eq_mul_inv, Finset.sum_mul]

theorem key_shift (x k S : ℕ) (hk : k ≤ S) :
    ((Nat.shiftLeft x (Nat.sub S k) : ℕ) : ℝ) / 2 ^ S = (x : ℝ) / 2 ^ k := by
  rw [raw_sub, raw_shiftLeft, Nat.shiftLeft_eq]
  push_cast
  rw [show (2 : ℝ) ^ S = 2 ^ (S - k) * 2 ^ k by rw [← pow_add, Nat.sub_add_cancel hk]]
  field_simp

theorem mag_shift (m ms TC k : ℕ) :
    ((Nat.shiftLeft m ms : ℕ) : ℝ) / 2 ^ (TC + k + ms) = (m : ℝ) / 2 ^ TC / 2 ^ k := by
  rw [raw_shiftLeft, Nat.shiftLeft_eq]
  push_cast
  rw [pow_add, pow_add]
  field_simp

theorem value_neg (S T key mag : ℕ) :
    Raw.value S T ⟨key, mag, true⟩ = -((mag : ℝ) / 2 ^ T * Real.log ((key : ℝ) / 2 ^ S)) := Raw.value_neg S T key mag

theorem value_pos (S T key mag : ℕ) :
    Raw.value S T ⟨key, mag, false⟩ = (mag : ℝ) / 2 ^ T * Real.log ((key : ℝ) / 2 ^ S) := Raw.value_pos S T key mag

theorem marg_cast (nC : ℕ) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (b v : ℕ) :
    (marg nC a sh b v : ℝ) = ∑ c ∈ Finset.range nC, if sh b c = v then (a c : ℝ) else 0 := by
  unfold marg
  rw [sumN_eq]
  push_cast
  apply Finset.sum_congr rfl
  intro c _
  rw [cond_beq_ite]
  split_ifs <;> simp

theorem zKey_value (S nC : ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool) (un up : ℕ → ℕ → ℕ)
    (hz : ∀ c < nC, fit c = true → up 0 (sh 0 c) + up 1 (sh 1 c) + up 2 (sh 2 c) ≤ S) :
    (zKey S nC sh fit un up : ℝ) / 2 ^ S = zR nC sh fit un up := by
  unfold zKey zR
  rw [sumN_eq, Nat.cast_sum, sum_div']
  apply Finset.sum_congr rfl
  intro c hc
  rw [cond_eq_ite]
  by_cases hf : fit c = true
  · rw [if_pos hf, if_pos hf]
    have h := hz c (Finset.mem_range.mp hc) hf
    rw [show Nat.add (Nat.add (up 0 (sh 0 c)) (up 1 (sh 1 c))) (up 2 (sh 2 c)) =
      up 0 (sh 0 c) + up 1 (sh 1 c) + up 2 (sh 2 c) from rfl]
    rw [key_shift _ _ S h]
    simp only [uR, raw_mul]
    push_cast
    rw [pow_add, pow_add]
    field_simp
  · rw [if_neg hf, if_neg hf]; simp

theorem wTot_cast (cr : ℕ → ℕ) : (wTot cr : ℝ) = ∑ r ∈ Finset.range 6, (cr r : ℝ) := by
  unfold wTot; rw [sumN_eq]; push_cast; rfl

theorem wAx_sum (cr ax0 : ℕ → ℕ) (hax : ∀ r < 6, ax0 r < 3) (F : ℕ → ℝ) :
    ∑ b ∈ Finset.range 3, (wAx cr ax0 b : ℝ) * F b = ∑ r ∈ Finset.range 6, (cr r : ℝ) * F (ax0 r) := by
  have e : ∀ b, (wAx cr ax0 b : ℝ) = ∑ r ∈ Finset.range 6, if ax0 r = b then (cr r : ℝ) else 0 := by
    intro b
    unfold wAx; rw [sumN_eq]; push_cast
    apply Finset.sum_congr rfl
    intro r _
    rw [cond_beq_ite]
    split_ifs <;> simp
  simp only [e, Finset.sum_mul]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro r hr
  have h3 : ax0 r ∈ Finset.range 3 := Finset.mem_range.mpr (hax r (Finset.mem_range.mp hr))
  simp only [ite_mul, zero_mul]
  rw [Finset.sum_ite_eq (Finset.range 3) (ax0 r) (fun b => (cr r : ℝ) * F b), if_pos h3]

theorem rawValue_loop_term (S T n : ℕ) (key mag : ℕ → ℕ) (neg : Bool) (V : ℕ → ℝ)
    (h : ∀ i < n, Raw.value S T ⟨key i, mag i, neg⟩ = V i) (tail : List Raw) :
    rawValue S T (loopL n (fun i t => term S (key i) (mag i) neg t) tail) =
      (∑ i ∈ Finset.range n, V i) + rawValue S T tail :=
  rawValue_loopL S T n _ V (fun i hi t => by rw [rawValue_term, h i hi]) tail

theorem rawValue_loop2_term (S T n m : ℕ) (key mag : ℕ → ℕ → ℕ) (neg : Bool) (V : ℕ → ℕ → ℝ)
    (h : ∀ i < n, ∀ j < m, Raw.value S T ⟨key i j, mag i j, neg⟩ = V i j) (tail : List Raw) :
    rawValue S T (loopL n (fun i t => loopL m (fun j t => term S (key i j) (mag i j) neg t) t) tail) =
      (∑ i ∈ Finset.range n, ∑ j ∈ Finset.range m, V i j) + rawValue S T tail :=
  rawValue_loopL S T n _ (fun i => ∑ j ∈ Finset.range m, V i j)
    (fun i hi t => rawValue_loop_term S T m (key i) (mag i) neg (V i) (fun j hj => h i hi j hj) t) tail

/-- Real value of the six-role source builder at coefficient scale `2^(TC + 44 + ms)`. -/
theorem srcB_value (S TC ms nC nV : ℕ) (hS : 44 ≤ S) (a : ℕ → ℕ) (sh : ℕ → ℕ → ℕ) (fit : ℕ → Bool)
    (un up : ℕ → ℕ → ℕ) (cr ax0 : ℕ → ℕ) (hok : okSrc S nC nV sh fit up = true)
    (hax : ∀ r < 6, ax0 r < 3) (tail : List Raw) :
    rawValue S (TC + 44 + ms) (srcB S ms nC nV a sh fit un up cr ax0 tail) =
      (∑ r ∈ Finset.range 6, (cr r : ℝ) / 2 ^ TC * CR nC nV a sh fit un up (ax0 r)) +
        rawValue S (TC + 44 + ms) tail := by
  simp only [okSrc, Bool.and_eq_true] at hok
  obtain ⟨hup0, hz0⟩ := hok
  have hup : ∀ b < 3, ∀ v < nV, up b v ≤ S := by
    intro b hb v hv
    have := allN_sound _ _ (allN_sound _ 3 hup0 b hb) v hv
    simpa [Nat.ble_eq] using this
  have hz : ∀ c < nC, fit c = true → up 0 (sh 0 c) + up 1 (sh 1 c) + up 2 (sh 2 c) ≤ S := by
    intro c hc hf
    have := allN_sound _ nC hz0 c hc
    rw [hf] at this
    simpa [Nat.ble_eq] using this
  unfold srcB
  rw [rawValue_loop2_term S (TC + 44 + ms) 3 nV (fun b v => Nat.shiftLeft (marg nC a sh b v) (Nat.sub S 44))
      (fun b v => Nat.shiftLeft (Nat.mul (wAx cr ax0 b) (marg nC a sh b v)) ms) true
      (fun b v => -((wAx cr ax0 b : ℝ) / 2 ^ TC * (xm nC a sh b v * Real.log (xm nC a sh b v))))
      (fun b _ v _ => by
        rw [value_neg, key_shift _ _ S hS, mag_shift]
        simp only [raw_mul, Nat.cast_mul, xm]
        ring)]
  rw [rawValue_loop_term S (TC + 44 + ms) nC (fun c => Nat.shiftLeft (a c) (Nat.sub S 44))
      (fun c => Nat.shiftLeft (Nat.mul (wTot cr) (a c)) ms) true
      (fun c => -((wTot cr : ℝ) / 2 ^ TC * ((a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44))))
      (fun c _ => by
        rw [value_neg, key_shift _ _ S hS, mag_shift]
        simp only [raw_mul, Nat.cast_mul]
        ring)]
  rw [rawValue_term, value_neg, zKey_value S nC sh fit un up hz]
  rw [rawValue_loop2_term S (TC + 44 + ms) 3 nV (fun b v => Nat.shiftLeft (un b v) (Nat.sub S (up b v)))
      (fun b v => Nat.shiftLeft (Nat.mul (wTot cr) (marg nC a sh b v)) ms) false
      (fun b v => (wTot cr : ℝ) / 2 ^ TC * (xm nC a sh b v * Real.log (uR un up b v)))
      (fun b hb v hv => by
        rw [value_pos, key_shift _ _ S (hup b hb v hv), mag_shift]
        simp only [raw_mul, Nat.cast_mul, xm, uR]
        ring)]
  have hzmag : ((Nat.shiftLeft (wTot cr) (Nat.add 44 ms) : ℕ) : ℝ) / 2 ^ (TC + 44 + ms) = (wTot cr : ℝ) / 2 ^ TC := by
    rw [raw_shiftLeft, Nat.shiftLeft_eq, show Nat.add 44 ms = 44 + ms from rfl]
    push_cast
    rw [pow_add, pow_add, pow_add]
    field_simp
  rw [hzmag]
  have hA : ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range nV,
      -((wAx cr ax0 b : ℝ) / 2 ^ TC * (xm nC a sh b v * Real.log (xm nC a sh b v))) =
      ∑ b ∈ Finset.range 3, (wAx cr ax0 b : ℝ) * (margEnt nC nV a sh b / 2 ^ TC) := by
    apply Finset.sum_congr rfl
    intro b _
    unfold margEnt
    rw [neg_div, mul_neg, sum_div', Finset.mul_sum, ← Finset.sum_neg_distrib]
    apply Finset.sum_congr rfl
    intro v _
    ring
  rw [hA, wAx_sum cr ax0 hax (fun b => margEnt nC nV a sh b / 2 ^ TC)]
  have key : ∑ r ∈ Finset.range 6, (cr r : ℝ) / 2 ^ TC * CR nC nV a sh fit un up (ax0 r) =
      ∑ r ∈ Finset.range 6, (cr r : ℝ) * (margEnt nC nV a sh (ax0 r) / 2 ^ TC) +
        (wTot cr : ℝ) / 2 ^ TC * common nC nV a sh fit un up := by
    rw [wTot_cast, sum_div', Finset.sum_mul, ← Finset.sum_add_distrib]
    apply Finset.sum_congr rfl
    intro r _
    unfold CR
    ring
  rw [key]
  unfold common
  have e1 : ∑ c ∈ Finset.range nC, -((wTot cr : ℝ) / 2 ^ TC * ((a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44))) =
      (wTot cr : ℝ) / 2 ^ TC * -(∑ c ∈ Finset.range nC, (a c : ℝ) / 2 ^ 44 * Real.log ((a c : ℝ) / 2 ^ 44)) := by
    rw [Finset.sum_neg_distrib, mul_neg, Finset.mul_sum]
  have e2 : ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range nV, (wTot cr : ℝ) / 2 ^ TC * (xm nC a sh b v * Real.log (uR un up b v)) =
      (wTot cr : ℝ) / 2 ^ TC * ∑ b ∈ Finset.range 3, ∑ v ∈ Finset.range nV, xm nC a sh b v * Real.log (uR un up b v) := by
    rw [Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro b _
    rw [Finset.mul_sum]
  rw [e1, e2]
  ring

end MatrixBounds.Numeric.FKLCoarse
