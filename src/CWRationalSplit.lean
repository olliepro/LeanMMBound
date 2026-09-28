import CWRationalRates
import VerifiedCWApproximateData

/-! Fixed rational split specifications retain the mathematical input checks.
They construct all integer extraction data and exact rates at divisible sizes. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- A fixed supported symmetric rational split, before any population is chosen. -/
structure RationalSplit (length denominator : ℕ) where
  /-- Coarse parent shape. -/
  parent : Shape
  /-- The parent consists of two children of the stated length. -/
  balanced : parent.total = 2*(2*length)
  /-- Exact nonnegative split numerators on the complete child alphabet. -/
  numerator : ShapeAlphabet (2*length) → ℕ
  /-- The denominator is the exact numerator sum. -/
  normalized : ∑ child, numerator child = denominator
  /-- Positive weights occur only at admissible complementary splits. -/
  supported : ∀ child, numerator child ≠ 0 → child.val.Fits parent
  /-- Complementary children have equal numerator weights. -/
  symmetric : ∀ child, numerator ((complementEquiv parent (2*length) balanced).symm child) = numerator child

namespace RationalSplit

variable {length denominator : ℕ}

/-- Exact integer extraction data at a specified population size. -/
def data (split : RationalSplit length denominator) (size : ℕ) : SplitRestrictionData length :=
  SplitRestrictionData.fromRational split.parent split.balanced split.numerator denominator size

/-- Every divisible population supplies the actual prescribed graph reference. -/
theorem reference (split : RationalSplit length denominator) {size : ℕ} (divisible : denominator ∣ size) :
    Nonempty ((split.data size).PrescribedEdges (P := Fin size)) :=
  SplitRestrictionData.fromRational_reference split.parent split.balanced split.numerator split.normalized divisible split.supported

/-- The actual integer split data has exact complementary symmetry at every size. -/
theorem data_symmetric (split : RationalSplit length denominator) (size : ℕ) : (split.data size).Symmetric := by
  intro child
  change (size/denominator)*split.numerator ((complementEquiv split.parent (2*length) split.balanced).symm child) = _
  rw [split.symmetric]
  rfl

/-- Fixed complete parent fine law, independent of the chosen divisible population. -/
def parentLaw (split : RationalSplit length denominator)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : (Fin (length+length) → Fin 3) → ℝ :=
  SplitRestrictionData.rationalParentLaw split.parent split.balanced split.numerator denominator law

/-- Fixed coarse-X retention rate from a rational Gibbs upper bound. -/
def coarseRetention (split : RationalSplit length denominator) (ux uy uz : Fin (2*length+1) → ℝ) : ℝ :=
  SplitRestrictionData.rationalCoarseRetention split.parent split.numerator denominator ux uy uz

/-- Fixed fine retention with the full separately labelled compatibility pools. -/
def fineRetention (split : RationalSplit length denominator)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) : ℝ :=
  entropy (split.parentLaw law) -
    ∑ sector, massEntropy (SplitRestrictionData.rationalPooledLaw split.numerator denominator axisClass law sector)

/-- Checked supplied rows construct rational specifications without any feasibility assumptions. -/
def ofChecked (row : SplitRow) (checked : row.check denominator = true) (total : row.childTotal = 2*length) :
    RationalSplit length denominator where
  parent := row.parent
  balanced := by rw [(SplitRow.check_sound checked).2.2.1, total]
  numerator := fun child => row.massAt child.val
  normalized := checkedSplitData_normalized row checked total
  supported child nonzero := ((SplitRow.check_sound checked).2.2.2 child.val (by simpa only [total] using child.property)).1 nonzero
  symmetric := by
    intro child
    have identity := checked_complement_mass checked
    rcases row with ⟨parent, childTotal, entries⟩
    dsimp only at total
    subst childTotal
    exact identity child

/-- Every actual coarse rate equals the fixed rational specification rate. -/
theorem data_coarseRetention (split : RationalSplit length denominator) {size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (ux uy uz : Fin (2*length+1) → ℝ) :
    (split.data size).coarseRetention (P := Fin size) ux uy uz = split.coarseRetention ux uy uz :=
  SplitRestrictionData.fromRational_coarseRetention split.parent split.balanced split.numerator
    denominatorPositive sizePositive divisible ux uy uz

/-- Every actual fine rate equals the fixed rational specification rate. -/
theorem data_fineRetention (split : RationalSplit length denominator) {size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (split.data size).lawRetention (P := Fin size) axisClass law = split.fineRetention axisClass law :=
  SplitRestrictionData.fromRational_lawRetention split.parent split.balanced split.numerator
    denominatorPositive sizePositive divisible axisClass law

/-- The actual parent window center is exactly the fixed complete rational parent law. -/
theorem data_parentLaw (split : RationalSplit length denominator) {size : ℕ}
    (denominatorPositive : 0 < denominator) (sizePositive : 0 < size) (divisible : denominator ∣ size)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ) :
    (split.data size).parentLaw (P := Fin size) law = split.parentLaw law :=
  SplitRestrictionData.fromRational_parentLaw split.parent split.balanced split.numerator
    denominatorPositive sizePositive divisible law

end RationalSplit
end
end MatrixBounds.Tensor.CW
