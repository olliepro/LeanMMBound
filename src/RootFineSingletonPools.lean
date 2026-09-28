import RootFineCachedRootExpression

/-! Singleton compatibility sectors can be evaluated directly while preserving all original labels. -/
namespace MatrixBounds.Numeric

open scoped BigOperators

/-- Retain selected source positions individually and pool all remaining positions by coordinate. -/
def singletonPoolLabel {I C : Type*} (isolated : I → Bool) (coordinate : I → C) (index : I) : I ⊕ C :=
  if isolated index then Sum.inl index else Sum.inr (coordinate index)

/-- A singleton-labelled pool has exactly its own source contribution, if that source is isolated. -/
theorem singletonPool_value {I C : Type*} [Fintype I] [DecidableEq I] [DecidableEq C]
    (isolated : I → Bool) (coordinate : I → C) (mass : I → ℚ) (selected : I) :
    (∑ index, if singletonPoolLabel isolated coordinate index = Sum.inl selected then mass index else 0) =
      if isolated selected then mass selected else 0 := by
  rw [Finset.sum_eq_single selected]
  · by_cases present : isolated selected <;> simp [singletonPoolLabel, present]
  · intro other _ different
    by_cases present : isolated other
    all_goals simp [singletonPoolLabel, present, different]
  · intro absent
    exact False.elim (absent (Finset.mem_univ selected))

/-- A coordinate-labelled pool contains exactly the non-isolated source positions at that coordinate. -/
theorem coordinatePool_value {I C : Type*} [Fintype I] [DecidableEq I] [DecidableEq C]
    (isolated : I → Bool) (coordinate : I → C) (mass : I → ℚ) (selected : C) :
    (∑ index, if singletonPoolLabel isolated coordinate index = Sum.inr selected then mass index else 0) =
      ∑ index, if isolated index then 0 else if coordinate index = selected then mass index else 0 := by
  apply Finset.sum_congr rfl
  intro index _
  by_cases present : isolated index
  all_goals simp [singletonPoolLabel, present]

end MatrixBounds.Numeric
