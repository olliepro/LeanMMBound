import SuppliedStagePresentations

/-! Actual six-region extraction for any shared collection of supplied phases,
with the source parameters and all preceding allocation labels discharged. -/
namespace MatrixBounds.Numeric.SuppliedSixfoldStages

universe v
open Tensor Tensor.CW Empirical SuppliedRationalStages
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {S : Type} [Fintype S]

/-- Original separately labelled parent windows for one active collection of phases. -/
def parents {K : Type} [CommRing K] (phase : S → Phase) (size : ℕ)
    (wide : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ) :=
  Mixed.sixfoldParent (K := K) (SuppliedStagePresentations.shared phase).original
    (Mixed.RationalStage.combine (fun sector => SuppliedPathStages.fixed (phase sector))).weight
    size 5 (SuppliedStagePresentations.shared phase).law (fun index => wide index.1 index.2)

/-- Original separately labelled child windows after that same shared extraction. -/
def children {K : Type} [CommRing K] (phase : S → Phase) (size : ℕ)
    (delta : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ) :=
  Mixed.sixfoldChildren (K := K) (SuppliedStagePresentations.shared phase).original
    (Mixed.RationalStage.combine (fun sector => SuppliedPathStages.fixed (phase sector))).weight
    size 5 (SuppliedStagePresentations.shared phase).law (fun index => delta index.1 index.2)

/-- The supplied source windows actually yield six independent regional copies at the sum-before-bottleneck rate. -/
theorem eventual_extraction {K : Type} [CommRing K] (phase : S → Phase)
    (wide : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ)
    (widePositive : ∀ sector label, 0 < wide sector label) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : (sector : S) → SuppliedPathStages.Labels (phase sector) → ℝ,
      (∀ sector label, 0 < delta sector label) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (SuppliedFixedStages.fixed (phase sector)).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v} (parents (K := K) phase (RepairRates.scale k) wide)
          (directSum (fun _ : Fin (copies^6) => children (K := K) phase (RepairRates.scale k) delta)) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ :=
    Mixed.RationalStage.eventual_sixfold_extraction (K := K)
      (Mixed.RationalStage.combine (fun sector => SuppliedPathStages.fixed (phase sector)))
      (SuppliedStagePresentations.shared phase) (by decide) 5
      (fun index => wide index.1 index.2) (fun index => widePositive index.1 index.2) errorPositive
  refine ⟨(fun sector label => delta ⟨sector, label⟩), (fun sector label => positive ⟨sector, label⟩), threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, ?_, overhead, reduction⟩
  simpa only [Mixed.RationalStage.combine_rates, SuppliedPathStages.fixed_rates] using retained

end
end MatrixBounds.Numeric.SuppliedSixfoldStages
