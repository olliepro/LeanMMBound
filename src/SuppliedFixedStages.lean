import SuppliedPopulationWeights
import WeightedPools

/-! The actual supplied population tables determine fixed, complete stages.
Zero-population labels are removed by the existing proved neutral-pool rule. -/
namespace MatrixBounds.Numeric.SuppliedFixedStages

universe v
open Tensor Tensor.CW Interface Entropy Empirical SuppliedPopulationWeights SuppliedRationalStages
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Retained original level-four source/role labels have their actual strictly positive coefficient. -/
abbrev Labels4 := PositiveWeight role4Weight

/-- Retained original node/strategy/role labels have their actual strictly positive coefficient. -/
abbrev Labels3 := PositiveWeight role3Weight

/-- Retained original terminal/ternary-axis labels have their actual strictly positive coefficient. -/
abbrev TerminalLabels := PositiveWeight terminalRoleWeight

/-- Complete actual level-four stage, with no parameter or population assumptions. -/
def level4 : Mixed.RationalStage Labels4 (fun _ => 4) 17592186044416 :=
  stage4 (fun label => label.val.1) (fun label => label.val.2)
    (fun label => role4Weight label.val) (fun label => label.property) (fun label => role4_divisible label.val)

/-- Complete actual level-three stage, with no parameter or population assumptions. -/
def level3 : Mixed.RationalStage Labels3 (fun _ => 2) 17592186044416 :=
  stage3 (fun label => label.val.1) (fun label => label.val.2)
    (fun label => role3Weight label.val) (fun label => label.property) (fun label => role3_divisible label.val)

/-- Complete actual terminal stage with the source's exact three-way role policy. -/
def terminal : Mixed.RationalStage TerminalLabels (fun _ => 1) 17592186044416 :=
  SuppliedTerminalRationalSplit.stage (fun label => label.val.1)
    (fun label => SuppliedTerminalRoles.role label.val.1 label.val.2)
    (fun label => terminalRoleWeight label.val) (fun label => label.property)
    (fun label => terminalRole_divisible label.val)

/-- The fixed positive source labels for each original phase. -/
def Labels : Phase → Type
  | .level4 => Labels4
  | .level3 => Labels3
  | .terminal => TerminalLabels

/-- Each supplied phase has finitely many fixed positive source labels. -/
instance labelsFinite (phase : Phase) : Fintype (Labels phase) := by cases phase <;> dsimp [Labels] <;> infer_instance

/-- All original phases, with their exact weights, in one common shared-extraction representation. -/
def fixed (phase : Phase) : Mixed.RationalStage (Labels phase) (fun _ => length phase) 17592186044416 := by
  cases phase with
  | level4 => exact level4
  | level3 => exact level3
  | terminal => exact terminal

/-- Any active collection of the original phases has an actual shared extraction at the sum of its true rates.
Only the available positive window widths and arbitrary positive asymptotic loss remain as inputs. -/
theorem eventual_shared_extraction {K S : Type*} [CommRing K] [Fintype S]
    (phase : S → Phase) (wide : ∀ sector, Labels (phase sector) → ℝ)
    (widePositive : ∀ sector label, 0 < wide sector label) {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : ∀ sector, Labels (phase sector) → ℝ, (∀ sector label, 0 < delta sector label) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (fixed (phase sector)).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (heterogeneous (fun sector => (fixed (phase sector)).parent (K := K) (RepairRates.scale k) 5 (wide sector)))
          (directSum (fun _ : Fin copies => heterogeneous (fun sector =>
            (fixed (phase sector)).children (K := K) (RepairRates.scale k) 5 (delta sector)))) cost :=
  Mixed.RationalStage.eventual_shared_extraction _ (by decide) 5 wide widePositive errorPositive

end
end MatrixBounds.Numeric.SuppliedFixedStages
