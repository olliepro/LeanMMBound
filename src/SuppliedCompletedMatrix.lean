module

public import SuppliedCompletedMatrixData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! All waiting and terminal factors of each actual completed batch restrict
to its genuine complete matrix with arbitrarily small total volume loss. -/
namespace MatrixBounds.Numeric.SuppliedCompletedMatrix

universe v
open Tensor Tensor.CW Interface SuppliedBatch
noncomputable section
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000

/-- One actual completed batch yields its full matrix at unit cost and the full weighted logarithmic rate. -/
theorem eventual_extraction (widths : Widths) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (size : ℝ)*(volumeRate-error) ≤
        Real.log ((Fintype.card (Rows size)*Fintype.card (Inner size)*Fintype.card (Columns size) : ℕ) : ℝ) ∧
      ContextReduction.{v} (completed (K := K) widths size).coefficient
        (MatrixMul.tensor (K := K) (I := Rows size) (J := Inner size) (L := Columns size)) 1 := by
  have partPositive : 0 < error/3 := by positivity
  obtain ⟨firstThreshold, first⟩ := SuppliedWaitingZero4.eventual_sixfold_extraction (K := K)
    widths.root widths.rootPositive.le partPositive
  obtain ⟨secondThreshold, second⟩ := SuppliedWaitingZero3.eventual_sixfold_extraction (K := K)
    (SuppliedLevel4Transition.extendTolerance widths.output4.val)
    (fun label => (SuppliedLevel4Transition.extendTolerance_positive _ widths.output4.property label).le) partPositive
  obtain ⟨thirdThreshold, third⟩ := SuppliedWaitingZero2.eventual_sixfold_extraction (K := K)
    (SuppliedLevel3Transition.extendTolerance widths.output3.val)
    (fun label => (SuppliedLevel3Transition.extendTolerance_pos _ widths.output3.property label).le) partPositive
  refine ⟨max 1 (max firstThreshold (max secondThreshold thirdThreshold)), ?_⟩
  intro size large
  have sizePositive : 0 < size := by omega
  obtain ⟨firstVolume, firstReduction⟩ := first size (by omega)
  obtain ⟨secondVolume, secondReduction⟩ := second size (by omega)
  obtain ⟨thirdVolume, thirdReduction⟩ := third size (by omega)
  have terminalVolume := SuppliedTerminalSixfoldMatrix.log_volume sizePositive
  constructor
  · rw [log_volume, terminalVolume]
    dsimp only [volumeRate]
    nlinarith
  · have firstTwo := (firstReduction.product secondReduction).trans
      (MatrixMul.productCoordinateRestriction (K := K)).context
    have waiting := (firstTwo.product thirdReduction).trans (MatrixMul.productCoordinateRestriction (K := K)).context
    have complete := (waiting.product (SuppliedTerminalSixfoldMatrix.reduction (K := K) size widths.outputTerminal)).trans
      (MatrixMul.productCoordinateRestriction (K := K)).context
    dsimp only [completed, SuppliedBatch.waiting, rootWaiting, zero3Waiting, zero2Waiting,
      FiniteTensor.ofCoeff, FiniteTensor.product, FiniteTensor.sixfold] at complete ⊢
    simpa only [one_mul] using complete

end
end MatrixBounds.Numeric.SuppliedCompletedMatrix
