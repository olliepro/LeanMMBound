import SuppliedInitialSixfold
import CWRationalCanonicalInterfaces

/-! The first allocated source interface is exactly the original parent tensor
of the checked supplied level-four extraction stage. -/
namespace MatrixBounds.Numeric.SuppliedInitialPhase

universe v
open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedInitialAllocation SuppliedAllocationWindows
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Complete allocated level-four parents are precisely the checked original stage input, with the same source laws and populations. -/
def activeRestriction {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (active (K := K) size tolerance)
      (SuppliedStagePresentations.level4.originalParent (K := K) size 5 (fun _ => tolerance)) := by
  change CoordinateRestriction
    (heterogeneous (fun label : SuppliedFixedStages.Labels4 =>
      window (K := K) 8 (SuppliedHierarchyParents.parent4 label.val.1) (role4Weight label.val*size)
        (SuppliedHigherLaws.parent4 label.val.1) tolerance))
    (heterogeneous (fun label : SuppliedFixedStages.Labels4 =>
      window (K := K) 8 (SuppliedTypedParameters.level4Split label.val.1).parent (role4Weight label.val*size)
        (SuppliedHigherLaws.parent4 label.val.1) tolerance))
  apply CoordinateRestriction.heterogeneous
  intro label
  change CoordinateRestriction
    (window (K := K) 8 (SuppliedHierarchyParents.parent4 label.val.1) (role4Weight label.val*size)
      (SuppliedHigherLaws.parent4 label.val.1) tolerance)
    (window (K := K) 8 (SuppliedTypedParameters.level4Split label.val.1).parent (role4Weight label.val*size)
      (SuppliedHigherLaws.parent4 label.val.1) tolerance)
  rw [SuppliedHierarchyParents.level4Split_parent]
  exact CoordinateRestriction.refl _

/-- The first batch state exposes the genuine level-four stage input beside its original waiting factors. -/
def batch {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun order : AxisOrder => orient order (product (waiting (K := K) size tolerance)
    (SuppliedStagePresentations.level4.originalParent (K := K) size 5 (fun _ => tolerance))))

/-- All six copies of the concrete initial batch match the first checked phase input at unit cost. -/
theorem batch_reduction {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v} (SuppliedInitialSixfold.batch (K := K) size tolerance)
      (batch (K := K) size tolerance) 1 := by
  have individual := ((CoordinateRestriction.refl (waiting (K := K) size tolerance)).product
    (activeRestriction (K := K) size tolerance)).context
  simpa only [one_pow] using individual.sixfold

end
end MatrixBounds.Numeric.SuppliedInitialPhase
