module

public import SuppliedPairedFineBlocks
public import FKLFine3.Role

/-! The generic role builder computes the exact value of one level-four paired-fine role
(`nP = 231`, `nC = 21`, `nCol = 45`, `nSec = 9`, `S = 406`, `Sc = 178`, role weights at `2^88`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL FKLFine3 Entropy Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- The semantic child values of a level-four source. -/
noncomputable def ch4 (node : Fin 105) : ChildValues4 :=
  fun column axis orbit => SuppliedRootFineChild3Integers.numerator node (shapeColumnEquiv 8 column) axis orbit

/-- Parent orbit entropy value as a range sum. -/
theorem parentEntropy4_real (P : Fin 231 → ℤ) (par : ℕ → ℕ) (hp : ∀ o : Fin 231, ((par o : ℕ) : ℤ) = P o)
    (sz : ℕ → ℕ) (h4 : ∀ o : Fin 231, sz o = OrbitLevel4.sizes o) :
    rationalLogValue (orbitEntropyExpression (fun orbit => (P orbit : ℚ) / ((2 ^ 406 : ℕ) : ℚ)) OrbitLevel4.sizes) =
      ∑ o ∈ Finset.range 231, (-((par o : ℝ) / 2 ^ 406 * Real.log ((par o : ℝ) / 2 ^ 406)) +
        (par o : ℝ) / 2 ^ 406 * Real.log (sz o)) := by
  have hcast : ∀ o : Fin 231, (((P o : ℚ) / ((2 ^ 406 : ℕ) : ℚ) : ℚ) : ℝ) = (par o : ℝ) / 2 ^ 406 := by
    intro o; rw [← hp o]; push_cast; ring
  simp only [orbitEntropyExpression, rationalLogValue_append, entropyLogExpression_value,
    orbitCorrectionExpression_value, entropy, hcast, h4]
  rw [Finset.sum_range (fun o => -((par o : ℝ) / 2 ^ 406 * Real.log ((par o : ℝ) / 2 ^ 406)) +
    (par o : ℝ) / 2 ^ 406 * Real.log (sz o)), Finset.sum_add_distrib, Finset.sum_neg_distrib]
  simp only [h4]

theorem isolated_real4 (node : Fin 105) (role : AxisOrder) (axis : Fin 2)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 45, w col = RootFineCachedParent4.weight node col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 45) (o : Fin 21), ((m col o : ℕ) : ℤ) = childMass4 (ch4 node) role axis col o)
    (iso : ℕ → Bool) (hiso : ∀ col : Fin 45, iso col = isolatedColumn 8 role axis col)
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 21, sz2 o = OrbitLevel3.sizes o) (col : Fin 45) :
    rationalLogValue (isolatedExpression (columns := 45) (children := 21) (isolatedColumn 8 role axis)
        (RootFineCachedParent4.weight node) 17592186044416 (childMass4 (ch4 node) role axis)
        (2 ^ 178) OrbitLevel3.sizes col) =
      if iso col = true then 2 * (w col : ℝ) / 2 ^ 44 * omReal 21 (fun o => (m col o : ℝ) / 2 ^ 178) sz2 else 0 := by
  have hmR : ∀ o : Fin 21, (((childMass4 (ch4 node) role axis col o : ℚ) / ((2 ^ 178 : ℕ) : ℚ) : ℚ) : ℝ) =
      (m col o : ℝ) / 2 ^ 178 := by
    intro o; rw [← hm col o]; push_cast; norm_num
  unfold isolatedExpression
  rw [hiso col]
  by_cases hiw : RootFineCachedParent4.weight node col = 0
  · have : (w col : ℝ) = 0 := by rw [hw col, hiw]; simp
    simp only [hiw, true_or, ite_true, this, mul_zero, zero_div, zero_mul, ite_self]
    simp [rationalLogValue]
  · cases hb : isolatedColumn 8 role axis col
    · simp [rationalLogValue]
    · simp only [hiw, false_or, Bool.true_eq_false, ite_false, ite_true, scaleLogExpression_value]
      rw [omReal_of _ _ (fun o => (m col o : ℝ) / 2 ^ 178) sz2 hmR (fun o => (h2 o).symm), hw col]
      push_cast; ring

theorem pool_real4 (node : Fin 105) (role : AxisOrder) (axis : Fin 2)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 45, w col = RootFineCachedParent4.weight node col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 45) (o : Fin 21), ((m col o : ℕ) : ℤ) = childMass4 (ch4 node) role axis col o)
    (inSec : ℕ → ℕ → Bool) (hsec : ∀ (sec : Fin 9) (col : Fin 45),
      inSec sec col = (!(isolatedColumn 8 role axis col) && decide (poolCoordinate 8 role axis col = sec)))
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 21, sz2 o = OrbitLevel3.sizes o) (sec : Fin 9) :
    rationalLogValue (orbitMassEntropyExpression
      (fun orbit => (coordinatePoolNumerator (columns := 45) (children := 21) (coordinates := 9)
        (isolatedColumn 8 role axis) (poolCoordinate 8 role axis) (RootFineCachedParent4.weight node)
        (childMass4 (ch4 node) role axis) sec orbit : ℚ) / ((17592186044416 : ℕ) * (2 ^ 178 : ℕ) : ℚ))
      OrbitLevel3.sizes) =
      omReal 21 (fun o => (poolN 45 w m inSec sec o : ℝ) / 2 ^ (178 + 44)) sz2 := by
  apply omReal_of _ _ _ sz2 _ (fun o => (h2 o).symm)
  intro o
  have key : (coordinatePoolNumerator (columns := 45) (children := 21) (coordinates := 9)
      (isolatedColumn 8 role axis) (poolCoordinate 8 role axis) (RootFineCachedParent4.weight node)
      (childMass4 (ch4 node) role axis) sec o : ℤ) = (poolN 45 w m inSec sec o : ℤ) := by
    unfold coordinatePoolNumerator poolN
    rw [sumN_eq, Nat.cast_sum, Finset.sum_range]
    apply Finset.sum_congr rfl
    intro col _
    rw [hsec sec col]
    by_cases hz : RootFineCachedParent4.weight node col = 0
    · have : w col = 0 := by rw [hw col, hz]
      cases isolatedColumn 8 role axis col <;> simp [hz, this, raw_mul]
    · cases hi : isolatedColumn 8 role axis col
      · by_cases hc : poolCoordinate 8 role axis col = sec
        · simp [hz, hc, hw col, hm col o]
        · simp [hz, hc]
      · simp [hz]
  rw [key]; push_cast; norm_num

/-- One complete level-four role: builder value = source mass × source expression value. -/
theorem role_value4 (node : Fin 105) (role : AxisOrder) (axis : Fin 2)
    (par : ℕ → ℕ) (hpar : ∀ o : Fin 231, ((par o : ℕ) : ℤ) =
      SuppliedRootFineParent4Integers.numerator node (role.permutation (physicalAxis axis)) o)
    (sz4 : ℕ → ℕ) (h4 : ∀ o : Fin 231, sz4 o = OrbitLevel4.sizes o)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 45, w col = RootFineCachedParent4.weight node col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 45) (o : Fin 21), ((m col o : ℕ) : ℤ) = childMass4 (ch4 node) role axis col o)
    (iso : ℕ → Bool) (hiso : ∀ col : Fin 45, iso col = isolatedColumn 8 role axis col)
    (inSec : ℕ → ℕ → Bool) (hsec : ∀ (sec : Fin 9) (col : Fin 45),
      inSec sec col = (!(isolatedColumn 8 role axis col) && decide (poolCoordinate 8 role axis col = sec)))
    (pool : ℕ → ℕ → ℕ) (hpool : ∀ sec < 9, ∀ o < 21, pool sec o = poolN 45 w m inSec sec o)
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 21, sz2 o = OrbitLevel3.sizes o)
    (cr : ℕ) (hcr : (cr : ℝ) / 2 ^ 88 = (sourceMass4 (node, role) : ℝ)) (tail : List Raw) :
    rawValue 406 (88 + 406) (roleB 231 21 45 9 406 178 par sz4 w m iso pool sz2 cr tail) =
      rationalLogValue (scaleLogExpression (sourceMass4 (node, role)) (sourceExpression4 node role axis)) +
        rawValue 406 (88 + 406) tail := by
  rw [roleB_value 231 21 45 9 406 178 88 (by norm_num), scaleLogExpression_value,
    ← nodeExpression4_value SuppliedRootFineParent4Integers.numerator (fun _ _ _ => rfl) (ch4 node) node
      (fun _ _ _ => rfl), ← hcr]
  congr 2
  simp only [nodeExpression4, rationalLogValue_append, scaleLogExpression_value, poolExpression4,
    splitPoolsExpression, finiteLogSum_value, parentEntropy4]
  rw [parentEntropy4_real _ par hpar sz4 h4, Finset.sum_range (fun col => if iso col = true then
      2 * (w col : ℝ) / 2 ^ 44 * omReal 21 (fun o => (m col o : ℝ) / 2 ^ 178) sz2 else 0),
    Finset.sum_range (fun sec => omReal 21 (fun o => (pool sec o : ℝ) / 2 ^ (178 + 44)) sz2)]
  have hp : ∀ sec : Fin 9, omReal 21 (fun o => (pool sec o : ℝ) / 2 ^ (178 + 44)) sz2 =
      omReal 21 (fun o => (poolN 45 w m inSec sec o : ℝ) / 2 ^ (178 + 44)) sz2 :=
    fun sec => omReal_congr 21 _ _ sz2 (fun o ho => by rw [hpool sec sec.isLt o ho])
  simp only [hp]
  rw [Finset.sum_congr rfl (fun col _ => (isolated_real4 node role axis w hw m hm iso hiso sz2 h2 col).symm),
    Finset.sum_congr rfl (fun sec _ => (pool_real4 node role axis w hw m hm inSec hsec sz2 h2 sec).symm)]
  push_cast
  ring

end MatrixBounds.Numeric.FKLFine4
