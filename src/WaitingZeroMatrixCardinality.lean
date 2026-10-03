module

public import CWZeroRationalExtraction
public import ContextMatrixProducts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Supported normalized rational zero-coordinate laws have nonempty actual
matrix index sets; their product-dimension logarithms therefore add exactly. -/
namespace MatrixBounds.Tensor.WaitingZeroMatrix

open CW Empirical Interface
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Every divisible supported normalized rational profile gives a nonempty actual zero-matrix index set, including population zero. -/
theorem rational_card_positive {q length total denominator size : ℕ} (qPositive : 0 < q)
    (numerator : (Fin length → Fin 3) → ℕ) (normalized : ∑ word, numerator word = denominator)
    (divisible : denominator ∣ size)
    (supported : ∀ word, fineTotal word ≠ total → numerator word = 0) :
    0 < Fintype.card (RationalZeroIndices q length total denominator size numerator) := by
  letI : Nonempty (TypedWord (P := Fin size) (rationalProfile numerator denominator size)) :=
    rationalProfile_feasible numerator normalized divisible
  have support : ∀ word, fineTotal word ≠ total → rationalProfile numerator denominator size word = 0 := by
    intro word outside
    simp only [rationalProfile, supported word outside, mul_zero]
  rw [exact_variable_card (rationalProfile numerator denominator size) support]
  have wordPositive : 0 < Fintype.card (TypedWord (P := Fin size) (rationalProfile numerator denominator size)) := Fintype.card_pos
  simpa only [← Nat.card_eq_fintype_card] using Nat.mul_pos wordPositive (pow_pos qPositive (middleMultiplicity (rationalProfile numerator denominator size)))

/-- The full logarithmic volume of a finite family of nonempty matrix factors is the sum of their actual volumes. -/
theorem product_log_volume {T : Type} [Fintype T] (I J L : T → Type)
    [∀ type, Fintype (I type)] [∀ type, Fintype (J type)] [∀ type, Fintype (L type)]
    (positive : ∀ type, 0 < Fintype.card (I type)*Fintype.card (J type)*Fintype.card (L type)) :
    Real.log ((Fintype.card (∀ type, I type)*Fintype.card (∀ type, J type)*
      Fintype.card (∀ type, L type) : ℕ) : ℝ) =
      ∑ type, Real.log ((Fintype.card (I type)*Fintype.card (J type)*Fintype.card (L type) : ℕ) : ℝ) := by
  rw [Fintype.card_pi, Fintype.card_pi, Fintype.card_pi,
    ← Finset.prod_mul_distrib, ← Finset.prod_mul_distrib, Nat.cast_prod]
  exact Real.log_prod (fun type _ => by exact_mod_cast (positive type).ne')

end
end MatrixBounds.Tensor.WaitingZeroMatrix
