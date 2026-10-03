module

public import FKL.Build

/-! Generic paired-fine role builder over abstract integer data, with its real value.

Dimensions: `nP` parent orbits, `nC` child orbits, `nCol` child columns, `nSec` pooled sectors.
Scales: parent masses `par o / 2^S`, child masses `m col o / 2^Sc`, split weights `w col / 2^44`,
pool masses `pool / 2^(Sc+44)`, role weight `cr / 2^TC`, coefficients at `2^(TC+S)`; requires `Sc + 44 ≤ S`.
The builder value is `(cr / 2^TC) · (parent orbit entropy − Σ isolated 2w/2^44 · OM(child) − Σ sectors OM(pool))`,
where `OM` is the orbit mass entropy `-Σ m log m + M log M + Σ m log size`. -/

@[expose] public section

namespace FKL

open scoped BigOperators

/-- Parent orbit entropy terms: `-(cr·p) log(p/2^S)` and `+(cr·p) log size`. -/
noncomputable def parentB (nP S : Nat) (par sz : Nat → Nat) (cr : Nat) (tail : List Raw) : List Raw :=
  loopL nP (fun o t => term S (par o) (Nat.mul cr (par o)) true
    (term S (Nat.shiftLeft (sz o) S) (Nat.mul cr (par o)) false t)) tail

/-- Isolated child columns: orbit mass entropy with weight `cr·2w`. -/
noncomputable def isoB (nC nCol S Sc : Nat) (w : Nat → Nat) (m : Nat → Nat → Nat) (iso : Nat → Bool) (sz : Nat → Nat)
    (cr : Nat) (tail : List Raw) : List Raw :=
  loopL nCol (fun col t => cond (iso col) (orbitMassB S nC (m col) sz (Nat.mul (Nat.mul cr 2) (w col))
    (S - Sc) (S - Sc - 44) t) t) tail

/-- Pooled numerator of sector `sec` at orbit `o`. -/
noncomputable def poolN (nCol : Nat) (w : Nat → Nat) (m : Nat → Nat → Nat) (inSec : Nat → Nat → Bool) (sec o : Nat) : Nat :=
  sumN nCol (fun col => cond (inSec sec col) (Nat.mul (Nat.mul 2 (w col)) (m col o)) 0)

/-- Pooled coordinate sectors: orbit mass entropy with weight `cr`. -/
noncomputable def poolsB (nC nSec S Sc : Nat) (pool : Nat → Nat → Nat)
    (sz : Nat → Nat) (cr : Nat) (tail : List Raw) : List Raw :=
  loopL nSec (fun sec t => orbitMassB S nC (pool sec) sz cr (S - Sc - 44) (S - Sc - 44) t) tail

/-- One complete physical role. -/
noncomputable def roleB (nP nC nCol nSec S Sc : Nat) (par sz3 : Nat → Nat) (w : Nat → Nat) (m : Nat → Nat → Nat)
    (iso : Nat → Bool) (pool : Nat → Nat → Nat) (sz2 : Nat → Nat) (cr : Nat) (tail : List Raw) : List Raw :=
  poolsB nC nSec S Sc pool sz2 cr (isoB nC nCol S Sc w m iso sz2 cr (parentB nP S par sz3 cr tail))

/-- Orbit mass entropy `-Σ a log a + A log A + Σ a log size` of real masses `a o`, `o < n`. -/
noncomputable def omReal (n : Nat) (a : Nat → ℝ) (sz : Nat → Nat) : ℝ :=
  -(∑ o ∈ Finset.range n, a o * Real.log (a o)) +
    (∑ o ∈ Finset.range n, a o) * Real.log (∑ o ∈ Finset.range n, a o) +
    ∑ o ∈ Finset.range n, a o * Real.log (sz o)

theorem orbitMassB_omReal (S T : Nat) (n : Nat) (get sz : Nat → Nat) (k ks ms : Nat) (tail : List Raw)
    (hks : ks ≤ S) :
    rawValue S T (orbitMassB S n get sz k ks ms tail) =
      -((k : ℝ) * 2 ^ ms * 2 ^ (S - ks) / 2 ^ T) *
        omReal n (fun o => (get o : ℝ) * 2 ^ ks / 2 ^ S) sz + rawValue S T tail := by
  rw [orbitMassB_value]
  congr 1
  have h2 : (2 : ℝ) ^ S = 2 ^ (S - ks) * 2 ^ ks := by rw [← pow_add, Nat.sub_add_cancel hks]
  have hne2 : (2 : ℝ) ^ ks ≠ 0 := pow_ne_zero _ two_ne_zero
  have hcpos : (2 : ℝ) ^ (S - ks) ≠ 0 := pow_ne_zero _ two_ne_zero
  have hscale : ∀ x : ℝ, x * 2 ^ ks / 2 ^ S = x * ((2 : ℝ) ^ (S - ks))⁻¹ := by
    intro x; rw [h2]; field_simp
  simp only [omReal, hscale]
  set c : ℝ := (2 : ℝ) ^ (S - ks) with hc
  have e1 : ∑ o ∈ Finset.range n, (get o : ℝ) * c⁻¹ * Real.log ((get o : ℝ) * c⁻¹) =
      c⁻¹ * ∑ o ∈ Finset.range n, (get o : ℝ) * Real.log ((get o : ℝ) * c⁻¹) := by
    rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro o _; ring
  have e2 : ∑ o ∈ Finset.range n, (get o : ℝ) * c⁻¹ = (∑ o ∈ Finset.range n, (get o : ℝ)) * c⁻¹ := by
    rw [Finset.sum_mul]
  have e3 : ∑ o ∈ Finset.range n, (get o : ℝ) * c⁻¹ * Real.log (sz o) =
      c⁻¹ * ∑ o ∈ Finset.range n, (get o : ℝ) * Real.log (sz o) := by
    rw [Finset.mul_sum]; apply Finset.sum_congr rfl; intro o _; ring
  rw [e1, e2, e3]
  have hcc : c * c⁻¹ = 1 := mul_inv_cancel₀ hcpos
  linear_combination (-(k : ℝ) * 2 ^ ms / 2 ^ T *
    (∑ o ∈ Finset.range n, (get o : ℝ) * Real.log ((get o : ℝ) * c⁻¹) -
      ∑ o ∈ Finset.range n, (get o : ℝ) * Real.log (sz o) -
      (∑ o ∈ Finset.range n, (get o : ℝ)) * Real.log ((∑ o ∈ Finset.range n, (get o : ℝ)) * c⁻¹))) * hcc

/-- Real value of the complete role builder, coefficients at scale `2^(TC+S)`. -/
theorem roleB_value (nP nC nCol nSec S Sc TC : Nat) (hS : Sc + 44 ≤ S) (par sz3 : Nat → Nat) (w : Nat → Nat)
    (m : Nat → Nat → Nat) (iso : Nat → Bool) (pool : Nat → Nat → Nat) (sz2 : Nat → Nat) (cr : Nat)
    (tail : List Raw) :
    rawValue S (TC + S) (roleB nP nC nCol nSec S Sc par sz3 w m iso pool sz2 cr tail) =
      (cr : ℝ) / 2 ^ TC *
        ((∑ o ∈ Finset.range nP, (-((par o : ℝ) / 2 ^ S * Real.log ((par o : ℝ) / 2 ^ S)) +
            (par o : ℝ) / 2 ^ S * Real.log (sz3 o))) -
         (∑ col ∈ Finset.range nCol, if iso col = true then
            2 * (w col : ℝ) / 2 ^ 44 * omReal nC (fun o => (m col o : ℝ) / 2 ^ Sc) sz2 else 0) -
         (∑ sec ∈ Finset.range nSec, omReal nC (fun o => (pool sec o : ℝ) / 2 ^ (Sc + 44)) sz2)) +
      rawValue S (TC + S) tail := by
  have pc : (2 : ℝ) ^ S = 2 ^ (S - Sc) * 2 ^ Sc := by rw [← pow_add]; congr 1; omega
  have pp : (2 : ℝ) ^ S = 2 ^ (S - Sc - 44) * 2 ^ (Sc + 44) := by rw [← pow_add]; congr 1; omega
  have hT : (2 : ℝ) ^ (TC + S) = 2 ^ TC * 2 ^ S := pow_add _ _ _
  have hTC : (2 : ℝ) ^ TC ≠ 0 := pow_ne_zero _ two_ne_zero
  have e1 : S - (S - Sc) = Sc := by omega
  have e2 : S - (S - Sc - 44) = Sc + 44 := by omega
  unfold roleB poolsB
  rw [rawValue_loopL S (TC + S) nSec _ (fun sec => -((cr : ℝ) / 2 ^ TC) *
      omReal nC (fun o => (pool sec o : ℝ) / 2 ^ (Sc + 44)) sz2)]
  · unfold isoB
    rw [rawValue_loopL S (TC + S) nCol _ (fun col => if iso col = true then -((cr : ℝ) / 2 ^ TC) *
        (2 * (w col : ℝ) / 2 ^ 44 * omReal nC (fun o => (m col o : ℝ) / 2 ^ Sc) sz2) else 0)]
    · unfold parentB
      rw [rawValue_loopL S (TC + S) nP _ (fun o => (cr : ℝ) / 2 ^ TC *
          (-((par o : ℝ) / 2 ^ S * Real.log ((par o : ℝ) / 2 ^ S)) + (par o : ℝ) / 2 ^ S * Real.log (sz3 o)))]
      · rw [mul_sub, mul_sub, Finset.mul_sum, Finset.mul_sum, Finset.mul_sum]
        have h1 : ∀ col ∈ Finset.range nCol, (if iso col = true then -((cr : ℝ) / 2 ^ TC) *
            (2 * (w col : ℝ) / 2 ^ 44 * omReal nC (fun o => (m col o : ℝ) / 2 ^ Sc) sz2) else 0) =
            -((cr : ℝ) / 2 ^ TC * (if iso col = true then
              2 * (w col : ℝ) / 2 ^ 44 * omReal nC (fun o => (m col o : ℝ) / 2 ^ Sc) sz2 else 0)) := by
          intro col _; split_ifs <;> ring
        have h2 : ∀ sec ∈ Finset.range nSec, -((cr : ℝ) / 2 ^ TC) *
            omReal nC (fun o => (pool sec o : ℝ) / 2 ^ (Sc + 44)) sz2 =
            -((cr : ℝ) / 2 ^ TC * omReal nC (fun o => (pool sec o : ℝ) / 2 ^ (Sc + 44)) sz2) := by
          intro sec _; ring
        rw [Finset.sum_congr rfl h1, Finset.sum_neg_distrib, Finset.sum_congr rfl h2, Finset.sum_neg_distrib]
        ring
      · intro o _ t
        rw [rawValue_term, rawValue_term, Raw.value_neg, Raw.value_pos]
        simp only [raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat]
        rw [hT, mul_div_assoc (sz3 o : ℝ), div_self (pow_ne_zero _ two_ne_zero), mul_one]
        field_simp
        all_goals ring
    · intro col _ t
      cases h : iso col
      · simp
      · simp only [cond_true, if_true]
        rw [orbitMassB_omReal S (TC + S) nC (m col) sz2 _ (S - Sc) (S - Sc - 44) t (by omega)]
        congr 1
        have hm : (fun o => (m col o : ℝ) * 2 ^ (S - Sc) / 2 ^ S) = (fun o => (m col o : ℝ) / 2 ^ Sc) := by
          funext o; rw [pc]; field_simp
        rw [hm, hT, e1]
        simp only [raw_mul, Nat.cast_mul, Nat.cast_ofNat]
        have q : (2 : ℝ) ^ (S - Sc - 44) * 2 ^ Sc * 2 ^ 44 = 2 ^ S := by
          rw [← pow_add, ← pow_add]; congr 1; omega
        field_simp
        rw [← q]
        ring
  · intro sec _ t
    rw [orbitMassB_omReal S (TC + S) nC _ sz2 cr (S - Sc - 44) (S - Sc - 44) t (by omega)]
    congr 1
    have hm : (fun o => (pool sec o : ℝ) * 2 ^ (S - Sc - 44) / 2 ^ S) =
        (fun o => (pool sec o : ℝ) / 2 ^ (Sc + 44)) := by
      funext o; rw [pp]; field_simp
    rw [hm, hT, e2]
    have q : (2 : ℝ) ^ (S - Sc - 44) * 2 ^ (Sc + 44) = 2 ^ S := by
      rw [← pow_add]; congr 1; omega
    field_simp
    rw [← q]
    ring

end FKL
