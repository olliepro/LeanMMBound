module

public import SuppliedHierarchyParentData
public import SuppliedTypedParameters

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

namespace MatrixBounds.Numeric.SuppliedHierarchyParents

/-- Exact contextual parent binding for every original node and strategy. -/
theorem alpha3_parent (node : Fin 945) (strategy : Fin 6) :
    (SuppliedParameters.alpha3 node strategy).val.parent = parent3 node := by
  have checked := complete3.complete (SuppliedParameters.flat2 node strategy)
  have projection := finProdFinEquiv.symm_apply_apply (node, strategy)
  change ((SuppliedParameters.flat2 node strategy).divNat,
    (SuppliedParameters.flat2 node strategy).modNat) = (node, strategy) at projection
  have pair := Prod.mk.inj projection
  simpa only [predicate3, pair.1, pair.2] using checked

/-- The actual level-three rational extraction split has its original hierarchy parent. -/
theorem level3Split_parent (node : Fin 945) (strategy : Fin 6) :
    (SuppliedTypedParameters.level3Split node strategy).parent = parent3 node :=
  alpha3_parent node strategy

/-- The actual level-four rational extraction split has its original positive root-child parent. -/
theorem level4Split_parent (node : Fin 105) :
    (SuppliedTypedParameters.level4Split node).parent = parent4 node :=
  alpha4_parent node

end MatrixBounds.Numeric.SuppliedHierarchyParents
