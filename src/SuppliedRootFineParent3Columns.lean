import RootFineColumnConvolution

/-! A finite-column implementation of the exact supplied level-three parent law. -/
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Columns

set_option maxHeartbeats 4000000
set_option maxRecDepth 100000

open Tensor.CW
noncomputable section

/-- The original level-three split numerator is read directly at its source column. -/
def weight (node : Fin 945) (strategy : Fin 6) (column : Fin 15) : ℕ :=
  (SuppliedParameters.alpha3 node strategy).val.row.atColumn column.val

/-- Direct source-column lookup is exactly the actual split's numerator. -/
theorem weight_eq (node : Fin 945) (strategy : Fin 6) (column : Fin 15) :
    weight node strategy column =
      (SuppliedTypedParameters.level3Split node strategy).numerator (shapeColumnEquiv 4 column) := by
  symm
  exact checkedSplit_numerator_column (length := 2)
    (SuppliedParameters.alpha3 node strategy).val
    (SuppliedParameters.alpha3 node strategy).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha3.table
      SuppliedParameterChecks.SplitAlpha3_metadata (SuppliedParameters.flat2 node strategy)) column

/-- Complete original child masses on the finite original shape columns. -/
def leaf (node : Fin 945) (strategy : Fin 6) (column : Fin 15) (axis : Fin 3) (orbit : Fin 6) : ℤ :=
  match SuppliedChildKinds.kind2 column with
  | Sum.inl selected => SuppliedRootFineLeafIntegers.zero node selected strategy
      ((shapes 4)[column.val]) axis orbit
  | Sum.inr selected => SuppliedRootFineLeafIntegers.terminal node selected strategy axis orbit

/-- The executable finite-column child vector retains its complete original physical law. -/
theorem leaf_eq (node : Fin 945) (strategy : Fin 6) (column : Fin 15) (axis : Fin 3) (orbit : Fin 6) :
    leaf node strategy column axis orbit =
      SuppliedRootFineLeafIntegers.leaf node strategy (shapeColumnEquiv 4 column) axis orbit := by
  simp only [leaf, SuppliedRootFineLeafIntegers.leaf, Equiv.symm_apply_apply]
  rfl

/-- The actual totalized complementary permutation expressed on original columns. -/
def complement (node : Fin 945) (strategy : Fin 6) (column : Fin 15) : Fin 15 :=
  let split := SuppliedTypedParameters.level3Split node strategy
  (shapeColumnEquiv 4).symm (complementEquiv split.parent 4 split.balanced (shapeColumnEquiv 4 column))

/-- Exact complete parent convolution on fifteen concrete source columns. -/
def numerator (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (weight node strategy)
    (complement node strategy) OrbitLevel3.sizes OrbitLevel3.encoding.columns
    SuppliedRootFineParent3Integers.wordScale (fun column => leaf node strategy column axis) orbit

/-- The finite-column convolution equals the complete original source-indexed integer numerator. -/
theorem numerator_eq (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    numerator node strategy axis orbit = SuppliedRootFineParent3Integers.numerator node strategy axis orbit := by
  let split := SuppliedTypedParameters.level3Split node strategy
  have identity := integerParentNumerator_enumeration (shapeColumnEquiv 4)
    split.numerator (complementEquiv split.parent 4 split.balanced)
    OrbitLevel3.sizes OrbitLevel3.encoding.columns SuppliedRootFineParent3Integers.wordScale
    (fun child => SuppliedRootFineLeafIntegers.leaf node strategy child axis) orbit
  have weights := funext (weight_eq node strategy)
  have leaves : (fun column => leaf node strategy column axis) =
      (fun column => SuppliedRootFineLeafIntegers.leaf node strategy (shapeColumnEquiv 4 column) axis) :=
    funext (fun column => funext (leaf_eq node strategy column axis))
  simpa only [numerator, SuppliedRootFineParent3Integers.numerator,
    SuppliedRootFineParent3Integers.sparseIntegerParent_eq, weights, leaves, complement, split]
    using identity.symm

end
end MatrixBounds.Numeric.SuppliedRootFineParent3Columns
