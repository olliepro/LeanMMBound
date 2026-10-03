module

public import IndicatorConcentration
public import Mathlib.Algebra.Order.Chebyshev

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Combine finite groupwise count errors without an independence assumption. -/
namespace MatrixBounds.Sampling

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Group Position Outcome : Type*} [Fintype Group] [Fintype Position] [Fintype Outcome]

/-- Summing a function over all fibers of a group label recovers its total sum. -/
theorem sum_over_groups (group : Position → Group) (value : Position → ℝ) :
    (∑ label, ∑ position : {position // group position = label}, value position.val) = ∑ position, value position := by
  simpa only [Fintype.sum_sigma] using! Equiv.sum_comp (Equiv.sigmaFiberEquiv group) value

/-- Group cardinalities partition the total number of positions, with the identity cast to reals. -/
theorem group_card_sum (group : Position → Group) :
    (∑ label, (Fintype.card {position // group position = label} : ℝ)) = Fintype.card Position := by
  simpa only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one] using
    sum_over_groups group (fun _ => 1)

/-- Linear second-moment bounds for group count errors imply a linear bound for their total.
The only loss is the number of possible group labels; the errors may be dependent. -/
theorem grouped_second_moment (group : Position → Group) (value : Position → Outcome → ℝ)
    (center : Group → ℝ) (constant : ℝ)
    (individual : ∀ label, average (fun outcome =>
      ((∑ position : {position // group position = label}, value position.val outcome) -
        Fintype.card {position // group position = label} * center label)^2) ≤
          constant * Fintype.card {position // group position = label}) :
    average (fun outcome => ((∑ position, value position outcome) -
      ∑ label, Fintype.card {position // group position = label} * center label)^2) ≤
        constant * Fintype.card Group * Fintype.card Position := by
  let error : Group → Outcome → ℝ := fun label outcome =>
    (∑ position : {position // group position = label}, value position.val outcome) -
      Fintype.card {position // group position = label} * center label
  have total (outcome : Outcome) :
      (∑ position, value position outcome) - ∑ label, Fintype.card {position // group position = label} * center label =
        ∑ label, error label outcome := by
    simp only [error, Finset.sum_sub_distrib]
    rw [sum_over_groups group (fun position => value position outcome)]
  simp only [total]
  calc
    _ ≤ average (fun outcome => (Fintype.card Group : ℝ) * ∑ label, (error label outcome)^2) := by
      apply average_mono
      intro outcome
      simpa only [Finset.card_univ] using
        (sq_sum_le_card_mul_sum_sq (s := Finset.univ) (f := fun label => error label outcome))
    _ = (Fintype.card Group : ℝ) * ∑ label, average (fun outcome => (error label outcome)^2) := by
      simp only [average, ← Finset.mul_sum, ← Finset.sum_div]
      rw [Finset.sum_comm]
      ring
    _ ≤ (Fintype.card Group : ℝ) * ∑ label, constant * Fintype.card {position // group position = label} :=
      mul_le_mul_of_nonneg_left (Finset.sum_le_sum (fun label _ => individual label)) (Nat.cast_nonneg _)
    _ = _ := by rw [← Finset.mul_sum, group_card_sum]; ring

/-- Dividing a groupwise count estimate by the population gives a frequency concentration bound. -/
theorem grouped_frequency_concentration [Nonempty Position] [Nonempty Outcome]
    (group : Position → Group) (value : Position → Outcome → ℝ) (center : Group → ℝ) (constant : ℝ)
    (individual : ∀ label, average (fun outcome =>
      ((∑ position : {position // group position = label}, value position.val outcome) -
        Fintype.card {position // group position = label} * center label)^2) ≤
          constant * Fintype.card {position // group position = label})
    {threshold : ℝ} (positive : 0 < threshold) :
    (Nat.card {outcome : Outcome // threshold ≤
      |(∑ position, value position outcome)/Fintype.card Position -
        ∑ label, ((Fintype.card {position // group position = label} : ℝ)/Fintype.card Position)*center label|} : ℝ) /
      Fintype.card Outcome ≤ constant * Fintype.card Group / ((Fintype.card Position : ℝ)*threshold^2) := by
  have population : (0 : ℝ) < Fintype.card Position := by exact_mod_cast Fintype.card_pos
  have identity (outcome : Outcome) :
      ((∑ position, value position outcome)/Fintype.card Position -
        ∑ label, ((Fintype.card {position // group position = label} : ℝ)/Fintype.card Position)*center label)^2 =
      ((∑ position, value position outcome) - ∑ label, Fintype.card {position // group position = label} * center label)^2 /
        (Fintype.card Position : ℝ)^2 := by
    simp only [div_mul_eq_mul_div, ← Finset.sum_div]
    field_simp
  have bound := squared_error_probability
    (fun outcome => (∑ position, value position outcome)/Fintype.card Position)
    (∑ label, ((Fintype.card {position // group position = label} : ℝ)/Fintype.card Position)*center label)
    threshold (constant*Fintype.card Group/Fintype.card Position) positive (by
      simp only [identity, average_div]
      calc
        _ ≤ (constant*Fintype.card Group*Fintype.card Position)/(Fintype.card Position : ℝ)^2 :=
          div_le_div_of_nonneg_right (grouped_second_moment group value center constant individual) (sq_nonneg _)
        _ = _ := by field_simp [population.ne'])
  convert bound using 1
  ring

end
end MatrixBounds.Sampling
