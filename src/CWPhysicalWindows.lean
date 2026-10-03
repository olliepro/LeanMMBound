module

public import CWAxisPermutations
public import CoordinateRestriction
public import PhysicalRoles
public import ShapePermutations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! All six physical axis orders act on the actual CW windowed tensors with
the correspondingly permuted shape and complete fine probability laws. -/
namespace MatrixBounds.Tensor.CW

open Numeric
noncomputable section
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Transport one complete constituent window to any physical coordinate order. -/
def physicalWindowRestriction (order : AxisOrder) (q length : ℕ) (shape : Shape)
    (laws : Fin 3 → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :
    CoordinateRestriction
      (orient order (Interface.windowedPower (K := K) (P := P) (constituent q length shape)
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (laws 0) (laws 1) (laws 2) tolerance))
      (Interface.windowedPower (K := K) (P := P) (constituent q length (shape.permute order.permutation))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (laws (order.permutation 0)) (laws (order.permutation 1)) (laws (order.permutation 2)) tolerance) := by
  have swap := transposeXY_windowed_constituent (K := K) (P := P) q length shape
    (laws 0) (laws 1) (laws 2) tolerance
  have cycle := cyclic_windowed_constituent (K := K) (P := P) q length shape
    (laws 0) (laws 1) (laws 2) tolerance
  have swapCycle := (congrArg cyclic swap).trans
    (cyclic_windowed_constituent (K := K) (P := P) q length (transposeShape shape)
      (laws 1) (laws 0) (laws 2) tolerance)
  have cycleTwice := (congrArg cyclic cycle).trans
    (cyclic_windowed_constituent (K := K) (P := P) q length (cyclicShape shape)
      (laws 1) (laws 2) (laws 0) tolerance)
  have swapCycleTwice := (congrArg cyclic swapCycle).trans
    (cyclic_windowed_constituent (K := K) (P := P) q length (cyclicShape (transposeShape shape))
      (laws 0) (laws 2) (laws 1) tolerance)
  cases order <;> refine ⟨id, id, id, ?_⟩ <;> intro x y z
  · rfl
  · exact congrFun (congrFun (congrFun swapCycle x) y) z
  · exact congrFun (congrFun (congrFun swap x) y) z
  · exact congrFun (congrFun (congrFun cycle x) y) z
  · exact congrFun (congrFun (congrFun cycleTwice x) y) z
  · exact congrFun (congrFun (congrFun swapCycleTwice x) y) z

end
end MatrixBounds.Tensor.CW
