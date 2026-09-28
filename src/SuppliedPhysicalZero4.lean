import ZeroWindowOrientation
import SuppliedZeroShapeBindings
import SuppliedZeroExtractions
import SuppliedHigherLaws

/-! Actual source zero-row tensors in their physical orientation yield the
specified matrix factors, preserving the original exact dimension rate. -/
namespace MatrixBounds.Numeric.SuppliedPhysicalZero4

universe v
open Tensor Tensor.CW Entropy SuppliedZeroSupport SuppliedZeroShapeBindings
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Actual complete original zero-row source window at a concrete population and tolerance. -/
def sourceWindow {K : Type*} [CommRing K] (node : Fin 48) (size : ℕ) (tolerance : ℝ) :=
  Interface.windowedPower (K := K) (P := Fin size) (constituent 5 8 (shape4 node))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (SuppliedHigherLaws.zero4 node (shape4 node) 0)
    (SuppliedHigherLaws.zero4 node (shape4 node) 1)
    (SuppliedHigherLaws.zero4 node (shape4 node) 2) tolerance

/-- The actual physical source window restricts to the canonical zero-row extraction window with unit cost. -/
theorem canonical_restriction {K : Type*} [CommRing K] (node : Fin 48) (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v} (orient (order4 node) (sourceWindow (K := K) node size tolerance))
      (orbitZeroWindow (K := K) 5 (entry4 node).total 17592186044416 size OrbitLevel4.orbits
        (entry4 node).row.orbitNumerator tolerance) 1 :=
  (SuppliedTypedParameters.zero4 node).canonical_window OrbitLevel4.orbits 0 OrbitLevel4.complement
    OrbitLevel4.decode_zero OrbitLevel4.decode_complement
    (shape4 node) (shape4_valid node).1
    (SuppliedLeafLaws.zeroAxis (shape4 node)) (SuppliedLeafLaws.positiveAxis (shape4 node))
    (source_zero_positive_distinct (shape4 node)) (shape4_valid node).2 5 size tolerance

/-- Every actual supplied physical zero-row window yields a genuine matrix factor at its exact source dimension rate. -/
theorem eventual_extraction {K : Type*} [CommRing K] (node : Fin 48) {error tolerance : ℝ}
    (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → 17592186044416*128 ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate 5 17592186044416 OrbitLevel4.orbits
        (entry4 node).row.orbitNumerator OrbitLevel4.middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices 5 8 (entry4 node).total (17592186044416*128) size
          (OrbitLevel4.orbits.expandedNumerator (entry4 node).row.orbitNumerator 128)) : ℝ) ∧
      ContextReduction.{v} (orient (order4 node) (sourceWindow (K := K) node size tolerance))
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices 5 8 (entry4 node).total (17592186044416*128) size
            (OrbitLevel4.orbits.expandedNumerator (entry4 node).row.orbitNumerator 128)) (L := PUnit)) 1 := by
  obtain ⟨threshold, extract⟩ := SuppliedZeroExtractions.extraction4 (K := K) node errorPositive nonnegative
  refine ⟨threshold, ?_⟩
  intro size large divisible
  obtain ⟨dimension, reduction⟩ := extract size large divisible
  refine ⟨dimension, ?_⟩
  simpa only [Nat.one_mul] using (canonical_restriction (K := K) node size tolerance).trans reduction

end
end MatrixBounds.Numeric.SuppliedPhysicalZero4
