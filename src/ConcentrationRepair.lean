module

public import HeterogeneousConcentration
public import LinearSymmetryRepair
public import Mathlib.Algebra.Order.Archimedean.Real.Basic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Convert finite parent-type concentration into the integer hole bounds
required by the constructive sparse repair theorem. -/
namespace MatrixBounds.Sampling

noncomputable section

/-- A C/(parents*epsilon^2) bad fraction gives an explicit integer inverse-scale hole bound. -/
theorem fraction_to_repair_bound {bad parts parents scale multiplier : ℕ} {constant epsilon : ℝ}
    (parts_positive : 0 < parts) (parents_positive : 0 < parents) (epsilon_positive : 0 < epsilon)
    (scale_bound : scale ≤ multiplier*parents)
    (fraction : (bad : ℝ)/parts ≤ constant/((parents : ℝ)*epsilon^2)) :
    bad*scale ≤ ⌈constant*multiplier/epsilon^2⌉₊*parts := by
  have hp : (0 : ℝ) < parts := by exact_mod_cast parts_positive
  have hm : (0 : ℝ) < parents := by exact_mod_cast parents_positive
  have he : 0 < epsilon^2 := sq_pos_of_pos epsilon_positive
  have scaled := (div_le_div_iff₀ hp (mul_pos hm he)).mp fraction
  have scale_real : (scale : ℝ) ≤ (multiplier : ℝ)*parents := by exact_mod_cast scale_bound
  have enlarged := mul_le_mul_of_nonneg_left scale_real (mul_nonneg (Nat.cast_nonneg bad) he.le)
  have multiplied := mul_le_mul_of_nonneg_right scaled (Nat.cast_nonneg multiplier)
  have before_ceiling : (bad : ℝ)*scale ≤ (constant*multiplier/epsilon^2)*parts := by
    rw [div_mul_eq_mul_div]
    apply (le_div_iff₀ he).mpr
    nlinarith
  have ceiling := mul_le_mul_of_nonneg_right (Nat.le_ceil (constant*multiplier/epsilon^2)) hp.le
  have result := before_ceiling.trans ceiling
  exact_mod_cast result

end
end MatrixBounds.Sampling

namespace MatrixBounds.Empirical

open Sampling
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Pool Parent : Type*} [Fintype Pool] [Fintype Parent] [Nonempty Parent]
variable {P B Slot : Pool → Type*}
variable [∀ t, Fintype (P t)] [∀ t, Fintype (B t)] [∀ t, Fintype (Slot t)]
variable [∀ t, DecidableEq (P t)]

/-- Parent-type holes satisfy the exact integer repair hypothesis with a profile-independent constant. -/
theorem heterogeneous_parent_repair_bound (profile : ∀ t, B t → ℕ)
    (representative : ∀ t, TypedWord (P := P t) (profile t))
    (positions : ∀ t, Parent × Slot t ↪ P t) {epsilon : ℝ} (positive : 0 < epsilon)
    (scale multiplier : ℕ) (scale_bound : scale ≤ multiplier*Fintype.card Parent) :
    Nat.card {words : ∀ t, TypedWord (P := P t) (profile t) // ∃ pattern : ∀ t, Slot t → B t,
        epsilon ≤ |(∑ parent, indicator (heterogeneousBlockEvent profile positions pattern parent) words) /
          Fintype.card Parent - heterogeneousBlockCenter (P := P) profile pattern|} * scale ≤
      ⌈((Fintype.card (∀ t, Slot t → B t) : ℝ)*(1+6*∑ t, (Fintype.card (Slot t) : ℝ)))*multiplier/epsilon^2⌉₊ *
        Fintype.card (∀ t, TypedWord (P := P t) (profile t)) := by
  letI : Nonempty (∀ t, TypedWord (P := P t) (profile t)) := ⟨representative⟩
  apply fraction_to_repair_bound Fintype.card_pos Fintype.card_pos positive scale_bound
  have bound := heterogeneous_all_patterns_concentration profile representative positions positive
  convert bound using 1
  ring

end
end MatrixBounds.Empirical
