module

public import TypeCounting
public import FactorialEntropy
public import TypeDenominators

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit entropy estimates for actual exact-type cardinalities, including
heterogeneous products. All error terms and profile feasibility are retained. -/
namespace MatrixBounds.Empirical

open MatrixBounds.Entropy
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P] [Fintype B]

/-- A feasible exact-type word count has the stated entropy rate with logarithmic finite-size errors. -/
theorem log_type_count_bounds (profile : B → ℕ) (representative : TypedWord (P := P) profile)
    (positive : 0 < Fintype.card P) :
    (Fintype.card P : ℝ)*entropy (fun b => (profile b : ℝ)/Fintype.card P) -
        Fintype.card B * (Real.log ((Fintype.card P : ℝ)+1)+1) ≤
      Real.log (Fintype.card (TypedWord (P := P) profile) : ℝ) ∧
    Real.log (Fintype.card (TypedWord (P := P) profile) : ℝ) ≤
      (Fintype.card P : ℝ)*entropy (fun b => (profile b : ℝ)/Fintype.card P) +
        Real.log ((Fintype.card P : ℝ)+1)+1 := by
  have total := profile_total profile representative
  have count_positive : 0 < ∑ b, profile b := by rwa [total]
  have bound := multinomial_entropy_bounds profile
  rw [← type_count_multinomial profile representative, countEntropy_eq profile count_positive, total] at bound
  exact bound

/-- Fixed rational profiles have exactly their chosen entropy rate at every positive divisible size. -/
theorem rational_type_entropy_bounds (numerator : B → ℕ) {denominator size : ℕ}
    (normalized : ∑ b, numerator b = denominator) (denominator_positive : 0 < denominator)
    (size_positive : 0 < size) (divisible : denominator ∣ size) :
    (size : ℝ)*entropy (fun b => (numerator b : ℝ)/denominator) -
        Fintype.card B * (Real.log ((size : ℝ)+1)+1) ≤
      Real.log (Fintype.card (TypedWord (P := Fin size) (rationalProfile numerator denominator size)) : ℝ) ∧
    Real.log (Fintype.card (TypedWord (P := Fin size) (rationalProfile numerator denominator size)) : ℝ) ≤
      (size : ℝ)*entropy (fun b => (numerator b : ℝ)/denominator) + Real.log ((size : ℝ)+1)+1 := by
  let representative : TypedWord (P := Fin size) (rationalProfile numerator denominator size) :=
    Classical.choice (rationalProfile_feasible numerator normalized divisible)
  have bound := log_type_count_bounds (rationalProfile numerator denominator size) representative
    (by simpa using size_positive)
  simp only [Fintype.card_fin] at bound
  have probabilities : (fun b => (rationalProfile numerator denominator size b : ℝ)/size) =
      (fun b => (numerator b : ℝ)/denominator) :=
    funext (rationalProfile_probability numerator denominator_positive size_positive divisible)
  rw [probabilities] at bound
  simpa only [← Nat.card_eq_fintype_card] using bound

/-- Counts of independent heterogeneous type words multiply, so their logarithms add exactly. -/
theorem log_heterogeneous_count {Pool : Type*} [Fintype Pool] {Positions Alphabet : Pool → Type*}
    [∀ t, Fintype (Positions t)] [∀ t, Fintype (Alphabet t)]
    (profile : ∀ t, Alphabet t → ℕ) (representative : ∀ t, TypedWord (P := Positions t) (profile t)) :
    Real.log (Fintype.card (∀ t, TypedWord (P := Positions t) (profile t)) : ℝ) =
      ∑ t, Real.log (Fintype.card (TypedWord (P := Positions t) (profile t)) : ℝ) := by
  simp only [Fintype.card_pi, Nat.cast_prod]
  apply Real.log_prod
  intro t _
  letI : Nonempty (TypedWord (P := Positions t) (profile t)) := ⟨representative t⟩
  exact_mod_cast Fintype.card_pos.ne'

/-- Heterogeneous exact-type counts have the sum of their entropy rates and explicit total error. -/
theorem heterogeneous_type_entropy_bounds {Pool : Type*} [Fintype Pool] {Positions Alphabet : Pool → Type*}
    [∀ t, Fintype (Positions t)] [∀ t, Fintype (Alphabet t)]
    (profile : ∀ t, Alphabet t → ℕ) (representative : ∀ t, TypedWord (P := Positions t) (profile t))
    (positive : ∀ t, 0 < Fintype.card (Positions t)) :
    (∑ t, (Fintype.card (Positions t) : ℝ)*entropy (fun b => (profile t b : ℝ)/Fintype.card (Positions t))) -
      ∑ t, (Fintype.card (Alphabet t) : ℝ)*(Real.log ((Fintype.card (Positions t) : ℝ)+1)+1) ≤
        Real.log (Fintype.card (∀ t, TypedWord (P := Positions t) (profile t)) : ℝ) ∧
    Real.log (Fintype.card (∀ t, TypedWord (P := Positions t) (profile t)) : ℝ) ≤
      (∑ t, (Fintype.card (Positions t) : ℝ)*entropy (fun b => (profile t b : ℝ)/Fintype.card (Positions t))) +
        ∑ t, (Real.log ((Fintype.card (Positions t) : ℝ)+1)+1) := by
  rw [log_heterogeneous_count profile representative, ← Finset.sum_sub_distrib, ← Finset.sum_add_distrib]
  constructor
  · exact Finset.sum_le_sum (fun t _ => (log_type_count_bounds (profile t) (representative t) (positive t)).1)
  · exact Finset.sum_le_sum (fun t _ => by
      simpa only [add_assoc] using (log_type_count_bounds (profile t) (representative t) (positive t)).2)

end
end MatrixBounds.Empirical
