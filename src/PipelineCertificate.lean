import PipelineTensorSchedule
import PipelineScheduleRates
import ContextSequenceRates

/-! A finite pipeline transports its genuine initial certificate to all
completed batches with the proved warm-up and drain accounting. -/
namespace MatrixBounds.Pipeline

universe v
open Tensor Interface
open scoped BigOperators
noncomputable section
variable {K : Type*} [CommSemiring K] {batches : ℕ}
variable {X Y Z : Fin batches → ℕ → Type}

/-- Equal stage numbers give the same tensor through dependent coordinate casts. -/
def equalStateRestriction {A B C : ℕ → Type*}
    (family : ∀ state, Coeff K (A state) (B state) (C state)) {before after : ℕ} (same : before = after) :
    CoordinateRestriction (family before) (family after) := by
  cases same
  exact CoordinateRestriction.refl _

/-- The initial scheduled state consists exactly of all batches in state zero. -/
def initialRestriction (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state)) :
    CoordinateRestriction (heterogeneous (fun batch => tensors batch 0)) (roundTensor tensors 0) :=
  CoordinateRestriction.heterogeneous (fun batch => equalStateRestriction (tensors batch) (completed_initial batch.val).symm)

/-- After all rounds every batch is in its completed state, with no batch omitted. -/
def finalRestriction (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state)) :
    CoordinateRestriction (roundTensor tensors (batches+2)) (heterogeneous (fun batch => tensors batch 3)) :=
  CoordinateRestriction.heterogeneous (fun batch => equalStateRestriction (tensors batch) (completed_final batch))

/-- Actual active extractions and their bounds yield a final rank decomposition with the full finite boundary loss. -/
theorem pipeline_certificate
    [∀ batch state, Fintype (X batch state)] [∀ batch state, Fintype (Y batch state)]
    [∀ batch state, Fintype (Z batch state)]
    (large : 2 ≤ batches)
    (tensors : ∀ batch state, Coeff K (X batch state) (Y batch state) (Z batch state))
    (copies cost : ℕ → ℕ) (rates : Fin 3 → Rates) (copyError costError size : ℝ)
    (extractions : ∀ round, round < batches+2 → ContextReduction.{v} (activeTensor tensors round)
      (directSum (fun _ : Fin (copies round) => advancedTensor tensors round)) (cost round))
    (copyBounds : ∀ round, round < batches+2 →
      Real.exp ((bottleneck (roundRates batches round rates)-copyError)*size) ≤ copies round)
    (costBounds : ∀ round, round < batches+2 → (cost round : ℝ) ≤ Real.exp (costError*size))
    (rank degree : ℕ) (certificate : Degeneration.Certificate (heterogeneous (fun batch => tensors batch 0)) rank degree) :
    ∃ finalCopies budget : ℕ,
      Real.exp ((batches*bottleneck (rates 0+rates 1+rates 2)-boundaryLoss (rates 0) (rates 1) (rates 2)
        -(batches+2)*copyError)*size) ≤ finalCopies ∧
      (budget : ℝ) ≤ Real.exp ((batches+2)*costError*size)*(rank*(degree+1)^2) ∧
      RankLE (directSum (fun _ : Fin finalCopies => heterogeneous (fun batch => tensors batch 3))) budget := by
  let finalCopies := ∏ round ∈ Finset.range (batches+2), copies round
  let totalCost := ∏ round ∈ Finset.range (batches+2), cost round
  have extraction := ((initialRestriction tensors).context.trans
    (pipeline_extraction tensors copies cost extractions)).trans ((finalRestriction tensors).context.batch (I := Fin finalCopies))
  have algorithm : RankLE (directSum (fun _ : Fin finalCopies => heterogeneous (fun batch => tensors batch 3)))
      (totalCost*(rank*(degree+1)^2)) := by
    simpa only [one_mul, mul_one] using extraction.apply_certificate certificate
  refine ⟨finalCopies, totalCost*(rank*(degree+1)^2), ?_, ?_, algorithm⟩
  · have retained := copy_product_lower copies
      (fun round => (bottleneck (roundRates batches round rates)-copyError)*size) (batches+2) copyBounds
    simpa only [total_growth large] using retained
  · have overhead := overhead_product_upper cost (fun _ => costError*size) (batches+2) costBounds
    have bound := mul_le_mul_of_nonneg_right overhead (show (0 : ℝ) ≤ rank*(degree+1)^2 by positivity)
    simpa only [Finset.sum_const, Finset.card_range, nsmul_eq_mul, Nat.cast_add, Nat.cast_ofNat,
      Nat.cast_mul, Nat.cast_pow, Nat.cast_one, mul_assoc, totalCost] using bound

end
end MatrixBounds.Pipeline
