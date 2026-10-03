module

public import SuppliedStage3
public import SuppliedStage4
public import SuppliedTerminalRationalSplit
public import CWRationalStageAssembly

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original source parameters instantiate all three phases of a shared rational
extraction. Every law, support, symmetry, and potential check is discharged. -/
namespace MatrixBounds.Numeric.SuppliedRationalStages

universe v
open Tensor Tensor.CW Entropy Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Original level-four labels and their chosen physical roles form a supported rational stage. -/
def stage4 {T : Type*} [Fintype T] (source : T → SuppliedStage4.Source) (role : T → AxisOrder)
    (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type)
    (divisible : ∀ type, 17592186044416 ∣ weight type) :
    Mixed.RationalStage T (fun _ => 4) 17592186044416 where
  splits type := SuppliedStage4.split (source type) (role type)
  weight := weight
  weightPositive := weightPositive
  divisible := divisible
  law type := SuppliedStage4.law (source type) (role type)
  lawRange type := SuppliedStage4.law_range (source type) (role type)
  potential type := SuppliedStage4.potential (source type) (role type)
  potentialPositive type := SuppliedStage4.potential_positive (source type) (role type)

/-- Original level-three labels and their chosen physical roles form a supported rational stage. -/
def stage3 {T : Type*} [Fintype T] (source : T → SuppliedStage3.Source) (role : T → AxisOrder)
    (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type)
    (divisible : ∀ type, 17592186044416 ∣ weight type) :
    Mixed.RationalStage T (fun _ => 2) 17592186044416 where
  splits type := SuppliedStage3.split (source type) (role type)
  weight := weight
  weightPositive := weightPositive
  divisible := divisible
  law type := SuppliedStage3.law (source type) (role type)
  lawRange type := SuppliedStage3.law_range (source type) (role type)
  potential type := SuppliedStage3.potential (source type) (role type)
  potentialPositive type := SuppliedStage3.potential_positive (source type) (role type)

/-- The three actual pipeline phases, in their required extraction order. -/
inductive Phase where
  | level4
  | level3
  | terminal
  deriving DecidableEq

-- v4.35 port: Mathlib's `deriving Fintype` handler for enumeration types produces an
-- ill-typed `Finset.mk` at v4.35.0-rc2, so the instance is written out.
instance : Fintype Phase where
  elems := {.level4, .level3, .terminal}
  complete := fun x => by cases x <;> decide

/-- Original parameter-coordinate labels for one phase. -/
def Source : Phase → Type
  | .level4 => SuppliedStage4.Source
  | .level3 => SuppliedStage3.Source
  | .terminal => SuppliedTerminalScaling.Source

/-- Each actual phase's paired child length. -/
def length : Phase → ℕ
  | .level4 => 4
  | .level3 => 2
  | .terminal => 1

/-- Uniform phase-indexed constructor for the original complete rational extraction data. -/
def stage (phase : Phase) {T : Type*} [Fintype T] (source : T → Source phase)
    (role : T → AxisOrder) (weight : T → ℕ) (weightPositive : ∀ type, 0 < weight type)
    (divisible : ∀ type, 17592186044416 ∣ weight type) :
    Mixed.RationalStage T (fun _ => length phase) 17592186044416 := by
  cases phase with
  | level4 => exact stage4 source role weight weightPositive divisible
  | level3 => exact stage3 source role weight weightPositive divisible
  | terminal => exact SuppliedTerminalRationalSplit.stage source role weight weightPositive divisible

/-- Any finite collection of actual supplied phases shares one extraction, with its minimum after the phase sums.
The labels can retain batch, source, strategy, and physical-region coordinates. -/
theorem eventual_shared_extraction {K S : Type*} [CommRing K] [Fintype S]
    (phase : S → Phase) {Labels : S → Type*} [∀ sector, Fintype (Labels sector)]
    (source : ∀ sector, Labels sector → Source (phase sector))
    (role : ∀ sector, Labels sector → AxisOrder) (weight : ∀ sector, Labels sector → ℕ)
    (weightPositive : ∀ sector type, 0 < weight sector type)
    (divisible : ∀ sector type, 17592186044416 ∣ weight sector type)
    (wide : ∀ sector, Labels sector → ℝ) (widePositive : ∀ sector type, 0 < wide sector type)
    {error : ℝ} (errorPositive : 0 < error) :
    let stages := fun sector => stage (phase sector) (source sector) (role sector)
      (weight sector) (weightPositive sector) (divisible sector)
    ∃ delta : ∀ sector, Labels sector → ℝ, (∀ sector type, 0 < delta sector type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → 17592186044416 ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck (∑ sector, (stages sector).rates)-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (Interface.heterogeneous (fun sector => (stages sector).parent (K := K) (RepairRates.scale k) 5 (wide sector)))
          (directSum (fun _ : Fin copies => Interface.heterogeneous (fun sector =>
            (stages sector).children (K := K) (RepairRates.scale k) 5 (delta sector)))) cost :=
  Mixed.RationalStage.eventual_shared_extraction _ (by decide) 5 wide widePositive errorPositive

end
end MatrixBounds.Numeric.SuppliedRationalStages
