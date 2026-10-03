module

public import SuppliedWaitingZero3Data
public import HeterogeneousProductRegrouping

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every complete waiting zero3 family yields its actual matrix, with one
common threshold and its original coefficient-weighted dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero3

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedLevel4Transition
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- Complete source windows for precisely the positive waiting populations. -/
def source (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :=
  heterogeneous (fun label : Active => SuppliedPhysicalZero3.sourceWindow (K := K) label.val.2
    (weight label.val*size) (toleranceAt tolerance label.val))

/-- Empty waiting populations are neutral; all positive original roles and nodes remain separate. -/
def selectRestriction (size : ℕ) (tolerance : Fin 105 × AxisOrder → ℝ) :
    CoordinateRestriction (waiting3 (K := K) size tolerance) (source (K := K) size tolerance) :=
  (flattenProductRestriction (fun previous node => SuppliedPhysicalZero3.sourceWindow (K := K) node
    (zeroWeight node previous*size) (tolerance ((SuppliedNodePartialIndexing.decode (.inr node)).1, previous)))).trans
    (dropZeroWeightRestriction weight size
      (fun label => constituent (K := K) 5 4 (SuppliedZeroSupport.shape3 label.2))
      (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
      (fun label => SuppliedHigherLaws.zero3 label.2 (SuppliedZeroSupport.shape3 label.2) 0)
      (fun label => SuppliedHigherLaws.zero3 label.2 (SuppliedZeroSupport.shape3 label.2) 1)
      (fun label => SuppliedHigherLaws.zero3 label.2 (SuppliedZeroSupport.shape3 label.2) 2)
      (toleranceAt tolerance))

/-- Product row indices of all separately labelled positive waiting matrices. -/
abbrev MatrixRows (size : ℕ) := ∀ label : Active, Rows label.val size

/-- Product contracted indices of all separately labelled positive waiting matrices. -/
abbrev MatrixInner (size : ℕ) := ∀ label : Active, Inner label.val size

/-- Product column indices of all separately labelled positive waiting matrices. -/
abbrev MatrixColumns (size : ℕ) := ∀ label : Active, Columns label.val size

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
theorem eventual_factor (label : Active) (tolerance : Fin 105 × AxisOrder → ℝ)
    (nonnegative : ∀ parent, 0 ≤ tolerance parent) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (weight label.val : ℝ)*size*(rate label.val-error) ≤
        Real.log (Fintype.card (Indices label.val size) : ℝ) ∧
      ContextReduction.{v}
        (SuppliedPhysicalZero3.sourceWindow (K := K) label.val.2 (weight label.val*size) (toleranceAt tolerance label.val))
        (MatrixMul.tensor (K := K) (I := Rows label.val size) (J := Inner label.val size) (L := Columns label.val size)) 1 := by
  obtain ⟨threshold, extract⟩ := SuppliedPhysicalZero3.eventual_extraction.{v, 0, 0, 0} (K := K) label.val.2
    errorPositive (nonnegative ((SuppliedNodePartialIndexing.decode (.inr label.val.2)).1, label.val.1))
  refine ⟨threshold, ?_⟩
  intro size large
  obtain ⟨dimension, reduction⟩ := extract (weight label.val*size)
    (large.trans (Nat.le_mul_of_pos_left size label.property)) (population_divisible label.val size)
  refine ⟨?_, restore_matrix (SuppliedZeroShapeBindings.order3 label.val.2) ?_⟩
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

/-- All complete original zero3 waiting windows simultaneously yield their actual product matrix at unit cost. -/
theorem eventual_extraction_per_unit (tolerance : Fin 105 × AxisOrder → ℝ)
    (nonnegative : ∀ parent, 0 ≤ tolerance parent) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (size : ℝ)*(volumeRate-error*totalWeight) ≤
        Real.log ((Fintype.card (MatrixRows size)*Fintype.card (MatrixInner size)*
          Fintype.card (MatrixColumns size) : ℕ) : ℝ) ∧
      ContextReduction.{v} (waiting3 (K := K) size tolerance)
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
end MatrixBounds.Numeric.SuppliedWaitingZero3
