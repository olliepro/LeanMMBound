import PairingSectorTypes
import ApproximateTypes

/-! Empirical laws of fixed labelled sectors combine with their actual rational
population weights. This is the window inclusion used by strategy allocation. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Sector P B : Type*} [Fintype Sector] [Fintype P]
variable {Positions : Sector → Type*} [∀ sector, Fintype (Positions sector)]

omit [Fintype P] in
/-- Regrouping disjoint labelled sectors adds their exact symbol counts. -/
theorem count_regroup_sectors (positions : ((sector : Sector) × Positions sector) ≃ P)
    (words : ∀ sector, Positions sector → B) (symbol : B) :
    count (regroupParts positions words) symbol = ∑ sector, count (words sector) symbol := by
  let regrouped : {p : P // regroupParts positions words p = symbol} ≃
      {p : (sector : Sector) × Positions sector // words p.1 p.2 = symbol} :=
    Equiv.subtypeEquiv positions.symm (fun _ => Iff.rfl)
  let counted : {p : (sector : Sector) × Positions sector // words p.1 p.2 = symbol} ≃
      ((sector : Sector) × {p : Positions sector // words sector p = symbol}) := {
    toFun := fun p => ⟨p.val.1, ⟨p.val.2, p.property⟩⟩
    invFun := fun p => ⟨⟨p.1, p.2.val⟩, p.2.property⟩
    left_inv := fun _ => rfl
    right_inv := fun _ => rfl }
  change Nat.card _ = _
  rw [Nat.card_congr (regrouped.trans counted), Nat.card_sigma]
  rfl

/-- Sector populations sum to the whole position count under the supplied placement bijection. -/
theorem sector_population_total (positions : ((sector : Sector) × Positions sector) ≃ P) :
    (∑ sector, Fintype.card (Positions sector)) = Fintype.card P := by
  simpa only [Fintype.card_sigma] using Fintype.card_congr positions

/-- Empirical probabilities of a regrouped word are the population-weighted sector probabilities, including empty sectors. -/
theorem sector_probability_mixture (positions : ((sector : Sector) × Positions sector) ≃ P)
    (words : ∀ sector, Positions sector → B) (symbol : B) :
    (count (regroupParts positions words) symbol : ℝ)/Fintype.card P =
      ∑ sector, ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*
        ((count (words sector) symbol : ℝ)/Fintype.card (Positions sector)) := by
  rw [count_regroup_sectors, Nat.cast_sum, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro sector _
  by_cases empty : Fintype.card (Positions sector) = 0
  · have vanished : count (words sector) symbol = 0 := Nat.eq_zero_of_le_zero ((count_le_positions _ _).trans_eq empty)
    simp only [empty, vanished, Nat.cast_zero, zero_div, mul_zero]
  · have nonzero : (Fintype.card (Positions sector) : ℝ) ≠ 0 := by exact_mod_cast empty
    field_simp

/-- Every accepted sector word lies in the window of the exact population-weighted mixture law. -/
theorem within_sector_mixture (positions : ((sector : Sector) × Positions sector) ≃ P)
    (laws : Sector → B → ℝ) (words : ∀ sector, Positions sector → B) (tolerance : ℝ) (nonnegative : 0 ≤ tolerance)
    (accepted : ∀ sector, Fintype.card (Positions sector) = 0 ∨ Within (laws sector) tolerance (words sector)) :
    Within (fun symbol => ∑ sector, ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*laws sector symbol)
      tolerance (regroupParts positions words) := by
  intro symbol
  rw [sector_probability_mixture, ← Finset.sum_sub_distrib]
  have errorIdentity (sector : Sector) :
      ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*((count (words sector) symbol : ℝ)/Fintype.card (Positions sector)) -
        ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*laws sector symbol =
      ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*
        ((count (words sector) symbol : ℝ)/Fintype.card (Positions sector)-laws sector symbol) := by ring
  simp only [errorIdentity]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    _ ≤ ∑ sector, ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*tolerance := by
      apply Finset.sum_le_sum
      intro sector _
      rw [abs_mul, abs_of_nonneg (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _))]
      rcases accepted sector with empty | inside
      · simp only [empty, Nat.cast_zero, zero_div, zero_mul, le_refl]
      · exact mul_le_mul_of_nonneg_left (inside symbol) (div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _))
    _ ≤ tolerance := by
      rw [← Finset.sum_mul, ← Finset.sum_div, ← Nat.cast_sum, sector_population_total positions]
      by_cases empty : Fintype.card P = 0
      · simpa only [empty, Nat.cast_zero, div_zero, zero_mul] using nonnegative
      · rw [div_self (by exact_mod_cast empty : (Fintype.card P : ℝ) ≠ 0), one_mul]

end
end MatrixBounds.Empirical
