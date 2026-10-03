module

public import ZeroWindowOrientation
public import SuppliedZeroShapeBindings
public import SuppliedZeroExtractions
public import SuppliedHigherLaws

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual source zero-row tensors in their physical orientation yield the
specified matrix factors, preserving the original exact dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedPhysicalZero3

universe v
open Tensor Tensor.CW Entropy SuppliedZeroSupport SuppliedZeroShapeBindings
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Actual complete original zero-row source window at a concrete population and tolerance. -/
def sourceWindow {K : Type*} [CommRing K] (node : Fin 840) (size : ℕ) (tolerance : ℝ) :=
  Interface.windowedPower (K := K) (P := Fin size) (constituent 5 4 (shape3 node))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedHigherLaws.zero3 node (shape3 node) 0)
    (SuppliedHigherLaws.zero3 node (shape3 node) 1)
    (SuppliedHigherLaws.zero3 node (shape3 node) 2) tolerance

/-- The actual physical source window restricts to the canonical zero-row extraction window with unit cost. -/
theorem canonical_restriction {K : Type*} [CommRing K] (node : Fin 840) (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v} (orient (order3 node) (sourceWindow (K := K) node size tolerance))
      (orbitZeroWindow (K := K) 5 (entry3 node).total 17592186044416 size OrbitLevel3.orbits
        (entry3 node).row.orbitNumerator tolerance) 1 :=
  (SuppliedTypedParameters.zero3 node).canonical_window OrbitLevel3.orbits 0 OrbitLevel3.complement
    OrbitLevel3.decode_zero OrbitLevel3.decode_complement
    (shape3 node) (shape3_valid node).1
    (SuppliedLeafLaws.zeroAxis (shape3 node)) (SuppliedLeafLaws.positiveAxis (shape3 node))
    (source_zero_positive_distinct (shape3 node)) (shape3_valid node).2 5 size tolerance

/-- Every actual supplied physical zero-row window yields a genuine matrix factor at its exact source dimension rate. -/
theorem eventual_extraction {K : Type*} [CommRing K] (node : Fin 840) {error tolerance : ℝ}
    (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → 17592186044416*8 ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate 5 17592186044416 OrbitLevel3.orbits
        (entry3 node).row.orbitNumerator OrbitLevel3.middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices 5 4 (entry3 node).total (17592186044416*8) size
          (OrbitLevel3.orbits.expandedNumerator (entry3 node).row.orbitNumerator 8)) : ℝ) ∧
      ContextReduction.{v} (orient (order3 node) (sourceWindow (K := K) node size tolerance))
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices 5 4 (entry3 node).total (17592186044416*8) size
            (OrbitLevel3.orbits.expandedNumerator (entry3 node).row.orbitNumerator 8)) (L := PUnit)) 1 := by
  obtain ⟨threshold, extract⟩ := SuppliedZeroExtractions.extraction3 (K := K) node errorPositive nonnegative
  refine ⟨threshold, ?_⟩
  intro size large divisible
  obtain ⟨dimension, reduction⟩ := extract size large divisible
  refine ⟨dimension, ?_⟩
  simpa only [Nat.one_mul] using (canonical_restriction (K := K) node size tolerance).trans reduction

end
end MatrixBounds.Numeric.SuppliedPhysicalZero3
