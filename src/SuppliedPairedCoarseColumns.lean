import SuppliedPairedCoarseExpressions
import RootFineColumnConvolution

/-! Replace dependent shape searches in the supplied coarse expressions with
proved direct reads at their original finite parameter columns. -/
namespace MatrixBounds.Numeric.SuppliedPairedCoarse

open Tensor Tensor.CW
noncomputable section
set_option maxRecDepth 5000
set_option maxHeartbeats 1000000

/-- Original level-four split mass read directly at a complete source column. -/
def columnMass4 (source : Fin 105) (column : Fin 45) : ℚ :=
  ((SuppliedParameters.alpha4 source).val.row.atColumn column.val : ℚ)/17592186044416

/-- Original level-three split mass read directly at a complete source column. -/
def columnMass3 (source : SuppliedStage3.Source) (column : Fin 15) : ℚ :=
  ((SuppliedParameters.alpha3 source.1 source.2).val.row.atColumn column.val : ℚ)/17592186044416

/-- Physical relabeling preserves the original source-column level-four split mass. -/
theorem columnMass4_eq (source : Fin 105) (role : Fin 6) (column : Fin 45) :
    ((SuppliedStage4.split source (SuppliedRoleIndex.order role)).numerator (enumeration4 role column) : ℚ)/17592186044416 =
      columnMass4 source column := by
  dsimp only [SuppliedStage4.split, RationalSplit.permute, enumeration4, Equiv.trans_apply, Function.comp_apply]
  rw [Equiv.symm_apply_apply]
  change ((SuppliedTypedParameters.level4Split source).numerator (shapeColumnEquiv 8 column) : ℚ)/_ = _
  rw [SuppliedTypedParameters.level4Split, checkedSplit_numerator_column (length := 4)]
  rfl

/-- Physical relabeling preserves the original source-column level-three split mass. -/
theorem columnMass3_eq (source : SuppliedStage3.Source) (role : Fin 6) (column : Fin 15) :
    ((SuppliedStage3.split source (SuppliedRoleIndex.order role)).numerator (enumeration3 role column) : ℚ)/17592186044416 =
      columnMass3 source column := by
  dsimp only [SuppliedStage3.split, RationalSplit.permute, enumeration3, Equiv.trans_apply, Function.comp_apply]
  rw [Equiv.symm_apply_apply]
  change ((SuppliedTypedParameters.level3Split source.1 source.2).numerator (shapeColumnEquiv 4 column) : ℚ)/_ = _
  rw [SuppliedTypedParameters.level3Split, checkedSplit_numerator_column (length := 2)]
  rfl

/-- Direct original-column implementation of the complete level-four coarse expression. -/
def directExpression4 (source : Fin 105) (role : Fin 6) : RationalLogExpression :=
  PairedCoarseColumns.expression (length := 4)
    (SuppliedStage4.split source (SuppliedRoleIndex.order role)).parent (enumeration4 role)
    (columnMass4 source) (potential4 source role)

/-- Direct original-column implementation of the complete level-three coarse expression. -/
def directExpression3 (source : SuppliedStage3.Source) (role : Fin 6) : RationalLogExpression :=
  PairedCoarseColumns.expression (length := 2)
    (SuppliedStage3.split source (SuppliedRoleIndex.order role)).parent (enumeration3 role)
    (columnMass3 source) (potential3 source role)

/-- The direct level-four implementation is identical term by term to the actual source expression. -/
theorem directExpression4_eq (source : Fin 105) (role : Fin 6) :
    sourceExpression4 source role = directExpression4 source role := by
  unfold sourceExpression4 directExpression4
  dsimp only
  rw [funext (columnMass4_eq source role)]

/-- The direct level-three implementation is identical term by term to the actual source expression. -/
theorem directExpression3_eq (source : SuppliedStage3.Source) (role : Fin 6) :
    sourceExpression3 source role = directExpression3 source role := by
  unfold sourceExpression3 directExpression3
  dsimp only
  rw [funext (columnMass3_eq source role)]

end
end MatrixBounds.Numeric.SuppliedPairedCoarse
