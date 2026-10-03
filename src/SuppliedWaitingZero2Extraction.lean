module

public import SuppliedWaitingZero2Validity
public import SuppliedWaitingZero2Selection

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every complete waiting zero2 family yields its actual matrix, with one
common threshold and its original coefficient-weighted dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedLevel3Transition SuppliedPopulationPaths
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- Actual logarithmic matrix volume is the sum of the selected original zero-row dimensions. -/
theorem matrix_log_volume (size : ℕ) :
    Real.log ((Fintype.card (MatrixRows size)*Fintype.card (MatrixInner size)*
      Fintype.card (MatrixColumns size) : ℕ) : ℝ) =
      ∑ label : Active, Real.log (Fintype.card (Indices label.val size) : ℝ) := by
  have volume := product_log_volume (fun label : Active => Rows label.val size)
    (fun label : Active => Inner label.val size) (fun label : Active => Columns label.val size)
    (fun label => by rw [factor_volume]; exact indices_positive label.val size)
  simp only [factor_volume] at volume
  simpa only [← Nat.card_eq_fintype_card] using volume

/-- One actual positive waiting population has the claimed asymptotic dimension in its original physical axes. -/
theorem eventual_factor (label : Active) (tolerance : Label3 → ℝ)
    (nonnegative : ∀ parent, 0 ≤ tolerance parent) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (weight label.val : ℝ)*size*(rate label.val-error) ≤
        Real.log (Fintype.card (Indices label.val size) : ℝ) ∧
      ContextReduction.{v}
        (sourceWindow (K := K) label.val size (tolerance label.val.1))
        (MatrixMul.tensor (K := K) (I := Rows label.val size) (J := Inner label.val size) (L := Columns label.val size)) 1 := by
  obtain ⟨threshold, extract⟩ := SuppliedPhysicalZero2.eventual_extraction.{v, 0, 0, 0} (K := K) label.val.1.source.1 label.val.2 label.val.1.source.2
    errorPositive (nonnegative label.val.1)
  refine ⟨threshold, ?_⟩
  intro size large
  obtain ⟨dimension, reduction⟩ := extract (weight label.val*size)
    (large.trans (Nat.le_mul_of_pos_left size label.property)) (population_divisible label.val size)
  refine ⟨?_, restore_matrix (order label.val) ?_⟩
  swap
  · convert reduction using 1
    all_goals (congr 1 <;> exact Subsingleton.elim _ _)
  simpa only [Indices, Nat.card_eq_fintype_card, Nat.cast_mul] using! dimension

/-- Dropping only zero weights preserves the exact total rate and the distributed error term. -/
theorem rate_sum (error : ℝ) :
    (∑ label : Active, (weight label.val : ℝ)*(rate label.val-error)) = volumeRate-error*totalWeight := by
  rw [sum_positive_weights weight (fun label => rate label-error)]
  unfold volumeRate totalWeight
  simp only [mul_sub, Finset.sum_sub_distrib, ← Finset.sum_mul]
  ring

/-- All complete original zero2 waiting windows simultaneously yield their actual product matrix at unit cost. -/
theorem eventual_extraction_per_unit (tolerance : Label3 → ℝ)
    (nonnegative : ∀ parent, 0 ≤ tolerance parent) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (size : ℝ)*(volumeRate-error*totalWeight) ≤
        Real.log ((Fintype.card (MatrixRows size)*Fintype.card (MatrixInner size)*
          Fintype.card (MatrixColumns size) : ℕ) : ℝ) ∧
      ContextReduction.{v} (waiting (K := K) size tolerance)
        (MatrixMul.tensor (K := K) (I := MatrixRows size) (J := MatrixInner size) (L := MatrixColumns size)) 1 := by
  choose thresholds extract using fun label : Active => eventual_factor (K := K) label tolerance nonnegative errorPositive
  refine ⟨Finset.univ.sup thresholds, ?_⟩
  intro size large
  have factors (label : Active) := extract label size ((Finset.le_sup (f := thresholds) (Finset.mem_univ label)).trans large)
  constructor
  · rw [matrix_log_volume, ← rate_sum error, Finset.mul_sum]
    exact Finset.sum_le_sum (fun label _ => by nlinarith [(factors label).1])
  · have extraction := ContextReduction.heterogeneous (fun _ : Active => 1) (fun label => (factors label).2)
    simpa only [Finset.prod_const_one, one_mul, mul_one] using
      ((selectRestriction (K := K) size tolerance).context.trans extraction).trans
        MatrixMul.contextReduction_heterogeneous_matrix

end
end MatrixBounds.Numeric.SuppliedWaitingZero2
