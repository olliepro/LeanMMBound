module

public import FKLHier3.Leaf
public import FKLHier3.ParTree
public import FKLFine3.Pack3

/-! The packed level-three parent table, verified from the leaf table by packed convolutions. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier3

open FKL FKLFine3

/-- Packed parent convolution reading the leaf table. -/
noncomputable def parQT (n s p : ℕ) : ℕ :=
  sumN 15 (fun c => Nat.mul (fW n s c)
    (Nat.mul (packN 840 6 (fun i => Nat.mul (leafT n s c p i) (wsc i)))
      (packN 140 6 (fun j => Nat.mul (leafT n s (fComp n s c) p j) (wsc j)))))

/-- Parent numerator from the leaf table. -/
noncomputable def fParQT (n s p o : ℕ) : ℕ :=
  Nat.mul (sz3 o) (lane (parQT n s p) 140 (Nat.add (Nat.mul 6 (col1 o)) (col2 o)))

/-- Parent lane index. -/
def pidx (s p o : ℕ) : ℕ := Nat.add (Nat.mul (Nat.add (Nat.mul s 3) p) 21) o

/-- Packed parent vector of node `n` (lanes of 144 bits), with literal loop indices. -/
noncomputable def parPack (n : ℕ) : ℕ :=
  sumN 6 (fun s => sumN 3 (fun p => sumN 21 (fun o =>
    Nat.shiftLeft (fParQT n s p o) (Nat.mul 144 (pidx s p o)))))

/-- Table read of the parent numerator. -/
noncomputable def parT (n s p o : ℕ) : ℕ := lane (lane (parTree.get n) 3024 (Nat.add (Nat.mul s 3) p)) 144 o

def ParOK (n : ℕ) : Prop := parTree.get n = parPack n

theorem parOK_of_range (d lo len : ℕ) (h : allRange (fun n => Nat.beq (parTree.get n) (parPack n)) d lo len = true) :
    ∀ i < len, ParOK (lo + i) := by
  intro i hi
  exact Nat.eq_of_beq_eq_true (allRange_sound _ d lo len h i hi)

theorem parQT_eq (n : Fin 945) (hL : LeafOK n) (s : Fin 6) (p : Fin 3) : parQT n s p = parQ n s p := by
  unfold parQT parQ
  simp only [sumN_eq]
  apply Finset.sum_congr rfl; intro c hc
  have hc' := Finset.mem_range.mp hc
  have hcomp : fComp n s c < 15 := by
    rw [fComp_eq n s ⟨c, hc'⟩]; exact (SuppliedRootFineParent3Columns.complement n s ⟨c, hc'⟩).isLt
  have e1 : (fun i => Nat.mul (leafT n s c p i) (wsc i)) = (fun i => Nat.mul (fLeaf n s c p i) (wsc i)) ∨ True := Or.inr trivial
  have hA : packN 840 6 (fun i => Nat.mul (leafT n s c p i) (wsc i)) = packN 840 6 (fun i => Nat.mul (fLeaf n s c p i) (wsc i)) := by
    simp only [packN_eq]; apply Finset.sum_congr rfl; intro i hi
    rw [leafT_eq n hL s ⟨c, hc'⟩ p ⟨i, Finset.mem_range.mp hi⟩]
  have hB : packN 140 6 (fun j => Nat.mul (leafT n s (fComp n s c) p j) (wsc j)) =
      packN 140 6 (fun j => Nat.mul (fLeaf n s (fComp n s c) p j) (wsc j)) := by
    simp only [packN_eq]; apply Finset.sum_congr rfl; intro j hj
    rw [leafT_eq n hL s ⟨_, hcomp⟩ p ⟨j, Finset.mem_range.mp hj⟩]
  rw [hA, hB]

theorem fParQT_eq (n : Fin 945) (hL : LeafOK n) (s : Fin 6) (p : Fin 3) (o : Fin 21) :
    fParQT n s p o = fPar n s p o := by
  rw [← fParQ_eq]
  unfold fParQT fParQ
  rw [parQT_eq n hL s p]

theorem parPack_flat (n : ℕ) : parPack n = packN 144 378 (fun k => fParQT n (k / 63) (k / 21 % 3) (k % 21)) := by
  unfold parPack
  simp only [sumN_eq, packN_eq, raw_shiftLeft, raw_mul, Nat.shiftLeft_eq, pidx, raw_add]
  rw [show (378 : ℕ) = 6 * 63 by norm_num, sum_range_mul]
  apply Finset.sum_congr rfl; intro s hs
  rw [show (63 : ℕ) = 3 * 21 by norm_num, sum_range_mul]
  apply Finset.sum_congr rfl; intro p hp
  apply Finset.sum_congr rfl; intro o ho
  simp only [Finset.mem_range] at hs hp ho
  have k1 : (s * (3 * 21) + (p * 21 + o)) / 63 = s := by omega
  have k2 : (s * (3 * 21) + (p * 21 + o)) / 21 % 3 = p := by omega
  have k3 : (s * (3 * 21) + (p * 21 + o)) % 21 = o := by omega
  rw [k1, k2, k3]
  congr 2
  ring

theorem fParQT_lt (n s p o : ℕ) (ho : o < 21) : fParQT n s p o < 2 ^ 144 := by
  unfold fParQT
  have h1 : sz3 o ≤ 8 := by
    have := sz3_eq ⟨o, ho⟩
    have hb : ∀ o : Fin 21, OrbitLevel3.sizes o ≤ 8 := by decide +kernel
    rw [this]; exact hb ⟨o, ho⟩
  have h2 : lane (parQT n s p) 140 (Nat.add (Nat.mul 6 (col1 o)) (col2 o)) < 2 ^ 140 := by
    rw [lane_eq]; exact Nat.mod_lt _ (Nat.two_pow_pos _)
  simp only [raw_mul]
  calc sz3 o * lane (parQT n s p) 140 (Nat.add (Nat.mul 6 (col1 o)) (col2 o)) < 8 * 2 ^ 140 + 1 := by nlinarith
    _ ≤ 2 ^ 144 := by norm_num

theorem parT_eq (n : Fin 945) (hL : LeafOK n) (hP : ParOK n) (s : Fin 6) (p : Fin 3) (o : Fin 21) :
    parT n s p o = fPar n s p o := by
  unfold parT
  rw [show (3024 : ℕ) = 144 * 21 by norm_num, lane_lane _ _ _ _ _ o.isLt,
    show 21 * Nat.add (Nat.mul s.val 3) p.val + o.val = pidx s.val p.val o.val by simp only [pidx, raw_add, raw_mul]; ring]
  rw [hP, parPack_flat, lane_packN]
  · have hk : pidx s.val p.val o.val < 378 := by simp only [pidx, raw_add, raw_mul]; omega
    have k1 : pidx s.val p.val o.val / 63 = s := by simp only [pidx, raw_add, raw_mul]; omega
    have k2 : pidx s.val p.val o.val / 21 % 3 = p := by simp only [pidx, raw_add, raw_mul]; omega
    have k3 : pidx s.val p.val o.val % 21 = o := by simp only [pidx, raw_add, raw_mul]; omega
    rw [k1, k2, k3, fParQT_eq n hL s p o]
  · intro k hk; exact fParQT_lt _ _ _ _ (Nat.mod_lt _ (by norm_num))
  · simp only [pidx, raw_add, raw_mul]; omega

end MatrixBounds.Numeric.FKLHier3
