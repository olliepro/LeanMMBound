import CWPooledCompatibility
import MassEntropy

/-! Separately labelled normalized children contribute weighted ordinary
entropy; ordinary children retain their full unnormalized compatibility pools. -/
namespace MatrixBounds.Entropy

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {I J Word : Type*} [Fintype I] [Fintype J] [Fintype Word]

/-- Keep selected source labels separate and pool the other labels by one coordinate. -/
def separatedClass (special : I → Prop) (coordinate : I → J) (index : I) : I ⊕ J :=
  if special index then Sum.inl index else Sum.inr (coordinate index)

/-- Complete sector mass, retaining all original source weights. -/
def separatedPool (special : I → Prop) (coordinate : I → J)
    (weight : I → ℝ) (mass : I → Word → ℝ) (sector : I ⊕ J) (word : Word) : ℝ :=
  ∑ index, if separatedClass special coordinate index = sector then weight index*mass index word else 0

omit [Fintype J] [Fintype Word] in
/-- A separately labelled sector contains only its own weighted source distribution. -/
theorem separatedPool_left (special : I → Prop) (coordinate : I → J)
    (weight : I → ℝ) (mass : I → Word → ℝ) (index : I) (word : Word) :
    separatedPool special coordinate weight mass (Sum.inl index) word =
      if special index then weight index*mass index word else 0 := by
  unfold separatedPool
  rw [Finset.sum_eq_single index]
  · by_cases selected : special index <;> simp [separatedClass, selected]
  · intro other _ different
    by_cases selected : special other <;> simp [separatedClass, selected, different]
  · simp

omit [Fintype J] [Fintype Word] in
/-- An ordinary coordinate sector contains exactly the weighted nonspecial children in that coordinate. -/
theorem separatedPool_right (special : I → Prop) (coordinate : I → J)
    (weight : I → ℝ) (mass : I → Word → ℝ) (label : J) (word : Word) :
    separatedPool special coordinate weight mass (Sum.inr label) word =
      ∑ index, if ¬special index ∧ coordinate index = label then weight index*mass index word else 0 := by
  unfold separatedPool
  apply Finset.sum_congr rfl
  intro index _
  by_cases selected : special index <;> simp [separatedClass, selected]

omit [Fintype J] in
/-- Zero total weight needs no normalization premise; otherwise a separate sector contributes weighted ordinary entropy. -/
theorem separatedPool_left_entropy (special : I → Prop) (coordinate : I → J)
    (weight : I → ℝ) (mass : I → Word → ℝ)
    (normalized : ∀ index, weight index ≠ 0 → ∑ word, mass index word = 1) (index : I) :
    massEntropy (separatedPool special coordinate weight mass (Sum.inl index)) =
      if special index then weight index*entropy (mass index) else 0 := by
  have identity := funext (separatedPool_left special coordinate weight mass index)
  rw [identity]
  by_cases selected : special index
  · simp only [if_pos selected]
    rw [massEntropy_scaled]
    by_cases zero : weight index = 0
    · simp only [zero, zero_mul]
    · rw [massEntropy_of_normalized _ (normalized index zero)]
  · simp [selected, massEntropy, entropy]

/-- The complete sector penalty is exactly the separate-child entropy sum plus the ordinary pool entropies. -/
theorem separatedPool_entropy (special : I → Prop) (coordinate : I → J)
    (weight : I → ℝ) (mass : I → Word → ℝ)
    (normalized : ∀ index, weight index ≠ 0 → ∑ word, mass index word = 1) :
    (∑ sector : I ⊕ J, massEntropy (separatedPool special coordinate weight mass sector)) =
      (∑ index, if special index then weight index*entropy (mass index) else 0)+
      ∑ label, massEntropy (fun word =>
        ∑ index, if ¬special index ∧ coordinate index = label then weight index*mass index word else 0) := by
  rw [Fintype.sum_sum_type]
  congr 1
  · apply Finset.sum_congr rfl
    intro index _
    exact separatedPool_left_entropy special coordinate weight mass normalized index
  · apply Finset.sum_congr rfl
    intro label _
    exact congrArg massEntropy (funext (separatedPool_right special coordinate weight mass label))

end
end MatrixBounds.Entropy
