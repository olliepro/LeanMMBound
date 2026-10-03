module

public import CWRationalSixfoldInterfaces

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A physical presentation records the original source windows and role labels
of an already checked rational stage. Its equalities give the actual interfaces. -/
namespace MatrixBounds.Tensor.CW.Mixed.RationalStage

universe v
open Empirical Numeric Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type} [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- Original source parameters underlying an actual physical rational extraction stage. -/
structure PhysicalPresentation (stage : RationalStage T length denominator) where
  /-- Complete original splits before their selected physical roles. -/
  original : ∀ type, RationalSplit (length type) denominator
  /-- Physical extraction role for each separately labelled source. -/
  role : T → AxisOrder
  /-- Complete original child laws before physically reindexing their shapes. -/
  law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ
  /-- The original split and role produce exactly the actual stage record. -/
  splits_eq : ∀ type, stage.splits type = (original type).permute (role type).permutation
  /-- The original child laws produce exactly the actual physical stage laws. -/
  laws_eq : ∀ type axis, stage.law type axis = roleLaw role law axis type

/-- Every physical presentation yields actual sixfold source-to-child extraction at the original stage rate. -/
theorem eventual_sixfold_extraction {K : Type} [CommRing K]
    (stage : RationalStage T length denominator) (presentation : PhysicalPresentation stage)
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck stage.rates-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (sixfoldParent (K := K) presentation.original stage.weight (RepairRates.scale k) q presentation.law wide)
          (directSum (fun _ : Fin (copies^6) =>
            sixfoldChildren (K := K) presentation.original stage.weight (RepairRates.scale k) q presentation.law delta)) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ := stage.eventual_extraction (K := K)
    denominatorPositive q wide widePositive errorPositive
  refine ⟨delta, positive, threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, retained, overhead, ?_⟩
  apply sixfold_role_extraction presentation.original presentation.role stage.weight
    (RepairRates.scale k) q presentation.law wide delta copies cost
  have splitsEqual : stage.splits = fun type => (presentation.original type).permute (presentation.role type).permutation :=
    funext presentation.splits_eq
  rw [splitsEqual] at reduction
  simpa only [presentation.laws_eq] using reduction

end
end MatrixBounds.Tensor.CW.Mixed.RationalStage
