import CWPhysicalWindows

/-! Physical CW window orientation is a coordinate isomorphism. Both directions
are available when routing symmetric source copies through extraction regions. -/
namespace MatrixBounds.Tensor.CW

open Numeric
noncomputable section
variable {K P : Type*} [CommRing K] [Fintype P]

/-- Restore a complete physically oriented CW window to its literal axis-permuted tensor. -/
def physicalWindowInverseRestriction (order : AxisOrder) (q length : ℕ) (shape : Shape)
    (laws : Fin 3 → (Fin length → Fin 3) → ℝ) (tolerance : ℝ) :
    CoordinateRestriction
      (Interface.windowedPower (K := K) (P := P) (constituent q length (shape.permute order.permutation))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (laws (order.permutation 0)) (laws (order.permutation 1)) (laws (order.permutation 2)) tolerance)
      (orient order (Interface.windowedPower (K := K) (P := P) (constituent q length shape)
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (laws 0) (laws 1) (laws 2) tolerance)) := by
  cases order <;> refine ⟨id, id, id, ?_⟩ <;> intro x y z
  · exact ((physicalWindowRestriction .xyz q length shape laws tolerance).coefficient x y z).symm
  · exact ((physicalWindowRestriction .xzy q length shape laws tolerance).coefficient x y z).symm
  · exact ((physicalWindowRestriction .yxz q length shape laws tolerance).coefficient x y z).symm
  · exact ((physicalWindowRestriction .yzx q length shape laws tolerance).coefficient x y z).symm
  · exact ((physicalWindowRestriction .zxy q length shape laws tolerance).coefficient x y z).symm
  · exact ((physicalWindowRestriction .zyx q length shape laws tolerance).coefficient x y z).symm

end
end MatrixBounds.Tensor.CW
