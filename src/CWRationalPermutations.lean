import CWRationalSplit
import CWPermutedCoarseData

/-! Fixed rational extraction parameters transport to every physical role
ordering, preserving support, normalization, symmetry, and parent centers. -/
namespace MatrixBounds.Tensor.CW.RationalSplit

open Empirical Numeric
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length denominator : ℕ}

/-- Permute a rational split's actual coarse coordinates while preserving its exact numerator masses. -/
def permute (split : RationalSplit length denominator) (axes : Equiv.Perm (Fin 3)) :
    RationalSplit length denominator where
  parent := split.parent.permute axes
  balanced := (Shape.permute_total axes split.parent).trans split.balanced
  numerator := split.numerator ∘ (shapeAlphabetPermutation axes (2*length)).symm
  normalized := (Equiv.sum_comp (shapeAlphabetPermutation axes (2*length)).symm split.numerator).trans split.normalized
  supported child nonzero := by
    let labels := shapeAlphabetPermutation axes (2*length)
    have supported := (Shape.permute_fits axes (labels.symm child).val split.parent).mpr (split.supported _ nonzero)
    have same : Shape.permute axes (labels.symm child).val = child.val :=
      congrArg Subtype.val (labels.apply_symm_apply child)
    rwa [same] at supported
  symmetric :=
    (SplitRestrictionData.fromCoarse split.parent split.balanced split.numerator).permutedCoarse_symmetric
      split.symmetric axes

/-- Constructing integer counts commutes exactly with physical shape reindexing. -/
theorem permute_data (split : RationalSplit length denominator) (axes : Equiv.Perm (Fin 3)) (size : ℕ) :
    (split.permute axes).data size = (split.data size).permutedCoarse axes := rfl

/-- Relabelled child laws give precisely the original complete parent law in the selected physical axis. -/
theorem permute_parentLaw (split : RationalSplit length denominator) (axes : Equiv.Perm (Fin 3))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (split.permute axes).parentLaw (SplitRestrictionData.permutedLaw axes law) = split.parentLaw law := by
  have identity := SplitRestrictionData.permutedCoarse_parentLaw (P := Fin denominator)
    (SplitRestrictionData.fromCoarse split.parent split.balanced split.numerator) axes law
  funext word
  have value := congrFun identity word
  simpa only [parentLaw, SplitRestrictionData.rationalParentLaw, SplitRestrictionData.parentLaw,
    SplitRestrictionData.fromCoarse, SplitRestrictionData.permutedCoarse, permute, Fintype.card_fin,
    Function.comp_apply] using value

end
end MatrixBounds.Tensor.CW.RationalSplit
