module

public import SuppliedDimensionSourceExpressions
public import FKL.Build
public import FKLDim.WZCore

/-! Raw builders of weighted zero-coordinate dimension expressions and terminal volume terms,
with their exact real values. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLDim

open FKL SuppliedDimensionRates
open scoped BigOperators

/-- Weighted zero-coordinate dimension terms of one source: orbit numerators `num o` at denominator
`2^44`, orbit sizes `sz o`, middle counts `mid o`, population numerator `pop`. Argument keys
`num o <<< ks`, `sz o <<< S`, `5 <<< S`; magnitudes `(pop * num o) <<< ms`. Skipped when `pop = 0`. -/
noncomputable def zdimB (S n : Nat) (num sz mid : Nat → Nat) (pop ks ms : Nat) (tail : List Raw) : List Raw :=
  cond (Nat.beq pop 0) tail
    (term S (Nat.shiftLeft 5 S) (Nat.shiftLeft (Nat.mul pop (sumN n (fun o => Nat.mul (num o) (mid o)))) ms) false
      (loopL n (fun o t => term S (Nat.shiftLeft (num o) ks) (Nat.shiftLeft (Nat.mul pop (num o)) ms) true
        (term S (Nat.shiftLeft (sz o) S) (Nat.shiftLeft (Nat.mul pop (num o)) ms) false t)) tail))

/-- Weighted terminal volume term `pop/2^W · (2 - 2 mu/2^44) · log 5`. Skipped when `pop = 0`. -/
noncomputable def tdimB (S : Nat) (pop mu ms : Nat) (tail : List Raw) : List Raw :=
  cond (Nat.beq pop 0) tail
    (term S (Nat.shiftLeft 5 S) (Nat.shiftLeft (Nat.mul pop (Nat.sub 35184372088832 (Nat.mul 2 mu))) ms) false tail)

theorem cast_shl (a b : ℕ) : ((Nat.shiftLeft a b : ℕ) : ℝ) = (a : ℝ) * 2 ^ b := by
  rw [raw_shiftLeft, Nat.shiftLeft_eq]; push_cast; ring

theorem cast_rmul (a b : ℕ) : ((Nat.mul a b : ℕ) : ℝ) = (a : ℝ) * b := by
  rw [raw_mul]; push_cast; ring

theorem zeroDim_value {n : ℕ} (mass : Fin n → ℚ) (sizes middle : Fin n → ℕ) :
    rationalLogValue (zeroDimensionExpression 5 mass sizes middle) =
      (∑ o : Fin n, (-((mass o : ℝ) * Real.log (mass o)) + (mass o : ℝ) * Real.log (sizes o))) +
        (∑ o : Fin n, (mass o : ℝ) * (middle o : ℝ)) * Real.log 5 := by
  simp only [zeroDimensionExpression, orbitEntropyExpression, rationalLogValue_append,
    entropyLogExpression_value, orbitCorrectionExpression_value, logAtom_value, Entropy.entropy,
    Rat.cast_sum, Rat.cast_mul, Rat.cast_natCast, Finset.sum_add_distrib, Finset.sum_neg_distrib]
  push_cast
  ring

/-- Real value of the zero-dimension builder in range-sum form. -/
theorem zdimB_real (S T n : Nat) (num sz mid : Nat → Nat) (pop ks ms W : Nat)
    (hks : ks + 44 = S) (hms : ms + W + 44 = T) (tail : List Raw) :
    rawValue S T (zdimB S n num sz mid pop ks ms tail) =
      (pop : ℝ) / 2 ^ W * ((∑ o ∈ Finset.range n, (-((num o : ℝ) / 2 ^ 44 * Real.log ((num o : ℝ) / 2 ^ 44)) +
          (num o : ℝ) / 2 ^ 44 * Real.log (sz o))) +
        (∑ o ∈ Finset.range n, (num o : ℝ) / 2 ^ 44 * (mid o : ℝ)) * Real.log 5) + rawValue S T tail := by
  have hS : (2 : ℝ) ^ S = 2 ^ ks * 2 ^ 44 := by rw [← hks, pow_add]
  have hT : (2 : ℝ) ^ T = 2 ^ ms * 2 ^ W * 2 ^ 44 := by rw [← hms, pow_add, pow_add]
  have hkey : ∀ a : ℕ, ((Nat.shiftLeft a ks : ℕ) : ℝ) / 2 ^ S = (a : ℝ) / 2 ^ 44 := by
    intro a; rw [cast_shl, hS]; field_simp
  have hkey2 : ∀ a : ℕ, ((Nat.shiftLeft a S : ℕ) : ℝ) / 2 ^ S = (a : ℝ) := by
    intro a; rw [cast_shl]; field_simp
  have hmag : ∀ x : ℕ, ((Nat.shiftLeft x ms : ℕ) : ℝ) / 2 ^ T = (x : ℝ) / 2 ^ W / 2 ^ 44 := by
    intro x; rw [cast_shl, hT]; field_simp
  unfold zdimB
  by_cases hp : pop = 0
  · subst hp
    have : Nat.beq 0 0 = true := rfl
    rw [this, Bool.cond_true]; simp
  · rw [nbeq_false_of_ne hp, Bool.cond_false, rawValue_term,
      rawValue_loopL S T n _ (fun o => ((pop : ℝ) / 2 ^ W) *
        (-((num o : ℝ) / 2 ^ 44 * Real.log ((num o : ℝ) / 2 ^ 44)) + (num o : ℝ) / 2 ^ 44 * Real.log (sz o)))]
    · rw [Raw.value_pos, hmag, hkey2, cast_rmul, sumN_eq, Nat.cast_sum]
      simp only [cast_rmul]
      have hsum : (∑ o ∈ Finset.range n, (num o : ℝ) / 2 ^ 44 * (mid o : ℝ)) =
          (∑ o ∈ Finset.range n, (num o : ℝ) * (mid o : ℝ)) / 2 ^ 44 := by
        rw [Finset.sum_div]; apply Finset.sum_congr rfl; intro o _; ring
      rw [hsum, ← Finset.mul_sum]
      push_cast
      ring
    · intro o _ t
      rw [rawValue_term, rawValue_term, Raw.value_neg, Raw.value_pos, hmag, hkey, hkey2, cast_rmul]
      ring

theorem zdimB_value (S T n : Nat) (num sz mid : Nat → Nat) (pop ks ms W : Nat)
    (hks : ks + 44 = S) (hms : ms + W + 44 = T)
    (mass : Fin n → ℚ) (hmass : ∀ o : Fin n, mass o = (num o : ℚ) / 2 ^ 44)
    (sizes middle : Fin n → ℕ) (hsz : ∀ o : Fin n, sz o = sizes o) (hmid : ∀ o : Fin n, mid o = middle o)
    (w : ℚ) (hw : w = (pop : ℚ) / 2 ^ W) (tail : List Raw) :
    rawValue S T (zdimB S n num sz mid pop ks ms tail) =
      rationalLogValue (weightedExpression w (zeroDimensionExpression 5 mass sizes middle)) +
        rawValue S T tail := by
  rw [weightedExpression_value, zeroDim_value, zdimB_real S T n num sz mid pop ks ms W hks hms tail]
  have hm : ∀ o : Fin n, (mass o : ℝ) = (num o : ℝ) / 2 ^ 44 := by
    intro o; rw [hmass o]; push_cast; ring
  have hwR : (w : ℝ) = (pop : ℝ) / 2 ^ W := by rw [hw]; push_cast; ring
  simp only [hm, ← hsz, ← hmid, hwR]
  rw [Finset.sum_range (fun o => -((num o : ℝ) / 2 ^ 44 * Real.log ((num o : ℝ) / 2 ^ 44)) +
      (num o : ℝ) / 2 ^ 44 * Real.log (sz o)),
    Finset.sum_range (fun o => (num o : ℝ) / 2 ^ 44 * (mid o : ℝ))]

theorem tdimB_value (S T : Nat) (pop mu ms W : Nat) (hS : 44 ≤ S) (hms : ms + W + 44 = T)
    (hmu : 2 * mu ≤ 35184372088832) (w : ℚ) (hw : w = (pop : ℚ) / 2 ^ W)
    (muq : ℚ) (hmuq : muq = (mu : ℚ) / 2 ^ 44) (tail : List Raw) :
    rawValue S T (tdimB S pop mu ms tail) =
      rationalLogValue (weightedExpression w (logAtom 5 (2 - 2 * muq))) + rawValue S T tail := by
  rw [weightedExpression_value, logAtom_value]
  have hT : (2 : ℝ) ^ T = 2 ^ ms * 2 ^ W * 2 ^ 44 := by rw [← hms, pow_add, pow_add]
  unfold tdimB
  by_cases hp : pop = 0
  · subst hp
    have : Nat.beq 0 0 = true := rfl
    rw [this, Bool.cond_true, hw]; simp
  · rw [nbeq_false_of_ne hp, Bool.cond_false, rawValue_term, Raw.value_pos, cast_shl, cast_shl, cast_rmul,
      raw_sub, Nat.cast_sub (by rw [raw_mul]; exact hmu), cast_rmul, hT, hw, hmuq]
    have h5 : ((5 : ℕ) : ℝ) * 2 ^ S / 2 ^ S = ((5 : ℚ) : ℝ) := by push_cast; field_simp
    rw [h5]
    push_cast
    field_simp
    ring

/-- `k` consecutive sources of block `b` (flat index `k b + j`) built by `F`. -/
theorem loopBlock (k m : ℕ) (b : Fin m) (F : ℕ → List Raw → List Raw) (V : Fin (m * k) → ℝ)
    (hF : ∀ n : Fin (m * k), ∀ t, rawValue 44 220 (F n t) = V n + rawValue 44 220 t) (tail : List Raw) :
    rawValue 44 220 (loopL k (fun j t => F (Nat.add (Nat.mul k b) j) t) tail) =
      (∑ offset : Fin k, V (finProdFinEquiv (b, offset))) + rawValue 44 220 tail := by
  rw [rawValue_loopL 44 220 k _ (fun j => if h : j < k then V (finProdFinEquiv (b, ⟨j, h⟩)) else 0),
    Finset.sum_range]
  · simp only [Fin.is_lt, dite_true, Fin.eta]
  · intro j hj t
    rw [dif_pos hj]
    have h1 : k * b.val + j < k * (b.val + 1) := by rw [Nat.mul_succ]; omega
    have h2 : k * (b.val + 1) ≤ m * k := by rw [Nat.mul_comm m k]; exact Nat.mul_le_mul_left k b.isLt
    have hlt : Nat.add (Nat.mul k b.val) j < m * k := by simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, (⟨j, hj⟩ : Fin k)) = (⟨Nat.add (Nat.mul k b.val) j, hlt⟩ : Fin (m * k)) := by
      ext; simp [finProdFinEquiv]; ring
    rw [e]; exact hF ⟨_, hlt⟩ t

end MatrixBounds.Numeric.FKLDim
