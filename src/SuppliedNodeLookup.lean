module

public import SuppliedNodeLookupData
public import ShapeAlphabet

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedNodeLookup

/-- The complete lookup is correct at every actual parent and child, including all absent pairs. -/
theorem lookup_correct (parent : Fin 105) (child : Fin 45) : correct parent child := by
  have checked := correctComplete.complete (finProdFinEquiv (parent, child))
  have projection := finProdFinEquiv.symm_apply_apply (parent, child)
  change ((finProdFinEquiv (parent, child)).divNat, (finProdFinEquiv (parent, child)).modNat) = (parent, child) at projection
  have pair := Prod.mk.inj projection
  simpa only [correctAt, pair.1, pair.2] using checked

/-- The grid lookup preserves every original positive node label. -/
theorem positive_inverse (node : Fin 945) : positiveInverse node := positiveComplete.complete node

/-- The grid lookup preserves every original zero node label. -/
theorem zero_inverse (node : Fin 840) : zeroInverse node := zeroComplete.complete node

/-- Every fitting child has an actual original hierarchy node. -/
theorem lookup_ne_none (parent : Fin 105) (child : Fin 45)
    (fits : (SuppliedShapeIndices.shapeAt 8 child.val).Fits (SuppliedHierarchyParents.parent4 parent)) :
    lookup parent child ≠ none := by
  intro absent
  have checked := lookup_correct parent child
  simp only [correct, absent] at checked
  exact checked fits

/-- Formal alphabet selection agrees with the original shape-column lookup. -/
theorem shapeAt_column (total : ℕ) (child : ShapeAlphabet total) :
    SuppliedShapeIndices.shapeAt total ((shapeColumnEquiv total).symm child).val = child.val := by
  have selected := (shapeColumnEquiv total).apply_symm_apply child
  have present := ((shapeColumnEquiv total).symm child).isLt
  change (shapes total)[((shapeColumnEquiv total).symm child).val]?.getD _ = _
  rw [List.getElem?_eq_getElem present]
  exact congrArg Subtype.val selected

end MatrixBounds.Numeric.SuppliedNodeLookup
