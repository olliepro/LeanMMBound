module

public import RootFineIntegerVectorCheck

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Normalization and nonnegativity justify checking only nonzero candidate coordinates. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Check the exact candidate total and every nonzero coordinate of a complete integer vector. -/
def sparseIntegerVectorCheck {width : ℕ} (denominator : ℤ) (candidate actual : Fin width → ℤ) : Bool :=
  decide ((∑ coordinate, candidate coordinate) = denominator) &&
    (List.finRange width).all (fun coordinate =>
      if candidate coordinate = 0 then true else decide (candidate coordinate = actual coordinate))

/-- A nonnegative actual vector with the same total cannot hide mass in omitted zero coordinates. -/
theorem sparseIntegerVectorCheck_sound {width : ℕ} (denominator : ℤ)
    (candidate actual : Fin width → ℤ)
    (nonnegative : ∀ coordinate, 0 ≤ actual coordinate)
    (normalized : ∑ coordinate, actual coordinate = denominator)
    (checked : sparseIntegerVectorCheck denominator candidate actual = true)
    (coordinate : Fin width) : candidate coordinate = actual coordinate := by
  simp only [sparseIntegerVectorCheck, Bool.and_eq_true] at checked
  obtain ⟨totalCheck, entriesCheck⟩ := checked
  have total : ∑ index, candidate index = denominator := of_decide_eq_true totalCheck
  have dominated (index : Fin width) : candidate index ≤ actual index := by
    by_cases zero : candidate index = 0
    · rw [zero]
      exact nonnegative index
    · have entry := List.all_eq_true.mp entriesCheck index (List.mem_finRange index)
      simp only [if_neg zero] at entry
      exact le_of_eq (of_decide_eq_true entry)
  exact (Finset.sum_eq_sum_iff_of_le (fun index _ => dominated index)).mp
    (total.trans normalized.symm) coordinate (Finset.mem_univ coordinate)

end MatrixBounds.Numeric
