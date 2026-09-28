import CWCoarseData
import CWCoarseRates
import CWProfileLaws
import CWTerminalProbabilities
import TypeDenominators

/-! Exact rational split laws at every divisible population. The normalized
coarse profiles and parent centers are independent of the integer population. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Scale a rational split numerator to an actual integer extraction record. -/
def fromRational {length : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ) (denominator size : ℕ) : SplitRestrictionData length :=
  fromCoarse parent balanced (rationalProfile numerator denominator size)

/-- Divisibility and normalization realize the exact rational split as a supported graph edge. -/
theorem fromRational_reference {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (normalized : ∑ child, numerator child = denominator) (divisible : denominator ∣ size)
    (support : ∀ child, numerator child ≠ 0 → child.val.Fits parent) :
    Nonempty ((fromRational parent balanced numerator denominator size).PrescribedEdges (P := Fin size)) := by
  obtain ⟨word⟩ := rationalProfile_feasible numerator normalized divisible
  refine ⟨fromCoarseReference parent balanced _ word ?_⟩
  intro position
  apply support
  intro zero
  have positive := profile_positive_at _ word position
  simp only [rationalProfile, zero, mul_zero] at positive
  omega

/-- Normalized rational coarse counts are precisely the fixed numerator law. -/
theorem fromRational_probability {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (child : ShapeAlphabet (2*length)) :
    ((fromRational parent balanced numerator denominator size).split child : ℝ)/Fintype.card (Fin size) =
      (numerator child : ℝ)/denominator := by
  simpa only [fromRational, fromCoarse, Fintype.card_fin] using
    rationalProfile_probability numerator denominatorPositive sizePositive divisible child

/-- Every normalized coarse marginal is the marginal of the fixed rational law. -/
theorem rationalProfile_marginal {A B : Type*} [Fintype A] [Fintype B]
    (numerator : A → ℕ) (axis : A → B) {denominator size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size) :
    (fun value => (marginalProfile (rationalProfile numerator denominator size) axis value : ℝ)/size) =
      marginal (fun child => (numerator child : ℝ)/denominator) axis := by
  rw [marginalProfile_div]
  congr 1
  funext child
  exact rationalProfile_probability numerator denominatorPositive sizePositive divisible child

/-- The parent window center equals the fixed rational mixture of complementary child products. -/
theorem fromRational_parentLaw {length denominator size : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (numerator : ShapeAlphabet (2*length) → ℕ)
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (fromRational parent balanced numerator denominator size).parentLaw (P := Fin size) law =
      fun word => ∑ child, ((numerator child : ℝ)/denominator)*
        (law child (leftHalf word)*law (complementEquiv parent (2*length) balanced child) (rightHalf word)) := by
  funext word
  unfold parentLaw
  simp_rw [fromRational_probability parent balanced numerator denominatorPositive sizePositive divisible]
  rfl

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
