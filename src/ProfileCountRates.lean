module

public import HeterogeneousTypeGluing
public import LogarithmicLoss

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The number of all heterogeneous exact-profile tuples is polynomial in the
common population scale, and its full gluing cost is subexponential. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions Alphabet : T → Type*}
variable [∀ type, Fintype (Positions type)] [∀ type, Fintype (Alphabet type)]

/-- All separately labelled profile choices have the product of their finite profile counts. -/
theorem profile_tuple_card : Fintype.card (∀ type, Profiles (Positions type) (Alphabet type)) =
    ∏ type, (Fintype.card (Positions type)+1)^Fintype.card (Alphabet type) := by
  rw [Fintype.card_pi]
  exact Finset.prod_congr rfl (fun _ _ => profiles_card)

/-- Linear population growth gives a single polynomial bound for all exact-profile tuples. -/
theorem profile_tuple_bound (growth size : ℕ) (population : ∀ type, Fintype.card (Positions type) ≤ growth*size) :
    Fintype.card (∀ type, Profiles (Positions type) (Alphabet type)) ≤
      (growth*size+1)^(∑ type, Fintype.card (Alphabet type)) := by
  rw [profile_tuple_card, ← Finset.prod_pow_eq_pow_sum]
  exact Finset.prod_le_prod' (fun type _ => Nat.pow_le_pow_left (Nat.add_le_add_right (population type) 1) _)

end
end MatrixBounds.Empirical

namespace MatrixBounds.Selection

noncomputable section

/-- Every fixed polynomial gluing factor lies below exp(error times size) above one explicit threshold. -/
theorem polynomial_cost_eventually (degree growth : ℕ) {error : ℝ} (positive : 0 < error) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size →
      ((growth*size+1 : ℕ) : ℝ)^degree ≤ Real.exp (error*size) := by
  obtain ⟨threshold, small⟩ := logarithmic_error_eventually
    (constant := (degree : ℝ)) (growth := (growth : ℝ)) (Nat.cast_nonneg _) (Nat.cast_nonneg _) positive
  refine ⟨threshold, ?_⟩
  intro size large
  have bound := small size large
  have degreeNonnegative : (0 : ℝ) ≤ degree := Nat.cast_nonneg _
  calc
    _ = Real.exp ((degree : ℝ)*Real.log ((growth : ℝ)*size+1)) := by
      rw [Real.exp_nat_mul, Real.exp_log (by positivity)]
      push_cast
      rfl
    _ ≤ Real.exp (error*size) := Real.exp_le_exp.mpr (by nlinarith)

end
end MatrixBounds.Selection
