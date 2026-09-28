import SuppliedRootFineParent4Integers
import RootFineColumnConvolution

/-! Verified parent3 integer tables can be substituted into complete finite-column parent4 arithmetic. -/
namespace MatrixBounds.Numeric.RootFineCachedParent4

open Tensor.CW
noncomputable section

/-- Complete original integer parent3 coordinates required by every higher convolution. -/
abbrev Parent3Values := Fin 945 → Fin 6 → Fin 3 → Fin 21 → ℤ

/-- All six original strategies are mixed using their exact source coefficients. -/
def mixed (parent3 : Parent3Values) (node : Fin 945) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  integerMixtureNumerator (SuppliedTypedParameters.strategies node).numerator
    (fun strategy => parent3 node strategy axis) orbit

/-- Replacing every cached parent3 value by its verified source identity preserves the complete mixture. -/
theorem mixed_eq (parent3 : Parent3Values)
    (sourceEq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (node : Fin 945) (axis : Fin 3) (orbit : Fin 21) :
    mixed parent3 node axis orbit = SuppliedRootFineChild3Integers.mixed node axis orbit := by
  simp only [mixed, SuppliedRootFineChild3Integers.mixed, integerMixtureNumerator, sourceEq]

/-- Complete finite child columns retain all positive, zero-coordinate, and absent source positions. -/
def child (parent3 : Parent3Values) (parent : Fin 105) (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  match SuppliedNodeLookup.lookup parent column with
  | none => 0
  | some (Sum.inl node) => mixed parent3 node axis orbit
  | some (Sum.inr node) => SuppliedRootFineChild3Integers.zero node ((shapes 8)[column.val]) axis orbit

/-- The finite-column child lookup has exactly its complete original integer meaning. -/
theorem child_eq (parent3 : Parent3Values)
    (sourceEq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (parent : Fin 105) (column : Fin 45) (axis : Fin 3) (orbit : Fin 21) :
    child parent3 parent column axis orbit =
      SuppliedRootFineChild3Integers.numerator parent (shapeColumnEquiv 8 column) axis orbit := by
  simp only [child, SuppliedRootFineChild3Integers.numerator, Equiv.symm_apply_apply,
    mixed_eq parent3 sourceEq]
  rfl

/-- Original level-four split weights are read directly from their finite source columns. -/
def weight (parent : Fin 105) (column : Fin 45) : ℕ :=
  (SuppliedParameters.alpha4 parent).val.row.atColumn column.val

/-- Direct sparse-column access is the actual supported parent split numerator. -/
theorem weight_eq (parent : Fin 105) (column : Fin 45) :
    weight parent column = (SuppliedTypedParameters.level4Split parent).numerator (shapeColumnEquiv 8 column) := by
  symm
  exact checkedSplit_numerator_column (length := 4)
    (SuppliedParameters.alpha4 parent).val (SuppliedParameters.alpha4 parent).property
    (ParameterIndexMetadata.split_total ParameterIndexData.SplitAlpha4.table
      SuppliedParameterChecks.SplitAlpha4_metadata parent) column

/-- Original totalized parent complement on all45 finite child columns. -/
def complement (parent : Fin 105) (column : Fin 45) : Fin 45 :=
  let split := SuppliedTypedParameters.level4Split parent
  (shapeColumnEquiv 8).symm (complementEquiv split.parent 8 split.balanced (shapeColumnEquiv 8 column))

/-- Complete parent4 convolution evaluated from a verified parent3 integer table. -/
def numerator (parent3 : Parent3Values) (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) : ℤ :=
  SuppliedRootFineParent3Integers.sparseIntegerParent (weight parent) (complement parent)
    OrbitLevel4.sizes OrbitLevel4.encoding.columns SuppliedRootFineParent4Integers.wordScale
    (fun column => child parent3 parent column axis) orbit

/-- Every cached finite-column convolution equals the original complete parent4 integer numerator. -/
theorem numerator_eq (parent3 : Parent3Values)
    (sourceEq : ∀ node strategy axis orbit, parent3 node strategy axis orbit =
      SuppliedRootFineParent3Integers.numerator node strategy axis orbit)
    (parent : Fin 105) (axis : Fin 3) (orbit : Fin 231) :
    numerator parent3 parent axis orbit = SuppliedRootFineParent4Integers.numerator parent axis orbit := by
  let split := SuppliedTypedParameters.level4Split parent
  have identity := integerParentNumerator_enumeration (shapeColumnEquiv 8)
    split.numerator (complementEquiv split.parent 8 split.balanced)
    OrbitLevel4.sizes OrbitLevel4.encoding.columns SuppliedRootFineParent4Integers.wordScale
    (fun column => SuppliedRootFineChild3Integers.numerator parent column axis) orbit
  have weights := funext (weight_eq parent)
  have children : (fun column => child parent3 parent column axis) =
      (fun column => SuppliedRootFineChild3Integers.numerator parent (shapeColumnEquiv 8 column) axis) :=
    funext (fun column => funext (child_eq parent3 sourceEq parent column axis))
  simpa only [numerator, SuppliedRootFineParent4Integers.numerator,
    SuppliedRootFineParent3Integers.sparseIntegerParent_eq, weights, children, complement, split]
    using identity.symm

end
end MatrixBounds.Numeric.RootFineCachedParent4
