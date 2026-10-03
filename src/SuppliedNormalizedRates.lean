module

public import PipelineRateScaling
public import SuppliedPipelineRank
public import SuppliedPipelineMatrix

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Express the actual construction in the source certificate's original
population unit, without altering any finite startup or drain term. -/
namespace MatrixBounds.Numeric.SuppliedNormalizedRates

open SuppliedPopulationWeights SuppliedRounds
noncomputable section

/-- Number of original population units represented by all six orientations and all source batches. -/
def units (batches : ℕ) : ℝ := 6*batches*rootWeight

/-- Every nonempty original pipeline has a strictly positive population conversion factor. -/
theorem units_positive {batches : ℕ} (positive : 0 < batches) : 0 < units batches := by
  have countPositive : (0 : ℝ) < batches := by exact_mod_cast positive
  have weightPositive : (0 : ℝ) < rootWeight := by exact_mod_cast SuppliedScaledRoot.rootWeight_positive
  unfold units
  positivity

/-- Actual complete shared-stage rates per original population unit. -/
def stages (stage : Fin 3) : Rates := fun axis => stageRates stage axis/rootWeight

/-- Complete retained-copy rate per original source unit, including finite boundary effects. -/
def retention (batches : ℕ) : ℝ := SuppliedRootStage.retention+
  bottleneck (stages 0+stages 1+stages 2)-boundaryLoss (stages 0) (stages 1) (stages 2)/batches

/-- Complete matrix volume rate per original source unit. -/
def volume : ℝ := SuppliedCompletedMatrix.volumeRate/(6*rootWeight)

/-- Each actual shared-stage rate is the population weight times its normalized rate. -/
theorem stage_eq (stage : Fin 3) : stageRates stage = fun axis => (rootWeight : ℝ)*stages stage axis := by
  have nonzero : (rootWeight : ℝ) ≠ 0 := by exact_mod_cast SuppliedScaledRoot.rootWeight_positive.ne'
  funext axis
  dsimp only [stages]
  exact (mul_div_cancel₀ _ nonzero).symm

/-- The actual source rank growth becomes exactly eight times log seven per original source unit. -/
theorem source_rate (batches : ℕ) : SuppliedSourceRank.rate batches = units batches*(8*Real.log 7) := by
  unfold SuppliedSourceRank.rate units
  ring

/-- Normalizing the actual complete schedule preserves all finite boundary losses. -/
theorem retention_rate {batches : ℕ} (positive : 0 < batches) :
    SuppliedSourcePipeline.retention batches = units batches*retention batches := by
  unfold SuppliedSourcePipeline.retention
  rw [stage_eq 0, stage_eq 1, stage_eq 2,
    scheduledRetention_scale (Nat.cast_nonneg rootWeight)]
  have batch := scheduledRetention_per_batch positive SuppliedRootStage.retention (stages 0) (stages 1) (stages 2)
  calc
    _ = 6*(rootWeight : ℝ)*((batches : ℝ)*SuppliedRootStage.retention+
        scheduledRetention batches (stages 0) (stages 1) (stages 2)) := by ring
    _ = _ := by rw [batch]; unfold units retention; ring

/-- Complete product-matrix volume normalizes by the identical positive source population factor. -/
theorem volume_rate (batches : ℕ) : SuppliedPipelineMatrix.volumeRate batches = units batches*volume := by
  have nonzero : (rootWeight : ℝ) ≠ 0 := by exact_mod_cast SuppliedScaledRoot.rootWeight_positive.ne'
  unfold SuppliedPipelineMatrix.volumeRate units volume
  field_simp

end
end MatrixBounds.Numeric.SuppliedNormalizedRates
