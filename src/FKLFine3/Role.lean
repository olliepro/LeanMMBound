module

public import SuppliedPairedFineBlocks
public import FKLFine3.Orbit

/-! The generic role builder computes the exact value of one level-three paired-fine role. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Entropy Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

theorem isolated_real (node : Fin 945) (s : Fin 6) (role : AxisOrder) (axis : Fin 2)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 15, w col = SuppliedRootFineParent3Columns.weight node s col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 15) (o : Fin 6), ((m col o : ℕ) : ℤ) = childMass3 (node, s) role axis col o)
    (iso : ℕ → Bool) (hiso : ∀ col : Fin 15, iso col = isolatedColumn 4 role axis col)
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 6, sz2 o = OrbitLevel2.sizes o) (col : Fin 15) :
    rationalLogValue (isolatedExpression (columns := 15) (children := 6) (isolatedColumn 4 role axis)
        (SuppliedRootFineParent3Columns.weight node s) 17592186044416 (childMass3 (node, s) role axis)
        17592186044416 OrbitLevel2.sizes col) =
      if iso col = true then 2 * (w col : ℝ) / 2 ^ 44 * omReal 6 (fun o => (m col o : ℝ) / 2 ^ 44) sz2 else 0 := by
  have hmR : ∀ o : Fin 6, (((childMass3 (node, s) role axis col o : ℚ) / ((17592186044416 : ℕ) : ℚ) : ℚ) : ℝ) =
      (m col o : ℝ) / 2 ^ 44 := by
    intro o; rw [← hm col o]; push_cast; norm_num
  unfold isolatedExpression
  rw [hiso col]
  by_cases hiw : SuppliedRootFineParent3Columns.weight node s col = 0
  · have : (w col : ℝ) = 0 := by rw [hw col, hiw]; simp
    simp only [hiw, true_or, if_true, this, mul_zero, zero_div, zero_mul, ite_self]
    simp [rationalLogValue]
  · cases hb : isolatedColumn 4 role axis col
    · simp [rationalLogValue]
    · simp only [hiw, false_or, Bool.true_eq_false, if_false, if_true, scaleLogExpression_value]
      rw [omReal_of _ _ (fun o => (m col o : ℝ) / 2 ^ 44) sz2 hmR (fun o => (h2 o).symm), hw col]
      push_cast; ring

theorem pool_real (node : Fin 945) (s : Fin 6) (role : AxisOrder) (axis : Fin 2)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 15, w col = SuppliedRootFineParent3Columns.weight node s col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 15) (o : Fin 6), ((m col o : ℕ) : ℤ) = childMass3 (node, s) role axis col o)
    (inSec : ℕ → ℕ → Bool) (hsec : ∀ (sec : Fin 5) (col : Fin 15),
      inSec sec col = (!(isolatedColumn 4 role axis col) && decide (poolCoordinate 4 role axis col = sec)))
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 6, sz2 o = OrbitLevel2.sizes o) (sec : Fin 5) :
    rationalLogValue (orbitMassEntropyExpression
      (fun orbit => (coordinatePoolNumerator (columns := 15) (children := 6) (coordinates := 5)
        (isolatedColumn 4 role axis) (poolCoordinate 4 role axis) (SuppliedRootFineParent3Columns.weight node s)
        (childMass3 (node, s) role axis) sec orbit : ℚ) / ((17592186044416 : ℕ) * (17592186044416 : ℕ) : ℚ))
      OrbitLevel2.sizes) =
      omReal 6 (fun o => (poolN 15 w m inSec sec o : ℝ) / 2 ^ (44 + 44)) sz2 := by
  apply omReal_of _ _ _ sz2 _ (fun o => (h2 o).symm)
  intro o
  have key : (coordinatePoolNumerator (columns := 15) (children := 6) (coordinates := 5)
      (isolatedColumn 4 role axis) (poolCoordinate 4 role axis) (SuppliedRootFineParent3Columns.weight node s)
      (childMass3 (node, s) role axis) sec o : ℤ) = (poolN 15 w m inSec sec o : ℤ) := by
    unfold coordinatePoolNumerator poolN
    rw [sumN_eq, Nat.cast_sum, Finset.sum_range]
    apply Finset.sum_congr rfl
    intro col _
    rw [hsec sec col]
    by_cases hz : SuppliedRootFineParent3Columns.weight node s col = 0
    · have : w col = 0 := by rw [hw col, hz]
      cases isolatedColumn 4 role axis col <;> simp [hz, this, raw_mul]
    · cases hi : isolatedColumn 4 role axis col
      · by_cases hc : poolCoordinate 4 role axis col = sec
        · simp [hz, hc, hw col, hm col o]
        · simp [hz, hc]
      · simp [hz]
  rw [key]; push_cast; norm_num

theorem omReal_congr (n : ℕ) (a b : ℕ → ℝ) (sz : ℕ → ℕ) (h : ∀ o < n, a o = b o) :
    omReal n a sz = omReal n b sz := by
  unfold omReal
  have h1 : (∑ o ∈ Finset.range n, a o * Real.log (a o)) = ∑ o ∈ Finset.range n, b o * Real.log (b o) :=
    Finset.sum_congr rfl (fun o ho => by rw [h o (Finset.mem_range.mp ho)])
  have h2 : (∑ o ∈ Finset.range n, a o) = ∑ o ∈ Finset.range n, b o :=
    Finset.sum_congr rfl (fun o ho => h o (Finset.mem_range.mp ho))
  have h3 : (∑ o ∈ Finset.range n, a o * Real.log (sz o)) = ∑ o ∈ Finset.range n, b o * Real.log (sz o) :=
    Finset.sum_congr rfl (fun o ho => by rw [h o (Finset.mem_range.mp ho)])
  rw [h1, h2, h3]

/-- One complete role: builder value = source mass × source expression value. -/
theorem role_value (node : Fin 945) (s : Fin 6) (role : AxisOrder) (axis : Fin 2)
    (par : ℕ → ℕ) (hpar : ∀ o : Fin 21, ((par o : ℕ) : ℤ) =
      SuppliedRootFineParent3Integers.numerator node s (role.permutation (physicalAxis axis)) o)
    (sz3 : ℕ → ℕ) (h3 : ∀ o : Fin 21, sz3 o = OrbitLevel3.sizes o)
    (w : ℕ → ℕ) (hw : ∀ col : Fin 15, w col = SuppliedRootFineParent3Columns.weight node s col)
    (m : ℕ → ℕ → ℕ) (hm : ∀ (col : Fin 15) (o : Fin 6), ((m col o : ℕ) : ℤ) = childMass3 (node, s) role axis col o)
    (iso : ℕ → Bool) (hiso : ∀ col : Fin 15, iso col = isolatedColumn 4 role axis col)
    (inSec : ℕ → ℕ → Bool) (hsec : ∀ (sec : Fin 5) (col : Fin 15),
      inSec sec col = (!(isolatedColumn 4 role axis col) && decide (poolCoordinate 4 role axis col = sec)))
    (pool : ℕ → ℕ → ℕ) (hpool : ∀ sec < 5, ∀ o < 6, pool sec o = poolN 15 w m inSec sec o)
    (sz2 : ℕ → ℕ) (h2 : ∀ o : Fin 6, sz2 o = OrbitLevel2.sizes o)
    (cr : ℕ) (hcr : (cr : ℝ) / 2 ^ 176 = (sourceMass3 ((node, s), role) : ℝ)) (tail : List Raw) :
    rawValue 134 (176 + 134) (roleB 21 6 15 5 134 44 par sz3 w m iso pool sz2 cr tail) =
      rationalLogValue (scaleLogExpression (sourceMass3 ((node, s), role)) (sourceExpression3 (node, s) role axis)) +
        rawValue 134 (176 + 134) tail := by
  rw [roleB_value 21 6 15 5 134 44 176 (by norm_num), scaleLogExpression_value,
    ← nodeExpression3_value SuppliedRootFineParent3Integers.numerator (fun _ _ _ _ => rfl), ← hcr]
  congr 2
  simp only [nodeExpression3, rationalLogValue_append, scaleLogExpression_value, poolExpression3,
    splitPoolsExpression, finiteLogSum_value, parentEntropy3]
  rw [parentEntropy_real _ par hpar sz3 h3, Finset.sum_range (fun col => if iso col = true then
      2 * (w col : ℝ) / 2 ^ 44 * omReal 6 (fun o => (m col o : ℝ) / 2 ^ 44) sz2 else 0),
    Finset.sum_range (fun sec => omReal 6 (fun o => (pool sec o : ℝ) / 2 ^ (44 + 44)) sz2)]
  have hp : ∀ sec : Fin 5, omReal 6 (fun o => (pool sec o : ℝ) / 2 ^ (44 + 44)) sz2 =
      omReal 6 (fun o => (poolN 15 w m inSec sec o : ℝ) / 2 ^ (44 + 44)) sz2 :=
    fun sec => omReal_congr 6 _ _ sz2 (fun o ho => by rw [hpool sec sec.isLt o ho])
  simp only [hp]
  rw [Finset.sum_congr rfl (fun col _ => (isolated_real node s role axis w hw m hm iso hiso sz2 h2 col).symm),
    Finset.sum_congr rfl (fun sec _ => (pool_real node s role axis w hw m hm inSec hsec sz2 h2 sec).symm)]
  push_cast
  ring

end MatrixBounds.Numeric.FKLFine3
