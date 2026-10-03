module

public import TensorBatching
public import SharedModulusRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A uniform prime cap gives a single integer output-copy count for every
nearby exact type. This removes the type-dependent prime and selection count
before exact-type batches are glued. -/
namespace MatrixBounds.Selection

noncomputable section

/-- Increasing a positive modulus decreases the Behrend retention factor. -/
theorem behrend_factor_antitone {small large : ℝ} (positive : 0 < small) (bound : small ≤ large) :
    Real.exp (-4*Real.sqrt (Real.log large)) ≤ Real.exp (-4*Real.sqrt (Real.log small)) := by
  apply Real.exp_le_exp.mpr
  have roots := Real.sqrt_le_sqrt (Real.log_le_log positive bound)
  linarith

/-- Replace the selected prime in the retained-count estimate by any common real upper bound. -/
theorem retained_count_uniform {prime copies : ℕ} {cost retention cap : ℝ}
    (primePositive : 0 < prime) (costPositive : 0 < cost) (primeBound : (prime : ℝ) ≤ cap)
    (retained : Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies) :
    Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log cap)) ≤ copies := by
  have positive : (0 : ℝ) < prime := by exact_mod_cast primePositive
  exact (mul_le_mul_of_nonneg_left (behrend_factor_antitone positive primeBound)
    (div_nonneg (Real.exp_pos _).le costPositive.le)).trans retained

/-- The common integer number of copies guaranteed by the explicit retention estimate. -/
def retainedCopies (cost retention cap : ℝ) : ℕ :=
  ⌈Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log cap))⌉₊

/-- Integer rounding upward retains the whole real lower bound without an additional exponential loss. -/
theorem retainedCopies_lower (cost retention cap : ℝ) :
    Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log cap)) ≤ retainedCopies cost retention cap := Nat.le_ceil _

end
end MatrixBounds.Selection

namespace MatrixBounds.Tensor

open Selection
noncomputable section
variable {K X Y Z : Type*} [CommSemiring K] [Fintype X] [Fintype Y] [Fintype Z]

/-- A family-specific selected prime and copy count yields the same fixed batch whenever the prime cap and entropy bound are uniform. -/
theorem rankLE_uniform_retained_batch (tensor : Coeff K X Y Z) {cost retention cap : ℝ} {rank : ℕ}
    (costPositive : 0 < cost)
    (available : ∃ prime copies : ℕ, 0 < prime ∧ (prime : ℝ) ≤ cap ∧
      Real.exp retention/cost*Real.exp (-4*Real.sqrt (Real.log prime)) ≤ copies ∧
      RankLE (directSum (fun _ : Fin copies => tensor)) rank) :
    RankLE (directSum (fun _ : Fin (retainedCopies cost retention cap) => tensor)) rank := by
  classical
  obtain ⟨prime, copies, primePositive, primeBound, retained, algorithm⟩ := available
  have uniform := retained_count_uniform primePositive costPositive primeBound retained
  have smaller : retainedCopies cost retention cap ≤ copies := Nat.ceil_le.mpr uniform
  exact rankLE_fewer_copies tensor smaller algorithm

end
end MatrixBounds.Tensor
