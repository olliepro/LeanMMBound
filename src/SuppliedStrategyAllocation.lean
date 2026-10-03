module

public import SuppliedLeafLaws
public import SuppliedHierarchyParents
public import WeightedSectorAllocation

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied six-strategy mixture is realized by an actual unit-cost tensor
restriction to labelled sectors with the original integer numerator weights. -/
namespace MatrixBounds.Numeric.SuppliedStrategyAllocation

universe v
open Tensor Tensor.CW Interface Empirical
open scoped BigOperators
noncomputable section

/-- The exact original mixture is the real rational-numerator mixture required by physical sector allocation. -/
theorem mixture_formula (node : Fin 945) (axis : Fin 3) :
    SuppliedLeafLaws.mixed3 node axis = fun word =>
      ∑ strategy, (((SuppliedTypedParameters.strategies node).numerator strategy : ℝ)/17592186044416)*
        SuppliedLeafLaws.parent3 node strategy axis word := by
  funext word
  norm_num only [SuppliedLeafLaws.mixed3, TypedProbabilityRow.rational, Rat.cast_div, Rat.cast_natCast]

/-- Allocating the actual mixed parent law produces all six source-labelled strategy tensors at their exact supplied weights. -/
theorem allocate {K : Type*} [CommRing K] (node : Fin 945) {weight size : ℕ}
    (weightPositive : 0 < weight) (sizePositive : 0 < size) (divisible : 17592186044416 ∣ weight)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (SuppliedLeafLaws.mixed3 node 0) (SuppliedLeafLaws.mixed3 node 1) (SuppliedLeafLaws.mixed3 node 2) tolerance)
      (heterogeneous (fun strategy : Fin 6 =>
        windowedPower (P := Fin (allocatedWeight weight 17592186044416
          (SuppliedTypedParameters.strategies node).numerator strategy*size))
          (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
          (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
          (SuppliedLeafLaws.parent3 node strategy 0) (SuppliedLeafLaws.parent3 node strategy 1)
          (SuppliedLeafLaws.parent3 node strategy 2) tolerance)) 1 := by
  rw [mixture_formula node 0, mixture_formula node 1, mixture_formula node 2]
  exact contextReduction_allocate_weighted
    (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedTypedParameters.strategies node).numerator (SuppliedTypedParameters.strategies node).numerator_total
    (by decide) weightPositive sizePositive divisible
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 0)
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 1)
    (fun strategy => SuppliedLeafLaws.parent3 node strategy 2) tolerance nonnegative

/-- The actual labelled strategy coefficients retain the complete incoming population coefficient. -/
theorem allocated_total (node : Fin 945) {weight : ℕ} (divisible : 17592186044416 ∣ weight) :
    (∑ strategy, allocatedWeight weight 17592186044416 (SuppliedTypedParameters.strategies node).numerator strategy) = weight :=
  allocatedWeight_total (SuppliedTypedParameters.strategies node).numerator
    (SuppliedTypedParameters.strategies node).numerator_total divisible

end
end MatrixBounds.Numeric.SuppliedStrategyAllocation
