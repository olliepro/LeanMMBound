module

public import CWRationalStagePresentation
public import CWPhysicalWindowFamilies

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The checked physical extraction yields six literal orientations of the
complete original parent and child families, ready for canonical allocations. -/
namespace MatrixBounds.Tensor.CW.Mixed.RationalStage

universe v
open Empirical Numeric Interface
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T : Type} [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- Original complete parent tensor of a physically presented stage, retaining every allocation label. -/
def PhysicalPresentation.originalParent {K : Type} [CommRing K] {stage : RationalStage T length denominator}
    (presentation : PhysicalPresentation stage) (size q : ℕ) (tolerance : T → ℝ) :=
  sourceWindowFamily (K := K) q (fun type => length type+length type) (fun type => stage.weight type*size)
    (fun type => (presentation.original type).parent)
    (fun type axis => (presentation.original type).parentLaw (presentation.law type axis)) tolerance

/-- Original complete child tensor of a physically presented stage, retaining every child and population label. -/
def PhysicalPresentation.originalChildren {K : Type} [CommRing K] {stage : RationalStage T length denominator}
    (presentation : PhysicalPresentation stage) (size q : ℕ) (tolerance : T → ℝ) :=
  sourceWindowFamily (K := K) q (fun index : ChildIndex length => length index.1)
    (fun index => (presentation.original index.1).childWeight (stage.weight index.1) index.2*size)
    (fun index => index.2.val) (fun index axis => presentation.law index.1 axis index.2) (fun index => tolerance index.1)

/-- Actual extraction acts on the six original complete window families, with all coordinate identifications discharged. -/
theorem eventual_canonical_extraction {K : Type} [CommRing K]
    (stage : RationalStage T length denominator) (presentation : PhysicalPresentation stage)
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck stage.rates-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (heterogeneous (fun order : AxisOrder => orient order
            (presentation.originalParent (K := K) (RepairRates.scale k) q wide)))
          (directSum (fun _ : Fin (copies^6) => heterogeneous (fun order : AxisOrder => orient order
            (presentation.originalChildren (K := K) (RepairRates.scale k) q delta)))) (cost^6) := by
  obtain ⟨delta, positive, threshold, extraction⟩ :=
    eventual_sixfold_extraction (K := K) stage presentation denominatorPositive q wide widePositive errorPositive
  refine ⟨delta, positive, threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, overhead, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, retained, overhead, ?_⟩
  have before := (CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
    physicalWindowFamilyRestriction (K := K) q (fun type => length type+length type)
      (fun type => stage.weight type*RepairRates.scale k) (fun type => (presentation.original type).parent)
      (fun type axis => (presentation.original type).parentLaw (presentation.law type axis)) wide order)).context
  have after := (CoordinateRestriction.heterogeneous (fun order : AxisOrder =>
    physicalWindowFamilyInverseRestriction (K := K) q (fun index : ChildIndex length => length index.1)
      (fun index => (presentation.original index.1).childWeight (stage.weight index.1) index.2*RepairRates.scale k)
      (fun index => index.2.val) (fun index axis => presentation.law index.1 axis index.2)
      (fun index => delta index.1) order)).context.batch (I := Fin (copies^6))
  simpa only [one_mul, mul_one] using! (before.trans reduction).trans after

end
end MatrixBounds.Tensor.CW.Mixed.RationalStage
