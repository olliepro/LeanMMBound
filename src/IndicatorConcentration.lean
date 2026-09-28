import SamplingBounds

/-! A finite second-moment concentration theorem for indicators whose one- and
two-point laws approximate a common independent distribution. -/
namespace MatrixBounds.Sampling

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Outcome : Type*} [Fintype Outcome] [Nonempty Outcome]

/-- Real zero-one value of a finite event. -/
def indicator (event : Outcome → Prop) (outcome : Outcome) : ℝ := if event outcome then 1 else 0

omit [Nonempty Outcome] in
/-- The average event indicator is its finite probability. -/
theorem average_indicator (event : Outcome → Prop) :
    average (indicator event) = (Nat.card {outcome // event outcome} : ℝ) / Fintype.card Outcome := by
  simp only [average, indicator, Finset.sum_boole, Nat.card_eq_fintype_card, Fintype.card_subtype]

/-- A constant random variable has the same constant average. -/
theorem average_const (constant : ℝ) : average (fun _ : Outcome => constant) = constant := by
  have positive : (0 : ℝ) < Fintype.card Outcome := by exact_mod_cast Fintype.card_pos
  simp only [average, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  exact mul_div_cancel_left₀ constant positive.ne'

omit [Nonempty Outcome] in
/-- Dividing each observation by a constant divides its finite average by that constant. -/
theorem average_div (value : Outcome → ℝ) (constant : ℝ) :
    average (fun outcome => value outcome / constant) = average value / constant := by
  simp only [average, ← Finset.sum_div]
  ring

/-- Centered indicator covariance expands in the individual and joint event probabilities. -/
theorem centered_indicator_covariance (left right : Outcome → Prop) (center : ℝ) :
    average (fun outcome => (indicator left outcome-center)*(indicator right outcome-center)) =
      average (indicator (fun outcome => left outcome ∧ right outcome)) -
        center * average (indicator left) - center * average (indicator right) + center^2 := by
  have identity (outcome : Outcome) :
      (indicator left outcome-center)*(indicator right outcome-center) =
        indicator (fun outcome => left outcome ∧ right outcome) outcome -
          center * indicator left outcome - center * indicator right outcome + center^2 := by
    by_cases hl : left outcome <;> by_cases hr : right outcome <;> simp [indicator, hl, hr] <;> ring
  have positive : (0 : ℝ) < Fintype.card Outcome := by exact_mod_cast Fintype.card_pos
  simp only [average, identity, Finset.sum_add_distrib, Finset.sum_sub_distrib,
    ← Finset.mul_sum, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
  field_simp [positive.ne']

/-- A centered zero-one variable has second moment at most one for centers in [0,1]. -/
theorem centered_indicator_diagonal (event : Outcome → Prop) {center : ℝ}
    (center_nonneg : 0 ≤ center) (center_le_one : center ≤ 1) :
    average (fun outcome => (indicator event outcome-center)^2) ≤ 1 := by
  rw [← average_const (Outcome := Outcome) 1]
  apply average_mono
  intro outcome
  unfold indicator
  split_ifs <;> nlinarith [mul_nonneg center_nonneg (sub_nonneg.mpr center_le_one)]

/-- Errors in one- and two-point event probabilities bound centered covariance. -/
theorem centered_indicator_bound (left right : Outcome → Prop) {center singleError jointError : ℝ}
    (center_nonneg : 0 ≤ center) (center_le_one : center ≤ 1) (single_nonneg : 0 ≤ singleError)
    (left_error : |average (indicator left)-center| ≤ singleError)
    (right_error : |average (indicator right)-center| ≤ singleError)
    (joint_error : |average (indicator (fun outcome => left outcome ∧ right outcome))-center^2| ≤ jointError) :
    average (fun outcome => (indicator left outcome-center)*(indicator right outcome-center)) ≤
      jointError + 2*singleError := by
  rw [centered_indicator_covariance]
  have left_lower := (abs_le.mp left_error).1
  have right_lower := (abs_le.mp right_error).1
  have joint_upper := (abs_le.mp joint_error).2
  have left_scaled := mul_le_mul_of_nonneg_left left_lower center_nonneg
  have right_scaled := mul_le_mul_of_nonneg_left right_lower center_nonneg
  nlinarith [mul_nonneg single_nonneg (sub_nonneg.mpr center_le_one)]

/-- Approximate one- and two-point independence gives an explicit concentration bound.
For m indicators with single error a and joint error b, the bad fraction is at most
(1/m+b+2*a)/threshold^2. This bound does not assume independence of the indicators. -/
theorem indicator_frequency_concentration {Index : Type*} [Fintype Index] [Nonempty Index]
    (event : Index → Outcome → Prop) {center singleError jointError threshold : ℝ}
    (center_nonneg : 0 ≤ center) (center_le_one : center ≤ 1)
    (single_nonneg : 0 ≤ singleError) (joint_nonneg : 0 ≤ jointError)
    (threshold_positive : 0 < threshold)
    (single_error : ∀ i, |average (indicator (event i))-center| ≤ singleError)
    (joint_error : ∀ i j, i ≠ j →
      |average (indicator (fun outcome => event i outcome ∧ event j outcome))-center^2| ≤ jointError) :
    (Nat.card {outcome // threshold ≤ |(∑ i, indicator (event i) outcome) /
        Fintype.card Index - center|} : ℝ) / Fintype.card Outcome ≤
      (1/(Fintype.card Index : ℝ) + jointError + 2*singleError) / threshold^2 := by
  let centered : Index → Outcome → ℝ := fun i outcome => indicator (event i) outcome-center
  have positive : (0 : ℝ) < Fintype.card Index := by exact_mod_cast Fintype.card_pos
  have moment := second_moment_bound centered 1 (jointError+2*singleError) (by positivity)
    (fun i => centered_indicator_diagonal (event i) center_nonneg center_le_one)
    (fun i j different => centered_indicator_bound (event i) (event j)
      center_nonneg center_le_one single_nonneg (single_error i) (single_error j) (joint_error i j different))
  apply squared_error_probability _ center threshold _ threshold_positive
  have identity (outcome : Outcome) :
      ((∑ i, indicator (event i) outcome) / Fintype.card Index - center)^2 =
        (∑ i, centered i outcome)^2 / (Fintype.card Index : ℝ)^2 := by
    simp only [centered, Finset.sum_sub_distrib, Finset.sum_const, Finset.card_univ, nsmul_eq_mul]
    field_simp [positive.ne']
  simp only [identity, average_div]
  calc
    _ ≤ ((Fintype.card Index : ℝ)*1 + (Fintype.card Index : ℝ)^2*(jointError+2*singleError)) /
        (Fintype.card Index : ℝ)^2 := div_le_div_of_nonneg_right moment (by positivity)
    _ = _ := by field_simp [positive.ne']; ring

end
end MatrixBounds.Sampling
