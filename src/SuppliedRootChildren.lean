module

public import SuppliedRootPopulation
public import CWRoleWindowRouting
public import HeterogeneousFiniteRegrouping
public import WindowedReindexing

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The actual root output is identified with complete original source windows,
including every zero-coordinate child, at the pipeline's exact populations. -/
namespace MatrixBounds.Numeric.SuppliedRootChildren

open Tensor Tensor.CW Interface SuppliedPopulationWeights SuppliedRootPopulation
noncomputable section

/-- Complete original root-child windows in any one of the six source orientations. -/
def windows {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) (order : AxisOrder) :=
  heterogeneous (fun child : ShapeAlphabet 16 =>
    orientedSourceWindow (K := K) (Positions := fun child => Fin (weight child*size))
      5 (fun _ => 8) Subtype.val SuppliedHigherLaws.root4 (fun _ => tolerance) order child)

/-- Actual supplied root extraction output restricts to its original complete child windows in the declared X-Z-Y physical order. -/
def restriction {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction
      ((CertifiedRoot.data (rootWeight*size)).approximateTarget (K := K) 5
        (SuppliedRootStage.law 0) (SuppliedRootStage.law 1) (SuppliedRootStage.law 2) tolerance)
      (windows (K := K) size tolerance .xzy) := by
  rw [RootRestrictionData.approximateTarget_eq_windowed]
  refine (reindexRestriction physicalChild _).trans ?_
  apply CoordinateRestriction.heterogeneous
  intro child
  have positions := windowPositionRestriction (finCongr (population child size))
    (constituent (K := K) 5 8 (physicalChild child).val)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedRootStage.law 0 (physicalChild child)) (SuppliedRootStage.law 1 (physicalChild child))
    (SuppliedRootStage.law 2 (physicalChild child)) tolerance
  simpa only [physical_law] using! positions

end
end MatrixBounds.Numeric.SuppliedRootChildren
