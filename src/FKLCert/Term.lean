module

public import IntegerLogLinearCertificates
public import RationalLogExpressions
public import FKL.Build

/-! Raw decoding of integer certificate terms at argument scale `2^S` and coefficient scale `2^T`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLCert

open FKL

/-- `|z|` with raw recursion. -/
noncomputable def natAbsRaw (z : ℤ) : Nat := Int.rec (fun n => n) (fun n => Nat.add n 1) z

/-- `z < 0` with raw recursion. -/
noncomputable def isNegRaw (z : ℤ) : Bool := Int.rec (fun _ => false) (fun _ => true) z

/-- `S + e` as a natural number (meaningful when `-S ≤ e`). -/
noncomputable def shiftExp (S : Nat) (e : ℤ) : Nat := Int.rec (fun n => Nat.add S n) (fun n => Nat.sub S (Nat.add n 1)) e

/-- `-S ≤ e`. -/
noncomputable def expOK (S : Nat) (e : ℤ) : Bool := Int.rec (fun _ => true) (fun n => Nat.ble (Nat.add n 1) S) e

/-- The raw term of a certificate record. -/
noncomputable def rawOf (S T : Nat) (t : IntegerLogTerm) : Raw :=
  ⟨Nat.div (Nat.shiftLeft t.query.numerator (shiftExp S t.query.exponent)) t.query.denominator,
   Nat.div (Nat.shiftLeft (natAbsRaw t.coefficient) T) t.denominator,
   isNegRaw t.coefficient⟩

/-- Exactness of the raw decoding. -/
noncomputable def exact (S T : Nat) (t : IntegerLogTerm) : Bool :=
  Bool.and (expOK S t.query.exponent)
    (Bool.and (Nat.blt 0 t.query.denominator)
      (Bool.and (Nat.beq (Nat.mod (Nat.shiftLeft t.query.numerator (shiftExp S t.query.exponent)) t.query.denominator) 0)
        (Bool.and (Nat.blt 0 t.denominator)
          (Nat.beq (Nat.mod (Nat.shiftLeft (natAbsRaw t.coefficient) T) t.denominator) 0))))

theorem raw_div (a b : Nat) : Nat.div a b = a / b := rfl
theorem raw_mod (a b : Nat) : Nat.mod a b = a % b := rfl

theorem natAbsRaw_eq (z : ℤ) : natAbsRaw z = z.natAbs := by cases z <;> rfl

theorem isNegRaw_eq (z : ℤ) : isNegRaw z = decide (z < 0) := by
  cases z with
  | ofNat n => simp only [isNegRaw]; simp
  | negSucc n => simp only [isNegRaw]; simp [Int.negSucc_lt_zero]

theorem shiftExp_cast (S : Nat) (e : ℤ) (h : expOK S e = true) : ((shiftExp S e : Nat) : ℤ) = S + e := by
  cases e with
  | ofNat n => simp only [shiftExp, raw_add]; push_cast; rfl
  | negSucc n =>
    simp only [expOK, Nat.ble_eq, raw_add] at h
    simp only [shiftExp, raw_add, raw_sub, Int.negSucc_eq]
    omega

theorem cast_div_exact (a b : ℕ) (hb : 0 < b) (h : b ∣ a) : ((a / b : ℕ) : ℝ) = (a : ℝ) / b := by
  obtain ⟨q, rfl⟩ := h
  rw [Nat.mul_div_cancel_left q hb]
  have : (b : ℝ) ≠ 0 := by exact_mod_cast hb.ne'
  push_cast; field_simp

/-- An exactly decoded record has the value of its monomial. -/
theorem rawOf_value (S T : Nat) (t : IntegerLogTerm) (h : exact S T t = true) :
    (rawOf S T t).value S T = t.monomial.value := by
  simp only [exact, Bool.and_eq_true, Nat.blt_eq, Nat.beq_eq] at h
  obtain ⟨he, hb, hk, hd, hm⟩ := h
  simp only [raw_shiftLeft, raw_mod, Nat.shiftLeft_eq, natAbsRaw_eq] at hk hm
  have hdivk := Nat.dvd_of_mod_eq_zero hk
  have hdivm := Nat.dvd_of_mod_eq_zero hm
  have hbR : (t.query.denominator : ℝ) ≠ 0 := by exact_mod_cast hb.ne'
  have hdR : (t.denominator : ℝ) ≠ 0 := by exact_mod_cast hd.ne'
  have key : ((rawOf S T t).key : ℝ) =
      (t.query.numerator : ℝ) * 2 ^ shiftExp S t.query.exponent / t.query.denominator := by
    simp only [rawOf, raw_div, raw_shiftLeft, Nat.shiftLeft_eq]
    rw [cast_div_exact _ _ hb hdivk]; push_cast; ring
  have mag : ((rawOf S T t).mag : ℝ) = (t.coefficient.natAbs : ℝ) * 2 ^ T / t.denominator := by
    simp only [rawOf, raw_div, raw_shiftLeft, Nat.shiftLeft_eq, natAbsRaw_eq]
    rw [cast_div_exact _ _ hd hdivm]; push_cast; ring
  have neg : (rawOf S T t).neg = decide (t.coefficient < 0) := by simp only [rawOf, isNegRaw_eq]
  have hz : ((2 : ℝ) ^ shiftExp S t.query.exponent) = 2 ^ S * (2 : ℝ) ^ t.query.exponent := by
    rw [← zpow_natCast, shiftExp_cast S t.query.exponent he, zpow_add₀ two_ne_zero, zpow_natCast]
  have coefEq : ((rawOf S T t).coef : ℝ) / 2 ^ T = (t.coefficient : ℝ) / t.denominator := by
    have habs : ((t.coefficient.natAbs : ℕ) : ℝ) = |(t.coefficient : ℝ)| := by
      rw [Nat.cast_natAbs, Int.cast_abs]
    unfold Raw.coef
    rw [neg]
    by_cases hn : t.coefficient < 0
    · have hnR : (t.coefficient : ℝ) < 0 := by exact_mod_cast hn
      simp only [hn, decide_true, Bool.cond_true, Int.cast_neg, Int.cast_natCast, mag, habs, abs_of_neg hnR]
      field_simp
    · have hnR : 0 ≤ (t.coefficient : ℝ) := by exact_mod_cast not_lt.mp hn
      simp only [hn, decide_false, Bool.cond_false, Int.cast_natCast, mag, habs, abs_of_nonneg hnR]
      field_simp
  have argEq : ((rawOf S T t).key : ℝ) / 2 ^ S = ((t.query.input : ℚ) : ℝ) := by
    rw [key, hz, IntegerLogQuery.input]
    push_cast
    field_simp
  rw [Raw.value, coefEq, argEq, LogMonomial.value, IntegerLogTerm.monomial]
  push_cast
  ring

end MatrixBounds.Numeric.FKLCert
