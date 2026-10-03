module

public import FKLHier4.Par4
public import FKLHier4.ChildAll
public import FKLHier4.Par4Tree

/-! The packed level-four parent table, verified per parent from the child table by packed convolutions
(one multiplication per column computes all `21 × 21` orbit-pair products). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL FKLFine3 Tensor Tensor.CW
open scoped BigOperators
set_option exponentiation.threshold 1000

/-- Packed parent convolution reading the child table: lane `21 i + j` (width 416) is
`Σ_c w_c · (child c i · wsc i) · (child (comp c) j · wsc j)`. -/
noncomputable def parQ4 (p a : ℕ) : ℕ :=
  sumN 45 (fun c => (fun w => cond (Nat.beq w 0) 0 (Nat.mul w
    (Nat.mul (packN 8736 21 (fun i => Nat.mul (childT p c a i) (wsc4 i)))
      (packN 416 21 (fun j => Nat.mul (childT p (fComp4 p c) a j) (wsc4 j)))))) (fW4 p c))

/-- Parent numerator read from the packed convolution. -/
noncomputable def fPar4Q (p a o : ℕ) : ℕ :=
  Nat.mul (sz4 o) (lane (parQ4 p a) 416 (Nat.add (Nat.mul 21 (col41 o)) (col42 o)))

theorem condw_mul (w X : ℕ) : cond (Nat.beq w 0) 0 (Nat.mul w X) = w * X := by
  by_cases hw : w = 0
  · subst hw; rw [show Nat.beq 0 0 = true from rfl, Bool.cond_true, Nat.zero_mul]
  · rw [beq_false hw]; rfl

theorem fPar4Q_eq (p : Fin 105) (a : Fin 3) (o : Fin 231) : fPar4Q p a o = fPar4 p a o := by
  have hC := child_all p p.isLt
  obtain ⟨h1, h2⟩ := cols4_lt o
  unfold fPar4Q fPar4 parQ4
  congr 1
  simp only [condw_mul, sumN_eq]
  have hm : ∀ c ∈ Finset.range 45, fW4 p c * (Nat.mul (packN 8736 21 (fun i => Nat.mul (childT p c a i) (wsc4 i)))
      (packN 416 21 (fun j => Nat.mul (childT p (fComp4 p c) a j) (wsc4 j)))) =
      fW4 p c * packN 416 (21 * 21) (fun t => (fChild p c a (t / 21) * wsc4 (t / 21)) *
        (fChild p (fComp4 p c) a (t % 21) * wsc4 (t % 21))) := by
    intro c hc
    have hc' := Finset.mem_range.mp hc
    have hcomp := fComp4_lt p ⟨c, hc'⟩
    have hA : packN 8736 21 (fun i => Nat.mul (childT p c a i) (wsc4 i)) =
        packN (21 * 416) 21 (fun i => fChild p c a i * wsc4 i) := by
      rw [packN_eq, packN_eq]; apply Finset.sum_congr rfl; intro i hi
      rw [childT_eq p hC c a i hc' a.isLt (Finset.mem_range.mp hi)]; rfl
    have hB : packN 416 21 (fun j => Nat.mul (childT p (fComp4 p c) a j) (wsc4 j)) =
        packN 416 21 (fun j => fChild p (fComp4 p c) a j * wsc4 j) := by
      rw [packN_eq, packN_eq]; apply Finset.sum_congr rfl; intro j hj
      rw [childT_eq p hC (fComp4 p c) a j hcomp a.isLt (Finset.mem_range.mp hj)]; rfl
    rw [hA, hB, raw_mul, packN_mul]
  rw [Finset.sum_congr rfl hm, sum_packN, lane_packN]
  · have e1 : (21 * col41 o + col42 o) / 21 = col41 o := by omega
    have e2 : (21 * col41 o + col42 o) % 21 = col42 o := by omega
    simp only [raw_add, raw_mul, e1, e2]
    apply Finset.sum_congr rfl; intro c _
    by_cases hw : fW4 p c = 0
    · rw [hw, show Nat.beq 0 0 = true from rfl, Bool.cond_true, Nat.zero_mul]
    · rw [beq_false hw, Bool.cond_false]; ring
  · intro t ht
    have hi : t / 21 < 21 := by omega
    have hj : t % 21 < 21 := Nat.mod_lt _ (by norm_num)
    calc (∑ c ∈ Finset.range 45, fW4 p c * ((fChild p c a (t / 21) * wsc4 (t / 21)) *
            (fChild p (fComp4 p c) a (t % 21) * wsc4 (t % 21))))
        ≤ ∑ c ∈ Finset.range 45, 17592186044416 * ((2 ^ 180 * 8) * (2 ^ 180 * 8)) := by
          apply Finset.sum_le_sum; intro c hc
          have hc' := Finset.mem_range.mp hc
          have hcomp := fComp4_lt p ⟨c, hc'⟩
          apply Nat.mul_le_mul (fW4_le p ⟨c, hc'⟩)
          apply Nat.mul_le_mul
          · exact Nat.mul_le_mul (le_of_lt (fChild_lt p c a _ hc' a.isLt hi)) (wsc4_le ⟨_, hi⟩)
          · exact Nat.mul_le_mul (le_of_lt (fChild_lt p _ a _ hcomp a.isLt hj)) (wsc4_le ⟨_, hj⟩)
      _ < 2 ^ 416 := by norm_num
  · simp only [raw_add, raw_mul]; omega

/-! ### The packed parent table -/

/-- Packed parent vector of parent `p` (lanes of 408 bits, index `a*231+o`). -/
noncomputable def par4Pack (p : ℕ) : ℕ := packN 94248 3 (fun a => packN2 408 (fun o => fPar4Q p a o))

/-- Per-parent kernel check of the parent table. -/
noncomputable def par4Chk (p : ℕ) : Bool := Nat.beq (par4Tree.get p) (par4Pack p)

def Par4OK (p : ℕ) : Prop := par4Chk p = true

theorem par4OK_of_range (d lo len : ℕ) (h : allRange par4Chk d lo len = true) :
    ∀ i < len, Par4OK (lo + i) := fun i hi => allRange_sound _ d lo len h i hi

/-- Table read of the level-four parent numerator. -/
noncomputable def par4T (p a o : ℕ) : ℕ := lane (lane (par4Tree.get p) 94248 a) 408 o

theorem fPar4Q_lt (p : Fin 105) (a o : ℕ) (ha : a < 3) (ho : o < 231) : fPar4Q p a o < 2 ^ 408 := by
  have e := fPar4Q_eq p ⟨a, ha⟩ ⟨o, ho⟩
  have hle := fPar4_le p ⟨a, ha⟩ ⟨o, ho⟩
  simp only at e hle
  rw [e]
  exact lt_of_le_of_lt hle (by norm_num)

theorem par4T_eq (p : Fin 105) (h : Par4OK p) (a : Fin 3) (o : Fin 231) : par4T p a o = fPar4 p a o := by
  have hg : par4Tree.get p = par4Pack p := Nat.eq_of_beq_eq_true h
  have hv : ∀ a < 3, packN 408 231 (fun o => fPar4Q p a o) < 2 ^ 94248 := fun a ha =>
    lt_of_lt_of_eq (packN_lt 408 231 _ (fun o ho => fPar4Q_lt p a o ha ho)) (congrArg (2 ^ ·) (by norm_num))
  unfold par4T
  rw [hg, par4Pack]
  simp only [packN2_eq]
  rw [lane_packN _ _ _ hv a a.isLt,
    lane_packN _ _ _ (fun o ho => fPar4Q_lt p a o a.isLt ho) o o.isLt, fPar4Q_eq]

end MatrixBounds.Numeric.FKLHier4
