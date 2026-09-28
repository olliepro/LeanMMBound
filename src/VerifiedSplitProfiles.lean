import ShapeAlphabet
import SplitPairing
import TypeDenominators
import VerifiedSplitData
import CWTypedInterfaces

/-! The kernel-checked split tables now supply feasible symmetric empirical
profiles and actual labelled parent/child slot bijections at every divisible size. -/
namespace MatrixBounds.Numeric

open Empirical
noncomputable section

/-- The prescribed number of occurrences of each coarse shape at a divisible parent size. -/
def splitProfile (data : SplitRow) (denominator size : ℕ) : ShapeAlphabet data.childTotal → ℕ :=
  rationalProfile (fun symbol => data.massAt symbol.val) denominator size

/-- A checked row gives a feasible exact split profile at every multiple of its denominator. -/
theorem splitProfile_feasible {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true) (divisible : denominator ∣ size) :
    Nonempty (TypedWord (P := Fin size) (splitProfile data denominator size)) :=
  rationalProfile_feasible _ (checked_shape_mass_total checked) divisible

/-- Complementary symmetry is preserved exactly by integer profile scaling. -/
theorem splitProfile_symmetric {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true) (symbol : ShapeAlphabet data.childTotal) :
    splitProfile data denominator size
      ((complementEquiv data.parent data.childTotal (SplitRow.check_sound checked).2.2.1).symm symbol) =
        splitProfile data denominator size symbol := by
  change (size/denominator)*data.massAt
    (complementEquiv data.parent data.childTotal (SplitRow.check_sound checked).2.2.1 symbol).val = _
  rw [checked_complement_mass checked]
  rfl

/-- Every observed symbol of a feasible checked profile is an admissible child of its parent. -/
theorem splitProfile_observed_fits {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true)
    (word : TypedWord (P := Fin size) (splitProfile data denominator size)) (position : Fin size) :
    (word.val position).val.Fits data.parent := by
  have positive := Tensor.CW.profile_positive_at _ word position
  have nonzero : data.massAt (word.val position).val ≠ 0 := by
    intro zero
    simp only [splitProfile, rationalProfile, zero, mul_zero] at positive
    omega
  exact ((SplitRow.check_sound checked).2.2.2 _ (word.val position).property).1 nonzero

/-- A checked exact split word constructs the required pools, with twice each coarse type count. -/
def splitProfilePairing {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true)
    (word : TypedWord (P := Fin size) (splitProfile data denominator size)) :
    Tensor.CW.Pairing (fun symbol => Fin (2*splitProfile data denominator size symbol)) (Fin size) :=
  complementaryPairing (complementEquiv data.parent data.childTotal (SplitRow.check_sound checked).2.2.1)
    (splitProfile data denominator size) (splitProfile_symmetric checked) word

/-- Actual left and right child shapes in the checked pairing reconstruct the recorded parent shape. -/
theorem splitProfilePairing_shapes {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true)
    (word : TypedWord (P := Fin size) (splitProfile data denominator size)) (position : Fin size) :
    Tensor.CW.addShape ((splitProfilePairing checked word).left position).1.val
      ((splitProfilePairing checked word).right position).1.val = data.parent := by
  simp only [splitProfilePairing, complementaryPairing_left, complementaryPairing_right]
  rw [complementEquiv_shape _ _ _ _ (splitProfile_observed_fits checked word position)]
  exact Tensor.CW.addShape_complement (splitProfile_observed_fits checked word position)

/-- Every supplied numerical split row gives a feasible exact profile and valid parent pairing. -/
theorem supplied_split_profile {data : SplitRow} (present : data ∈ SplitCertificateData.rows)
    {size : ℕ} (divisible : 17592186044416 ∣ size) :
    ∃ word : TypedWord (P := Fin size) (splitProfile data 17592186044416 size),
      ∀ position, Tensor.CW.addShape
        ((splitProfilePairing (List.all_eq_true.mp SplitCertificateData.rows_checked data present) word).left position).1.val
        ((splitProfilePairing (List.all_eq_true.mp SplitCertificateData.rows_checked data present) word).right position).1.val = data.parent := by
  have checked := List.all_eq_true.mp SplitCertificateData.rows_checked data present
  obtain ⟨word⟩ := splitProfile_feasible checked divisible
  exact ⟨word, splitProfilePairing_shapes checked word⟩

end
end MatrixBounds.Numeric
