module

public import PhysicalRoles
public import SuppliedTypedParameters

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The verifier's lexicographic six-role columns and the actual tensor-axis
order labels agree exactly, retaining every allocation column. -/
namespace MatrixBounds.Numeric.SuppliedRoleIndex

open Tensor
open scoped BigOperators
noncomputable section

/-- The source permutation table uses lexicographic order XYZ, XZY, YXZ, YZX, ZXY, ZYX. -/
def order : Fin 6 → AxisOrder := ![.xyz, .xzy, .yxz, .yzx, .zxy, .zyx]

/-- The source role column of an actual tensor-axis order. -/
def column : AxisOrder → Fin 6
  | .xyz => 0
  | .xzy => 1
  | .yxz => 2
  | .yzx => 3
  | .zxy => 4
  | .zyx => 5

/-- All original role columns enumerate the actual tensor-axis orders bijectively. -/
def orderEquiv : Fin 6 ≃ AxisOrder where
  toFun := order
  invFun := column
  left_inv := by decide
  right_inv := by decide

/-- Explicit source coordinate permutations for every role column. -/
def sourceAxes : Fin 6 → Fin 3 → Fin 3 :=
  ![![0,1,2], ![0,2,1], ![1,0,2], ![1,2,0], ![2,0,1], ![2,1,0]]

/-- The original permutation table agrees entrywise with the actual physical tensor orientation. -/
theorem axes_exact : ∀ role : Fin 6, ∀ axis : Fin 3,
    AxisOrder.permutation (order role) axis = sourceAxes role axis := by decide

/-- The normalized original level-four role weights indexed by actual tensor orientations. -/
def allocation4 (parent : Fin 105) (role : AxisOrder) : ℕ :=
  (SuppliedTypedParameters.allocation4 parent).numerator (column role)

/-- Actual orientation labels retain the complete original level-four allocation mass. -/
theorem allocation4_total (parent : Fin 105) : ∑ role, allocation4 parent role = 17592186044416 := by
  rw [← Equiv.sum_comp orderEquiv]
  change (∑ index, (SuppliedTypedParameters.allocation4 parent).numerator (column (order index))) = _
  have inverse : ∀ index, column (order index) = index := orderEquiv.left_inv
  simp only [inverse]
  exact (SuppliedTypedParameters.allocation4 parent).numerator_total

/-- The normalized original level-three role weights indexed by actual tensor orientations. -/
def allocation3 (node : Fin 945) (strategy : Fin 6) (role : AxisOrder) : ℕ :=
  (SuppliedTypedParameters.allocation3 node strategy).numerator (column role)

/-- Actual orientation labels retain the complete original level-three allocation mass. -/
theorem allocation3_total (node : Fin 945) (strategy : Fin 6) :
    ∑ role, allocation3 node strategy role = 17592186044416 := by
  rw [← Equiv.sum_comp orderEquiv]
  change (∑ index, (SuppliedTypedParameters.allocation3 node strategy).numerator (column (order index))) = _
  have inverse : ∀ index, column (order index) = index := orderEquiv.left_inv
  simp only [inverse]
  exact (SuppliedTypedParameters.allocation3 node strategy).numerator_total

end
end MatrixBounds.Numeric.SuppliedRoleIndex
