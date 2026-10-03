module

public import CWZeroWindowedMatrix
public import CWZeroRationalDimensions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Fixed rational zero-coordinate laws supply actual matrix factors of their
claimed asymptotic size from every nonnegative empirical window. -/
namespace MatrixBounds.Tensor.CW

universe v
open Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K]

/-- The complete fine probability law of a zero-total coordinate. -/
def zeroFineLaw (length : ℕ) : (Fin length → Fin 3) → ℝ :=
  fun word => if word = (fun _ => 0) then 1 else 0

/-- A positive population's all-zero exact profile has the same fixed Dirac law. -/
theorem zeroProfile_probability {P : Type*} [Fintype P] (length : ℕ) (positive : 0 < Fintype.card P) :
    (fun word => (zeroProfile (P := P) length word : ℝ)/Fintype.card P) = zeroFineLaw length := by
  have nonzero : (Fintype.card P : ℝ) ≠ 0 := by exact_mod_cast positive.ne'
  funext word
  by_cases same : word = (fun _ => 0) <;> simp only [zeroProfile, zeroFineLaw, same, if_true, if_false,
    Nat.cast_zero, zero_div, div_self nonzero]

/-- A fixed-law zero-Z interface at a specified population and window. -/
def rationalZeroWindow (q length total denominator size : ℕ) (numerator : (Fin length → Fin 3) → ℕ)
    (tolerance : ℝ) :=
  Interface.windowedPower (P := Fin size) (constituent (K := K) q length ⟨total, 2*length-total, 0⟩)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (fun word => (numerator word : ℝ)/denominator)
    (fun word => (numerator ((fineComplement length).symm word) : ℝ)/denominator)
    (zeroFineLaw length) tolerance

/-- The matrix index set selected from a zero-coordinate rational window. -/
abbrev RationalZeroIndices (q length total denominator size : ℕ) (numerator : (Fin length → Fin 3) → ℕ) :=
  Interface.Variable (P := Fin size) (fun entry : AxisVariable q length total => fineWord entry.val)
    (rationalProfile numerator denominator size)

/-- The selected exact rational profile has precisely the available fixed laws on all three axes. -/
def rationalZeroMatrixRestriction {q length total denominator size : ℕ}
    (numerator : (Fin length → Fin 3) → ℕ) (denominatorPositive : 0 < denominator)
    (sizePositive : 0 < size) (divisible : denominator ∣ size)
    {tolerance : ℝ} (nonnegative : 0 ≤ tolerance) :
    CoordinateRestriction (rationalZeroWindow (K := K) q length total denominator size numerator tolerance)
      (MatrixMul.tensor (K := K) (I := PUnit) (J := RationalZeroIndices q length total denominator size numerator)
        (L := PUnit)) := by
  have law : (fun word => (rationalProfile numerator denominator size word : ℝ)/Fintype.card (Fin size)) =
      (fun word => (numerator word : ℝ)/denominator) := by
    simpa only [Fintype.card_fin] using
      funext (rationalProfile_probability numerator denominatorPositive sizePositive divisible)
  have complement : (fun word => (complementProfile (rationalProfile numerator denominator size) word : ℝ)/
      Fintype.card (Fin size)) = (fun word => (numerator ((fineComplement length).symm word) : ℝ)/denominator) := by
    funext word
    exact congrFun law ((fineComplement length).symm word)
  have restriction := zeroWindowedMatrixRestriction (K := K) (P := Fin size) (q := q) (total := total)
    (rationalProfile numerator denominator size) nonnegative
  rw [law, complement, zeroProfile_probability length (by simpa only [Fintype.card_fin] using sizePositive)] at restriction
  exact restriction

/-- The actual fixed-law zero leaf has arbitrarily close asymptotic matrix size and unit contextual cost. -/
theorem eventual_rational_zero_extraction {q length total denominator : ℕ} (qPositive : 0 < q)
    (numerator : (Fin length → Fin 3) → ℕ) (normalized : ∑ word, numerator word = denominator)
    (denominatorPositive : 0 < denominator)
    (supported : ∀ word, fineTotal word ≠ total → numerator word = 0)
    {error tolerance : ℝ} (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → denominator ∣ size →
      (size : ℝ)*(zeroDimensionRate q denominator numerator-error) ≤
        Real.log (Nat.card (RationalZeroIndices q length total denominator size numerator) : ℝ) ∧
      ContextReduction.{v} (rationalZeroWindow (K := K) q length total denominator size numerator tolerance)
        (MatrixMul.tensor (K := K) (I := PUnit) (J := RationalZeroIndices q length total denominator size numerator)
          (L := PUnit)) 1 := by
  obtain ⟨threshold, dimensions⟩ := eventual_rational_dimension qPositive numerator normalized
    denominatorPositive supported errorPositive
  refine ⟨max 1 threshold, ?_⟩
  intro size large divisible
  exact ⟨dimensions size (by omega) divisible,
    (rationalZeroMatrixRestriction numerator denominatorPositive (by omega) divisible nonnegative).context⟩

end
end MatrixBounds.Tensor.CW
