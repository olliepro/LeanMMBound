module

public import FKLRoot.Static
public import FKLHier4.Tables
public import FKLBridge.Idx.DyadicZero4
public import RootFineIntegerPools

/-! Fast root child laws (`RootFineIntegerPools.law` at denominator `2^406`) read from the verified
level-four parent table and the zero-coordinate rows, and SWAR-packed root mixtures and coordinate pools
(lanes of 460 bits, denominator `2^450`). -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLRoot

open FKL FKLHier4 FKLFine3 Tensor Tensor.CW
open scoped BigOperators
set_option exponentiation.threshold 1000

/-- The parent integers used throughout. -/
noncomputable abbrev P4 : RootFineCachedRootExpression.Parent4Values := SuppliedRootFineParent4Integers.numerator

/-- Zero-coordinate eight-letter numerator `(zero4 z).numerator o`. -/
noncomputable def fZ4 (z o : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicZero4.tree 6 14 z) o

/-- Oriented zero root child numerator. -/
noncomputable def fZeroR (z c ax o : ℕ) : ℕ :=
  cond (Nat.beq ax (zAx16 c)) (cond (Nat.beq o 0)
      165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064 0)
    (cond (Nat.beq ax (pAx16 c)) (Nat.mul (fZ4 z o) 9394170331095332911557922387157348109502730195633279482829163886128836100458433773854795993539074812127739904)
      (Nat.mul (fZ4 z (comp4 o)) 9394170331095332911557922387157348109502730195633279482829163886128836100458433773854795993539074812127739904))

theorem two406 : (165263992197562149737978827008192759957101170741070304821162198818601447809077836456297302609928821211897803006255839576064 : ℕ) = 2 ^ 406 := by norm_num
theorem two362 : (9394170331095332911557922387157348109502730195633279482829163886128836100458433773854795993539074812127739904 : ℕ) = 2 ^ 362 := by norm_num

/-- Root child law of root column `c` on fine axis `a`. -/
noncomputable def fLaw (a c o : ℕ) : ℕ :=
  (fun k => cond (Nat.blt k 512) (fZeroR k c (axR a) o) (par4T (Nat.sub k 512) (axR a) o)) (kindR c)

/-- Root weight numerator of column `c`. -/
noncomputable def fRW (c : ℕ) : ℕ := FKLBridge.Dyadic.cell (ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0) c

theorem fZ4_eq (z : Fin 48) (o : Fin 231) : fZ4 z o = (SuppliedTypedParameters.zero4 z).numerator o := by
  have hw := (SuppliedTypedParameters.zero4 z).width_eq
  unfold fZ4
  rw [← FKLBridge.Idx.DyadicZero4.get_eq]
  rw [FKLBridge.Dyadic.cell_eq _ o (by
    change o.val < (SuppliedTypedParameters.zero4 z).row.width; rw [hw]; exact o.isLt)]
  rfl

theorem fZ4_le (z : Fin 48) (o : Fin 231) : fZ4 z o ≤ 17592186044416 := by
  rw [fZ4_eq]
  exact row_cell_le _ (SuppliedTypedParameters.zero4 z).accepted o

theorem fRW_eq (c : Fin 153) : fRW c = RootFineIntegerPools.weight c := by
  have hw := SuppliedTypedParameters.rootDistribution.width_eq
  have hg : ptGet FKLBridge.Idx.DyadicRootAlpha.tree 0 1 0 =
      (ParameterIndexData.DyadicRootAlpha.table.get 0).val := (FKLBridge.Idx.DyadicRootAlpha.get_eq 0).symm
  unfold fRW
  rw [hg, FKLBridge.Dyadic.cell_eq _ _ (by
      change c.val < SuppliedTypedParameters.rootDistribution.row.width
      rw [hw]; exact c.isLt)]
  rfl

theorem fRW_le (c : Fin 153) : fRW c ≤ 17592186044416 := by
  rw [fRW_eq]
  exact row_cell_le _ SuppliedTypedParameters.rootDistribution.accepted c

theorem fZeroR_eq (z : Fin 48) (c : Fin 153) (ax : Fin 3) (o : Fin 231) :
    ((fZeroR z c ax o : ℕ) : ℤ) = SuppliedRootFineRoot4Integers.zero z
      ((shapes 16)[c.val]'(lt_of_lt_of_eq c.isLt shapes16_length.symm)) ax o := by
  unfold fZeroR SuppliedRootFineRoot4Integers.zero
  rw [zAx16_eq c, pAx16_eq c]
  simp only [cond_beq, raw_mul]
  generalize hs : (shapes 16)[c.val]'(lt_of_lt_of_eq c.isLt shapes16_length.symm) = sh
  by_cases h1 : ax = SuppliedLeafLaws.zeroAxis sh
  · have : ax.val = (SuppliedLeafLaws.zeroAxis sh).val := by rw [h1]
    simp only [this, ite_true, h1]
    by_cases h0 : o = 0
    · subst h0; norm_num
    · have : o.val ≠ 0 := fun h => h0 (Fin.ext h)
      simp [this, h0]
  · have : ax.val ≠ (SuppliedLeafLaws.zeroAxis sh).val := fun h => h1 (Fin.ext h)
    simp only [this, ite_false, h1]
    by_cases h2 : ax = SuppliedLeafLaws.positiveAxis sh
    · have : ax.val = (SuppliedLeafLaws.positiveAxis sh).val := by rw [h2]
      simp only [this, ite_true, h2]
      rw [fZ4_eq z o]; push_cast; norm_num
    · have : ax.val ≠ (SuppliedLeafLaws.positiveAxis sh).val := fun h => h2 (Fin.ext h)
      simp only [this, ite_false, h2]
      rw [comp4_eq o, fZ4_eq z (OrbitLevel4.complement o)]; push_cast; norm_num

theorem fLaw_eq (a : Fin 2) (c : Fin 153) (o : Fin 231) :
    ((fLaw a c o : ℕ) : ℤ) = RootFineIntegerPools.law P4 a c o := by
  have hk := kindR_eq c
  have hax := axR_eq a
  unfold fLaw RootFineIntegerPools.law RootFineCachedRootExpression.rootNumerator
  rw [hk]
  set ax := SuppliedRootStage.axes (SuppliedRootFine.physicalAxis a) with hax'
  rw [hax]
  cases hkind : SuppliedChildKinds.kind4 c with
  | inl z =>
    simp only
    have hb : Nat.blt z.val 512 = true := Nat.blt_eq.mpr (by have := z.isLt; omega)
    rw [hb, Bool.cond_true]
    exact fZeroR_eq z c ax o
  | inr p =>
    simp only
    have hb : Nat.blt (512 + p.val) 512 = false := by
      cases h : Nat.blt (512 + p.val) 512
      · rfl
      · have := Nat.blt_eq.mp h; omega
    rw [hb, Bool.cond_false, show Nat.sub (512 + p.val) 512 = p.val by rw [raw_sub]; omega]
    exact par4T_int p ax o

theorem fLaw_lt (a : Fin 2) (c : Fin 153) (o : Fin 231) : fLaw a c o < 2 ^ 408 := by
  have hk := kindR_eq c
  unfold fLaw
  rw [hk]
  cases hkind : SuppliedChildKinds.kind4 c with
  | inl z =>
    simp only
    have hb : Nat.blt z.val 512 = true := Nat.blt_eq.mpr (by have := z.isLt; omega)
    rw [hb, Bool.cond_true]
    unfold fZeroR
    have hoc : comp4 o < 231 := by rw [comp4_eq o]; exact (OrbitLevel4.complement o).isLt
    have e1 := fZ4_le z o
    have e2 := fZ4_le z ⟨comp4 o, hoc⟩
    simp only [cond_beq, raw_mul, two362]
    split_ifs
    · norm_num
    · norm_num
    · calc fZ4 z o * 2 ^ 362 ≤ 17592186044416 * 2 ^ 362 := Nat.mul_le_mul_right _ e1
        _ < 2 ^ 408 := by norm_num
    · calc fZ4 z (comp4 o) * 2 ^ 362 ≤ 17592186044416 * 2 ^ 362 := Nat.mul_le_mul_right _ e2
        _ < 2 ^ 408 := by norm_num
  | inr p =>
    simp only
    have hb : Nat.blt (512 + p.val) 512 = false := by
      cases h : Nat.blt (512 + p.val) 512
      · rfl
      · have := Nat.blt_eq.mp h; omega
    rw [hb, Bool.cond_false]
    unfold par4T
    rw [lane_eq]
    exact Nat.mod_lt _ (Nat.two_pow_pos _)

/-! ### Packed mixtures and pools -/

/-- Packed root law of column `c` (lanes of 460 bits). -/
noncomputable def lawVec (a c : ℕ) : ℕ := packN2 460 (fun o => fLaw a c o)

/-- Packed complete root mixture. -/
noncomputable def mixV (a : ℕ) : ℕ := sumN 153 (fun c => Nat.mul (fRW c) (lawVec a c))

/-- Packed coordinate pool of sector `k`. -/
noncomputable def poolV (a k : ℕ) : ℕ := sumN 153 (fun c => Nat.mul (cond (inSecR a k c) (fRW c) 0) (lawVec a c))

noncomputable def mixF (a o : ℕ) : ℕ := lane (mixV a) 460 o
noncomputable def poolF (a k o : ℕ) : ℕ := lane (poolV a k) 460 o

theorem sum_bound (a : Fin 2) (g : ℕ → ℕ) (hg : ∀ c < 153, g c ≤ 17592186044416) (o : ℕ) (ho : o < 231) :
    (∑ c ∈ Finset.range 153, g c * fLaw a c o) < 2 ^ 460 :=
  calc (∑ c ∈ Finset.range 153, g c * fLaw a c o) ≤ ∑ c ∈ Finset.range 153, 17592186044416 * 2 ^ 408 := by
        apply Finset.sum_le_sum; intro c hc
        exact Nat.mul_le_mul (hg c (Finset.mem_range.mp hc)) (le_of_lt (fLaw_lt a ⟨c, Finset.mem_range.mp hc⟩ ⟨o, ho⟩))
    _ < 2 ^ 460 := by rw [Finset.sum_const, Finset.card_range, smul_eq_mul]; norm_num

theorem mixF_eq (a : Fin 2) (o : Fin 231) :
    ((mixF a o : ℕ) : ℤ) = RootFineIntegerPools.mixture P4 a o := by
  unfold mixF mixV lawVec RootFineIntegerPools.mixture RootFineIntegerPools.contribution
  simp only [sumN_eq, raw_mul, packN2_eq]
  rw [sum_packN, lane_packN]
  · rw [Nat.cast_sum, Finset.sum_range]
    apply Finset.sum_congr rfl; intro c _
    rw [Nat.cast_mul, fRW_eq c, fLaw_eq a c o]
  · intro o' ho'
    exact sum_bound a fRW (fun c hc => fRW_le ⟨c, hc⟩) o' ho'
  · exact o.isLt

theorem poolF_eq (a : Fin 2) (k : Fin 17) (o : Fin 231) :
    ((poolF a k o : ℕ) : ℤ) = RootFineIntegerPools.pool P4 a (finSumFinEquiv (Sum.inr k)) o := by
  unfold poolF poolV lawVec
  simp only [sumN_eq, raw_mul, packN2_eq]
  have hg : ∀ c < 153, cond (inSecR a k c) (fRW c) 0 ≤ 17592186044416 := by
    intro c h
    cases inSecR a k c
    · exact Nat.zero_le _
    · exact fRW_le ⟨c, h⟩
  rw [sum_packN, lane_packN]
  · unfold RootFineIntegerPools.pool
    simp only [Equiv.symm_apply_apply]
    rw [Nat.cast_sum, Finset.sum_range]
    apply Finset.sum_congr rfl; intro c _
    unfold inSecR
    rw [isoR_eq a c, coordR_eq a c]
    cases hi : RootFineExecutablePools.isolated a c
    · by_cases hc : RootFineExecutablePools.coordinate a c = k
      · have hb : Nat.beq (RootFineExecutablePools.coordinate a c).val k.val = true := by rw [hc]; exact Nat.beq_refl _
        simp only [Bool.not_false, Bool.true_and, hb, Bool.cond_true, hc, ite_true, Bool.false_eq_true, ite_false]
        rw [Nat.cast_mul, fRW_eq c, fLaw_eq a c o, show Nat.beq k.val k.val = true from Nat.beq_refl _, Bool.cond_true]
        unfold RootFineIntegerPools.contribution; rfl
      · have hb : Nat.beq (RootFineExecutablePools.coordinate a c).val k.val = false :=
          FKLHier4.beq_false (fun e => hc (Fin.ext e))
        simp [hb, hc]
    · simp
  · intro o' ho'
    exact sum_bound a _ hg o' ho'
  · exact o.isLt

end MatrixBounds.Numeric.FKLRoot
