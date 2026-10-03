module

public import AllWeightSectorAllocation

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Rational allocations expose the named fixed child coefficients used by
the next source interface, through explicit position bijections. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {Sector : Type*} [Fintype Sector]

/-- Allocate a complete mixture into its exactly identified fixed child populations. -/
theorem contextReduction_allocate_named_weights {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator assigned : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (assignment : ∀ sector, allocatedWeight weight denominator numerator sector = assigned sector)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsX sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsY sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsZ sector symbol) tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (assigned sector*size))
        tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  have allocation := contextReduction_allocate_all_weights tensor partX partY partZ numerator normalized denominatorPositive
    sizePositive divisible lawsX lawsY lawsZ tolerance nonnegative
  have rename := CoordinateRestriction.heterogeneous (fun sector => windowPositionRestriction
    (finCongr (congrArg (fun coefficient => coefficient*size) (assignment sector)))
    tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)
  exact allocation.trans rename.context

/-- Allocate physical roles into their exact named populations with all original fine-law centers retained. -/
theorem contextReduction_allocate_named_roles {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator assigned : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (assignment : ∀ sector, allocatedWeight weight denominator numerator sector = assigned sector)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ lawX lawY lawZ tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (assigned sector*size))
        tensor partX partY partZ lawX lawY lawZ tolerance)) 1 := by
  have allocation := contextReduction_allocate_named_weights tensor partX partY partZ numerator assigned normalized denominatorPositive
    sizePositive divisible assignment (fun _ => lawX) (fun _ => lawY) (fun _ => lawZ) tolerance nonnegative
  simpa only [rational_mixture_identical numerator normalized denominatorPositive] using allocation

end
end MatrixBounds.Interface
