module

public import CWProfileLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Parent mixtures and compatibility pools are uniformly stable under child
law perturbations, including zero-weight child types and empty sectors. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P] [Nonempty P] {length : ℕ}

/-- Independent child laws in the probability cube produce a parent law in the same cube. -/
theorem parentLaw_range (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1) (word : Fin (length+length) → Fin 3) :
    0 ≤ data.parentLaw (P := P) law word ∧ data.parentLaw (P := P) law word ≤ 1 := by
  have nonnegative (child : ShapeAlphabet (2*length)) : 0 ≤ (data.split child : ℝ)/Fintype.card P := by positivity
  constructor
  · exact Finset.sum_nonneg (fun child _ => mul_nonneg (nonnegative child) (mul_nonneg (range _ _).1 (range _ _).1))
  · unfold parentLaw
    calc
      _ ≤ ∑ child, (data.split child : ℝ)/Fintype.card P * 1 := by
        apply Finset.sum_le_sum
        intro child _
        apply mul_le_mul_of_nonneg_left _ (nonnegative child)
        simpa only [one_mul] using mul_le_mul (range _ _).2 (range _ _).2 (range _ _).1 (by norm_num : (0 : ℝ) ≤ 1)
      _ = 1 := by simp only [mul_one]; exact data.parent_weights_sum reference

/-- Every compatibility sector has total parent-normalized mass at most two. -/
theorem pooledLaw_range (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
    (sector : CompatibilityClass (2*length)) (symbol : Fin length → Fin 3) :
    0 ≤ data.pooledLaw (P := P) axisClass law sector symbol ∧ data.pooledLaw (P := P) axisClass law sector symbol ≤ 2 := by
  have nonnegative (child : ShapeAlphabet (2*length)) : 0 ≤ 2*(data.split child : ℝ)/Fintype.card P := by positivity
  constructor
  · unfold pooledLaw
    apply Finset.sum_nonneg
    intro child _
    split_ifs
    · exact mul_nonneg (nonnegative child) (range _ _).1
    · exact le_rfl
  · unfold pooledLaw
    calc
      _ ≤ ∑ child, 2*(data.split child : ℝ)/Fintype.card P := by
        apply Finset.sum_le_sum
        intro child _
        split_ifs
        · exact mul_le_of_le_one_right (nonnegative child) (range _ _).2
        · exact nonnegative child
      _ = 2 := by
        simp_rw [mul_div_assoc]
        rw [← Finset.mul_sum, data.parent_weights_sum reference, mul_one]

/-- Perturbing each child-law coordinate by delta changes every parent coordinate by at most twice delta. -/
theorem parentLaw_close (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (law law' : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child symbol, 0 ≤ law child symbol ∧ law child symbol ≤ 1)
    (range' : ∀ child symbol, 0 ≤ law' child symbol ∧ law' child symbol ≤ 1)
    {delta : ℝ} (nonnegative : 0 ≤ delta) (close : ∀ child symbol, |law child symbol-law' child symbol| ≤ delta)
    (word : Fin (length+length) → Fin 3) :
    |data.parentLaw (P := P) law word-data.parentLaw (P := P) law' word| ≤ 2*delta := by
  exact Entropy.mixture_product_error (fun child => (data.split child : ℝ)/Fintype.card P)
    _ _ _ _ (fun _ => by positivity) (data.parent_weights_sum reference)
    (fun _ => range _ _) (fun _ => range' _ _) nonnegative (fun _ => close _ _) (fun _ => close _ _)

/-- Perturbing each child law by delta changes every pooled mass coordinate by at most twice delta. -/
theorem pooledLaw_close (data : SplitRestrictionData length) (reference : data.PrescribedEdges (P := P))
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law law' : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    {delta : ℝ} (nonnegative : 0 ≤ delta) (close : ∀ child symbol, |law child symbol-law' child symbol| ≤ delta)
    (sector : CompatibilityClass (2*length)) (symbol : Fin length → Fin 3) :
    |data.pooledLaw (P := P) axisClass law sector symbol-data.pooledLaw (P := P) axisClass law' sector symbol| ≤ 2*delta := by
  have weight (child : ShapeAlphabet (2*length)) : 0 ≤ 2*(data.split child : ℝ)/Fintype.card P := by positivity
  unfold pooledLaw
  rw [← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ child, |(if axisClass child = sector then (2*(data.split child : ℝ)/Fintype.card P)*law child symbol else 0) -
      (if axisClass child = sector then (2*(data.split child : ℝ)/Fintype.card P)*law' child symbol else 0)| :=
        Finset.abs_sum_le_sum_abs _ _
    _ ≤ ∑ child, (2*(data.split child : ℝ)/Fintype.card P)*delta := by
      apply Finset.sum_le_sum
      intro child _
      split_ifs
      · rw [← mul_sub, abs_mul, abs_of_nonneg (weight child)]
        exact mul_le_mul_of_nonneg_left (close child symbol) (weight child)
      · simpa only [sub_self, abs_zero] using mul_nonneg (weight child) nonnegative
    _ = 2*delta := by
      simp_rw [mul_div_assoc]
      rw [← Finset.sum_mul, ← Finset.mul_sum, data.parent_weights_sum reference, mul_one]

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
