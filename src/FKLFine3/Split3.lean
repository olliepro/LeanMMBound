module

public import FKLFine3.Static
public import FKL.Range
public import FKLBridge.Split
public import FKLBridge.Idx.SplitAlpha3

/-! Fast level-three split weights and paired complements. -/

@[expose] public section

namespace MatrixBounds.Numeric.FKLFine3

open FKL Tensor Tensor.CW SuppliedPairedFine

/-- Packed split-row index of node `n`, strategy `s`. -/
noncomputable def sa3 (n s : ℕ) : ℕ := ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 (Nat.add (Nat.mul n 6) s)

/-- Split weight numerator of column `c`. -/
noncomputable def fW (n s c : ℕ) : ℕ := FKLBridge.Split.cell (sa3 n s) c

/-- Column index of the total-four shape `(x, y, 4-x-y)`. -/
def idx4 (x y : ℕ) : ℕ := Nat.add (Nat.div (Nat.mul x (Nat.sub 11 x)) 2) y

/-- Paired complement column of column `c` under the node's split parent. -/
noncomputable def fComp (n s c : ℕ) : ℕ :=
  (fun r => cond (Bool.and (Nat.ble (shX c) (FKLBridge.Split.parentX r))
      (Bool.and (Nat.ble (shY c) (FKLBridge.Split.parentY r)) (Nat.ble (shZ c) (FKLBridge.Split.parentZ r))))
    (idx4 (Nat.sub (FKLBridge.Split.parentX r) (shX c)) (Nat.sub (FKLBridge.Split.parentY r) (shY c))) c) (sa3 n s)

theorem sa3_eq (n : Fin 945) (s : Fin 6) :
    sa3 n s = (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s)).val := by
  rw [FKLBridge.Idx.SplitAlpha3.get_eq, SuppliedParameters.flat2_val]; rfl

/-- Every level-three split row has the fifteen original columns. -/
theorem widthsOK : allRange (fun i => Nat.beq (FKLBridge.Split.width (ptGet FKLBridge.Idx.SplitAlpha3.tree 7 13 i)) 15)
    13 0 5670 = true := by decide +kernel

theorem width15 (n : Fin 945) (s : Fin 6) :
    (SuppliedParameters.alpha3 n s).val.row.width = 15 := by
  have hi := allRange_sound _ 13 0 5670 widthsOK (SuppliedParameters.flat2 n s).val (SuppliedParameters.flat2 n s).isLt
  simp only [Nat.zero_add, Nat.beq_eq] at hi
  rw [← FKLBridge.Idx.SplitAlpha3.get_eq, FKLBridge.Split.width_eq] at hi
  exact hi

theorem fW_eq (n : Fin 945) (s : Fin 6) (c : Fin 15) :
    fW n s c = SuppliedRootFineParent3Columns.weight n s c := by
  unfold fW SuppliedRootFineParent3Columns.weight
  rw [sa3_eq, FKLBridge.Split.cell_eq _ c (by
    change c.val < (SuppliedParameters.alpha3 n s).val.row.width; rw [width15]; exact c.isLt)]
  rfl

theorem idx4_shape : ∀ c : Fin 15, idx4 (shX c) (shY c) = c.val := by decide +kernel

theorem shapeCol_apply (c : Fin 15) : ((shapeColumnEquiv 4 c).val : Shape) = shape4 c := rfl

theorem idx4_lt (t : Shape) (h : t ∈ shapes 4) : idx4 t.x t.y < 15 := by
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.mp h
  have hi' : i < 15 := by rw [shapes4_length] at hi; exact hi
  have := idx4_shape ⟨i, hi'⟩
  have hs := shape_eq ⟨i, hi'⟩
  simp only [List.getElem?_eq_getElem hi, Option.map_some, Option.some.injEq, Prod.mk.injEq] at hs
  rw [hs.1, hs.2.1, this]; exact hi'

theorem shapeCol_symm (t : Shape) (h : t ∈ shapes 4) :
    (((shapeColumnEquiv 4).symm ⟨t, h⟩ : Fin (shapes 4).length) : ℕ) = idx4 t.x t.y := by
  obtain ⟨i, hi, rfl⟩ := List.mem_iff_getElem.mp h
  have hi' : i < 15 := by rw [shapes4_length] at hi; exact hi
  have hs := shape_eq ⟨i, hi'⟩
  simp only [List.getElem?_eq_getElem hi, Option.map_some, Option.some.injEq, Prod.mk.injEq] at hs
  rw [hs.1, hs.2.1, idx4_shape ⟨i, hi'⟩]
  have : (shapeColumnEquiv 4).symm ⟨(shapes 4)[i], h⟩ = ⟨i, hi⟩ := by
    rw [Equiv.symm_apply_eq]; rfl
  have := congrArg Fin.val this
  convert this using 2

theorem fComp_eq (n : Fin 945) (s : Fin 6) (c : Fin 15) :
    fComp n s c = (SuppliedRootFineParent3Columns.complement n s c).val := by
  have hP : ∀ f, f = FKLBridge.Split.parentX ∨ True := fun _ => Or.inr trivial
  have px := FKLBridge.Split.parentX_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  have py := FKLBridge.Split.parentY_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  have pz := FKLBridge.Split.parentZ_eq (ParameterIndexData.SplitAlpha3.table.get (SuppliedParameters.flat2 n s))
  rw [← sa3_eq] at px py pz
  have hs := shape_eq c
  simp only [List.getElem?_eq_getElem (lt_of_lt_of_eq c.isLt shapes4_length.symm), Option.map_some,
    Option.some.injEq, Prod.mk.injEq] at hs
  unfold fComp SuppliedRootFineParent3Columns.complement complementEquiv
  simp only [Function.Involutive.coe_toPerm, complementSymbol]
  set P := (SuppliedTypedParameters.level3Split n s).parent with hPdef
  have hPx : FKLBridge.Split.parentX (sa3 n s) = P.x := px
  have hPy : FKLBridge.Split.parentY (sa3 n s) = P.y := py
  have hPz : FKLBridge.Split.parentZ (sa3 n s) = P.z := pz
  rw [hPx, hPy, hPz]
  have e4 : ((shapeColumnEquiv 4 c).val : Shape) = (shapes 4)[c.val]'(lt_of_lt_of_eq c.isLt shapes4_length.symm) := rfl
  by_cases hf : ((shapeColumnEquiv 4 c).val).Fits P
  · rw [dif_pos hf]
    have hf' : shX c ≤ P.x ∧ shY c ≤ P.y ∧ shZ c ≤ P.z := by
      rw [e4] at hf; unfold Shape.Fits at hf; rw [hs.1, hs.2.1, hs.2.2] at hf; exact hf
    have hb : Bool.and (Nat.ble (shX c) P.x) (Bool.and (Nat.ble (shY c) P.y) (Nat.ble (shZ c) P.z)) = true := by
      simp [Nat.ble_eq, hf'.1, hf'.2.1, hf'.2.2]
    simp only [hb, Bool.cond_true]
    rw [shapeCol_symm]
    simp only [Shape.complement, e4, hs.1, hs.2.1, raw_sub]
    rfl
  · rw [dif_neg hf]
    have hf' : ¬ (shX c ≤ P.x ∧ shY c ≤ P.y ∧ shZ c ≤ P.z) := by
      rw [e4] at hf; unfold Shape.Fits at hf; rw [hs.1, hs.2.1, hs.2.2] at hf; exact hf
    have hb : Bool.and (Nat.ble (shX c) P.x) (Bool.and (Nat.ble (shY c) P.y) (Nat.ble (shZ c) P.z)) = false := by
      by_contra hc
      simp only [Bool.not_eq_false, Bool.and_eq_true, Nat.ble_eq] at hc
      exact hf' hc
    simp only [hb, Bool.cond_false]
    exact (congrArg Fin.val ((shapeColumnEquiv 4).symm_apply_apply c)).symm

end MatrixBounds.Numeric.FKLFine3
