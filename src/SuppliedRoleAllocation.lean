import SuppliedRoleIndex
import SuppliedHigherLaws
import WeightedSectorAllocation

/-! Every supplied role-distribution row is realized as an actual disjoint
labelled position allocation, with unchanged complete parent laws. -/
namespace MatrixBounds.Numeric.SuppliedRoleAllocation

universe v
open Tensor Tensor.CW Interface Empirical
open scoped BigOperators
noncomputable section

/-- Original level-four role allocation is an actual unit-cost restriction to all six labelled orientations. -/
theorem allocate4 {K : Type*} [CommRing K] (parent : Fin 105) {weight size : ℕ}
    (weightPositive : 0 < weight) (sizePositive : 0 < size) (divisible : 17592186044416 ∣ weight)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) (constituent (K := K) 5 8 (SuppliedHierarchyParents.parent4 parent))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (SuppliedHigherLaws.parent4 parent 0) (SuppliedHigherLaws.parent4 parent 1)
        (SuppliedHigherLaws.parent4 parent 2) tolerance)
      (heterogeneous (fun role : AxisOrder =>
        windowedPower (P := Fin (allocatedWeight weight 17592186044416 (SuppliedRoleIndex.allocation4 parent) role*size))
          (constituent (K := K) 5 8 (SuppliedHierarchyParents.parent4 parent))
          (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
          (SuppliedHigherLaws.parent4 parent 0) (SuppliedHigherLaws.parent4 parent 1)
          (SuppliedHigherLaws.parent4 parent 2) tolerance)) 1 :=
  contextReduction_allocate_roles
    (constituent (K := K) 5 8 (SuppliedHierarchyParents.parent4 parent))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedRoleIndex.allocation4 parent) (SuppliedRoleIndex.allocation4_total parent)
    (by decide) weightPositive sizePositive divisible
    (SuppliedHigherLaws.parent4 parent 0) (SuppliedHigherLaws.parent4 parent 1)
    (SuppliedHigherLaws.parent4 parent 2) tolerance nonnegative

/-- Original level-three role allocation preserves the specific strategy's complete parent laws. -/
theorem allocate3 {K : Type*} [CommRing K] (node : Fin 945) (strategy : Fin 6) {weight size : ℕ}
    (weightPositive : 0 < weight) (sizePositive : 0 < size) (divisible : 17592186044416 ∣ weight)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
        (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
        (SuppliedLeafLaws.parent3 node strategy 0) (SuppliedLeafLaws.parent3 node strategy 1)
        (SuppliedLeafLaws.parent3 node strategy 2) tolerance)
      (heterogeneous (fun role : AxisOrder =>
        windowedPower (P := Fin (allocatedWeight weight 17592186044416 (SuppliedRoleIndex.allocation3 node strategy) role*size))
          (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
          (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
          (SuppliedLeafLaws.parent3 node strategy 0) (SuppliedLeafLaws.parent3 node strategy 1)
          (SuppliedLeafLaws.parent3 node strategy 2) tolerance)) 1 :=
  contextReduction_allocate_roles
    (constituent (K := K) 5 4 (SuppliedHierarchyParents.parent3 node))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedRoleIndex.allocation3 node strategy) (SuppliedRoleIndex.allocation3_total node strategy)
    (by decide) weightPositive sizePositive divisible
    (SuppliedLeafLaws.parent3 node strategy 0) (SuppliedLeafLaws.parent3 node strategy 1)
    (SuppliedLeafLaws.parent3 node strategy 2) tolerance nonnegative

/-- Every supplied level-four role allocation preserves its exact incoming population coefficient. -/
theorem allocated4_total (parent : Fin 105) {weight : ℕ} (divisible : 17592186044416 ∣ weight) :
    (∑ role, allocatedWeight weight 17592186044416 (SuppliedRoleIndex.allocation4 parent) role) = weight :=
  allocatedWeight_total _ (SuppliedRoleIndex.allocation4_total parent) divisible

/-- Every supplied level-three role allocation preserves its exact incoming population coefficient. -/
theorem allocated3_total (node : Fin 945) (strategy : Fin 6) {weight : ℕ} (divisible : 17592186044416 ∣ weight) :
    (∑ role, allocatedWeight weight 17592186044416 (SuppliedRoleIndex.allocation3 node strategy) role) = weight :=
  allocatedWeight_total _ (SuppliedRoleIndex.allocation3_total node strategy) divisible

end
end MatrixBounds.Numeric.SuppliedRoleAllocation
