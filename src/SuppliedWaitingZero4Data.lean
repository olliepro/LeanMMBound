module

public import SuppliedInitialAllocation
public import SuppliedPhysicalZero4
public import WaitingZeroMatrixOrientation
public import WaitingZeroMatrixCardinality

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original root zero-coordinate children have exactly their actual zero4
source shapes, laws, populations, and compressed matrix dimension rates. -/
namespace MatrixBounds.Numeric.SuppliedWaitingZero4

open Tensor Tensor.CW Interface Entropy SuppliedZeroSupport WaitingZeroMatrix DyadicPopulationArithmetic
open scoped BigOperators
noncomputable section
set_option maxRecDepth 2000
set_option maxHeartbeats 2000000
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- The complete original root-child shape of a supplied zero-coordinate node. -/
def child (node : Fin 48) : ShapeAlphabet 16 := SuppliedChildKinds.child4Equiv.symm (.inl node)

/-- The original root classification recovers the exact zero-node source label. -/
theorem child_kind (node : Fin 48) : SuppliedChildKinds.kind4 ((shapeColumnEquiv 16).symm (child node)) = .inl node := by
  have selected := SuppliedChildKinds.child4Equiv.apply_symm_apply (.inl node)
  simpa only [SuppliedChildKinds.child4Equiv, Equiv.trans_apply, Equiv.ofBijective_apply] using! selected

/-- The root waiting child has precisely the source shape of its original supplied zero4 row. -/
theorem child_shape (node : Fin 48) : (child node).val = shape4 node := by
  have selected := SuppliedNodeLookup.shapeAt_column 16 (child node)
  have correct := SuppliedChildKinds.kind4_correct ((shapeColumnEquiv 16).symm (child node))
  rw [child_kind] at correct
  have column := congrArg (fun entry : Option ℕ => entry.getD 0) correct
  unfold shape4
  rw [column]
  exact selected.symm

/-- Exact original root population coefficient of one waiting zero-coordinate child. -/
def weight (node : Fin 48) : ℕ := SuppliedRootPopulation.weight (child node)

/-- Only strictly positive original root population coefficients require an asymptotic extraction. -/
abbrev Active := PositiveWeight weight

/-- Actual complete compressed matrix dimension rate of an original zero4 row. -/
def rate (node : Fin 48) : ℝ :=
  orbitZeroDimensionRate 5 17592186044416 OrbitLevel4.orbits
    (entry4 node).row.orbitNumerator OrbitLevel4.middle

/-- Original weighted waiting dimension rate before the six physical source orientations. -/
def volumeRate : ℝ := ∑ node : Fin 48, (weight node : ℝ)*rate node

/-- Total original waiting population coefficient, used to distribute a requested error. -/
def totalWeight : ℝ := ∑ node : Fin 48, (weight node : ℝ)

/-- The original root reserve population clears the entire zero4 word-expansion denominator. -/
theorem weight_divisible (node : Fin 48) : 17592186044416*128 ∣ weight node := by
  unfold weight SuppliedRootPopulation.weight scaled
  exact dvd_mul_of_dvd_left (by norm_num [denominator] : 17592186044416*128 ∣ denominator^7) _

/-- Every growing root waiting population has integral complete-word profile counts. -/
theorem population_divisible (node : Fin 48) (size : ℕ) : 17592186044416*128 ∣ weight node*size :=
  dvd_mul_of_dvd_left (weight_divisible node) size

/-- Actual selected canonical zero4 matrix index set at its original population. -/
abbrev Indices (node : Fin 48) (size : ℕ) :=
  RationalZeroIndices 5 8 (entry4 node).total (17592186044416*128) (weight node*size)
    (OrbitLevel4.orbits.expandedNumerator (entry4 node).row.orbitNumerator 128)

/-- Every supplied selected zero4 matrix index set is nonempty, including empty populations. -/
theorem indices_positive (node : Fin 48) (size : ℕ) : 0 < Fintype.card (Indices node size) := by
  have normalized := ((entry4 node).check_sound OrbitLevel4.totalAt OrbitLevel4.total OrbitLevel4.totalAt_correct
    (SuppliedZeroSupport.checked4 node)).1
  have expandedNormalized := OrbitLevel4.orbits.expanded_normalized (entry4 node).row.orbitNumerator
    normalized (by decide : 0 < 17592186044416) (by decide : 0 < 128) OrbitLevel4.sizes_divide
  have supported := expanded_fine_support OrbitLevel4.orbits (entry4 node).row.orbitNumerator
    OrbitLevel4.total OrbitLevel4.total_correct (entry4 node).total 128 (SuppliedZeroExtractions.supported4 node)
  exact rational_card_positive (by decide : 0 < 5) _ expandedNormalized (population_divisible node size) supported

/-- Actual row indices after restoring the source zero4 node's physical axes. -/
abbrev Rows (node : Fin 48) (size : ℕ) :=
  MatrixMul.orientedRows PUnit (Indices node size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order4 node))

/-- Actual contracted indices after restoring the source zero4 node's physical axes. -/
abbrev Inner (node : Fin 48) (size : ℕ) :=
  MatrixMul.orientedInner PUnit (Indices node size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order4 node))

/-- Actual column indices after restoring the source zero4 node's physical axes. -/
abbrev Columns (node : Fin 48) (size : ℕ) :=
  MatrixMul.orientedColumns PUnit (Indices node size) PUnit (inverseOrder (SuppliedZeroShapeBindings.order4 node))

/-- Restoring physical axes preserves exactly the selected zero4 index cardinality as matrix volume. -/
theorem factor_volume (node : Fin 48) (size : ℕ) :
    Fintype.card (Rows node size)*Fintype.card (Inner node size)*Fintype.card (Columns node size) =
      Fintype.card (Indices node size) := by
  simpa only [Fintype.card_punit, one_mul, mul_one] using
    MatrixMul.oriented_volume (I := PUnit) (J := Indices node size) (L := PUnit)
      (inverseOrder (SuppliedZeroShapeBindings.order4 node))

/-- The full original waiting coefficient sum is nonnegative. -/
theorem totalWeight_nonnegative : 0 ≤ totalWeight := Finset.sum_nonneg (fun _ _ => Nat.cast_nonneg _)

end
end MatrixBounds.Numeric.SuppliedWaitingZero4
