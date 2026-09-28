import CWFiberCounts
import TypeEntropy

/-! Actual coordinate dimensions of exact CW interfaces, with the entropy
and middle-coordinate contribution used for the zero-coordinate leaves. -/
namespace MatrixBounds.Tensor.CW

open Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Total number of middle coordinates among all fine blocks prescribed by a profile. -/
def middleMultiplicity {length : ℕ} (profile : (Fin length → Fin 3) → ℕ) : ℕ :=
  ∑ word, count word 1 * profile word

/-- Exact interface coordinates equal the multinomial fine-part count times q to the middle multiplicity. -/
theorem exact_variable_card {q length total : ℕ} (profile : (Fin length → Fin 3) → ℕ)
    (supported : ∀ word, fineTotal word ≠ total → profile word = 0) :
    Fintype.card (Interface.Variable (P := P)
      (fun entry : AxisVariable q length total => fineWord entry.val) profile) =
      Fintype.card (TypedWord (P := P) profile) * q^(middleMultiplicity profile) := by
  rw [Interface.variable_card]
  congr 1
  rw [middleMultiplicity, ← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_congr rfl
  intro word _
  by_cases valid : fineTotal word = total
  · have cardinality := congrArg (fun n : ℕ => n ^ profile word)
      (axis_fine_fiber_card (q := q) word valid)
    simpa only [← Nat.card_eq_fintype_card, pow_mul] using cardinality
  · rw [supported word valid, pow_zero, mul_zero, pow_zero]

/-- The logarithmic dimension separates into the type-word entropy term and the q-coordinate term. -/
theorem log_exact_variable_card {q length total : ℕ} (positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (supported : ∀ word, fineTotal word ≠ total → profile word = 0)
    (representative : TypedWord (P := P) profile) :
    Real.log (Fintype.card (Interface.Variable (P := P)
      (fun entry : AxisVariable q length total => fineWord entry.val) profile) : ℝ) =
      Real.log (Fintype.card (TypedWord (P := P) profile) : ℝ) + middleMultiplicity profile * Real.log q := by
  letI : Nonempty (TypedWord (P := P) profile) := ⟨representative⟩
  have count_positive : (0 : ℝ) < Fintype.card (TypedWord (P := P) profile) := by exact_mod_cast Fintype.card_pos
  have q_positive : (0 : ℝ) < q := by exact_mod_cast positive
  rw [exact_variable_card profile supported, Nat.cast_mul, Nat.cast_pow,
    Real.log_mul count_positive.ne' (pow_pos q_positive _).ne', Real.log_pow]

/-- The actual dimension has precisely the claimed entropy-plus-middle-symbol growth with explicit errors. -/
theorem exact_dimension_entropy_bounds {q length total : ℕ} (q_positive : 0 < q)
    (profile : (Fin length → Fin 3) → ℕ)
    (supported : ∀ word, fineTotal word ≠ total → profile word = 0)
    (representative : TypedWord (P := P) profile) (positions_positive : 0 < Fintype.card P) :
    (Fintype.card P : ℝ)*Entropy.entropy (fun word => (profile word : ℝ)/Fintype.card P) +
        middleMultiplicity profile*Real.log q -
        (3^length : ℕ)*(Real.log ((Fintype.card P : ℝ)+1)+1) ≤
      Real.log (Fintype.card (Interface.Variable (P := P)
        (fun entry : AxisVariable q length total => fineWord entry.val) profile) : ℝ) ∧
    Real.log (Fintype.card (Interface.Variable (P := P)
      (fun entry : AxisVariable q length total => fineWord entry.val) profile) : ℝ) ≤
      (Fintype.card P : ℝ)*Entropy.entropy (fun word => (profile word : ℝ)/Fintype.card P) +
        middleMultiplicity profile*Real.log q + Real.log ((Fintype.card P : ℝ)+1)+1 := by
  rw [log_exact_variable_card q_positive profile supported representative]
  have bounds := log_type_count_bounds profile representative positions_positive
  simp only [Fintype.card_fun, Fintype.card_fin] at bounds
  constructor <;> linarith [bounds.1, bounds.2]

end
end MatrixBounds.Tensor.CW
