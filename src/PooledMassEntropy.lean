module

public import PooledEntropy
public import MassEntropy

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The combinatorial sector-count exponent is precisely the unnormalized
pooled entropy used in the supplied certificate's retention formula. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Slot Sector B : Type*} [Fintype Slot] [Fintype Sector] [Fintype B]

/-- Every sector contributes parent size times its unnormalized pooled mass entropy.
Empty sectors satisfy the same identity without a separate positivity requirement. -/
theorem pooled_entropy_main (label : Slot → Sector) (profile : Sector → B → ℕ)
    (representative : ∀ sector, TypedWord (P := {slot // label slot = sector}) (profile sector))
    (size : ℝ) (nonzero : size ≠ 0) :
    (∑ sector, (Fintype.card {slot // label slot = sector} : ℝ)*
      Entropy.entropy (fun symbol => (profile sector symbol : ℝ)/Fintype.card {slot // label slot = sector})) =
      size * ∑ sector, Entropy.massEntropy (fun symbol => (profile sector symbol : ℝ)/size) := by
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro sector _
  have identity := Entropy.countEntropy_eq_any (profile sector)
  rw [profile_total (profile sector) (representative sector)] at identity
  rw [← identity]
  exact Entropy.countEntropy_parent_scale (profile sector) size nonzero

/-- Pooled compatibility counts have the verifier's mass-entropy exponent plus explicit finite error. -/
theorem pooled_mass_entropy_upper (label : Slot → Sector) (profile : Sector → B → ℕ)
    (representative : ∀ sector, TypedWord (P := {slot // label slot = sector}) (profile sector))
    (size : ℝ) (nonzero : size ≠ 0) :
    Real.log (Nat.card {word : Slot → B // SectorCompatible label profile word} : ℝ) ≤
      size * (∑ sector, Entropy.massEntropy (fun symbol => (profile sector symbol : ℝ)/size)) +
        ∑ sector, (Real.log ((Fintype.card {slot // label slot = sector} : ℝ)+1)+1) := by
  have upper := (pooled_entropy_bounds label profile representative).2
  rw [pooled_entropy_main label profile representative size nonzero] at upper
  exact upper

end
end MatrixBounds.Empirical
