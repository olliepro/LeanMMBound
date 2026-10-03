module

public import SixfoldExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every finite contextual preprocessing or output conversion can be performed
on all six physical source copies with its exact sixth-power cost. -/
namespace MatrixBounds.Tensor

universe v
noncomputable section
open scoped BigOperators

/-- Lift a contextual tensor transformation to the complete sixfold symmetric product. -/
theorem ContextReduction.sixfold {K X Y Z U V W : Type} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z] [Fintype U] [Fintype V] [Fintype W]
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) :
    ContextReduction.{v} (Interface.heterogeneous (fun order : AxisOrder => Tensor.orient order source))
      (Interface.heterogeneous (fun order : AxisOrder => Tensor.orient order target)) (cost^6) := by
  have combined := ContextReduction.heterogeneous (fun _ : AxisOrder => cost)
    (fun order => reduction.orient order)
  simpa only [Finset.prod_const, Finset.card_univ, axisOrder_card] using combined

end
end MatrixBounds.Tensor
