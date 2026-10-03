module

public import OrientedBatches
public import ContextHeterogeneousBatching

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One genuine shared extraction can be applied in all six physical regions.
Every copy label survives, and counts and costs are raised to the sixth power. -/
namespace MatrixBounds.Tensor

universe v u
open scoped BigOperators
noncomputable section

namespace AxisOrder

/-- Finite original tensor axes give a finite left axis in every physical order. -/
instance leftFintype (X Y Z : Type u) [Fintype X] [Fintype Y] [Fintype Z] (order : AxisOrder) :
    Fintype (order.left X Y Z) := by cases order <;> dsimp only [left] <;> infer_instance

/-- Finite original tensor axes give a finite middle axis in every physical order. -/
instance middleFintype (X Y Z : Type u) [Fintype X] [Fintype Y] [Fintype Z] (order : AxisOrder) :
    Fintype (order.middle X Y Z) := by cases order <;> dsimp only [middle] <;> infer_instance

/-- Finite original tensor axes give a finite right axis in every physical order. -/
instance rightFintype (X Y Z : Type u) [Fintype X] [Fintype Y] [Fintype Z] (order : AxisOrder) :
    Fintype (order.right X Y Z) := by cases order <;> dsimp only [right] <;> infer_instance

end AxisOrder

/-- Apply one contextual extraction in each of the six physical regions, preserving complete output tensors. -/
theorem ContextReduction.sixfold_extraction {K X Y Z U V W : Type} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z] [Fintype U] [Fintype V] [Fintype W]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {copies cost : ℕ}
    (extraction : ContextReduction.{v} source (directSum (fun _ : Fin copies => target)) cost) :
    ContextReduction.{v} (Interface.heterogeneous (fun order : AxisOrder => Tensor.orient order source))
      (directSum (fun _ : Fin (copies^6) => Interface.heterogeneous (fun order : AxisOrder => Tensor.orient order target))) (cost^6) := by
  have combined := ContextReduction.heterogeneous_extractions (fun _ : AxisOrder => copies) (fun _ : AxisOrder => cost)
    (fun order => extraction.orient_extraction order)
  have copyIdentity : (∏ _ : AxisOrder, copies) = copies^6 := by
    simp only [Finset.prod_const, Finset.card_univ, axisOrder_card]
  rw [copyIdentity] at combined
  simpa only [Finset.prod_const, Finset.card_univ, axisOrder_card] using combined

end
end MatrixBounds.Tensor
