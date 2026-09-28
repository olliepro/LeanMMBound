import CWCompatibilityRates

/-! Express actual parent centers and pooled masses directly in normalized
child laws. Empty child pools have zero weight and require no division premise. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Empirical child probability law, with zero in every coordinate of an empty pool. -/
def childLaw (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) : ℝ :=
  (profile child symbol : ℝ)/(2*data.split child)

/-- Independent-concatenation parent distribution for arbitrary prescribed child laws. -/
def parentLaw (data : SplitRestrictionData length)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) (word : Fin (length+length) → Fin 3) : ℝ :=
  ∑ child, ((data.split child : ℝ)/Fintype.card P)*
    (law child (leftHalf word)*law (complementEquiv data.parent (2*length) data.balanced child) (rightHalf word))

/-- Pooled child-law masses relative to one parent position, retaining each compatibility sector. -/
def pooledLaw (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (sector : CompatibilityClass (2*length)) (symbol : Fin length → Fin 3) : ℝ :=
  ∑ child, if axisClass child = sector then (2*(data.split child : ℝ)/Fintype.card P)*law child symbol else 0

/-- The actual parent center is precisely the independent-concatenation law of the empirical child profiles. -/
theorem parentCenter_childLaw (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :
    data.parentCenter (P := P) profile = data.parentLaw (P := P) (data.childLaw profile) := rfl

/-- Feasibility bounds every child count by that child's number of slots. -/
theorem child_count_le (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    profile child symbol ≤ 2*data.split child := by
  rw [← (representative child).property symbol]
  simpa only [ChildPositions, Fintype.card_fin] using count_le_positions (representative child).val symbol

/-- A normalized child law times its pool weight recovers the parent-normalized count, including empty pools. -/
theorem childLaw_weighted (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    (2*(data.split child : ℝ)/Fintype.card P)*data.childLaw profile child symbol =
      (profile child symbol : ℝ)/Fintype.card P := by
  by_cases empty : data.split child = 0
  · have zero : profile child symbol = 0 := by have := data.child_count_le profile representative child symbol; omega
    simp only [childLaw, empty, zero, Nat.cast_zero, mul_zero, zero_div]
  · have nonzero : (data.split child : ℝ) ≠ 0 := by exact_mod_cast empty
    unfold childLaw
    field_simp

/-- Pooling normalized child laws is exactly pooling integer fine profiles and dividing by the parent population. -/
theorem pooledLaw_childLaw (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) (sector : CompatibilityClass (2*length)) (symbol : Fin length → Fin 3) :
    data.pooledLaw (P := P) axisClass (data.childLaw profile) sector symbol =
      (pooledProfile profile axisClass sector symbol : ℝ)/Fintype.card P := by
  unfold pooledLaw pooledProfile
  rw [Nat.cast_sum, Finset.sum_div]
  apply Finset.sum_congr rfl
  intro child _
  split_ifs with member
  · exact data.childLaw_weighted profile representative child symbol
  · simp only [Nat.cast_zero, zero_div]

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
