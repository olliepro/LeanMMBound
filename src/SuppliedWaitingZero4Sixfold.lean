module

public import SuppliedWaitingZero4Extraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete sixfold waiting zero4 family produces one actual matrix at
the exact original weighted volume rate with arbitrarily small additive loss. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero4

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedInitialAllocation
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- Actual final row indices from all six orientations of the complete waiting matrix. -/
abbrev CombinedRows (size : ℕ) := SixfoldRows (MatrixRows size) (MatrixInner size) (MatrixColumns size)

/-- Actual final contracted indices from all six orientations of the complete waiting matrix. -/
abbrev CombinedInner (size : ℕ) := SixfoldInner (MatrixRows size) (MatrixInner size) (MatrixColumns size)

/-- Actual final column indices from all six orientations of the complete waiting matrix. -/
abbrev CombinedColumns (size : ℕ) := SixfoldColumns (MatrixRows size) (MatrixInner size) (MatrixColumns size)

/-- A positive per-population loss distributes any requested global error across the six complete waiting families. -/
def distributedError (error : ℝ) : ℝ := error/(6*(totalWeight+1))

/-- The distributed loss is strictly positive for any positive requested error. -/
theorem distributedError_positive {error : ℝ} (positive : 0 < error) : 0 < distributedError error :=
  div_pos positive (mul_pos (by norm_num) (by linarith [totalWeight_nonnegative]))

/-- The total weighted error across all six orientations never exceeds the requested global error. -/
theorem distributedError_bound {error : ℝ} (positive : 0 < error) :
    6*distributedError error*totalWeight ≤ error := by
  have nonnegative := totalWeight_nonnegative
  have identity : 6*distributedError error*(totalWeight+1) = error := by
    unfold distributedError
    have nonzero : 6*(totalWeight+1) ≠ 0 := ne_of_gt (mul_pos (by norm_num) (by linarith))
    calc
      6*(error/(6*(totalWeight+1)))*(totalWeight+1) =
          (error/(6*(totalWeight+1)))*(6*(totalWeight+1)) := by ring
      _ = error := div_mul_cancel₀ error nonzero
  have lossPositive := distributedError_positive positive
  nlinarith

/-- All six physical orientations of every original waiting zero4 window yield a genuine matrix at their full weighted rate.
Only nonnegative available window widths and an arbitrary positive asymptotic error are inputs. -/
theorem eventual_sixfold_extraction (tolerance : ℝ)
    (nonnegative : 0 ≤ tolerance) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (size : ℝ)*(6*volumeRate-error) ≤
        Real.log ((Fintype.card (CombinedRows size)*Fintype.card (CombinedInner size)*
          Fintype.card (CombinedColumns size) : ℕ) : ℝ) ∧
      ContextReduction.{v}
        (heterogeneous (fun order : AxisOrder => orient order (waiting (K := K) size tolerance)))
        (MatrixMul.tensor (K := K) (I := CombinedRows size) (J := CombinedInner size) (L := CombinedColumns size)) 1 := by
  obtain ⟨threshold, extract⟩ := eventual_extraction_per_unit (K := K) tolerance nonnegative
    (distributedError_positive errorPositive)
  refine ⟨threshold, ?_⟩
  intro size large
  obtain ⟨dimension, reduction⟩ := extract size large
  constructor
  · rw [sixfold_log_volume]
    have errorBound := distributedError_bound errorPositive
    have scaledError := mul_le_mul_of_nonneg_left errorBound (Nat.cast_nonneg size : (0 : ℝ) ≤ size)
    nlinarith
  · simpa only [one_pow, one_mul] using reduction.sixfold.trans
      (sixfold_matrix (K := K) (I := MatrixRows size) (J := MatrixInner size) (L := MatrixColumns size))

end
end MatrixBounds.Numeric.SuppliedWaitingZero4
