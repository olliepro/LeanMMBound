import SuppliedPairedFinePhysicalPools
import RootFineSingletonPools

/-! Original paired compatibility labels retain forced singleton children and the exact physical coordinate pools. -/
namespace MatrixBounds.Numeric.SuppliedPairedFine

open Tensor Tensor.CW Entropy
noncomputable section
set_option maxRecDepth 3000

/-- The actual fine-axis rule marking separately constrained original child columns. -/
def isolatedColumn (total : ℕ) (role : AxisOrder) (axis : Fin 2)
    (column : Fin (shapes total).length) : Bool :=
  let shape := (physicalChildren total role column).val
  if axis = 0 then decide (shape.z = 0) else decide (shape.x = 0 ∨ shape.y = 0)

/-- The original physical axis coordinate selecting each remaining compatibility pool. -/
def poolCoordinate (total : ℕ) (role : AxisOrder) (axis : Fin 2)
    (column : Fin (shapes total).length) : Fin (total+1) :=
  if axis = 0 then shapeCoordinate (physicalChildren total role column) 1
  else shapeCoordinate (physicalChildren total role column) 2

/-- The physical sector inverse is the singleton or coordinate label of the physical child. -/
theorem physicalLabel_unfold (total : ℕ) (role : AxisOrder) (axis : Fin 2)
    (column : Fin (shapes total).length) :
    physicalLabel total role axis column = finSumFinEquiv
      ((Equiv.sumCongr (physicalChildren total role) (Equiv.refl (Fin (total+1)))).symm
        (actualClass axis (physicalChildren total role column))) := by
  simp only [physicalLabel, physicalSectors, Equiv.symm_trans_apply, Equiv.symm_symm]

/-- Physical singleton labels are precisely the original source columns, with all remaining coordinate labels intact. -/
theorem physicalLabel_eq (total : ℕ) (role : AxisOrder) (axis : Fin 2)
    (column : Fin (shapes total).length) :
    physicalLabel total role axis column = finSumFinEquiv
      (singletonPoolLabel (isolatedColumn total role axis) (poolCoordinate total role axis) column) := by
  rw [physicalLabel_unfold]
  congr 1
  unfold actualClass isolatedColumn poolCoordinate singletonPoolLabel
  fin_cases axis
  · simp only [Fin.zero_eta, Fin.isValue, if_true, yClass, shapeCoordinate, Shape.coordinates,
      Equiv.coe_fn_mk, Matrix.cons_val_one, decide_eq_true_eq]
    split_ifs <;> simp_all [Equiv.sumCongr_symm, Equiv.sumCongr_apply]
  · simp only [Fin.mk_one, Fin.isValue, if_neg (by decide : (1 : Fin 2) ≠ 0), zClass, shapeCoordinate,
      Shape.coordinates, Equiv.coe_fn_mk, Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons,
      decide_eq_true_eq]
    split_ifs <;> simp_all [Equiv.sumCongr_symm, Equiv.sumCongr_apply]

end
end MatrixBounds.Numeric.SuppliedPairedFine
