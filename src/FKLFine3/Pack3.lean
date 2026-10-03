module

public import FKLFine3.Par3
public import FKLFine3.Bounds3
public import FKL.Pack
public import FKL.FineRole

/-! Packed (SWAR) level-three pools and parent convolutions, proved equal to the scalar versions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine
open scoped BigOperators

/-- The six leaf numerators of column `c` as one packed number (lanes of 96 bits). -/
noncomputable def leafVec (n s p c : ℕ) : ℕ := packN 96 6 (fun o => fLeaf n s c p o)

/-- Packed pooled numerators of one sector. -/
noncomputable def poolV (n s p r a sec : ℕ) : ℕ :=
  sumN 15 (fun c => Nat.mul (cond (inSec r a sec c) (Nat.mul 2 (fW n s c)) 0) (leafVec n s p c))

/-- Pool numerator read from the packed sector vector. -/
noncomputable def fPool (n s p r a sec o : ℕ) : ℕ := lane (poolV n s p r a sec) 96 o

/-- Packed parent convolution: lanes `6 i + j` of width 140. -/
noncomputable def parQ (n s p : ℕ) : ℕ :=
  sumN 15 (fun c => Nat.mul (fW n s c)
    (Nat.mul (packN 840 6 (fun i => Nat.mul (fLeaf n s c p i) (wsc i)))
      (packN 140 6 (fun j => Nat.mul (fLeaf n s (fComp n s c) p j) (wsc j)))))

/-- Parent numerator read from the packed convolution. -/
noncomputable def fParQ (n s p o : ℕ) : ℕ :=
  Nat.mul (sz3 o) (lane (parQ n s p) 140 (Nat.add (Nat.mul 6 (col1 o)) (col2 o)))

theorem wsc_le : ∀ i : Fin 6, wsc i ≤ 2 := by decide +kernel
theorem cols_lt : ∀ o : Fin 21, col1 o < 6 ∧ col2 o < 6 := by decide +kernel

theorem fPool_eq (n : Fin 945) (s : Fin 6) (p : Fin 3) (r a : ℕ) (sec : ℕ) (o : ℕ) (ho : o < 6) :
    fPool n s p r a sec o = poolN 15 (fW n s) (fun c o => fLeaf n s c p o) (inSec r a) sec o := by
  unfold fPool poolV poolN leafVec
  have hk : ∀ c, Nat.mul (cond (inSec r a sec c) (Nat.mul 2 (fW n s c)) 0) (packN 96 6 (fun o => fLeaf n s c p o)) =
      (cond (inSec r a sec c) (2 * fW n s c) 0) * packN 96 6 (fun o => fLeaf n s c p o) := by
    intro c; cases inSec r a sec c <;> rfl
  simp only [hk, sumN_eq]
  rw [sum_packN, lane_packN]
  · apply Finset.sum_congr rfl; intro c _
    cases inSec r a sec c <;> simp [raw_mul, Nat.mul_assoc]
  · intro o' ho'
    calc (∑ c ∈ Finset.range 15, cond (inSec r a sec c) (2 * fW n s c) 0 * fLeaf n s c p o')
        ≤ ∑ c ∈ Finset.range 15, (2 * 17592186044416) * 17592186044416 := by
          apply Finset.sum_le_sum; intro c hc
          have hc' := Finset.mem_range.mp hc
          have hw : fW n s c ≤ 17592186044416 := fW_le n s ⟨c, hc'⟩
          have hl : fLeaf n s c p o' ≤ 17592186044416 := fLeaf_le n s ⟨c, hc'⟩ p ⟨o', ho'⟩
          apply Nat.mul_le_mul _ hl
          cases inSec r a sec c <;> simp <;> omega
      _ < 2 ^ 96 := by norm_num
  · exact ho

theorem fParQ_eq (n : Fin 945) (s : Fin 6) (p : Fin 3) (o : Fin 21) : fParQ n s p o = fPar n s p o := by
  obtain ⟨h1, h2⟩ := cols_lt o
  unfold fParQ fPar parQ
  congr 1
  have hm : ∀ c, Nat.mul (fW n s c) (Nat.mul (packN 840 6 (fun i => Nat.mul (fLeaf n s c p i) (wsc i)))
      (packN 140 6 (fun j => Nat.mul (fLeaf n s (fComp n s c) p j) (wsc j)))) =
      fW n s c * packN 140 (6 * 6) (fun t => (fLeaf n s c p (t / 6) * wsc (t / 6)) *
        (fLeaf n s (fComp n s c) p (t % 6) * wsc (t % 6))) := by
    intro c
    rw [show (840 : ℕ) = 6 * 140 by norm_num]
    simp only [raw_mul]
    rw [packN_mul]
  simp only [hm, sumN_eq]
  rw [sum_packN, lane_packN]
  · have e1 : (6 * col1 o + col2 o) / 6 = col1 o := by omega
    have e2 : (6 * col1 o + col2 o) % 6 = col2 o := by omega
    simp only [raw_add, raw_mul, e1, e2]
    apply Finset.sum_congr rfl; intro c _
    by_cases hw : fW n s c = 0
    · simp [hw]
    · have : Nat.beq (fW n s c) 0 = false := by
        cases h : Nat.beq (fW n s c) 0
        · rfl
        · exact absurd (Nat.eq_of_beq_eq_true h) hw
      simp only [this, Bool.cond_false, raw_mul]
      ring
  · intro t ht
    calc (∑ c ∈ Finset.range 15, fW n s c * ((fLeaf n s c p (t / 6) * wsc (t / 6)) *
            (fLeaf n s (fComp n s c) p (t % 6) * wsc (t % 6))))
        ≤ ∑ c ∈ Finset.range 15, 17592186044416 * ((17592186044416 * 2) * (17592186044416 * 2)) := by
          apply Finset.sum_le_sum; intro c hc
          have hc' := Finset.mem_range.mp hc
          have hcomp : fComp n s c < 15 := by
            rw [fComp_eq n s ⟨c, hc'⟩]; exact (SuppliedRootFineParent3Columns.complement n s ⟨c, hc'⟩).isLt
          have hi : t / 6 < 6 := by omega
          have hj : t % 6 < 6 := Nat.mod_lt _ (by norm_num)
          apply Nat.mul_le_mul (fW_le n s ⟨c, hc'⟩)
          apply Nat.mul_le_mul
          · exact Nat.mul_le_mul (fLeaf_le n s ⟨c, hc'⟩ p ⟨_, hi⟩) (wsc_le ⟨_, hi⟩)
          · exact Nat.mul_le_mul (fLeaf_le n s ⟨_, hcomp⟩ p ⟨_, hj⟩) (wsc_le ⟨_, hj⟩)
      _ < 2 ^ 140 := by norm_num
  · simp only [raw_add, raw_mul]; omega

end MatrixBounds.Numeric.FKLFine3
