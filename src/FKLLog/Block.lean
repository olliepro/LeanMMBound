module

public import FKLLog.Basic
public import FKLLog.Grid
public import IntegerLogLinearCertificates

/-! Nat-only kernel evaluation of the integer logarithm certificate checks.

One raw `List.rec` pass over a block computes, with `Nat` operations only, the parameter checks of every
term and the four endpoint sums (lower/upper, each as a positive and a negative part); a final comparison
with the reported `FixedBounds` closes both `integerLogCheck terms = true` and
`integerLogBounds terms = bounds` (`blockCheck_sound`). Signed quantities are differences `a - b` of
naturals; Euclidean floor division of a negative numerator by `D > 0` is `-((|x| + D - 1) / D)`. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLLog

noncomputable section

/-- Positive part of `⌊(a - b) / D⌋`. -/
def fdP (a b D : Nat) : Nat := sel (Nat.ble b a) (Nat.div (Nat.sub a b) D) 0

/-- Negative part of `⌊(a - b) / D⌋`. -/
def fdN (a b D : Nat) : Nat := sel (Nat.ble b a) 0 (Nat.div (Nat.add (Nat.sub b a) (Nat.sub D 1)) D)

/-- `6 x (2^44)^2 + 2 x^3`. -/
def cubicNum (x : Nat) : Nat :=
  Nat.add (Nat.mul (Nat.mul 6 x) 309485009821345068724781056) (Nat.mul 2 (Nat.mul (Nat.mul x x) x))

/-- `x (3·2^88 + x^2)`, so that `cubicNum x · 2^60 = cubicA x · 2^61`. -/
def cubicA (x : Nat) : Nat := Nat.mul x (Nat.add 928455029464035206174343168 (Nat.mul x x))

/-- Floor endpoint of the cubic at scale `2^60`: `⌊cubicNum x · 2^60 / (3·2^132)⌋`. -/
def cubicLo (x : Nat) : Nat := Nat.div (cubicA x) 7083549724304467820544

/-- Ceiling endpoint of the cubic at scale `2^60`. -/
def cubicHi (x : Nat) : Nat :=
  Nat.div (Nat.add (Nat.mul (cubicA x) 2305843009213693952) 16333553612205046246241981156724874149887)
    16333553612205046246241981156724874149888

/-- Positive part of the query lower endpoint. -/
def qP (CL GL : Nat) (eneg : Bool) (ea : Nat) : Nat :=
  Nat.add (Nat.add CL GL) (sel eneg 0 (Nat.mul 799144290325165978 ea))

/-- Negative part of the query lower endpoint. -/
def qQ (eneg : Bool) (ea : Nat) : Nat := sel eneg (Nat.add 65666 (Nat.mul 799144290325165980 ea)) 65666

/-- Positive part of the query upper endpoint. -/
def qP' (CU GU : Nat) (eneg : Bool) (ea : Nat) : Nat :=
  Nat.add (Nat.add (Nat.add 65665 CU) GU) (sel eneg 0 (Nat.mul 799144290325165980 ea))

/-- Negative part of the query upper endpoint. -/
def qQ' (eneg : Bool) (ea : Nat) : Nat := sel eneg (Nat.mul 799144290325165978 ea) 0

/-- Running sums of a block: lower = `lp - ln`, upper = `up - un`, and the conjunction of the checks. -/
structure Acc where
  lp : Nat
  ln : Nat
  up : Nat
  un : Nat
  ok : Bool

/-- Add one term with `A = ⌊(m P - m Q)/D⌋`, `B = ⌊(m Q' - m P')/D⌋`. -/
def termAcc (cneg ok : Bool) (Ap An Bp Bn : Nat) (a : Acc) : Acc :=
  ⟨Nat.add (sel cneg Bp Ap) a.lp, Nat.add (sel cneg Bn An) a.ln,
   Nat.add (sel cneg An Bn) a.up, Nat.add (sel cneg Ap Bp) a.un, band ok a.ok⟩

def termQ (cneg : Bool) (m D : Nat) (ok : Bool) (X Y X' Y' : Nat) (a : Acc) : Acc :=
  termAcc cneg ok (fdP X Y D) (fdN X Y D) (fdP Y' X' D) (fdN Y' X' D) a

/-- Nat form of `IntegerLogTerm.check` (with nonnegative parameter endpoints). -/
def checkN (D N Dd : Nat) (plneg puneg : Bool) (pl pu : Nat) : Bool :=
  band (Nat.ble 1 D) (band (Nat.ble 1 Dd) (band (Nat.ble Dd N)
    (band (Bool.rec true false plneg) (band (Bool.rec true false puneg)
      (band (Nat.ble (Nat.mul pu 512) 17592186044416)
        (band (Nat.ble (Nat.mul pl (Nat.add N Dd)) (Nat.mul (Nat.sub N Dd) 17592186044416))
          (Nat.ble (Nat.mul (Nat.sub N Dd) 17592186044416) (Nat.mul pu (Nat.add N Dd)))))))))

def termN (cneg : Bool) (m D N Dd : Nat) (eneg : Bool) (ea g : Nat) (plneg puneg : Bool) (pl pu : Nat)
    (a : Acc) : Acc :=
  termQ cneg m D (checkN D N Dd plneg puneg pl pu)
    (Nat.mul m (qP (cubicLo pl) (lane64 gridLo g) eneg ea)) (Nat.mul m (qQ eneg ea))
    (Nat.mul m (qP' (cubicHi pu) (lane64 gridHi g) eneg ea)) (Nat.mul m (qQ' eneg ea)) a

/-- One term of a block. -/
def step (t : IntegerLogTerm) (a : Acc) : Acc :=
  termN (iNeg t.coefficient) (iVal t.coefficient) t.denominator (Nat.mul t.query.numerator 256)
    (Nat.mul t.query.denominator (Nat.add 256 t.query.grid.val)) (iNeg t.query.exponent) (iVal t.query.exponent)
    t.query.grid.val (iNeg t.query.parameter.lower) (iNeg t.query.parameter.upper)
    (iVal t.query.parameter.lower) (iVal t.query.parameter.upper) a

/-- The whole block. -/
def run (l : List IntegerLogTerm) : Acc :=
  List.rec (motive := fun _ => Acc) ⟨0, 0, 0, 0, true⟩ (fun t _ r => step t r) l

/-- `z = p - n`. -/
def eqI (p n : Nat) (z : ℤ) : Bool :=
  Int.rec (fun k => Nat.beq p (Nat.add n k)) (fun k => Nat.beq n (Nat.add p (Nat.add k 1))) z

def blockOut (a : Acc) (b : FixedBounds) : Bool :=
  band a.ok (band (eqI a.lp a.ln b.lower) (eqI a.up a.un b.upper))

/-- The fast block check. -/
def blockCheck (l : List IntegerLogTerm) (b : FixedBounds) : Bool := blockOut (run l) b

/-! ### Soundness -/


theorem eqI_sound (p n : Nat) (z : ℤ) (h : eqI p n z = true) : z = (p : ℤ) - n := by
  cases z with
  | ofNat k =>
    have : p = n + k := Nat.eq_of_beq_eq_true h
    simp only [Int.ofNat_eq_natCast]; omega
  | negSucc k =>
    have : n = p + (k + 1) := Nat.eq_of_beq_eq_true h
    rw [Int.negSucc_eq]; omega

theorem neg_ediv_nat (x D : Nat) (hD : 0 < D) :
    (-(x : ℤ)) / (D : ℤ) = -(((x + (D - 1)) / D : Nat) : ℤ) := by
  have hdm := Nat.div_add_mod (x + (D - 1)) D
  have hlt := Nat.mod_lt (x + (D - 1)) hD
  generalize (x + (D - 1)) / D = q at hdm hlt ⊢
  generalize (x + (D - 1)) % D = r at hdm hlt
  generalize hM : D * q = M at hdm
  have hDpos : (0 : ℤ) < D := by exact_mod_cast hD
  have key := (Int.ediv_emod_unique (a := -(x : ℤ)) (b := (D : ℤ)) (q := -(q : ℤ))
    (r := (M : ℤ) - x) hDpos).mpr ⟨?_, ?_, ?_⟩
  · exact key.1
  · have : (M : ℤ) = (D : ℤ) * q := by rw [← hM]; push_cast; rfl
    rw [this]; ring
  · omega
  · omega

theorem fd_eq (a b D : Nat) (hD : 0 < D) :
    ((a : ℤ) - b) / (D : ℤ) = (fdP a b D : ℤ) - fdN a b D := by
  unfold fdP fdN
  simp only [sel_eq]
  by_cases h : b ≤ a
  · have hb : Nat.ble b a = true := Nat.ble_eq.mpr h
    rw [hb]
    simp only [Bool.cond_true, Nat.cast_zero, sub_zero]
    rw [show (a : ℤ) - b = ((a - b : Nat) : ℤ) by omega]
    exact (Int.natCast_div _ _).symm
  · have hb : Nat.ble b a = false := Bool.eq_false_iff.mpr (fun h2 => h (Nat.ble_eq.mp h2))
    rw [hb]
    simp only [Bool.cond_false, Nat.cast_zero, zero_sub]
    rw [show (a : ℤ) - b = -((b - a : Nat) : ℤ) by omega]
    exact neg_ediv_nat _ _ hD

theorem cubicNum_cast (x : Nat) :
    fixedCubicNumerator (x : ℤ) (2^44) = (cubicNum x : ℤ) := by
  simp only [fixedCubicNumerator, cubicNum, raw_add, raw_mul]
  push_cast; ring

theorem cubicNum_mul (x : Nat) : cubicNum x * 1152921504606846976 = cubicA x * 2305843009213693952 := by
  simp only [cubicNum, cubicA, raw_add, raw_mul]; ring

theorem cubicEndpoint_lower (x : Nat) : (fixedCubicEndpoint (x : ℤ)).lower = (cubicLo x : ℤ) := by
  have e1 : (fixedCubicEndpoint (x : ℤ)).lower = ((cubicNum x * 1152921504606846976 : Nat) : ℤ) /
      ((16333553612205046246241981156724874149888 : Nat) : ℤ) := by
    simp only [fixedCubicEndpoint, FixedBounds.quotient, cubicNum_cast]
    norm_num
  rw [e1, ← Int.natCast_div, cubicNum_mul,
    show (16333553612205046246241981156724874149888 : Nat) = 7083549724304467820544 * 2305843009213693952 by norm_num,
    Nat.mul_div_mul_right _ _ (by norm_num)]
  rfl

theorem cubicEndpoint_upper (x : Nat) : (fixedCubicEndpoint (x : ℤ)).upper = (cubicHi x : ℤ) := by
  have key := neg_ediv_nat (cubicNum x * 1152921504606846976) 16333553612205046246241981156724874149888
    (by norm_num)
  have e1 : (fixedCubicEndpoint (x : ℤ)).upper = -((-((cubicNum x * 1152921504606846976 : Nat) : ℤ)) /
      ((16333553612205046246241981156724874149888 : Nat) : ℤ)) := by
    simp only [fixedCubicEndpoint, FixedBounds.quotient, cubicNum_cast, neg_mul]
    norm_num
  rw [e1, key, neg_neg, cubicNum_mul]; rfl

theorem cubic_eq (pl pu : Nat) :
    fixedCubicLogBounds ⟨pl, pu⟩ = ⟨(cubicLo pl : ℤ) - 65665, (cubicHi pu : ℤ) + 65665⟩ := by
  simp only [fixedCubicLogBounds, FixedBounds.add, fixedCubicRemainder, cubicEndpoint_lower,
    cubicEndpoint_upper]
  congr 1

theorem exp_eq_ofNat (k : Nat) :
    FixedBounds.scaleRatio (Int.ofNat k) 1 integerLogTwo =
      ⟨(k : ℤ) * 799144290325165978, (k : ℤ) * 799144290325165980⟩ := by
  simp [FixedBounds.scaleRatio, integerLogTwo]

theorem exp_eq_negSucc (k : Nat) :
    FixedBounds.scaleRatio (Int.negSucc k) 1 integerLogTwo =
      ⟨-(((k + 1 : Nat) : ℤ) * 799144290325165980), -(((k + 1 : Nat) : ℤ) * 799144290325165978)⟩ := by
  have : ¬ (0 ≤ Int.negSucc k) := by simp [Int.negSucc_lt_zero]
  unfold FixedBounds.scaleRatio
  rw [if_neg this]
  simp only [integerLogTwo, Nat.cast_one, Int.ediv_one, Int.negSucc_eq]
  push_cast
  congr 1 <;> ring

theorem query_core (CL CU GL GU : Nat) (e : ℤ) (eneg : Bool) (ea : Nat)
    (he : e = cond eneg (-(ea : ℤ)) (ea : ℤ)) (hpos : eneg = true → 0 < ea) :
    ((⟨(CL : ℤ) - 65665, (CU : ℤ) + 65665⟩ : FixedBounds).add ⟨(GL : ℤ) - 1, (GU : ℤ)⟩).add
        (FixedBounds.scaleRatio e 1 integerLogTwo) =
      ⟨(qP CL GL eneg ea : ℤ) - qQ eneg ea, (qP' CU GU eneg ea : ℤ) - qQ' eneg ea⟩ := by
  cases eneg with
  | false =>
    simp only [Bool.cond_false] at he
    subst he
    have h0 : (0 : ℤ) ≤ (ea : ℤ) := by positivity
    simp only [FixedBounds.scaleRatio, if_pos h0, integerLogTwo, FixedBounds.add, qP, qQ, qP', qQ', sel_eq,
      Bool.cond_false, raw_add, raw_mul, Nat.cast_one, Int.ediv_one]
    push_cast; congr 1 <;> ring
  | true =>
    simp only [Bool.cond_true] at he
    subst he
    have h0 : ¬ (0 : ℤ) ≤ -(ea : ℤ) := by have := hpos rfl; omega
    simp only [FixedBounds.scaleRatio, if_neg h0, integerLogTwo, FixedBounds.add, qP, qQ, qP', qQ', sel_eq,
      Bool.cond_true, raw_add, raw_mul, Nat.cast_one, Int.ediv_one]
    push_cast; congr 1 <;> ring

theorem iVal_spec (e : ℤ) : e = cond (iNeg e) (-(iVal e : ℤ)) (iVal e : ℤ) ∧ (iNeg e = true → 0 < iVal e) := by
  cases e with
  | ofNat k => exact ⟨rfl, fun h => absurd h (by rw [iNeg_ofNat]; decide)⟩
  | negSucc k =>
    refine ⟨?_, fun _ => ?_⟩
    · show Int.negSucc k = -((k + 1 : Nat) : ℤ)
      rw [Int.negSucc_eq]; push_cast; ring
    · show 0 < k + 1
      omega

theorem query_eq (q : IntegerLogQuery) (pl pu : Nat) (hp : q.parameter = ⟨pl, pu⟩) :
    q.bounds = ⟨(qP (cubicLo pl) (lane64 gridLo q.grid.val) (iNeg q.exponent) (iVal q.exponent) : ℤ) - qQ (iNeg q.exponent) (iVal q.exponent),
      (qP' (cubicHi pu) (lane64 gridHi q.grid.val) (iNeg q.exponent) (iVal q.exponent) : ℤ) - qQ' (iNeg q.exponent) (iVal q.exponent)⟩ := by
  unfold IntegerLogQuery.bounds
  rw [hp, FKLLog.grid_eq, cubic_eq]
  exact query_core _ _ _ _ _ _ _ (iVal_spec _).1 (iVal_spec _).2

theorem scale_eq (c : ℤ) (D : Nat) (hD : 0 < D) (P Q P' Q' : Nat) (ok : Bool) (a : Acc) :
    let r := termQ (iNeg c) (iVal c) D ok (iVal c * P) (iVal c * Q) (iVal c * P') (iVal c * Q') a
    (FixedBounds.scaleRatio c D ⟨(P : ℤ) - Q, (P' : ℤ) - Q'⟩).lower + ((a.lp : ℤ) - a.ln) = (r.lp : ℤ) - r.ln ∧
    (FixedBounds.scaleRatio c D ⟨(P : ℤ) - Q, (P' : ℤ) - Q'⟩).upper + ((a.up : ℤ) - a.un) = (r.up : ℤ) - r.un := by
  intro r
  cases c with
  | ofNat m =>
    have h0 : (0 : ℤ) ≤ (m : ℤ) := by positivity
    simp only [r, termQ, termAcc, sel_eq, iNeg_ofNat, iVal_ofNat, Bool.cond_false, raw_add]
    simp only [Int.ofNat_eq_natCast, FixedBounds.scaleRatio, if_pos h0]
    refine ⟨?_, ?_⟩
    · rw [show (m : ℤ) * ((P : ℤ) - Q) = ((m * P : Nat) : ℤ) - ((m * Q : Nat) : ℤ) by push_cast; ring,
        fd_eq _ _ _ hD]
      push_cast; ring
    · rw [show -(m : ℤ) * ((P' : ℤ) - Q') = ((m * Q' : Nat) : ℤ) - ((m * P' : Nat) : ℤ) by push_cast; ring,
        fd_eq _ _ _ hD]
      push_cast; ring
  | negSucc k =>
    have h0 : ¬ (0 : ℤ) ≤ Int.negSucc k := by simp [Int.negSucc_lt_zero]
    simp only [r, termQ, termAcc, sel_eq, iNeg_negSucc, iVal_negSucc, Bool.cond_true, FixedBounds.scaleRatio, if_neg h0,
      raw_add]
    refine ⟨?_, ?_⟩
    · rw [show (Int.negSucc k) * ((P' : ℤ) - Q') = (((k + 1) * Q' : Nat) : ℤ) - (((k + 1) * P' : Nat) : ℤ) by
        rw [Int.negSucc_eq]; push_cast; ring, fd_eq _ _ _ hD]
      push_cast; ring
    · rw [show -(Int.negSucc k) * ((P : ℤ) - Q) = (((k + 1) * P : Nat) : ℤ) - (((k + 1) * Q : Nat) : ℤ) by
        rw [Int.negSucc_eq]; push_cast; ring, fd_eq _ _ _ hD]
      push_cast; ring

theorem checkN_sound (t : IntegerLogTerm)
    (h : checkN t.denominator (Nat.mul t.query.numerator 256)
      (Nat.mul t.query.denominator (Nat.add 256 t.query.grid.val)) (iNeg t.query.parameter.lower)
      (iNeg t.query.parameter.upper) (iVal t.query.parameter.lower) (iVal t.query.parameter.upper) = true) :
    t.check = true ∧ 0 < t.denominator ∧
      t.query.parameter = ⟨(iVal t.query.parameter.lower : ℤ), (iVal t.query.parameter.upper : ℤ)⟩ := by
  obtain ⟨c, D, ⟨n, d, e, g, ⟨pl, pu⟩⟩⟩ := t
  simp only at h ⊢
  cases pl with
  | negSucc k => simp [checkN, band_eq, brec_eq, iNeg_negSucc] at h
  | ofNat pl =>
  cases pu with
  | negSucc k => simp [checkN, band_eq, brec_eq, iNeg_negSucc] at h
  | ofNat pu =>
  simp only [checkN, band_eq, brec_eq, Bool.not_false, iNeg_ofNat, iVal_ofNat, Bool.cond_false, Bool.and_eq_true, Nat.blt_eq, Nat.ble_eq,
    raw_add, raw_mul, raw_sub, Bool.true_and] at h
  obtain ⟨hD, hDd, hle, h512, hlo, hhi⟩ := h
  refine ⟨?_, hD, rfl⟩
  simp only [IntegerLogTerm.check, IntegerLogQuery.check, integerLogParameterCheck,
    IntegerLogQuery.localNumerator, IntegerLogQuery.localDenominator, Bool.and_eq_true, decide_eq_true_eq]
  refine ⟨hD, decide_eq_true ?_⟩
  simp only [Int.ofNat_eq_natCast]
  zify [hle] at hlo hhi
  push_cast at hDd hle hlo hhi h512 ⊢
  refine ⟨by exact_mod_cast hDd, by exact_mod_cast hle, by positivity, ?_, ?_, ?_⟩
  · have : ((pu : ℤ) * 512) ≤ 17592186044416 := by exact_mod_cast h512
    norm_num; exact this
  · norm_num; linarith
  · norm_num; linarith

theorem step_sound (t : IntegerLogTerm) (a : Acc) (h : (step t a).ok = true) :
    a.ok = true ∧ t.check = true ∧
      t.bounds.lower + ((a.lp : ℤ) - a.ln) = ((step t a).lp : ℤ) - (step t a).ln ∧
      t.bounds.upper + ((a.up : ℤ) - a.un) = ((step t a).up : ℤ) - (step t a).un := by
  have hok : (step t a).ok = band (checkN t.denominator (Nat.mul t.query.numerator 256)
      (Nat.mul t.query.denominator (Nat.add 256 t.query.grid.val)) (iNeg t.query.parameter.lower)
      (iNeg t.query.parameter.upper) (iVal t.query.parameter.lower) (iVal t.query.parameter.upper)) a.ok := rfl
  rw [hok, band_eq, Bool.and_eq_true] at h
  obtain ⟨hck, ha⟩ := h
  obtain ⟨hc, hD, hp⟩ := checkN_sound t hck
  have hq := query_eq t.query _ _ hp
  refine ⟨ha, hc, ?_, ?_⟩
  · unfold IntegerLogTerm.bounds; rw [hq]; exact (scale_eq t.coefficient t.denominator hD _ _ _ _ true a).1
  · unfold IntegerLogTerm.bounds; rw [hq]; exact (scale_eq t.coefficient t.denominator hD _ _ _ _ true a).2

theorem run_sound (l : List IntegerLogTerm) (h : (run l).ok = true) :
    integerLogCheck l = true ∧
      integerLogBounds l = ⟨((run l).lp : ℤ) - (run l).ln, ((run l).up : ℤ) - (run l).un⟩ := by
  induction l with
  | nil => exact ⟨rfl, by simp [integerLogBounds, run]⟩
  | cons t l ih =>
    have hr : run (t :: l) = step t (run l) := rfl
    rw [hr] at h ⊢
    obtain ⟨ha, hc, hl, hu⟩ := step_sound t (run l) h
    obtain ⟨ih1, ih2⟩ := ih ha
    refine ⟨by simp [integerLogCheck, hc, ih1], ?_⟩
    simp only [integerLogBounds, ih2, FixedBounds.add, ← hl, ← hu]

/-- The fast check certifies both block theorems. -/
theorem blockCheck_sound (l : List IntegerLogTerm) (b : FixedBounds) (h : blockCheck l b = true) :
    integerLogCheck l = true ∧ integerLogBounds l = b := by
  obtain ⟨lo, hi⟩ := b
  simp only [blockCheck, blockOut, band_eq, Bool.and_eq_true] at h
  obtain ⟨hok, hl, hu⟩ := h
  obtain ⟨h1, h2⟩ := run_sound l hok
  refine ⟨h1, ?_⟩
  rw [h2, eqI_sound _ _ _ hl, eqI_sound _ _ _ hu]

end

end MatrixBounds.Numeric.FKLLog
