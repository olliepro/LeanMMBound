module

public import FKLFine4.Role4

/-! Source and block raw builders for level-four paired fine, generic over fast data functions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine4

open FKL FKLFine3 Entropy Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- Fast data for the level-four paired-fine builders. Indices: source `p`, role `r`, physical axis `ph`,
fine axis `a`, column `c`, orbit `o`, sector `sec`. -/
structure Data4 where
  par : ℕ → ℕ → ℕ → ℕ
  w : ℕ → ℕ → ℕ
  m : ℕ → ℕ → ℕ → ℕ → ℕ
  cr : ℕ → ℕ → ℕ
  phys : ℕ → ℕ → ℕ
  iso : ℕ → ℕ → ℕ → Bool
  inSec : ℕ → ℕ → ℕ → ℕ → Bool
  pool : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ
  sz4 : ℕ → ℕ
  sz3 : ℕ → ℕ

/-- The semantic facts a `Data4` must satisfy. -/
structure Data4.Valid (D : Data4) : Prop where
  phys : ∀ (r : Fin 6) (axis : Fin 2), D.phys r axis = ((SuppliedRoleIndex.order r).permutation (physicalAxis axis)).val
  par : ∀ (p : Fin 105) (ph : Fin 3) (o : Fin 231),
    ((D.par p ph o : ℕ) : ℤ) = SuppliedRootFineParent4Integers.numerator p ph o
  w : ∀ (p : Fin 105) (c : Fin 45), D.w p c = RootFineCachedParent4.weight p c
  m : ∀ (p : Fin 105) (ph : Fin 3) (c : Fin 45) (o : Fin 21),
    ((D.m p ph c o : ℕ) : ℤ) = SuppliedRootFineChild3Integers.numerator p (shapeColumnEquiv 8 c) ph o
  cr : ∀ (p : Fin 105) (r : Fin 6), (D.cr p r : ℝ) / 2 ^ 88 = (sourceMass4 (p, SuppliedRoleIndex.order r) : ℝ)
  iso : ∀ (r : Fin 6) (axis : Fin 2) (c : Fin 45), D.iso r axis c = isolatedColumn 8 (SuppliedRoleIndex.order r) axis c
  inSec : ∀ (r : Fin 6) (axis : Fin 2) (sec : Fin 9) (c : Fin 45), D.inSec r axis sec c =
    (!(isolatedColumn 8 (SuppliedRoleIndex.order r) axis c) &&
      decide (poolCoordinate 8 (SuppliedRoleIndex.order r) axis c = sec))
  pool : ∀ (p : Fin 105) (r : Fin 6) (axis : Fin 2), ∀ sec < 9, ∀ o < 21,
    D.pool p (D.phys r axis) r axis sec o = poolN 45 (D.w p) (D.m p (D.phys r axis)) (D.inSec r axis) sec o
  sz4 : ∀ o : Fin 231, D.sz4 o = OrbitLevel4.sizes o
  sz3 : ∀ o : Fin 21, D.sz3 o = OrbitLevel3.sizes o

/-- One role, skipped when its population is zero. -/
noncomputable def roleRaw4 (D : Data4) (p r axis : ℕ) (tail : List Raw) : List Raw :=
  cond (Nat.beq (D.cr p r) 0) tail
    (roleB 231 21 45 9 406 178 (D.par p (D.phys r axis)) D.sz4 (D.w p) (D.m p (D.phys r axis))
      (D.iso r axis) (D.pool p (D.phys r axis) r axis) D.sz3 (D.cr p r) tail)

/-- All six roles of one source. -/
noncomputable def nodeRaw4 (D : Data4) (p axis : ℕ) (tail : List Raw) : List Raw :=
  loopL 6 (fun r t => roleRaw4 D p r axis t) tail

/-- The seven sources of one block. -/
noncomputable def blockRaw4 (D : Data4) (b axis : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => nodeRaw4 D (Nat.add (Nat.mul 7 b) j) axis t) tail

theorem roleRaw4_value (D : Data4) (hD : D.Valid) (p : Fin 105) (r : Fin 6) (axis : Fin 2) (tail : List Raw) :
    rawValue 406 494 (roleRaw4 D p r axis tail) =
      rationalLogValue (scaleLogExpression (sourceMass4 (p, SuppliedRoleIndex.order r))
        (sourceExpression4 p (SuppliedRoleIndex.order r) axis)) + rawValue 406 494 tail := by
  unfold roleRaw4
  by_cases h0 : D.cr p r = 0
  · have hb : Nat.beq (D.cr p r) 0 = true := by rw [h0]; rfl
    rw [hb, Bool.cond_true, scaleLogExpression_value]
    have := hD.cr p r
    rw [h0] at this
    simp only [Nat.cast_zero, zero_div] at this
    rw [← this, zero_mul, zero_add]
  · have hb : Nat.beq (D.cr p r) 0 = false := by
      cases h : Nat.beq (D.cr p r) 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) h0
    rw [hb, Bool.cond_false]
    have hpool := hD.pool p r axis
    rw [hD.phys r axis] at hpool ⊢
    exact role_value4 p (SuppliedRoleIndex.order r) axis _ (fun o => hD.par p _ o) D.sz4 hD.sz4
      (D.w p) (hD.w p) _ (fun c o => by rw [hD.m p _ c o]; rfl) _ (hD.iso r axis) _ (hD.inSec r axis)
      _ hpool D.sz3 hD.sz3 _ (hD.cr p r) tail

theorem nodeRaw4_value (D : Data4) (hD : D.Valid) (p : Fin 105) (axis : Fin 2) (tail : List Raw) :
    rawValue 406 494 (nodeRaw4 D p axis tail) = rationalLogValue (sourceSum4 p axis) + rawValue 406 494 tail := by
  unfold nodeRaw4
  rw [rawValue_loopL 406 494 6 _ (fun r => if h : r < 6 then rationalLogValue (scaleLogExpression
      (sourceMass4 (p, SuppliedRoleIndex.order ⟨r, h⟩))
      (sourceExpression4 p (SuppliedRoleIndex.order ⟨r, h⟩) axis)) else 0)]
  · rw [sourceSum4, finiteLogSum_value, Finset.sum_range]
    simp only [Fin.is_lt, dite_true]
  · intro r hr t
    rw [dif_pos hr]
    exact roleRaw4_value D hD p ⟨r, hr⟩ axis t

theorem blockRaw4_value (D : Data4) (hD : D.Valid) (b : Fin 15) (axis : Fin 2) (tail : List Raw) :
    rawValue 406 494 (blockRaw4 D b axis tail) =
      (∑ offset : Fin 7, rationalLogValue (sourceSum4 (finProdFinEquiv (b, offset)) axis)) + rawValue 406 494 tail := by
  unfold blockRaw4
  rw [rawValue_loopL 406 494 7 _ (fun j => if h : j < 7 then
      rationalLogValue (sourceSum4 (finProdFinEquiv (b, ⟨j, h⟩)) axis) else 0)]
  · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 7 b.val) j < 105 := by
      have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, ⟨j, hj⟩) = (⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 105) := by
      ext; simp [finProdFinEquiv, raw_add, raw_mul]; ring
    rw [e]
    exact nodeRaw4_value D hD ⟨_, hlt⟩ axis t

end MatrixBounds.Numeric.FKLFine4
