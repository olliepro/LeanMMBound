module

public import CWMixedNearbyExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Separate the exact nominal mixed retention from its uniform per-parent
entropy loss. The minimum is still taken only after the three global sums. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric
open scoped BigOperators
noncomputable section
variable {T : Type*} [Fintype T] {Positions : T → Type*}
variable [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- A common per-type loss subtracts its total after the mixed minimum. -/
theorem mixedRetention_sub (rateX rateY rateZ loss : T → ℝ) :
    mixedRetention (fun type => rateX type-loss type) (fun type => rateY type-loss type)
      (fun type => rateZ type-loss type) = mixedRetention rateX rateY rateZ-∑ type, loss type := by
  simp only [mixedRetention, Finset.sum_sub_distrib, min_sub_sub_right]

/-- The nominal extraction rate is the zero-error mixed rate minus the total per-parent error. -/
theorem nominalRetention_error (data : ∀ type, SplitRestrictionData (length type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ) (error : ℝ) :
    nominalRetention (Positions := Positions) data ux uy uz lawY lawZ error =
      nominalRetention (Positions := Positions) data ux uy uz lawY lawZ 0 -
        error*∑ type, (Fintype.card (Positions type) : ℝ) := by
  unfold nominalRetention nominalCoarseRate nominalFineRate
  simp only [mul_sub, sub_zero]
  rw [mixedRetention_sub]
  congr 1
  rw [Finset.mul_sum]
  exact Finset.sum_congr rfl (fun _ _ => mul_comm _ _)

/-- Linear population bounds turn the exact mixed rate into a uniform rate after all degree errors. -/
theorem nominalRetention_lower (data : ∀ type, SplitRestrictionData (length type))
    (ux uy uz : ∀ type, Fin (2*length type+1) → ℝ)
    (lawY lawZ : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℝ)
    (multiplier : T → ℕ) (size : ℕ) {error rate : ℝ} (nonnegative : 0 ≤ error)
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*size)
    (retention : rate*size ≤ nominalRetention (Positions := Positions) data ux uy uz lawY lawZ 0) :
    (rate-error*∑ type, (multiplier type : ℝ))*size ≤ nominalRetention (Positions := Positions) data ux uy uz lawY lawZ error := by
  rw [nominalRetention_error]
  have populationSum : (∑ type, (Fintype.card (Positions type) : ℝ)) ≤ (∑ type, (multiplier type : ℝ))*size := by
    rw [Finset.sum_mul]
    exact Finset.sum_le_sum (fun type _ => by exact_mod_cast population type)
  have loss := mul_le_mul_of_nonneg_left populationSum nonnegative
  nlinarith

end
end MatrixBounds.Tensor.CW.Mixed
