import ScaledSectorAllocation
import WindowedReindexing

/-! Allocate a fixed integer population coefficient among rationally weighted
strategies and roles, preserving every sector and the common growing scale. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {Sector : Type*} [Fintype Sector]

/-- The integer coefficient of a labelled rational sector after allocation. -/
def allocatedWeight (weight denominator : ℕ) (numerator : Sector → ℕ) (sector : Sector) : ℕ :=
  (weight/denominator)*numerator sector

omit [Fintype Sector] in
/-- Divisibility before scaling gives each sector its fixed integer coefficient times the same scale. -/
theorem rationalProfile_allocatedWeight (numerator : Sector → ℕ) {weight denominator : ℕ}
    (divisible : denominator ∣ weight) (size : ℕ) (sector : Sector) :
    rationalProfile numerator denominator (weight*size) sector = allocatedWeight weight denominator numerator sector*size := by
  unfold rationalProfile allocatedWeight
  rw [Nat.mul_comm weight size, Nat.mul_div_assoc size divisible]
  ring

/-- Allocation preserves the full population coefficient, including sectors of weight zero. -/
theorem allocatedWeight_total (numerator : Sector → ℕ) {weight denominator : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (divisible : denominator ∣ weight) :
    (∑ sector, allocatedWeight weight denominator numerator sector) = weight := by
  simp only [allocatedWeight, ← Finset.mul_sum, normalized, Nat.div_mul_cancel divisible]

/-- Rational strategy allocation has the same fixed scaled population convention as all subsequent extraction stages. -/
theorem contextReduction_allocate_weighted {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (weightPositive : 0 < weight) (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsX sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsY sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsZ sector symbol) tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (allocatedWeight weight denominator numerator sector*size))
        tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  have allocation := contextReduction_allocate_rational tensor partX partY partZ numerator normalized denominatorPositive
    (Nat.mul_pos weightPositive sizePositive) (dvd_mul_of_dvd_left divisible size) lawsX lawsY lawsZ tolerance nonnegative
  have regroup := CoordinateRestriction.heterogeneous (fun sector => windowPositionRestriction
    (finCongr (rationalProfile_allocatedWeight numerator divisible size sector)) tensor partX partY partZ
    (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)
  exact allocation.trans regroup.context

/-- Allocating identical complete laws to roles leaves the supplied parent center unchanged. -/
theorem rational_mixture_identical {B : Type*} (numerator : Sector → ℕ) {denominator : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (positive : 0 < denominator) (law : B → ℝ) :
    (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*law symbol) = law := by
  have nonzero : (denominator : ℝ) ≠ 0 := by exact_mod_cast positive.ne'
  funext symbol
  rw [← Finset.sum_mul, ← Finset.sum_div, ← Nat.cast_sum, normalized, div_self nonzero, one_mul]

/-- Choosing an extraction role splits positions without changing any complete fine-law center. -/
theorem contextReduction_allocate_roles {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator weight size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (denominatorPositive : 0 < denominator)
    (weightPositive : 0 < weight) (sizePositive : 0 < size) (divisible : denominator ∣ weight)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (weight*size)) tensor partX partY partZ lawX lawY lawZ tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (allocatedWeight weight denominator numerator sector*size))
        tensor partX partY partZ lawX lawY lawZ tolerance)) 1 := by
  have allocation := contextReduction_allocate_weighted tensor partX partY partZ numerator normalized denominatorPositive
    weightPositive sizePositive divisible (fun _ => lawX) (fun _ => lawY) (fun _ => lawZ) tolerance nonnegative
  simpa only [rational_mixture_identical numerator normalized denominatorPositive] using allocation

end
end MatrixBounds.Interface
