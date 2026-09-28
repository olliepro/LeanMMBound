import CWOneLetterInterfaces
import CWRetentionContinuity
import EntropyPointMass

/-! Every terminal one-letter compatibility sector has only one possible
fine symbol. Its actual pooled mass entropy vanishes, even for empty pools. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P]

/-- Decode the Y coarse label from either a forced child sector or a pooled sector. -/
def ySectorLabel : CompatibilityClass 2 → Fin 3 := Sum.elim shapeYIndex id

/-- Decode the Z coarse label from either a forced child sector or a pooled sector. -/
def zSectorLabel : CompatibilityClass 2 → Fin 3 := Sum.elim shapeZIndex id

/-- The Y compatibility class retains the complete one-letter Y label. -/
theorem ySectorLabel_class (child : ShapeAlphabet 2) : ySectorLabel (yClass child) = shapeYIndex child := by
  unfold ySectorLabel yClass
  split_ifs <;> rfl

/-- The Z compatibility class retains the complete one-letter Z label. -/
theorem zSectorLabel_class (child : ShapeAlphabet 2) : zSectorLabel (zClass child) = shapeZIndex child := by
  unfold zSectorLabel zClass
  split_ifs <;> rfl

/-- Pooling Dirac child laws with the same label incurs exactly zero compatibility entropy. -/
theorem one_letter_pooled_entropy_zero (data : SplitRestrictionData 1)
    (axisClass : ShapeAlphabet 2 → CompatibilityClass 2) (label : ShapeAlphabet 2 → Fin 3)
    (sectorLabel : CompatibilityClass 2 → Fin 3)
    (consistent : ∀ child, sectorLabel (axisClass child) = label child) (sector : CompatibilityClass 2) :
    Entropy.massEntropy (data.pooledLaw (P := P) axisClass (fun child => oneLetterLaw (label child)) sector) = 0 := by
  apply Entropy.massEntropy_single_support _ (fun _ => sectorLabel sector)
  intro word different
  unfold SplitRestrictionData.pooledLaw
  apply Finset.sum_eq_zero
  intro child _
  by_cases belongs : axisClass child = sector
  · have labelSame : label child = sectorLabel sector := (consistent child).symm.trans (congrArg sectorLabel belongs)
    simp [belongs, oneLetterLaw, labelSame, different]
  · simp [belongs]

/-- The actual one-letter Y retention is its parent entropy with no pooled compatibility loss. -/
theorem one_letter_y_retention (data : SplitRestrictionData 1) :
    data.lawRetention (P := P) yClass (fun child => oneLetterLaw (shapeYIndex child)) =
      Entropy.entropy (data.parentLaw (P := P) (fun child => oneLetterLaw (shapeYIndex child))) := by
  unfold SplitRestrictionData.lawRetention
  simp only [one_letter_pooled_entropy_zero data yClass shapeYIndex ySectorLabel ySectorLabel_class,
    Finset.sum_const_zero, sub_zero]

/-- The actual one-letter Z retention is its parent entropy with no pooled compatibility loss. -/
theorem one_letter_z_retention (data : SplitRestrictionData 1) :
    data.lawRetention (P := P) zClass (fun child => oneLetterLaw (shapeZIndex child)) =
      Entropy.entropy (data.parentLaw (P := P) (fun child => oneLetterLaw (shapeZIndex child))) := by
  unfold SplitRestrictionData.lawRetention
  simp only [one_letter_pooled_entropy_zero data zClass shapeZIndex zSectorLabel zSectorLabel_class,
    Finset.sum_const_zero, sub_zero]

end
end MatrixBounds.Tensor.CW
