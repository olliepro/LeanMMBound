import CWRationalCanonicalAssembly
import SuppliedStagePresentations

/-! Any shared round of the supplied phases extracts its actual sixfold
canonical parents into actual canonical children with all history labels. -/
namespace MatrixBounds.Numeric.SuppliedCanonicalStages

universe v
open Tensor Tensor.CW Empirical SuppliedRationalStages Interface
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {S : Type} [Fintype S]

/-- All six original orientations of a supplied phase's complete parent windows. -/
def parent {K : Type} [CommRing K] (phase : Phase) (size : ℕ)
    (wide : SuppliedPathStages.Labels phase → ℝ) :=
  heterogeneous (fun order : AxisOrder => orient order
    ((SuppliedStagePresentations.presentation phase).originalParent (K := K) size 5 wide))

/-- All six original orientations of a supplied phase's complete child windows. -/
def children {K : Type} [CommRing K] (phase : Phase) (size : ℕ)
    (delta : SuppliedPathStages.Labels phase → ℝ) :=
  heterogeneous (fun order : AxisOrder => orient order
    ((SuppliedStagePresentations.presentation phase).originalChildren (K := K) size 5 delta))

/-- A shared supplied round attains its sum-before-bottleneck retention on the canonical interfaces used by the next phase. -/
theorem eventual_extraction {K : Type} [CommRing K] (phase : S → Phase)
    (wide : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ)
    (widePositive : ∀ sector label, 0 < wide sector label) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ,
      (∀ sector label, 0 < delta sector label) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (SuppliedFixedStages.fixed (phase sector)).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v} (heterogeneous (fun sector => parent (K := K) (phase sector) (RepairRates.scale k) (wide sector)))
          (directSum (fun _ : Fin (copies^6) => heterogeneous (fun sector =>
            children (K := K) (phase sector) (RepairRates.scale k) (delta sector)))) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ :=
    Mixed.RationalStage.eventual_labelled_canonical_extraction (K := K)
      (fun sector => SuppliedPathStages.fixed (phase sector))
      (fun sector => SuppliedStagePresentations.presentation (phase sector)) (by decide) 5 wide widePositive errorPositive
  refine ⟨delta, positive, threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, ?_, overhead, reduction⟩
  simpa only [SuppliedPathStages.fixed_rates] using retained

end
end MatrixBounds.Numeric.SuppliedCanonicalStages
