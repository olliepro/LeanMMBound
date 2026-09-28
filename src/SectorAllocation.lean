import SectorWindows
import WindowedInterface
import ContextExtraction

/-! Strategy allocation is an actual variable restriction into labelled sectors.
Its law is the mixture with the exact sector population proportions. -/
namespace MatrixBounds.Interface

universe v
open Tensor Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {K Sector P X Y Z BX BY BZ : Type*} [CommSemiring K] [Fintype Sector] [Fintype P]
variable {Positions : Sector → Type*} [∀ sector, Fintype (Positions sector)]

/-- The law obtained by weighting each sector's law by its fraction of physical positions. -/
def sectorLaw {B : Type*} (laws : Sector → B → ℝ) : B → ℝ :=
  fun symbol => ∑ sector, ((Fintype.card (Positions sector) : ℝ)/Fintype.card P)*laws sector symbol

omit [Fintype Sector] [Fintype P] [∀ sector, Fintype (Positions sector)] in
/-- Reading a reassembled coordinate at a placed sector slot recovers its original coordinate. -/
theorem regroupParts_at {A : Type*} (positions : ((sector : Sector) × Positions sector) ≃ P)
    (entries : ∀ sector, Positions sector → A) (slot : (sector : Sector) × Positions sector) :
    regroupParts positions entries (positions slot) = entries slot.1 slot.2 :=
  congrArg (fun pair : (sector : Sector) × Positions sector => entries pair.1 pair.2) (positions.symm_apply_apply slot)

/-- Regrouping the physical positions turns a tensor power into the product of its sector powers. -/
theorem sector_power_identity (positions : ((sector : Sector) × Positions sector) ≃ P)
    (tensor : Coeff K X Y Z) (x : ∀ sector, Positions sector → X)
    (y : ∀ sector, Positions sector → Y) (z : ∀ sector, Positions sector → Z) :
    heterogeneous (fun _ : P => tensor) (regroupParts positions x) (regroupParts positions y) (regroupParts positions z) =
      heterogeneousPower (Positions := Positions) (fun _ : Sector => tensor) x y z := by
  unfold heterogeneous heterogeneousPower
  rw [← positions.prod_comp (fun p => tensor (regroupParts positions x p) (regroupParts positions y p) (regroupParts positions z p))]
  simp only [regroupParts_at, Fintype.prod_sigma]

omit [Fintype Sector] [Fintype P] [∀ sector, Fintype (Positions sector)] in
/-- Applying an alphabet map commutes with reassembling disjoint position sectors. -/
theorem part_regroup {A B : Type*} (positions : ((sector : Sector) × Positions sector) ≃ P)
    (part : A → B) (entries : ∀ sector, Positions sector → A) :
    (fun p => part (regroupParts positions entries p)) =
      regroupParts positions (fun sector p => part (entries sector p)) := rfl

/-- Sector windows imply the available mixture window under the actual coordinate regrouping. -/
theorem sector_window_inclusion {A B : Type*} (positions : ((sector : Sector) × Positions sector) ≃ P)
    (part : A → B) (laws : Sector → B → ℝ) (entries : ∀ sector, Positions sector → A)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance)
    (accepted : ∀ sector, activeWithin (laws sector) tolerance (fun p => part (entries sector p))) :
    activeWithin (sectorLaw (P := P) (Positions := Positions) laws) tolerance
      (fun p => part (regroupParts positions entries p)) := by
  right
  rw [part_regroup]
  exact within_sector_mixture positions laws _ tolerance nonnegative accepted

/-- Sector acceptance masks applied after coordinate regrouping produce exactly the labelled strategy product. -/
theorem sector_allocation_identity (positions : ((sector : Sector) × Positions sector) ≃ P)
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    acceptedTensor (fun x y z => windowedPower (P := P) tensor partX partY partZ
      (sectorLaw (P := P) (Positions := Positions) lawsX) (sectorLaw (P := P) (Positions := Positions) lawsY)
      (sectorLaw (P := P) (Positions := Positions) lawsZ) tolerance
      (regroupParts positions x) (regroupParts positions y) (regroupParts positions z)) id id id
      (fun x => ∀ sector, activeWithin (lawsX sector) tolerance (fun p => partX (x sector p)))
      (fun y => ∀ sector, activeWithin (lawsY sector) tolerance (fun p => partY (y sector p)))
      (fun z => ∀ sector, activeWithin (lawsZ sector) tolerance (fun p => partZ (z sector p))) =
    heterogeneous (fun sector => windowedPower (P := Positions sector) tensor partX partY partZ
      (lawsX sector) (lawsY sector) (lawsZ sector) tolerance) := by
  rw [heterogeneous_windowedPower]
  funext x y z
  dsimp only [acceptedTensor, id_eq]
  simp only [poolProfiles, activeProfileWithin_word]
  by_cases accepted : (∀ sector, activeWithin (lawsX sector) tolerance (fun p => partX (x sector p))) ∧
      (∀ sector, activeWithin (lawsY sector) tolerance (fun p => partY (y sector p))) ∧
      (∀ sector, activeWithin (lawsZ sector) tolerance (fun p => partZ (z sector p)))
  · have hx := sector_window_inclusion positions partX lawsX x nonnegative accepted.1
    have hy := sector_window_inclusion positions partY lawsY y nonnegative accepted.2.1
    have hz := sector_window_inclusion positions partZ lawsZ z nonnegative accepted.2.2
    rw [if_pos accepted, if_pos accepted]
    unfold windowedPower
    rw [acceptedTensor, if_pos ⟨hx, hy, hz⟩]
    exact sector_power_identity positions tensor x y z
  · rw [if_neg accepted, if_neg accepted]

variable [Fintype X] [Fintype Y] [Fintype Z]

/-- Restrict an available mixture-law power to fixed labelled strategy sectors at unit cost in every tensor context. -/
theorem contextReduction_allocate_sectors (positions : ((sector : Sector) × Positions sector) ≃ P)
    (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawsX : Sector → BX → ℝ) (lawsY : Sector → BY → ℝ) (lawsZ : Sector → BZ → ℝ)
    (tolerance : ℝ) (nonnegative : 0 ≤ tolerance) :
    ContextReduction.{v} (windowedPower (P := P) tensor partX partY partZ
      (sectorLaw (P := P) (Positions := Positions) lawsX) (sectorLaw (P := P) (Positions := Positions) lawsY)
      (sectorLaw (P := P) (Positions := Positions) lawsZ) tolerance)
      (heterogeneous (fun sector => windowedPower (P := Positions sector) tensor partX partY partZ
        (lawsX sector) (lawsY sector) (lawsZ sector) tolerance)) 1 := by
  rw [← sector_allocation_identity positions tensor partX partY partZ lawsX lawsY lawsZ tolerance nonnegative]
  have regrouped := contextReduction_pullback.{v} (windowedPower (P := P) tensor partX partY partZ
    (sectorLaw (P := P) (Positions := Positions) lawsX) (sectorLaw (P := P) (Positions := Positions) lawsY)
    (sectorLaw (P := P) (Positions := Positions) lawsZ) tolerance)
    (regroupParts positions) (regroupParts positions) (regroupParts positions)
  exact regrouped.trans (contextReduction_accepted _ _ _ _ _ _ _)

end
end MatrixBounds.Interface
