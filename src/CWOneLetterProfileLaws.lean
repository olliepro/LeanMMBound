import CWOneLetterData
import CWActiveLaws

/-! The empirical child laws of forced one-letter profiles are exactly their
Dirac laws with the established zero convention on empty child pools. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Canonical one-letter exact profiles have the corresponding active Dirac probability laws. -/
theorem one_letter_childLaw (data : SplitRestrictionData 1) (label : ShapeAlphabet 2 → Fin 3) :
    data.childLaw (fun child => oneLetterProfile (label child) (2*data.split child)) =
      data.activeLaw (fun child => oneLetterLaw (label child)) := by
  funext child word
  by_cases empty : data.split child = 0
  · simp [SplitRestrictionData.childLaw, SplitRestrictionData.activeLaw, empty, oneLetterProfile]
  · have nonzero : (data.split child : ℝ) ≠ 0 := by exact_mod_cast empty
    by_cases same : word = (fun _ => label child)
    · simp [SplitRestrictionData.childLaw, SplitRestrictionData.activeLaw, empty,
        oneLetterProfile, oneLetterLaw, same, nonzero]
    · simp [SplitRestrictionData.childLaw, SplitRestrictionData.activeLaw, empty,
        oneLetterProfile, oneLetterLaw, same]

/-- A forced one-letter profile is supported on exactly the required coarse total. -/
theorem one_letter_profile_support (label : Fin 3) (size : ℕ) (word : Fin 1 → Fin 3)
    (outside : fineTotal word ≠ label.val) : oneLetterProfile label size word = 0 := by
  apply if_neg
  intro same
  apply outside
  simp only [same, fineTotal, Fin.sum_univ_one]

end
end MatrixBounds.Tensor.CW
