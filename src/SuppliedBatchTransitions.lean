import SuppliedBatchTensors
import SuppliedLevel4SixfoldTransition

/-! Actual complete output transitions for each scheduled batch, retaining
all waiting windows and recording the newly chosen output widths. -/
namespace MatrixBounds.Numeric.SuppliedBatch

universe v
open Tensor Tensor.CW Interface SuppliedRationalStages
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
variable {K : Type} [CommRing K]

/-- The canonical root batch starts the complete scheduled level-four state, including all six original waiting families. -/
def initialRestriction (root : ℝ) (positive : 0 < root) (size : ℕ) :
    CoordinateRestriction (SuppliedInitialPhase.batch (K := K) size root)
      (state (K := K) 0 (Widths.initial root positive) size).coefficient :=
  sixfoldProductRestriction (SuppliedInitialAllocation.waiting (K := K) size root)
    (SuppliedStagePresentations.level4.originalParent (K := K) size 5 (fun _ => root))

/-- Each actual canonical output advances its complete batch to the next state, with no unproved interface assumptions. -/
theorem next_reduction (index : Fin 3) (widths : Widths) (next : Width (phaseAt index))
    {size : ℕ} (sizePositive : 0 < size) :
    ContextReduction.{v}
      (product (waiting (K := K) widths size (phaseAt index)).coefficient
        (SuppliedCanonicalStages.children (K := K) (phaseAt index) size next.val))
      (state (K := K) (index.val+1) (widths.update (phaseAt index) next) size).coefficient 1 := by
  fin_cases index
  · have converted := SuppliedLevel4Transition.sixfold_transition (K := K) sizePositive next.val next.property
    have carried := converted.keep_left (rootWaiting (K := K) widths size).coefficient
    have grouped := (associateLeftRestriction (rootWaiting (K := K) widths size).coefficient
      (zero3Waiting (K := K) (widths.update .level4 next) size).coefficient
      (active (K := K) (widths.update .level4 next) size .level3).coefficient).context
    simpa only [one_mul] using carried.trans grouped
  · have converted := SuppliedLevel3Transition.sixfold_positive_transition (K := K) sizePositive next.val next.property
    have carried := converted.keep_left (waiting (K := K) widths size .level3).coefficient
    have grouped := (associateLeftRestriction (waiting (K := K) widths size .level3).coefficient
      (zero2Waiting (K := K) (widths.update .level3 next) size).coefficient
      (active (K := K) (widths.update .level3 next) size .terminal).coefficient).context
    dsimp only [phaseAt, Widths.update, Widths.input, state, atPhase, waiting, active,
      rootWaiting, zero3Waiting, zero2Waiting, SuppliedCanonicalStages.parent,
      SuppliedCanonicalStages.children, SuppliedStagePresentations.presentation,
      SuppliedPathStages.fixed, SuppliedPathStages.Labels, SuppliedPathStages.labelsFinite,
      FiniteTensor.ofCoeff, FiniteTensor.product, FiniteTensor.sixfold] at carried grouped ⊢
    simpa only [one_mul] using carried.trans grouped
  · dsimp only [phaseAt, Widths.update, state, completed, waiting, output,
      rootWaiting, zero3Waiting, zero2Waiting, SuppliedCanonicalStages.children,
      SuppliedStagePresentations.presentation, SuppliedPathStages.fixed,
      SuppliedPathStages.Labels, SuppliedPathStages.labelsFinite,
      FiniteTensor.ofCoeff, FiniteTensor.product, FiniteTensor.sixfold]
    exact ContextReduction.refl _

end
end MatrixBounds.Numeric.SuppliedBatch
