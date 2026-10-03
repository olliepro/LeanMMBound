module

public import SuppliedWaitingZero2Source
public import WaitingZeroMatrixCardinality
public import ZeroOrbitLawData
public import VerifiedOrbitStatistics

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every full-history zero2 waiting coefficient has its actual checked source
row, supported rational matrix indices, and complete compressed dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero2

open Tensor Tensor.CW Interface Entropy WaitingZeroMatrix
open scoped BigOperators
noncomputable section
set_option maxRecDepth 3000
set_option maxHeartbeats 2000000
set_option synthInstance.maxSize 1000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Exact original zero-leaf row and coarse target for a complete waiting history. -/
def entry (label : Label) : ZeroOrbitRow :=
  ⟨(SuppliedTypedParameters.zero2 label.1.source.1 label.2 label.1.source.2).row,
    Shape.coordinates (shape label.2) (SuppliedLeafLaws.positiveAxis (shape label.2))⟩

/-- Actual complete orbit-compressed matrix dimension rate of the original zero2 row. -/
def rate (label : Label) : ℝ :=
  orbitZeroDimensionRate 5 17592186044416 OrbitLevel2.orbits
    (entry label).row.orbitNumerator OrbitLevel2.middle

/-- Exact weighted waiting dimension rate over every original source, child, strategy, and role history. -/
def volumeRate : ℝ := ∑ label : Label, (weight label : ℝ)*rate label

/-- Total original waiting coefficient, used only to distribute an arbitrary asymptotic error. -/
def totalWeight : ℝ := ∑ label : Label, (weight label : ℝ)

/-- Selected complete rational matrix index set at the original leaf population. -/
abbrev Indices (label : Label) (size : ℕ) :=
  RationalZeroIndices 5 2 (entry label).total (17592186044416*2) (weight label*size)
    (OrbitLevel2.orbits.expandedNumerator (entry label).row.orbitNumerator 2)

/-- Actual row indices in the original source leaf's physical axis order. -/
abbrev Rows (label : Label) (size : ℕ) :=
  MatrixMul.orientedRows PUnit (Indices label size) PUnit (inverseOrder (order label))

/-- Actual contracted indices in the original source leaf's physical axis order. -/
abbrev Inner (label : Label) (size : ℕ) :=
  MatrixMul.orientedInner PUnit (Indices label size) PUnit (inverseOrder (order label))

/-- Actual column indices in the original source leaf's physical axis order. -/
abbrev Columns (label : Label) (size : ℕ) :=
  MatrixMul.orientedColumns PUnit (Indices label size) PUnit (inverseOrder (order label))

/-- Physical orientation preserves the full selected zero2 index cardinality as actual matrix volume. -/
theorem factor_volume (label : Label) (size : ℕ) :
    Fintype.card (Rows label size)*Fintype.card (Inner label size)*Fintype.card (Columns label size) =
      Fintype.card (Indices label size) := by
  simpa only [Fintype.card_punit, one_mul, mul_one] using
    MatrixMul.oriented_volume (I := PUnit) (J := Indices label size) (L := PUnit) (inverseOrder (order label))

/-- The complete original waiting coefficient sum is nonnegative. -/
theorem totalWeight_nonnegative : 0 ≤ totalWeight := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)

end
end MatrixBounds.Numeric.SuppliedWaitingZero2
