module

public import PhysicalRoles
public import ShapePermutations
public import HeterogeneousFiniteRegrouping

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact sixfold tensor routing preserves every source and strategy label.
The coordinate convention uses original-axis permutations composed on the right. -/
namespace MatrixBounds.Tensor.AxisOrder

open Numeric Interface
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 3000000
set_option maxRecDepth 10000

/-- For one chosen role, every physical region comes from exactly one of the six source copies. -/
def regionSourceEquiv (role : AxisOrder) : AxisOrder ≃ AxisOrder :=
  permutationEquiv.trans ((Equiv.mulLeft role.permutation).trans permutationEquiv.symm)

/-- The selected source's axes are the original role axes followed by the physical region axes. -/
theorem regionSource_permutation (role region : AxisOrder) :
    (regionSourceEquiv role region).permutation = role.permutation*region.permutation := by
  change permutationEquiv (permutationEquiv.symm _) = _
  exact Equiv.apply_symm_apply _ _

/-- Two consecutive actual shape orientations follow the same axis-composition convention. -/
theorem permute_region (shape : Shape) (role region : AxisOrder) :
    (shape.permute role.permutation).permute region.permutation =
      shape.permute (regionSourceEquiv role region).permutation := by
  apply Shape.coordinates.injective
  funext axis
  simp only [Shape.permute_coordinate, regionSource_permutation]
  rfl

/-- Reassign all six source copies into physical extraction regions without dropping or duplicating a labelled role. -/
def labelledRegionEquiv {T : Type*} (role : T → AxisOrder) : AxisOrder × T ≃ AxisOrder × T where
  toFun index := (regionSourceEquiv (role index.2) index.1, index.2)
  invFun index := ((regionSourceEquiv (role index.2)).symm index.1, index.2)
  left_inv index := by simp only [Equiv.symm_apply_apply]
  right_inv index := by simp only [Equiv.apply_symm_apply]

/-- Actual tensor-factor labels can be routed into the six extraction regions through coordinate maps. -/
def routeRestriction {K T : Type*} [CommSemiring K] [Fintype T]
    (role : T → AxisOrder) {X Y Z : AxisOrder × T → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (heterogeneous family)
      (heterogeneous (fun index : AxisOrder × T => family (regionSourceEquiv (role index.2) index.1, index.2))) :=
  reindexRestriction (labelledRegionEquiv role) family

/-- Every original labelled source factor is counted once by the region routing. -/
theorem region_sum {T A : Type*} [Fintype T] [AddCommMonoid A]
    (role : T → AxisOrder) (value : AxisOrder × T → A) :
    (∑ region, ∑ label, value (regionSourceEquiv (role label) region, label)) =
      ∑ source, ∑ label, value (source, label) := by
  simpa only [Fintype.sum_prod_type] using! (labelledRegionEquiv role).sum_comp value

end
end MatrixBounds.Tensor.AxisOrder
