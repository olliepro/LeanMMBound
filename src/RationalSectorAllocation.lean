module

public import SectorAllocation
public import TypeDenominators

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Rational strategy weights give actual disjoint position sectors at every
divisible size. Their tensor restriction has exactly the certified mixture law. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {Sector : Type*} [Fintype Sector]

/-- Physical positions of each rationally weighted strategy sector. -/
abbrev RationalSectorPositions (numerator : Sector → ℕ) (denominator size : ℕ) (sector : Sector) :=
  Fin (rationalProfile numerator denominator size sector)

/-- A normalized rational allocation supplies a bijection from labelled sectors to the full position set. -/
def rationalSectorPlacement (numerator : Sector → ℕ) {denominator size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator) (divisible : denominator ∣ size) :
    ((sector : Sector) × RationalSectorPositions numerator denominator size sector) ≃ Fin size :=
  Fintype.equivOfCardEq (by
    simp only [Fintype.card_sigma, RationalSectorPositions, Fintype.card_fin]
    exact rationalProfile_total numerator normalized divisible)

/-- The physical sector mixture is exactly the specified rational mixture of strategy laws. -/
theorem rationalSectorLaw {B : Type*} (numerator : Sector → ℕ) {denominator size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (laws : Sector → B → ℝ) :
    sectorLaw (P := Fin size) (Positions := RationalSectorPositions numerator denominator size) laws =
      fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*laws sector symbol := by
  funext symbol
  unfold sectorLaw
  simp only [RationalSectorPositions, Fintype.card_fin]
  apply Finset.sum_congr rfl
  intro sector _
  rw [rationalProfile_probability numerator denominatorPositive sizePositive divisible sector]

/-- Certified rational weights produce the corresponding labelled strategy tensors by a unit-cost contextual restriction. -/
theorem contextReduction_allocate_rational {K X Y Z BX BY BZ : Type*} [CommSemiring K]
    [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (numerator : Sector → ℕ) {denominator size : ℕ}
    (normalized : ∑ sector, numerator sector = denominator)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v}
      (windowedPower (P := Fin size) tensor partX partY partZ
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsX sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsY sector symbol)
        (fun symbol => ∑ sector, ((numerator sector : ℝ)/denominator)*lawsZ sector symbol) tolerance)
      (heterogeneous (fun sector => windowedPower (P := RationalSectorPositions numerator denominator size sector)
        tensor partX partY partZ (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  have allocation := contextReduction_allocate_sectors.{v} (rationalSectorPlacement numerator normalized divisible)
    tensor partX partY partZ lawsX lawsY lawsZ tolerance nonnegative
  simpa only [rationalSectorLaw numerator denominatorPositive sizePositive divisible] using allocation

end
end MatrixBounds.Interface
