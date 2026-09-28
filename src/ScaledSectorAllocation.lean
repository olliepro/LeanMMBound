import RationalSectorAllocation

/-! Fixed rational sector weights are integer multiples of a common growing
scale. This is the population convention used by rational mixed extraction. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {Sector : Type*} [Fintype Sector]

omit [Fintype Sector] in
/-- An integer multiple of the denominator gives exactly the prescribed scaled sector count. -/
theorem rationalProfile_scaled (numerator : Sector → ℕ) {denominator : ℕ}
    (positive : 0 < denominator) (size : ℕ) (sector : Sector) :
    rationalProfile numerator denominator (denominator*size) sector = numerator sector*size := by
  simp only [rationalProfile, Nat.mul_div_right size positive, Nat.mul_comm size]

/-- Place all scaled sectors bijectively into the full denominator-scaled position set. -/
def scaledSectorPlacement (numerator : Sector → ℕ) {denominator : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (size : ℕ) :
    ((sector : Sector) × Fin (numerator sector*size)) ≃ Fin (denominator*size) :=
  Fintype.equivOfCardEq (by simp only [Fintype.card_sigma, Fintype.card_fin, ← Finset.sum_mul, normalized])

/-- Scaling every sector and the full population by the same positive integer preserves the rational mixture. -/
theorem scaledSectorLaw {B : Type*} (numerator : Sector → ℕ) (denominator : ℕ) {size : ℕ}
    (sizePositive : 0 < size) (laws : Sector → B → ℝ) :
    sectorLaw (P := Fin (denominator*size)) (Positions := fun sector => Fin (numerator sector*size)) laws =
      fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*laws sector symbol := by
  have nonzero : (size : ℝ) ≠ 0 := by exact_mod_cast sizePositive.ne'
  funext symbol
  simp only [sectorLaw, Fintype.card_fin, Nat.cast_mul, mul_div_mul_right _ _ nonzero]

/-- The actual allocation restriction produces labelled sectors of sizes numerator times the common scale. -/
theorem contextReduction_allocate_scaled {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator)
    (sizePositive : 0 < size)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin (denominator*size)) tensor partX partY partZ
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsX sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsY sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsZ sector symbol) tolerance)
      (heterogeneous (fun sector => windowedPower (P := Fin (numerator sector*size))
        tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  have allocation := contextReduction_allocate_sectors.{v} (scaledSectorPlacement numerator normalized size)
    tensor partX partY partZ lawsX lawsY lawsZ tolerance nonnegative
  simpa only [scaledSectorLaw numerator denominator sizePositive] using allocation

end
end MatrixBounds.Interface
