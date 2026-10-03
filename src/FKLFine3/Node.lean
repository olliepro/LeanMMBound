module

public import FKLFine3.Role

/-! Node and block raw builders for level-three paired fine, generic over fast data functions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Entropy Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- Fast data for the level-three paired-fine builders, with the facts tying it to the semantic tables.
Indices are natural numbers: node `n`, strategy `s`, role `r`, physical axis `p`, column `c`, orbit `o`. -/
structure Data where
  par : ℕ → ℕ → ℕ → ℕ → ℕ
  w : ℕ → ℕ → ℕ → ℕ
  m : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ
  cr : ℕ → ℕ → ℕ → ℕ
  phys : ℕ → ℕ → ℕ
  iso : ℕ → ℕ → ℕ → Bool
  inSec : ℕ → ℕ → ℕ → ℕ → Bool
  pool : ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ → ℕ
  sz3 : ℕ → ℕ
  sz2 : ℕ → ℕ

/-- The semantic facts a `Data` must satisfy. -/
structure Data.Valid (D : Data) : Prop where
  phys : ∀ (r : Fin 6) (axis : Fin 2), D.phys r axis = ((SuppliedRoleIndex.order r).permutation (physicalAxis axis)).val
  par : ∀ (n : Fin 945) (s : Fin 6) (p : Fin 3) (o : Fin 21),
    ((D.par n s p o : ℕ) : ℤ) = SuppliedRootFineParent3Integers.numerator n s p o
  w : ∀ (n : Fin 945) (s : Fin 6) (c : Fin 15), D.w n s c = SuppliedRootFineParent3Columns.weight n s c
  m : ∀ (n : Fin 945) (s : Fin 6) (p : Fin 3) (c : Fin 15) (o : Fin 6),
    ((D.m n s p c o : ℕ) : ℤ) = SuppliedRootFineParent3Columns.leaf n s c p o
  cr : ∀ (n : Fin 945) (s : Fin 6) (r : Fin 6),
    (D.cr n s r : ℝ) / 2 ^ 176 = (sourceMass3 ((n, s), SuppliedRoleIndex.order r) : ℝ)
  iso : ∀ (r : Fin 6) (axis : Fin 2) (c : Fin 15), D.iso r axis c = isolatedColumn 4 (SuppliedRoleIndex.order r) axis c
  inSec : ∀ (r : Fin 6) (axis : Fin 2) (sec : Fin 5) (c : Fin 15), D.inSec r axis sec c =
    (!(isolatedColumn 4 (SuppliedRoleIndex.order r) axis c) &&
      decide (poolCoordinate 4 (SuppliedRoleIndex.order r) axis c = sec))
  pool : ∀ (n : Fin 945) (s : Fin 6) (r : Fin 6) (axis : Fin 2), ∀ sec < 5, ∀ o < 6,
    D.pool n s (D.phys r axis) r axis sec o = poolN 15 (D.w n s) (D.m n s (D.phys r axis)) (D.inSec r axis) sec o
  sz3 : ∀ o : Fin 21, D.sz3 o = OrbitLevel3.sizes o
  sz2 : ∀ o : Fin 6, D.sz2 o = OrbitLevel2.sizes o

/-- One role, skipped when its population is zero. -/
noncomputable def roleRaw (D : Data) (n s r axis : ℕ) (tail : List Raw) : List Raw :=
  cond (Nat.beq (D.cr n s r) 0) tail
    (roleB 21 6 15 5 134 44 (D.par n s (D.phys r axis)) D.sz3 (D.w n s) (D.m n s (D.phys r axis))
      (D.iso r axis) (D.pool n s (D.phys r axis) r axis) D.sz2 (D.cr n s r) tail)

/-- All strategies and roles of one node. -/
noncomputable def nodeRaw (D : Data) (n axis : ℕ) (tail : List Raw) : List Raw :=
  loopL 6 (fun s t => loopL 6 (fun r t => roleRaw D n s r axis t) t) tail

/-- The seven nodes of one block. -/
noncomputable def blockRaw (D : Data) (b axis : ℕ) (tail : List Raw) : List Raw :=
  loopL 7 (fun j t => nodeRaw D (Nat.add (Nat.mul 7 b) j) axis t) tail

theorem roleRaw_value (D : Data) (hD : D.Valid) (n : Fin 945) (s : Fin 6) (r : Fin 6) (axis : Fin 2)
    (tail : List Raw) :
    rawValue 134 310 (roleRaw D n s r axis tail) =
      rationalLogValue (scaleLogExpression (sourceMass3 ((n, s), SuppliedRoleIndex.order r))
        (sourceExpression3 (n, s) (SuppliedRoleIndex.order r) axis)) + rawValue 134 310 tail := by
  unfold roleRaw
  by_cases h0 : D.cr n s r = 0
  · have hb : Nat.beq (D.cr n s r) 0 = true := by rw [h0]; rfl
    rw [hb, Bool.cond_true, scaleLogExpression_value]
    have := hD.cr n s r
    rw [h0] at this
    simp only [Nat.cast_zero, zero_div] at this
    rw [← this, zero_mul, zero_add]
  · have hb : Nat.beq (D.cr n s r) 0 = false := by
      cases h : Nat.beq (D.cr n s r) 0
      · rfl
      · exact absurd (Nat.eq_of_beq_eq_true h) h0
    rw [hb, Bool.cond_false]
    have hpool := hD.pool n s r axis
    rw [hD.phys r axis] at hpool ⊢
    exact role_value n s (SuppliedRoleIndex.order r) axis _ (fun o => hD.par n s _ o) D.sz3 hD.sz3
      (D.w n s) (hD.w n s) _ (fun c o => by rw [hD.m n s _ c o]; rfl) _ (hD.iso r axis) _ (hD.inSec r axis)
      _ hpool D.sz2 hD.sz2 _ (hD.cr n s r) tail

theorem nodeRaw_value (D : Data) (hD : D.Valid) (n : Fin 945) (axis : Fin 2) (tail : List Raw) :
    rawValue 134 310 (nodeRaw D n axis tail) = rationalLogValue (sourceSum3 n axis) + rawValue 134 310 tail := by
  unfold nodeRaw
  rw [rawValue_loopL 134 310 6 _ (fun s => if h : s < 6 then rationalLogValue (finiteLogSum (fun role : Fin 6 =>
      scaleLogExpression (sourceMass3 ((n, ⟨s, h⟩), SuppliedRoleIndex.order role))
        (sourceExpression3 (n, ⟨s, h⟩) (SuppliedRoleIndex.order role) axis))) else 0)]
  · rw [sourceSum3, finiteLogSum_value, Finset.sum_range]
    simp only [Fin.is_lt, dite_true]
  · intro s hs t
    rw [rawValue_loopL 134 310 6 _ (fun r => if h : r < 6 then rationalLogValue (scaleLogExpression
        (sourceMass3 ((n, ⟨s, hs⟩), SuppliedRoleIndex.order ⟨r, h⟩))
        (sourceExpression3 (n, ⟨s, hs⟩) (SuppliedRoleIndex.order ⟨r, h⟩) axis)) else 0)]
    · rw [dif_pos hs, finiteLogSum_value, Finset.sum_range]
      simp only [Fin.is_lt, dite_true]
    · intro r hr t'
      rw [dif_pos hr]
      exact roleRaw_value D hD n ⟨s, hs⟩ ⟨r, hr⟩ axis t'

theorem blockRaw_value (D : Data) (hD : D.Valid) (b : Fin 135) (axis : Fin 2) (tail : List Raw) :
    rawValue 134 310 (blockRaw D b axis tail) =
      (∑ offset : Fin 7, rationalLogValue (sourceSum3 (finProdFinEquiv (b, offset)) axis)) + rawValue 134 310 tail := by
  unfold blockRaw
  rw [rawValue_loopL 134 310 7 _ (fun j => if h : j < 7 then
      rationalLogValue (sourceSum3 (finProdFinEquiv (b, ⟨j, h⟩)) axis) else 0)]
  · rw [Finset.sum_range]; simp only [Fin.is_lt, dite_true]
  · intro j hj t
    rw [dif_pos hj]
    have hlt : Nat.add (Nat.mul 7 b.val) j < 945 := by
      have := b.isLt; simp only [raw_add, raw_mul]; omega
    have e : finProdFinEquiv (b, ⟨j, hj⟩) = (⟨Nat.add (Nat.mul 7 b.val) j, hlt⟩ : Fin 945) := by
      ext; simp [finProdFinEquiv, raw_add, raw_mul]; ring
    rw [e]
    exact nodeRaw_value D hD ⟨_, hlt⟩ axis t

end MatrixBounds.Numeric.FKLFine3
