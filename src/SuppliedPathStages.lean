import SuppliedFixedStages
import SuppliedPathRateSums

/-! Shared extraction uses every actual source and preceding role label. The
full-history stage rates equal the certificate's aggregated source rates. -/
namespace MatrixBounds.Numeric.SuppliedPathStages

universe v
open Tensor Tensor.CW Interface Entropy Empirical SuppliedRationalStages SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Positive level-three labels preserve both current and inherited physical roles. -/
abbrev Labels3 := PositiveWeight weight3

/-- Positive terminal labels preserve the complete physical role history. -/
abbrev TerminalLabels := PositiveWeight terminalWeight

/-- Actual level-three extraction stage with every preceding allocation sector retained. -/
def level3 : Mixed.RationalStage Labels3 (fun _ => 2) 17592186044416 :=
  stage3 (fun label => label.val.source) (fun label => label.val.role)
    (fun label => weight3 label.val) (fun label => label.property) (fun label => weight3_divisible label.val)

/-- Actual terminal extraction stage with both preceding allocation sectors retained. -/
def terminal : Mixed.RationalStage TerminalLabels (fun _ => 1) 17592186044416 :=
  SuppliedTerminalRationalSplit.stage (fun label => label.val.source)
    (fun label => SuppliedTerminalRoles.role label.val.source label.val.selected)
    (fun label => terminalWeight label.val) (fun label => label.property)
    (fun label => terminal_divisible label.val)

/-- Every original phase carries all of its allocation-history labels. -/
def Labels : Phase → Type
  | .level4 => SuppliedFixedStages.Labels4
  | .level3 => Labels3
  | .terminal => TerminalLabels

/-- All complete allocation-history label families are finite. -/
instance labelsFinite (phase : Phase) : Fintype (Labels phase) := by cases phase <;> dsimp [Labels] <;> infer_instance

/-- The actual original fixed stages retain every source and allocation-history coordinate. -/
def fixed (phase : Phase) : Mixed.RationalStage (Labels phase) (fun _ => length phase) 17592186044416 := by
  cases phase with
  | level4 => exact SuppliedFixedStages.level4
  | level3 => exact level3
  | terminal => exact terminal

/-- Keeping inherited level-four sectors changes no level-three physical rate sum. -/
theorem level3_rates : level3.rates = SuppliedFixedStages.level3.rates := by
  have sumIdentity (rate : SuppliedStage3.Source → AxisOrder → ℝ) :
      (∑ label : Labels3, (weight3 label.val : ℝ)*rate label.val.source label.val.role) =
        ∑ label : SuppliedFixedStages.Labels3,
          (SuppliedPopulationWeights.role3Weight label.val : ℝ)*rate label.val.1 label.val.2 := by
    rw [sum_positive_weights weight3 (fun label => rate label.source label.role),
      sum_positive_weights SuppliedPopulationWeights.role3Weight (fun label => rate label.1 label.2),
      sum_weight3]
    simp only [Fintype.sum_prod_type]
  unfold level3 SuppliedFixedStages.level3 stage3 Mixed.RationalStage.rates
  apply congrArg₂ Matrix.vecCons
  · exact sumIdentity (fun source role => (SuppliedStage3.split source role).coarseRetention
      (SuppliedStage3.potential source role 0) (SuppliedStage3.potential source role 1) (SuppliedStage3.potential source role 2))
  · apply congrArg₂ Matrix.vecCons
    · exact sumIdentity (fun source role => (SuppliedStage3.split source role).fineRetention yClass (SuppliedStage3.law source role 1))
    · apply congrArg₂ Matrix.vecCons
      · exact sumIdentity (fun source role => (SuppliedStage3.split source role).fineRetention zClass (SuppliedStage3.law source role 2))
      · rfl

/-- Keeping both inherited sectors changes no terminal physical rate sum. -/
theorem terminal_rates : terminal.rates = SuppliedFixedStages.terminal.rates := by
  funext axis
  rw [terminal, SuppliedFixedStages.terminal, SuppliedTerminalRationalSplit.stage_rates,
    SuppliedTerminalRationalSplit.stage_rates]
  let rate := fun source selected => Terminal.axisEntropy (SuppliedTerminalScaling.extreme source)
    (SuppliedTerminalScaling.middle source)
    (SuppliedTerminalScaling.axes source (SuppliedTerminalRoles.role source selected) axis)
  exact (sum_positive_weights terminalWeight (fun label => rate label.source label.selected)).trans
    ((sum_terminal rate).trans (by
      simpa only [Fintype.sum_prod_type] using
        (sum_positive_weights SuppliedPopulationWeights.terminalRoleWeight (fun label => rate label.1 label.2)).symm))

/-- The actual full-history rates equal the original fixed source coefficient sums in every phase. -/
theorem fixed_rates (phase : Phase) : (fixed phase).rates = (SuppliedFixedStages.fixed phase).rates := by
  cases phase with
  | level4 => rfl
  | level3 => exact level3_rates
  | terminal => exact terminal_rates

/-- Any active collection of full-history source stages has the desired shared bottleneck rate.
Every output keeps its original source, physical role history, and retained-copy labels. -/
theorem eventual_shared_extraction {K S : Type*} [CommRing K] [Fintype S]
    (phase : S → Phase) (wide : ∀ sector, Labels (phase sector) → ℝ)
    (widePositive : ∀ sector label, 0 < wide sector label) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : ∀ sector, Labels (phase sector) → ℝ, (∀ sector label, 0 < delta sector label) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (SuppliedFixedStages.fixed (phase sector)).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (heterogeneous (fun sector => (fixed (phase sector)).parent (K := K) (RepairRates.scale k) 5 (wide sector)))
          (directSum (fun _ : Fin copies => heterogeneous (fun sector =>
            (fixed (phase sector)).children (K := K) (RepairRates.scale k) 5 (delta sector)))) cost := by
  simpa only [fixed_rates] using Mixed.RationalStage.eventual_shared_extraction.{v}
    (fun sector => fixed (phase sector)) (by decide) 5 wide widePositive errorPositive

end
end MatrixBounds.Numeric.SuppliedPathStages
