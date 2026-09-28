import WeightedSectorAllocation
import CoordinateRestriction

/-! Exact strategy allocation also covers zero-population parents. This lets
the full original source label set remain unchanged between stages. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {Sector : Type*} [Fintype Sector]

/-- Allocate every fixed integer weight, including zero, into the prescribed complete rational sectors. -/
theorem contextReduction_allocate_all_weights {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsX sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsY sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsZ sector symbol) tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (allocatedWeight weight denominator numerator sector*size))
        tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  by_cases positive : 0 < weight
  · exact contextReduction_allocate_weighted tensor partX partY partZ numerator normalized denominatorPositive
      positive sizePositive divisible lawsX lawsY lawsZ tolerance nonnegative
  · have zero : weight = 0 := Nat.eq_zero_of_not_pos positive
    subst weight
    apply CoordinateRestriction.context
    refine ⟨(fun _ position => Fin.elim0 (Fin.cast (zero_mul size) position)),
      (fun _ position => Fin.elim0 (Fin.cast (zero_mul size) position)),
      (fun _ position => Fin.elim0 (Fin.cast (zero_mul size) position)), ?_⟩
    intro x y z
    rw [windowedPower_empty _ _ _ _ _ _ _ _ (by simp) _ _ _]
    unfold heterogeneous
    symm
    apply Finset.prod_eq_one
    intro sector _
    exact windowedPower_empty _ _ _ _ _ _ _ _ (by simp [allocatedWeight]) _ _ _

/-- Role allocation preserves the original complete law for all nonnegative integer source populations. -/
theorem contextReduction_allocate_all_roles {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ lawX lawY lawZ tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (allocatedWeight weight denominator numerator sector*size))
        tensor partX partY partZ lawX lawY lawZ tolerance)) 1 := by
  have allocation := contextReduction_allocate_all_weights tensor partX partY partZ numerator normalized denominatorPositive
    sizePositive divisible (fun _ => lawX) (fun _ => lawY) (fun _ => lawZ) tolerance nonnegative
  simpa only [rational_mixture_identical numerator normalized denominatorPositive] using allocation

end
end MatrixBounds.Interface
