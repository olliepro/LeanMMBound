module

public import CWRetentionContinuity

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Empty child pools impose no empirical tolerance condition. Replacing their
nominal laws by zero leaves every parent and pooled retention quantity unchanged,
and makes closeness statements valid uniformly on the complete shape alphabet. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] {length : ℕ}

/-- Canonical nominal laws use zero coordinates on child types whose pools are empty. -/
def activeLaw (data : SplitRestrictionData length)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) : ℝ :=
  if data.split child = 0 then 0 else law child symbol

/-- Discarding an empty pool's unused law preserves the probability-cube bounds. -/
theorem activeLaw_range (data : SplitRestrictionData length)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
    (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    0 ≤ data.activeLaw law child symbol ∧ data.activeLaw law child symbol ≤ 1 := by
  unfold activeLaw
  split_ifs
  · norm_num
  · exact range child symbol

/-- Complementary child types have identical pool counts under the exact split symmetry. -/
theorem split_complement_eq (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (child : ShapeAlphabet (2*length)) :
    data.split (complementEquiv data.parent (2*length) data.balanced child) = data.split child := by
  have same := symmetric (complementEquiv data.parent (2*length) data.balanced child)
  rw [Equiv.symm_apply_apply] at same
  exact same.symm

/-- Empty-pool laws do not affect the independent-concatenation parent distribution. -/
theorem parentLaw_active (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    data.parentLaw (P := P) (data.activeLaw law) = data.parentLaw (P := P) law := by
  funext word
  unfold parentLaw
  apply Finset.sum_congr rfl
  intro child _
  by_cases empty : data.split child = 0
  · simp only [empty, Nat.cast_zero, zero_div, zero_mul]
  · simp only [activeLaw, data.split_complement_eq symmetric child, if_neg empty]

/-- Empty-pool laws also contribute zero to every compatibility-sector mass. -/
theorem pooledLaw_active (data : SplitRestrictionData length)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    data.pooledLaw (P := P) axisClass (data.activeLaw law) = data.pooledLaw (P := P) axisClass law := by
  funext sector symbol
  unfold pooledLaw
  apply Finset.sum_congr rfl
  intro child _
  by_cases empty : data.split child = 0
  · simp only [empty, Nat.cast_zero, mul_zero, zero_div, zero_mul, ite_self]
  · simp only [activeLaw, if_neg empty]

/-- The nominal fine retention formula is unchanged by its canonical empty-pool convention. -/
theorem lawRetention_active (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    data.lawRetention (P := P) axisClass (data.activeLaw law) = data.lawRetention (P := P) axisClass law := by
  unfold lawRetention
  rw [data.parentLaw_active symmetric law, data.pooledLaw_active axisClass law]

/-- Closeness need only be checked in nonempty pools; empty feasible profiles equal the canonical zero law. -/
theorem childLaw_close_active (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (representative : data.TargetParts profile)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) {delta : ℝ} (nonnegative : 0 ≤ delta)
    (close : ∀ child, data.split child ≠ 0 → ∀ symbol, |data.childLaw profile child symbol-law child symbol| ≤ delta)
    (child : ShapeAlphabet (2*length)) (symbol : Fin length → Fin 3) :
    |data.childLaw profile child symbol-data.activeLaw law child symbol| ≤ delta := by
  by_cases empty : data.split child = 0
  · have zero : profile child symbol = 0 := by have := data.child_count_le profile representative child symbol; omega
    simpa only [activeLaw, empty, if_true, childLaw, zero, Nat.cast_zero, mul_zero, zero_div, sub_self, abs_zero] using nonnegative
  · simpa only [activeLaw, if_neg empty] using close child empty symbol

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
