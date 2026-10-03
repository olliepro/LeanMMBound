module

public import SuppliedLevel4Transition
public import WaitingZeroMatrixOrientation
public import WaitingZeroMatrixCardinality

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual zero3 waiting populations, physical matrix factors, and their
complete source dimension rates retain every inherited allocation sector. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero3

open Tensor Tensor.CW Interface Entropy SuppliedZeroSupport SuppliedPopulationWeights
open SuppliedLevel4Transition WaitingZeroMatrix DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Original inherited role and original zero-coordinate node of a waiting factor. -/
abbrev Label := AxisOrder × Fin 840

/-- Exact paired child population inherited from the original role allocation. -/
def weight (label : Label) : ℕ := zeroWeight label.2 label.1

/-- Positive fixed coefficients select precisely the nonempty waiting populations. -/
abbrev Active := PositiveWeight weight

/-- The actual complete compressed zero3 matrix-dimension rate of one original node. -/
def rate (label : Label) : ℝ :=
  orbitZeroDimensionRate 5 17592186044416 OrbitLevel3.orbits
    (entry3 label.2).row.orbitNumerator OrbitLevel3.middle

/-- Original coefficient-weighted matrix dimension rate before the six source orientations. -/
def volumeRate : ℝ := ∑ label : Label, (weight label : ℝ)*rate label

/-- Sum of original waiting coefficients, used solely to distribute an arbitrary asymptotic error. -/
def totalWeight : ℝ := ∑ label : Label, (weight label : ℝ)

/-- Original level-four tolerance inherited by this waiting factor. -/
def toleranceAt (tolerance : Fin 105 × AxisOrder → ℝ) (label : Label) : ℝ :=
  tolerance ((SuppliedNodePartialIndexing.decode (.inr label.2)).1, label.1)

/-- All supplied waiting coefficients already clear the full rational word expansion denominator. -/
theorem weight_divisible (label : Label) : 17592186044416*8 ∣ weight label := by
  unfold weight zeroWeight SuppliedNodePartialIndexing.childWeight role4Weight
  erw [child_scaled]
  unfold scaled
  exact dvd_mul_of_dvd_left (by norm_num [denominator] : 17592186044416*8 ∣ denominator^5) _

/-- Every growing waiting population retains the required full-word integrality. -/
theorem population_divisible (label : Label) (size : ℕ) : 17592186044416*8 ∣ weight label*size :=
  dvd_mul_of_dvd_left (weight_divisible label) size

/-- Complete actual matrix index set selected from the zero-coordinate source window. -/
abbrev Indices (label : Label) (size : ℕ) :=
  RationalZeroIndices 5 4 (entry3 label.2).total (17592186044416*8) (weight label*size)
    (OrbitLevel3.orbits.expandedNumerator (entry3 label.2).row.orbitNumerator 8)

/-- Every supplied waiting matrix index set is nonempty at each growing population. -/
theorem indices_positive (label : Label) (size : ℕ) : 0 < Fintype.card (Indices label size) := by
  have normalized := ((entry3 label.2).check_sound OrbitLevel3.totalAt OrbitLevel3.total OrbitLevel3.totalAt_correct
    (SuppliedZeroExtractions.checked3 label.2)).1
  have expandedNormalized := OrbitLevel3.orbits.expanded_normalized (entry3 label.2).row.orbitNumerator
    normalized (by decide : 0 < 17592186044416) (by decide : 0 < 8) OrbitLevel3.sizes_divide
  have supported := expanded_fine_support OrbitLevel3.orbits (entry3 label.2).row.orbitNumerator
    OrbitLevel3.total OrbitLevel3.total_correct (entry3 label.2).total 8 (SuppliedZeroExtractions.supported3 label.2)
  exact rational_card_positive (by decide : 0 < 5) _ expandedNormalized (population_divisible label size) supported

/-- Actual row indices after restoring the source node's physical orientation. -/
abbrev Rows (label : Label) (size : ℕ) :=
  MatrixMul.orientedRows PUnit (Indices label size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order3 label.2))

/-- Actual contracted indices after restoring the source node's physical orientation. -/
abbrev Inner (label : Label) (size : ℕ) :=
  MatrixMul.orientedInner PUnit (Indices label size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order3 label.2))

/-- Actual column indices after restoring the source node's physical orientation. -/
abbrev Columns (label : Label) (size : ℕ) :=
  MatrixMul.orientedColumns PUnit (Indices label size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order3 label.2))

/-- Each restored matrix factor has exactly the cardinality of its selected canonical index set. -/
theorem factor_volume (label : Label) (size : ℕ) :
    Fintype.card (Rows label size)*Fintype.card (Inner label size)*Fintype.card (Columns label size) =
      Fintype.card (Indices label size) := by
  simpa only [Fintype.card_punit, one_mul, mul_one] using
    MatrixMul.oriented_volume (I := PUnit) (J := Indices label size) (L := PUnit)
      (inverseOrder (SuppliedZeroShapeBindings.order3 label.2))

/-- Original waiting coefficient total is nonnegative even when some labels have zero population. -/
theorem totalWeight_nonnegative : 0 ≤ totalWeight := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)

end
end MatrixBounds.Numeric.SuppliedWaitingZero3
