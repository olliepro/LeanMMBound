import CWRationalMixedExtraction
import CWRationalChildren
import ContextComposition
import MatrixBounds

/-! A checked rational stage packages its fixed mathematical parameters.
Its extraction theorem has one arbitrary error and no graph or count premises. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Fixed parameters of a mixed stage, including the support checks and all three complete fine laws. -/
structure RationalStage (T : Type*) [Fintype T] (length : T → ℕ) (denominator : ℕ) where
  /-- Supported symmetric rational split for each labelled type. -/
  splits : ∀ type, RationalSplit (length type) denominator
  /-- Integer population coefficients multiplying the common asymptotic scale. -/
  weight : T → ℕ
  /-- All retained type labels have positive populations. -/
  weightPositive : ∀ type, 0 < weight type
  /-- Each child population coefficient is an integer before the scale is selected. -/
  divisible : ∀ type, denominator ∣ weight type
  /-- Complete child laws in the fixed physical X, Y, Z order. -/
  law : ∀ type, Fin 3 → ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ
  /-- Every child-law entry is a probability entry, including unused child labels. -/
  lawRange : ∀ type axis child symbol, 0 ≤ law type axis child symbol ∧ law type axis child symbol ≤ 1
  /-- Positive potentials defining the rational Gibbs coarse-degree bound. -/
  potential : ∀ type, Fin 3 → Fin (2*length type+1) → ℝ
  /-- The logarithms and Gibbs bound use strictly positive potentials. -/
  potentialPositive : ∀ type axis symbol, 0 < potential type axis symbol

namespace RationalStage
variable {T : Type*} [Fintype T] {length : T → ℕ} {denominator : ℕ}

/-- The sum of the three physical retention rates, before selecting the shared bottleneck. -/
def rates (stage : RationalStage T length denominator) : Rates :=
  ![∑ type, (stage.weight type : ℝ)*(stage.splits type).coarseRetention
      (stage.potential type 0) (stage.potential type 1) (stage.potential type 2),
    ∑ type, (stage.weight type : ℝ)*(stage.splits type).fineRetention yClass (stage.law type 1),
    ∑ type, (stage.weight type : ℝ)*(stage.splits type).fineRetention zClass (stage.law type 2)]

/-- The fixed stage rate is exactly the minimum after the three complete physical sums. -/
theorem retention_eq_bottleneck (stage : RationalStage T length denominator) :
    rationalRetention stage.splits stage.weight (fun type => stage.potential type 0)
      (fun type => stage.potential type 1) (fun type => stage.potential type 2)
      (fun type => stage.law type 1) (fun type => stage.law type 2) 0 = bottleneck stage.rates := by
  simp only [rationalRetention, mixedRetention, sub_zero, bottleneck, rates,
    Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two]
  rfl

/-- A checked rational stage supplies all complete child windows at its exact bottleneck rate with arbitrarily small loss. -/
theorem eventual_extraction {K : Type*} [CommRing K] (stage : RationalStage T length denominator)
    (denominatorPositive : 0 < denominator) (q : ℕ) (wide : T → ℝ) (widePositive : ∀ type, 0 < wide type)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ delta : T → ℝ, (∀ type, 0 < delta type) ∧ ∃ threshold : ℕ,
      ∀ k : ℕ, threshold ≤ k → denominator ∣ RepairRates.scale k → ∃ copies cost : ℕ,
        Real.exp ((bottleneck stage.rates-error)*RepairRates.scale k) ≤ copies ∧
        (cost : ℝ) ≤ Real.exp (error*RepairRates.scale k) ∧
        ContextReduction.{v}
          (rationalParent (K := K) stage.splits stage.weight (RepairRates.scale k) q
            (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2) wide)
          (directSum (fun _ : Fin copies => rationalChildren (K := K) stage.splits stage.weight (RepairRates.scale k) q
            (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2) delta)) cost := by
  let total : ℝ := ∑ type, (stage.weight type : ℝ)
  have nonnegative : 0 ≤ total := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)
  let degreeError := error/(2*(total+1))
  have degreePositive : 0 < degreeError := div_pos errorPositive (by positivity)
  have degreeBound : degreeError*total ≤ error/2 := by
    have identity : degreeError*(2*(total+1)) = error := div_mul_cancel₀ error (by positivity)
    nlinarith
  let base := max 2 (Finset.univ.sup (fun type => 2*length type))
  obtain ⟨delta, positiveDelta, threshold, extraction⟩ := eventual_rational_extraction.{v}
    (K := K) stage.splits stage.weight stage.weightPositive denominatorPositive q (q+2) base
    (fun type => Fintype.card (ShapeAlphabet (2*length type))) Nat.lt_two_pow_self.le
    (fun _ => Nat.lt_two_pow_self.le) (le_max_left _ _)
    (fun type => (Finset.le_sup (f := fun type => 2*length type) (Finset.mem_univ type)).trans (le_max_right _ _))
    wide widePositive (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2)
    (fun type => stage.lawRange type 0) (fun type => stage.lawRange type 1) (fun type => stage.lawRange type 2)
    (fun type => stage.potential type 0) (fun type => stage.potential type 1) (fun type => stage.potential type 2)
    (fun type => stage.potentialPositive type 0) (fun type => stage.potentialPositive type 1)
    (fun type => stage.potentialPositive type 2) degreePositive (half_pos errorPositive) errorPositive
  refine ⟨delta, positiveDelta, threshold, ?_⟩
  intro k large divisible
  obtain ⟨copies, cost, retained, costBound, reduction⟩ := extraction k large divisible
  refine ⟨copies, cost, ?_, costBound, ?_⟩
  · rw [rationalRetention_error, stage.retention_eq_bottleneck] at retained
    apply le_trans (Real.exp_le_exp.mpr ?_) retained
    exact mul_le_mul_of_nonneg_right (by dsimp only [total] at degreeBound; linarith) (Nat.cast_nonneg _)
  · simpa only [one_mul] using reduction.trans
      ((rationalChildrenRestriction stage.splits stage.weight stage.divisible (RepairRates.scale k) q
        (fun type => stage.law type 0) (fun type => stage.law type 1) (fun type => stage.law type 2) delta).context.batch)

end RationalStage
end
end MatrixBounds.Tensor.CW.Mixed
