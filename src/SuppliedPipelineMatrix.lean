import SuppliedCompletedMatrix
import MatrixFamilyVolume
import SuppliedRoundWidths

/-! All complete final batches combine into one concrete finite matrix,
with a uniform threshold for their separately chosen windows. -/
namespace MatrixBounds.Numeric.SuppliedPipelineMatrix

universe v
open Tensor Tensor.CW Interface SuppliedBatch SuppliedRounds
open scoped BigOperators
noncomputable section
set_option synthInstance.maxSize 1000
set_option maxRecDepth 3000
set_option maxHeartbeats 3000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K] {batches : ℕ}

/-- All complete matrix row indices across the original labelled source batches. -/
abbrev Rows (batches size : ℕ) := Fin batches → SuppliedCompletedMatrix.Rows size

/-- All complete contracted matrix indices across the original labelled source batches. -/
abbrev Inner (batches size : ℕ) := Fin batches → SuppliedCompletedMatrix.Inner size

/-- All complete matrix column indices across the original labelled source batches. -/
abbrev Columns (batches size : ℕ) := Fin batches → SuppliedCompletedMatrix.Columns size

/-- Full matrix volume growth of all original supplied batches. -/
def volumeRate (batches : ℕ) : ℝ := batches*SuppliedCompletedMatrix.volumeRate

/-- All final batches have positive finite matrix volume. -/
theorem volume_positive (batches size : ℕ) :
    0 < Fintype.card (Rows batches size)*Fintype.card (Inner batches size)*Fintype.card (Columns batches size) := by
  have positive := MatrixMul.family_volume_positive
    (fun _ : Fin batches => SuppliedCompletedMatrix.Rows size)
    (fun _ => SuppliedCompletedMatrix.Inner size) (fun _ => SuppliedCompletedMatrix.Columns size)
    (fun _ => SuppliedCompletedMatrix.volume_positive size)
  simpa only [← Nat.card_eq_fintype_card] using positive

/-- The complete pipeline matrix multiplies each complete batch's logarithmic volume by the batch count. -/
theorem log_volume (batches size : ℕ) :
    Real.log ((Fintype.card (Rows batches size)*Fintype.card (Inner batches size)*Fintype.card (Columns batches size) : ℕ) : ℝ) =
      (batches : ℝ)*Real.log ((Fintype.card (SuppliedCompletedMatrix.Rows size)*
        Fintype.card (SuppliedCompletedMatrix.Inner size)*Fintype.card (SuppliedCompletedMatrix.Columns size) : ℕ) : ℝ) := by
  have equality := MatrixMul.identical_log_volume batches (SuppliedCompletedMatrix.Rows size)
    (SuppliedCompletedMatrix.Inner size) (SuppliedCompletedMatrix.Columns size) (SuppliedCompletedMatrix.volume_positive size)
  simpa only [← Nat.card_eq_fintype_card] using equality

/-- Every actual finite family of complete batches yields its genuine product-index matrix at full asymptotic volume. -/
theorem eventual_extraction (positiveBatches : 0 < batches) (final : Parameters batches)
    {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (size : ℝ)*(volumeRate batches-error) ≤
        Real.log ((Fintype.card (Rows batches size)*Fintype.card (Inner batches size)*Fintype.card (Columns batches size) : ℕ) : ℝ) ∧
      ContextReduction.{v} (heterogeneous (fun batch => (completed (K := K) (final batch) size).coefficient))
        (MatrixMul.tensor (K := K) (I := Rows batches size) (J := Inner batches size) (L := Columns batches size)) 1 := by
  have countPositive : (0 : ℝ) < batches := by exact_mod_cast positiveBatches
  have partPositive : 0 < error/(batches : ℝ) := div_pos positive countPositive
  choose thresholds extract using fun batch => SuppliedCompletedMatrix.eventual_extraction (K := K) (final batch) partPositive
  refine ⟨∑ batch, thresholds batch, ?_⟩
  intro size above
  have selected := fun batch => extract batch size
    ((Finset.single_le_sum (fun _ _ => Nat.zero_le _) (Finset.mem_univ batch)).trans above)
  constructor
  · have one := (selected (⟨0, positiveBatches⟩ : Fin batches)).1
    have multiplied := mul_le_mul_of_nonneg_left one countPositive.le
    rw [log_volume]
    convert multiplied using 1
    dsimp only [volumeRate]
    field_simp
  · have extracted := ContextReduction.heterogeneous (fun _ : Fin batches => 1) (fun batch => (selected batch).2)
    have combined := extracted.trans (MatrixMul.heterogeneousCoordinateRestriction (K := K)).context
    simpa only [Finset.prod_const_one, one_mul] using combined

end
end MatrixBounds.Numeric.SuppliedPipelineMatrix
