import RootCoarseEnumeration

/-! Exact source-column evaluation of arbitrary supported coarse Gibbs sums.
This extends the root helper to the later paired extraction levels. -/
namespace MatrixBounds.Numeric

open Tensor.CW
open scoped BigOperators
noncomputable section

/-- A sum over a complete supported subtype equals the sum with its exact support indicator. -/
theorem supportedSubtype_sum {A M : Type*} [Fintype A] [AddCommMonoid M]
    (supported : A → Prop) [DecidablePred supported] (weight : A → M) :
    (∑ item : {item // supported item}, weight item.val) =
      ∑ item : A, if supported item then weight item else 0 := by
  have identity := Fintype.sum_subtype_add_sum_subtype supported
    (fun item => if supported item then weight item else 0)
  have yes (item : {item // supported item}) :
      (if supported item.val then weight item.val else 0) = weight item.val := if_pos item.property
  have no (item : {item // ¬supported item}) :
      (if supported item.val then weight item.val else 0) = 0 := if_neg item.property
  simpa only [yes, no, Finset.sum_const_zero, add_zero] using identity

/-- All admissible splits are retained when the Gibbs normalizer is evaluated by source columns. -/
theorem rationalGibbsNormalizer_supported_enumeration {length n : ℕ}
    (parent : Shape) (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (ux uy uz : Fin (2*length+1) → ℚ) :
    rationalGibbsNormalizer parent ux uy uz =
      ∑ column : Fin n, if (enumeration column).val.Fits parent then
        ux (shapeXIndex (enumeration column))*uy (shapeYIndex (enumeration column))*
          uz (shapeZIndex (enumeration column)) else 0 := by
  unfold rationalGibbsNormalizer
  change (∑ child : {child : ShapeAlphabet (2*length) // child.val.Fits parent},
    ux (shapeXIndex child.val)*uy (shapeYIndex child.val)*uz (shapeZIndex child.val)) = _
  rw [supportedSubtype_sum (fun child : ShapeAlphabet (2*length) => child.val.Fits parent)
    (fun child => ux (shapeXIndex child)*uy (shapeYIndex child)*uz (shapeZIndex child))]
  exact (enumeration.sum_comp (fun child => if child.val.Fits parent then
    ux (shapeXIndex child)*uy (shapeYIndex child)*uz (shapeZIndex child) else 0)).symm

end
end MatrixBounds.Numeric
