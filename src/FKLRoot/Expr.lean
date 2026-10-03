module

public import FKLRoot.Law
public import RootFineCertificateExpressions
public import FKLFine3.Orbit

/-! The raw root fine builder (`S = T = 450`) computes the exact value of the root fine expression in
the supplied certificate convention (`RootFineCertificateExpressions.expression`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLRoot

open FKL FKLHier4 FKLFine3 Entropy Tensor Tensor.CW
open scoped BigOperators
set_option exponentiation.threshold 1000

/-- Mixture orbit entropy terms. -/
noncomputable def mixB (a : ℕ) (tail : List Raw) : List Raw :=
  loopL 231 (fun o t => term 450 (mixF a o) (mixF a o) true
    (term 450 (Nat.shiftLeft (sz4 o) 450) (mixF a o) false t)) tail

/-- Isolated root columns: weighted child orbit entropies (signs already reversed). -/
noncomputable def singB (a : ℕ) (tail : List Raw) : List Raw :=
  loopL 153 (fun c t => cond (isoR a c)
    (loopL 231 (fun o t => term 450 (Nat.shiftLeft (fLaw a c o) 44) (Nat.mul (fRW c) (fLaw a c o)) false
      (term 450 (Nat.shiftLeft (sz4 o) 450) (Nat.mul (fRW c) (fLaw a c o)) true t)) t) t) tail

/-- Coordinate pools: orbit mass entropies (signs already reversed). -/
noncomputable def poolsB (a : ℕ) (tail : List Raw) : List Raw :=
  loopL 17 (fun k t => orbitMassB 450 231 (poolF a k) sz4 1 0 0 t) tail

/-- The complete raw root fine expression on fine axis `a`. -/
noncomputable def rootRaw (a : ℕ) : List Raw := poolsB a (singB a (mixB a []))

theorem orbitEntropy_val (x : Fin 231 → ℚ) (X : ℕ → ℝ) (hx : ∀ o : Fin 231, ((x o : ℚ) : ℝ) = X o)
    (sz : ℕ → ℕ) (h4 : ∀ o : Fin 231, sz o = OrbitLevel4.sizes o) :
    rationalLogValue (orbitEntropyExpression x OrbitLevel4.sizes) =
      ∑ o ∈ Finset.range 231, (-(X o * Real.log (X o)) + X o * Real.log (sz o)) := by
  simp only [orbitEntropyExpression, rationalLogValue_append, entropyLogExpression_value,
    orbitCorrectionExpression_value, entropy, hx, h4]
  rw [Finset.sum_range (fun o => -(X o * Real.log (X o)) + X o * Real.log (sz o)), Finset.sum_add_distrib,
    Finset.sum_neg_distrib]
  simp only [h4]

theorem div450 (m : ℝ) : m * 2 ^ 450 / 2 ^ 450 = m := by
  rw [mul_div_assoc, div_self (pow_ne_zero _ two_ne_zero), mul_one]

theorem mixB_value (a : ℕ) (tail : List Raw) :
    rawValue 450 450 (mixB a tail) = (∑ o ∈ Finset.range 231, (-((mixF a o : ℝ) / 2 ^ 450 *
      Real.log ((mixF a o : ℝ) / 2 ^ 450)) + (mixF a o : ℝ) / 2 ^ 450 * Real.log (sz4 o))) + rawValue 450 450 tail := by
  unfold mixB
  rw [rawValue_loopL 450 450 231 _ (fun o => -((mixF a o : ℝ) / 2 ^ 450 *
      Real.log ((mixF a o : ℝ) / 2 ^ 450)) + (mixF a o : ℝ) / 2 ^ 450 * Real.log (sz4 o))]
  intro o _ t
  rw [rawValue_term, rawValue_term, Raw.value_neg, Raw.value_pos]
  simp only [raw_shiftLeft, Nat.shiftLeft_eq, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat, div450]
  ring

theorem singB_value (a : ℕ) (tail : List Raw) :
    rawValue 450 450 (singB a tail) = (∑ c ∈ Finset.range 153, if isoR a c = true then
      -((fRW c : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a c o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a c o : ℝ) / 2 ^ 406)) + (fLaw a c o : ℝ) / 2 ^ 406 * Real.log (sz4 o))) else 0) +
      rawValue 450 450 tail := by
  unfold singB
  rw [rawValue_loopL 450 450 153 _ (fun c => if isoR a c = true then
      -((fRW c : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a c o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a c o : ℝ) / 2 ^ 406)) + (fLaw a c o : ℝ) / 2 ^ 406 * Real.log (sz4 o))) else 0)]
  intro c _ t
  cases h : isoR a c
  · simp
  · simp only [Bool.cond_true, ite_true]
    rw [rawValue_loopL 450 450 231 _ (fun o => -((fRW c : ℝ) / 2 ^ 44 * (-((fLaw a c o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a c o : ℝ) / 2 ^ 406)) + (fLaw a c o : ℝ) / 2 ^ 406 * Real.log (sz4 o))))]
    · rw [Finset.mul_sum, ← Finset.sum_neg_distrib]
    · intro o _ t'
      rw [rawValue_term, rawValue_term, Raw.value_pos, Raw.value_neg]
      simp only [raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, Nat.cast_mul, Nat.cast_pow, Nat.cast_ofNat, div450]
      have h450 : (2 : ℝ) ^ 450 = 2 ^ 44 * 2 ^ 406 := by rw [← pow_add]
      have hk : (fLaw a c o : ℝ) * 2 ^ 44 / 2 ^ 450 = (fLaw a c o : ℝ) / 2 ^ 406 := by
        rw [h450]; field_simp
      have hm : (fRW c : ℝ) * (fLaw a c o : ℝ) / 2 ^ 450 = (fRW c : ℝ) / 2 ^ 44 * ((fLaw a c o : ℝ) / 2 ^ 406) := by
        rw [h450]; field_simp
      rw [hk, hm]
      ring

theorem poolsB_value (a : ℕ) (tail : List Raw) :
    rawValue 450 450 (poolsB a tail) = (∑ k ∈ Finset.range 17,
      -omReal 231 (fun o => (poolF a k o : ℝ) / 2 ^ 450) sz4) + rawValue 450 450 tail := by
  unfold poolsB
  rw [rawValue_loopL 450 450 17 _ (fun k => -omReal 231 (fun o => (poolF a k o : ℝ) / 2 ^ 450) sz4)]
  intro k _ t
  rw [orbitMassB_omReal 450 450 231 (poolF a k) sz4 1 0 0 t (by norm_num)]
  congr 1
  have e : (fun o => (poolF a k o : ℝ) * 2 ^ 0 / 2 ^ 450) = (fun o => (poolF a k o : ℝ) / 2 ^ 450) := by
    funext o; simp
  rw [e]
  simp

/-- Splitting the 170 sectors into 153 singletons and 17 coordinate pools. -/
theorem sum_fin170 (f : Fin 170 → ℝ) :
    ∑ s, f s = ∑ i : Fin 153, f (finSumFinEquiv (m := 153) (n := 17) (Sum.inl i)) +
      ∑ k : Fin 17, f (finSumFinEquiv (m := 153) (n := 17) (Sum.inr k)) := by
  rw [← Equiv.sum_comp (finSumFinEquiv (m := 153) (n := 17)), Fintype.sum_sum_type]

theorem rootRaw_value (a : Fin 2) :
    rawValue 450 450 (rootRaw a) = rationalLogValue (RootFineCertificateExpressions.expression P4 a) := by
  unfold rootRaw RootFineCertificateExpressions.expression
  rw [poolsB_value, singB_value, mixB_value, rawValue_nil, add_zero, rationalLogValue_append,
    scaleLogExpression_value, finiteLogSum_value, sum_fin170]
  simp only [RootFineCertificateExpressions.sectorExpression, Equiv.symm_apply_apply]
  have hmix : rationalLogValue (orbitEntropyExpression (RootFineCachedRootExpression.mixture P4 a) OrbitLevel4.sizes) =
      ∑ o ∈ Finset.range 231, (-((mixF a o : ℝ) / 2 ^ 450 * Real.log ((mixF a o : ℝ) / 2 ^ 450)) +
        (mixF a o : ℝ) / 2 ^ 450 * Real.log (sz4 o)) := by
    apply orbitEntropy_val _ _ _ sz4 sz4_eq
    intro o
    rw [← RootFineIntegerPools.mixture_value, ← mixF_eq a o]
    push_cast; ring
  have hsing : ∀ i : Fin 153, rationalLogValue (if RootFineExecutablePools.isolated a i = true then
      scaleLogExpression (SuppliedRootCoarse.mass i)
        (orbitEntropyExpression (RootFineCachedRootExpression.mass P4 a i) OrbitLevel4.sizes) else []) =
      if isoR a i = true then (fRW i : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a i o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a i o : ℝ) / 2 ^ 406)) + (fLaw a i o : ℝ) / 2 ^ 406 * Real.log (sz4 o)) else 0 := by
    intro i
    rw [isoR_eq a i]
    split_ifs
    · rw [scaleLogExpression_value]
      congr 1
      · simp only [SuppliedRootCoarse.mass, TypedProbabilityRow.rational]
        rw [fRW_eq i, Rat.cast_div, Rat.cast_natCast, Rat.cast_natCast]
        congr 1
        norm_num
      · apply orbitEntropy_val _ _ _ sz4 sz4_eq
        intro o
        have := fLaw_eq a i o
        simp only [RootFineCachedRootExpression.mass]
        rw [show RootFineCachedRootExpression.rootNumerator P4 i
            (SuppliedRootStage.axes (SuppliedRootFine.physicalAxis a)) o = RootFineIntegerPools.law P4 a i o from rfl,
          ← this]
        push_cast; ring
    · simp [rationalLogValue]
  have hpool : ∀ k : Fin 17, rationalLogValue (orbitMassEntropyExpression
      (RootFineExecutablePools.pool P4 a (finSumFinEquiv (Sum.inr k))) OrbitLevel4.sizes) =
      omReal 231 (fun o => (poolF a k o : ℝ) / 2 ^ 450) sz4 := by
    intro k
    apply omReal_of _ _ _ sz4 _ (fun o => (sz4_eq o).symm)
    intro o
    rw [← RootFineIntegerPools.pool_value, ← poolF_eq a k o]
    push_cast; ring
  simp only [hsing, hpool]
  rw [hmix, Finset.sum_range (fun c => if isoR a c = true then
      -((fRW c : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a c o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a c o : ℝ) / 2 ^ 406)) + (fLaw a c o : ℝ) / 2 ^ 406 * Real.log (sz4 o))) else 0),
    Finset.sum_range (fun k => -omReal 231 (fun o => (poolF a k o : ℝ) / 2 ^ 450) sz4)]
  have hneg : ∀ i : Fin 153, (if isoR a i = true then
      -((fRW i : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a i o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a i o : ℝ) / 2 ^ 406)) + (fLaw a i o : ℝ) / 2 ^ 406 * Real.log (sz4 o))) else 0) =
      -(if isoR a i = true then (fRW i : ℝ) / 2 ^ 44 * ∑ o ∈ Finset.range 231, (-((fLaw a i o : ℝ) / 2 ^ 406 *
        Real.log ((fLaw a i o : ℝ) / 2 ^ 406)) + (fLaw a i o : ℝ) / 2 ^ 406 * Real.log (sz4 o)) else 0) := by
    intro i; split_ifs <;> simp
  simp only [hneg, Finset.sum_neg_distrib]
  push_cast
  ring

end MatrixBounds.Numeric.FKLRoot
