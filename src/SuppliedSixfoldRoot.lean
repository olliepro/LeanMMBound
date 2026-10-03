module

public import SuppliedRootChildren
public import CWRoleWindowRegions
public import SixfoldComposition

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied root extraction actually yields the six symmetric complete
source-window families required by the subsequent mixed-level pipeline. -/
namespace MatrixBounds.Numeric.SuppliedSixfoldRoot

universe v
open Tensor Tensor.CW Interface Empirical SuppliedPopulationWeights
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Six independent coordinate-permuted copies of the original unrestricted CW source. -/
def source {K : Type} [CommRing K] (size : ℕ) :=
  heterogeneous (fun order : AxisOrder => orient order (rootPower (K := K) (P := Fin (rootWeight*size)) 5 8))

/-- Complete original root-child windows in all six source copies. -/
def children {K : Type} [CommRing K] (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun order : AxisOrder => SuppliedRootChildren.windows (K := K) size tolerance order)

/-- Each actual root extraction produces the full sixfold original child interface at its proved exact source rate. -/
theorem eventual_extraction {K : Type} [CommRing K] {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∃ delta > 0,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp (((rootWeight : ℝ)*SuppliedRootStage.retention-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v} (source (K := K) (RepairRates.scale k))
          (directSum (fun _ : Fin (copies^6) => children (K := K) (RepairRates.scale k) delta)) (cost^6) := by
  obtain ⟨threshold, delta, positive, extraction⟩ := SuppliedScaledRoot.eventual_extraction (K := K) errorPositive
  refine ⟨threshold, delta, positive, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, retained, overhead, ?_⟩
  have restoreChildren := (SuppliedRootChildren.restriction (K := K) (RepairRates.scale k) delta).context.sixfold
  have restoreSources := (sixfoldRegionInverseRestriction (K := K)
    (Positions := fun child : ShapeAlphabet 16 => Fin (SuppliedRootPopulation.weight child*RepairRates.scale k))
    5 (fun _ => 8) Subtype.val SuppliedHigherLaws.root4 (fun _ => delta) (fun _ => .xzy)).context
  have combined := reduction.sixfold_extraction.trans ((restoreChildren.trans restoreSources).batch)
  simpa only [one_pow, mul_one, one_mul] using! combined

end
end MatrixBounds.Numeric.SuppliedSixfoldRoot
