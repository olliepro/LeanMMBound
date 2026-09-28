import SuppliedWaitingZero4Data
import HeterogeneousProductRegrouping

/-! Every complete waiting zero4 family yields its actual matrix, with one
common threshold and its original coefficient-weighted dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero4

universe v
open Tensor Tensor.CW Interface WaitingZeroMatrix SuppliedInitialAllocation
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type} [CommRing K]

/-- Complete source windows for precisely the positive waiting populations. -/
def source (size : ℕ) (tolerance : ℝ) :=
  heterogeneous (fun label : Active => SuppliedPhysicalZero4.sourceWindow (K := K) label.val
    (weight label.val*size) tolerance)

/-- Every root waiting child is exactly its original complete zero4 source window. -/
def sourceRestriction (size : ℕ) (tolerance : ℝ) (node : Fin 48) :
    CoordinateRestriction (SuppliedInitialAllocation.childWindow (K := K) size tolerance (child node))
      (SuppliedPhysicalZero4.sourceWindow (K := K) node (weight node*size) tolerance) := by
  unfold SuppliedInitialAllocation.childWindow SuppliedPhysicalZero4.sourceWindow SuppliedAllocationWindows.window
  unfold SuppliedHigherLaws.root4
  simp only [child_kind]
  rw [child_shape]
  exact CoordinateRestriction.refl _

/-- Root waiting populations are reidentified exactly and only neutral zero coefficients are omitted. -/
def selectRestriction (size : ℕ) (tolerance : ℝ) :
    CoordinateRestriction (waiting (K := K) size tolerance) (source (K := K) size tolerance) :=
  (CoordinateRestriction.heterogeneous (sourceRestriction (K := K) size tolerance)).trans
    (dropZeroWeightRestriction weight size
      (fun node => constituent (K := K) 5 8 (SuppliedZeroSupport.shape4 node))
      (fun _ x => fineWord x.val) (fun _ y => fineWord y.val) (fun _ z => fineWord z.val)
      (fun node => SuppliedHigherLaws.zero4 node (SuppliedZeroSupport.shape4 node) 0)
      (fun node => SuppliedHigherLaws.zero4 node (SuppliedZeroSupport.shape4 node) 1)
      (fun node => SuppliedHigherLaws.zero4 node (SuppliedZeroSupport.shape4 node) 2)
      (fun _ => tolerance))

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
theorem eventual_factor (label : Active) (tolerance : ℝ)
    (nonnegative : 0 ≤ tolerance) {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      (weight label.val : ℝ)*size*(rate label.val-error) ≤
        Real.log (Fintype.card (Indices label.val size) : ℝ) ∧
      ContextReduction.{v}
        (SuppliedPhysicalZero4.sourceWindow (K := K) label.val (weight label.val*size) tolerance)
        (MatrixMul.tensor (K := K) (I := Rows label.val size) (J := Inner label.val size) (L := Columns label.val size)) 1 := by
  obtain ⟨threshold, extract⟩ := SuppliedPhysicalZero4.eventual_extraction.{v, 0, 0, 0} (K := K) label.val
    errorPositive nonnegative
  refine ⟨threshold, ?_⟩
  intro size large
  obtain ⟨dimension, reduction⟩ := extract (weight label.val*size)
    (large.trans (Nat.le_mul_of_pos_left size label.property)) (population_divisible label.val size)
  refine ⟨?_, restore_matrix (SuppliedZeroShapeBindings.order4 label.val) ?_⟩
  swap
  · convert reduction using 1
    congr 1 <;> exact Subsingleton.elim _ _
  simpa only [Indices, Nat.card_eq_fintype_card, Nat.cast_mul] using dimension

/-- Dropping only zero weights preserves the exact total rate and the distributed error term. -/
theorem rate_sum (error : ℝ) :
    (∑ label : Active, (weight label.val : ℝ)*(rate label.val-error)) = volumeRate-error*totalWeight := by
  rw [sum_positive_weights weight (fun label => rate label-error)]
  unfold volumeRate totalWeight
  simp only [mul_sub, Finset.sum_sub_distrib, ← Finset.sum_mul]
  ring

/-- All complete original zero4 waiting windows simultaneously yield their actual product matrix at unit cost. -/
theorem eventual_extraction_per_unit (tolerance : ℝ)
    (nonnegative : 0 ≤ tolerance) {error : ℝ} (errorPositive : 0 < error) :
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
end MatrixBounds.Numeric.SuppliedWaitingZero4
