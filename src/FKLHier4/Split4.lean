module

public import FKLHier4.Static
public import FKLFine3.Split3
public import FKLFine3.Weight3
public import FKLFine3.Bounds3
public import RootFineCachedParent4

/-! Fast level-four split weights and paired complements. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLHier4

open FKL FKLFine3 Tensor Tensor.CW

/-- Packed split-row index of parent `p`. -/
noncomputable def sa4 (p : ℕ) : ℕ := ptGet FKLBridge.Idx.SplitAlpha4.tree 7 13 p

/-- Level-four split weight numerator of column `c`. -/
noncomputable def fW4 (p c : ℕ) : ℕ := FKLBridge.Split.cell (sa4 p) c

/-- Paired complement column of column `c` under the parent shape of `p`. -/
noncomputable def fComp4 (p c : ℕ) : ℕ :=
  (fun r => cond (Bool.and (Nat.ble (sh8X c) (FKLBridge.Split.parentX r))
      (Bool.and (Nat.ble (sh8Y c) (FKLBridge.Split.parentY r)) (Nat.ble (sh8Z c) (FKLBridge.Split.parentZ r))))
    (idx8 (Nat.sub (FKLBridge.Split.parentX r) (sh8X c)) (Nat.sub (FKLBridge.Split.parentY r) (sh8Y c))) c) (sa4 p)

theorem sa4_eq (p : Fin 105) : sa4 p = (ParameterIndexData.SplitAlpha4.table.get p).val := by
  rw [FKLBridge.Idx.SplitAlpha4.get_eq]; rfl

theorem fW4_eq (p : Fin 105) (c : Fin 45) : fW4 p c = RootFineCachedParent4.weight p c := by
  unfold fW4 RootFineCachedParent4.weight
  rw [sa4_eq, FKLBridge.Split.cell_eq _ c (by
    change c.val < (SuppliedParameters.alpha4 p).val.row.width; rw [width45]; exact c.isLt)]
  rfl

theorem fW4_le (p : Fin 105) (c : Fin 45) : fW4 p c ≤ 17592186044416 := by
  rw [fW4_eq]
  exact row_cell_le _ (SplitRow.check_sound (SuppliedParameters.alpha4 p).property).1 c

theorem shapeCol8_symm (t : Shape) (h : t ∈ shapes 8) :
    (((shapeColumnEquiv 8).symm ⟨t, h⟩ : Fin (shapes 8).length) : ℕ) = idx8 t.x t.y := by
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.mp h
  have hi' : i < 45 := by rw [shapes8_length] at hi; exact hi
  have hs := shape8_eq ⟨i, hi'⟩
  simp only [List.getElem?_eq_getElem hi, Option.map_some, Option.some.injEq, Prod.mk.injEq] at hs
  rw [hs.1, hs.2.1, idx8_shape ⟨i, hi'⟩]
  have : (shapeColumnEquiv 8).symm ⟨(shapes 8)[i], h⟩ = ⟨i, hi⟩ := by
    rw [Equiv.symm_apply_eq]; rfl
  have := congrArg Fin.val this
  convert this using 2

theorem fComp4_eq (p : Fin 105) (c : Fin 45) :
    fComp4 p c = (RootFineCachedParent4.complement p c).val := by
  have px := FKLBridge.Split.parentX_eq (ParameterIndexData.SplitAlpha4.table.get p)
  have py := FKLBridge.Split.parentY_eq (ParameterIndexData.SplitAlpha4.table.get p)
  have pz := FKLBridge.Split.parentZ_eq (ParameterIndexData.SplitAlpha4.table.get p)
  rw [← sa4_eq] at px py pz
  have hs := shape8_eq c
  simp only [List.getElem?_eq_getElem (lt_of_lt_of_eq c.isLt shapes8_length.symm), Option.map_some,
    Option.some.injEq, Prod.mk.injEq] at hs
  unfold fComp4 RootFineCachedParent4.complement complementEquiv
  simp only [Function.Involutive.coe_toPerm, complementSymbol]
  set P := (SuppliedTypedParameters.level4Split p).parent with hPdef
  have hPx : FKLBridge.Split.parentX (sa4 p) = P.x := px
  have hPy : FKLBridge.Split.parentY (sa4 p) = P.y := py
  have hPz : FKLBridge.Split.parentZ (sa4 p) = P.z := pz
  rw [hPx, hPy, hPz]
  have e8 : ((shapeColumnEquiv 8 c).val : Shape) = (shapes 8)[c.val]'(lt_of_lt_of_eq c.isLt shapes8_length.symm) := rfl
  by_cases hf : ((shapeColumnEquiv 8 c).val).Fits P
  · rw [dif_pos hf]
    have hf' : sh8X c ≤ P.x ∧ sh8Y c ≤ P.y ∧ sh8Z c ≤ P.z := by
      rw [e8] at hf; unfold Shape.Fits at hf; rw [hs.1, hs.2.1, hs.2.2] at hf; exact hf
    have hb : Bool.and (Nat.ble (sh8X c) P.x) (Bool.and (Nat.ble (sh8Y c) P.y) (Nat.ble (sh8Z c) P.z)) = true := by
      simp [Nat.ble_eq, hf'.1, hf'.2.1, hf'.2.2]
    simp only [hb, Bool.cond_true]
    rw [shapeCol8_symm]
    simp only [Shape.complement, e8, hs.1, hs.2.1, raw_sub]
    rfl
  · rw [dif_neg hf]
    have hf' : ¬ (sh8X c ≤ P.x ∧ sh8Y c ≤ P.y ∧ sh8Z c ≤ P.z) := by
      rw [e8] at hf; unfold Shape.Fits at hf; rw [hs.1, hs.2.1, hs.2.2] at hf; exact hf
    have hb : Bool.and (Nat.ble (sh8X c) P.x) (Bool.and (Nat.ble (sh8Y c) P.y) (Nat.ble (sh8Z c) P.z)) = false := by
      by_contra hc
      simp only [Bool.not_eq_false, Bool.and_eq_true, Nat.ble_eq] at hc
      exact hf' hc
    simp only [hb, Bool.cond_false]
    exact (congrArg Fin.val ((shapeColumnEquiv 8).symm_apply_apply c)).symm

theorem fComp4_lt (p : Fin 105) (c : Fin 45) : fComp4 p c < 45 := by
  rw [fComp4_eq]; exact (RootFineCachedParent4.complement p c).isLt

end MatrixBounds.Numeric.FKLHier4
