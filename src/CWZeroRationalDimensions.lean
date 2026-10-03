module

public import CWTypedDimensions
public import LogarithmicLoss

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Zero-coordinate matrix dimensions at a fixed rational complete fine law.
All entropy estimates refer to the actual typed coordinate set. -/
namespace MatrixBounds.Tensor.CW

open Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Repeating a fine profile repeats its total number of middle coordinates by the same factor. -/
theorem middleMultiplicity_scale {length : ℕ} (profile : (Fin length → Fin 3) → ℕ) (repetitions : ℕ) :
    middleMultiplicity (fun word => repetitions*profile word) = repetitions*middleMultiplicity profile := by
  unfold middleMultiplicity
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro word _
  ring

/-- The mean middle-coordinate count of a rational law is independent of its divisible population. -/
theorem rational_middleMultiplicity {length denominator size : ℕ}
    (numerator : (Fin length → Fin 3) → ℕ) (denominatorPositive : 0 < denominator)
    (divisible : denominator ∣ size) :
    (middleMultiplicity (rationalProfile numerator denominator size) : ℝ) =
      (size : ℝ)*((middleMultiplicity numerator : ℝ)/denominator) := by
  rw [show rationalProfile numerator denominator size = (fun word => (size/denominator)*numerator word) from rfl,
    middleMultiplicity_scale, Nat.cast_mul]
  have factor : ((size/denominator : ℕ) : ℝ)*(denominator : ℝ) = size := by
    exact_mod_cast Nat.div_mul_cancel divisible
  have nonzero : (denominator : ℝ) ≠ 0 := by exact_mod_cast denominatorPositive.ne'
  rw [← mul_div_assoc]
  apply (eq_div_iff nonzero).mpr
  nlinarith

/-- The logarithmic matrix-size rate of a normalized complete fine law. -/
def zeroDimensionRate {length : ℕ} (q denominator : ℕ) (numerator : (Fin length → Fin 3) → ℕ) : ℝ :=
  entropy (fun word => (numerator word : ℝ)/denominator) +
    ((middleMultiplicity numerator : ℝ)/denominator)*Real.log q

/-- The actual rational typed dimension has the intended rate and explicit finite-size errors. -/
theorem rational_dimension_entropy_bounds {q length total denominator size : ℕ} (qPositive : 0 < q)
    (numerator : (Fin length → Fin 3) → ℕ) (normalized : ∑ word, numerator word = denominator)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (supported : ∀ word, fineTotal word ≠ total → numerator word = 0) :
    (size : ℝ)*zeroDimensionRate q denominator numerator-
        (3^length : ℕ)*(Real.log ((size : ℝ)+1)+1) ≤
      Real.log (Nat.card (Interface.Variable (P := Fin size)
        (fun entry : AxisVariable q length total => fineWord entry.val)
        (rationalProfile numerator denominator size)) : ℝ) ∧
    Real.log (Nat.card (Interface.Variable (P := Fin size)
      (fun entry : AxisVariable q length total => fineWord entry.val)
      (rationalProfile numerator denominator size)) : ℝ) ≤
      (size : ℝ)*zeroDimensionRate q denominator numerator+Real.log ((size : ℝ)+1)+1 := by
  let representative := Classical.choice (rationalProfile_feasible numerator normalized divisible)
  have support : ∀ word, fineTotal word ≠ total → rationalProfile numerator denominator size word = 0 := by
    intro word outside
    simp only [rationalProfile, supported word outside, mul_zero]
  have bound := exact_dimension_entropy_bounds qPositive (rationalProfile numerator denominator size)
    support representative (by simpa only [Fintype.card_fin] using sizePositive)
  have law : (fun word => (rationalProfile numerator denominator size word : ℝ)/(size : ℝ)) =
      (fun word => (numerator word : ℝ)/(denominator : ℝ)) :=
    funext (rationalProfile_probability numerator denominatorPositive sizePositive divisible)
  simp only [law, rational_middleMultiplicity numerator denominatorPositive divisible,
    ← Nat.card_eq_fintype_card, Nat.card_fin] at bound
  unfold zeroDimensionRate
  constructor <;> linarith [bound.1, bound.2]

/-- Above one fixed threshold, every divisible population realizes the dimension rate with an arbitrarily small loss. -/
theorem eventual_rational_dimension {q length total denominator : ℕ} (qPositive : 0 < q)
    (numerator : (Fin length → Fin 3) → ℕ) (normalized : ∑ word, numerator word = denominator)
    (denominatorPositive : 0 < denominator)
    (supported : ∀ word, fineTotal word ≠ total → numerator word = 0)
    {error : ℝ} (errorPositive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → denominator ∣ size →
      (size : ℝ)*(zeroDimensionRate q denominator numerator-error) ≤
        Real.log (Nat.card (Interface.Variable (P := Fin size)
          (fun entry : AxisVariable q length total => fineWord entry.val)
          (rationalProfile numerator denominator size)) : ℝ) := by
  obtain ⟨threshold, small⟩ := Selection.logarithmic_error_eventually
    (constant := ((3^length : ℕ) : ℝ)) (growth := 1) (Nat.cast_nonneg _) (by norm_num) errorPositive
  refine ⟨max 1 threshold, ?_⟩
  intro size large divisible
  have positive : 0 < size := by omega
  have bound := (rational_dimension_entropy_bounds qPositive numerator normalized denominatorPositive
    positive divisible supported).1
  have loss := small size (by omega)
  simp only [one_mul] at loss
  nlinarith

end
end MatrixBounds.Tensor.CW
