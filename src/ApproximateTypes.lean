import AcceptedRestrictions
import InterfaceContinuity
import EmpiricalTypes

/-! Empirical tolerance windows and the exact inclusion needed to feed nearby
child types into the same available parent interface. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
variable {P B : Type*} [Fintype P]

/-- A complete empirical distribution belongs to the coordinatewise tolerance window.
For example, tolerance=epsilon accepts all fine types within epsilon of the target center. -/
def Within (center : B → ℝ) (tolerance : ℝ) (word : P → B) : Prop :=
  ∀ symbol, |(count word symbol : ℝ)/Fintype.card P-center symbol| ≤ tolerance

/-- Moving a window's center by at most delta enlarges its required tolerance by at most delta. -/
theorem within_shift (center center' : B → ℝ) (word : P → B) {tolerance shift : ℝ}
    (close : ∀ symbol, |center' symbol-center symbol| ≤ shift)
    (inside : Within center' tolerance word) : Within center (tolerance+shift) word := by
  intro symbol
  calc
    _ = |((count word symbol : ℝ)/Fintype.card P-center' symbol) + (center' symbol-center symbol)| := by congr 1; ring
    _ ≤ |(count word symbol : ℝ)/Fintype.card P-center' symbol| + |center' symbol-center symbol| := abs_add_le _ _
    _ ≤ tolerance+shift := add_le_add (inside symbol) (close symbol)

/-- Increasing an empirical tolerance can only add accepted variable parts. -/
theorem within_mono (center : B → ℝ) (word : P → B) {narrow wide : ℝ}
    (bound : narrow ≤ wide) (inside : Within center narrow word) : Within center wide word :=
  fun symbol => (inside symbol).trans bound

/-- The epsilon/2 window around a perturbed parent center fits inside the original epsilon window. -/
theorem nearby_parent_window (center center' : B → ℝ) (word : P → B) {epsilon delta : ℝ}
    (small : delta ≤ epsilon/4) (close : ∀ symbol, |center' symbol-center symbol| ≤ 2*delta)
    (inside : Within center' (epsilon/2) word) : Within center epsilon word := by
  exact within_mono center word (by linarith : epsilon/2+2*delta ≤ epsilon)
    (within_shift center center' word close inside)

/-- Normalized mixtures of nearby independent child distributions satisfy the parent-window inclusion. -/
theorem mixture_parent_window {Sector : Type*} [Fintype Sector]
    (weight : Sector → ℝ) (left right left' right' : Sector → B → ℝ)
    (weight_nonneg : ∀ sector, 0 ≤ weight sector) (normalized : ∑ sector, weight sector = 1)
    (right_bounds : ∀ sector symbol, 0 ≤ right sector symbol ∧ right sector symbol ≤ 1)
    (left'_bounds : ∀ sector symbol, 0 ≤ left' sector symbol ∧ left' sector symbol ≤ 1)
    {epsilon delta : ℝ} (delta_nonneg : 0 ≤ delta) (small : delta ≤ epsilon/4)
    (left_close : ∀ sector symbol, |left sector symbol-left' sector symbol| ≤ delta)
    (right_close : ∀ sector symbol, |right sector symbol-right' sector symbol| ≤ delta)
    (word : P → B)
    (inside : Within (fun symbol => ∑ sector, weight sector*(left sector symbol*right sector symbol)) (epsilon/2) word) :
    Within (fun symbol => ∑ sector, weight sector*(left' sector symbol*right' sector symbol)) epsilon word := by
  apply nearby_parent_window _ _ word small _ inside
  intro symbol
  exact Entropy.mixture_product_error weight (fun sector => left sector symbol) (fun sector => right sector symbol)
    (fun sector => left' sector symbol) (fun sector => right' sector symbol) weight_nonneg normalized
    (fun sector => right_bounds sector symbol) (fun sector => left'_bounds sector symbol)
    delta_nonneg (fun sector => left_close sector symbol) (fun sector => right_close sector symbol)

/-- Every empirical frequency lies in the probability cube, including an empty position set. -/
theorem empirical_probability_range (word : P → B) (symbol : B) :
    0 ≤ (count word symbol : ℝ)/Fintype.card P ∧ (count word symbol : ℝ)/Fintype.card P ≤ 1 := by
  constructor
  · exact div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  · by_cases empty : Fintype.card P = 0
    · simp only [empty, Nat.cast_zero, div_zero, zero_le_one]
    · have positive : (0 : ℝ) < Fintype.card P := by exact_mod_cast Nat.pos_of_ne_zero empty
      rw [div_le_one positive]
      exact_mod_cast count_le_positions word symbol

omit [Fintype P] in
/-- A single parent tolerance controls empirical entropy uniformly at every number of positions. -/
theorem exists_within_entropy_control [Fintype B] (center : B → ℝ)
    (centerRange : ∀ symbol, 0 ≤ center symbol ∧ center symbol ≤ 1)
    {error : ℝ} (positive : 0 < error) :
    ∃ tolerance > 0, ∀ (Positions : Type*) [Fintype Positions] (word : Positions → B),
      Within center tolerance word →
        |Entropy.entropy (fun symbol => (count word symbol : ℝ)/Fintype.card Positions) -
          Entropy.entropy center| < error := by
  obtain ⟨tolerance, tolerancePositive, control⟩ := Entropy.entropy_uniform_tolerance (A := B) positive
  refine ⟨tolerance/2, half_pos tolerancePositive, ?_⟩
  intro Positions finite word inside
  apply control _ center (empirical_probability_range word) centerRange
  intro symbol
  exact (inside symbol).trans_lt (half_lt_self tolerancePositive)

end
end MatrixBounds.Empirical
