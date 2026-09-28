import VerifiedSplitProfiles
import CWUniformPairing
import CWCoarseGraph
import SupportedTypes

/-! The supplied checked split tables instantiate the complete admissible graph
and the fixed-parent coordinate maps without adding support or shape hypotheses. -/
namespace MatrixBounds.Numeric

open Empirical Tensor Tensor.CW
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

/-- Every inadmissible child has exactly zero count in a checked split profile. -/
theorem splitProfile_support {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true) (symbol : ShapeAlphabet data.childTotal)
    (outside : ¬symbol.val.Fits data.parent) : splitProfile data denominator size symbol = 0 := by
  have zero : data.massAt symbol.val = 0 := by
    by_contra nonzero
    exact outside (((SplitRow.check_sound checked).2.2.2 symbol.val symbol.property).1 nonzero)
  simp only [splitProfile, rationalProfile, zero, mul_zero]

/-- The checked full-table profile restricted to the actual admissible child alphabet. -/
def admissibleSplitProfile (data : SplitRow) (denominator size : ℕ) : SplitAlphabet data.parent data.childTotal → ℕ :=
  fun symbol => splitProfile data denominator size symbol.val

/-- Every checked prescribed word is canonically an exact word on the actual support alphabet. -/
def admissibleSplitEquiv {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true) :
    TypedWord (P := Fin size) (splitProfile data denominator size) ≃
      TypedWord (P := Fin size) (admissibleSplitProfile data denominator size) :=
  supportedTypeEquiv (fun symbol => symbol.val.Fits data.parent) (splitProfile data denominator size)
    (splitProfile_support checked)

/-- The supplied full-table and actual-support exact edge counts are identical. -/
theorem admissibleSplit_card {data : SplitRow} {denominator size : ℕ} (checked : data.check denominator = true) :
    Nat.card (TypedWord (P := Fin size) (splitProfile data denominator size)) =
      Nat.card (TypedWord (P := Fin size) (admissibleSplitProfile data denominator size)) :=
  Nat.card_congr (admissibleSplitEquiv checked)

/-- Prescribed checked split words lie in the complete graph with their actual marginal profiles. -/
def checkedCoarseWord {data : SplitRow} {denominator size : ℕ}
    (checked : data.check denominator = true)
    (word : TypedWord (P := Fin size) (splitProfile data denominator size)) :
    CoarseWords (P := Fin size) data.parent data.childTotal
      (marginalProfile (admissibleSplitProfile data denominator size) splitXIndex)
      (marginalProfile (admissibleSplitProfile data denominator size) splitYIndex)
      (marginalProfile (admissibleSplitProfile data denominator size) splitZIndex) := by
  let admissible := admissibleSplitEquiv checked word
  exact ⟨admissible.val,
    hasType_projected _ splitXIndex admissible.val admissible.property,
    hasType_projected _ splitYIndex admissible.val admissible.property,
    hasType_projected _ splitZIndex admissible.val admissible.property⟩

/-- The recorded numerical row transports one common parent certificate to the whole labelled child product.
For any divisible size, `splitProfile_feasible` supplies its exact word. -/
def checkedUniformPairingCertificate {K : Type*} [CommRing K]
    {data : SplitRow} {denominator size : ℕ} (checked : data.check denominator = true)
    (word : TypedWord (P := Fin size) (splitProfile data denominator size)) (q length : ℕ)
    (profileX profileY profileZ : ShapeAlphabet data.childTotal → (Fin length → Fin 3) → ℕ)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (parentPower (K := K) (P := Fin size) q length data.parent) rank degree) :
    Degeneration.Certificate (exactChildren (K := K)
      (Positions := fun symbol => Fin (2*splitProfile data denominator size symbol))
      q (fun _ => length) Subtype.val profileX profileY profileZ) rank degree :=
  uniformPairingCertificate (splitProfilePairing checked word) q length data.parent Subtype.val
    (splitProfilePairing_shapes checked word) profileX profileY profileZ certificate

end
end MatrixBounds.Numeric
