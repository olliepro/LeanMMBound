module

public import SuppliedZeroLeafSupport
public import ZeroWindowOrientation
public import VerifiedZeroOrbitLaws
public import VerifiedOrbitComplements

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every original source two-letter zero leaf yields its genuine matrix factor
from the actual complete physically oriented source window. -/
namespace MatrixBounds.Numeric.SuppliedPhysicalZero2

universe v
open Tensor Tensor.CW Entropy SuppliedLeafLaws SuppliedZeroLeafTargets SuppliedZeroLeafSupport
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
set_option maxRecDepth 100000
set_option maxHeartbeats 8000000

/-- The original twelve zero-child shapes have their exact total and selected zero coordinate. -/
theorem shape_valid : ∀ child : Fin 12,
    (shape child).total = 4 ∧ Shape.coordinates (shape child) (zeroAxis (shape child)) = 0 := by decide +kernel

/-- The actual source zero-leaf fine law, including all physical axes and complete words. -/
def law (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (axis : Fin 3) : (Fin 2 → Fin 3) → ℝ :=
  OrbitLevel2.orbits.decode (fun orbit => (zeroMass node child strategy (shape child) axis orbit : ℝ))

/-- Actual complete source zero-leaf window at its original parameter indices. -/
def sourceWindow {K : Type*} [CommRing K] (node : Fin 945) (child : Fin 12) (strategy : Fin 6)
    (size : ℕ) (tolerance : ℝ) :=
  Interface.windowedPower (K := K) (P := Fin size) (constituent 5 2 (shape child))
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (law node child strategy 0) (law node child strategy 1) (law node child strategy 2) tolerance

/-- The original zero-leaf physical axes give the exact canonical zero-Z tensor window. -/
theorem canonical_restriction {K : Type*} [CommRing K] (node : Fin 945) (child : Fin 12) (strategy : Fin 6)
    (size : ℕ) (tolerance : ℝ) :
    ContextReduction.{v}
      (orient (zeroCanonicalOrder (zeroAxis (shape child)) (positiveAxis (shape child)))
        (sourceWindow (K := K) node child strategy size tolerance))
      (orbitZeroWindow (K := K) 5 (entry node child strategy).total 17592186044416 size OrbitLevel2.orbits
        (entry node child strategy).row.orbitNumerator tolerance) 1 :=
  (SuppliedTypedParameters.zero2 node child strategy).canonical_window OrbitLevel2.orbits 0 OrbitLevel2.complement
    OrbitLevel2.decode_zero OrbitLevel2.decode_complement (shape child) (shape_valid child).1
    (zeroAxis (shape child)) (positiveAxis (shape child)) (source_zero_positive_distinct (shape child))
    (shape_valid child).2 5 size tolerance

/-- Every original indexed source zero leaf yields actual matrix factors at its exact complete entropy-and-symbol rate. -/
theorem eventual_extraction {K : Type*} [CommRing K] (node : Fin 945) (child : Fin 12) (strategy : Fin 6)
    {error tolerance : ℝ} (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → 17592186044416*2 ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate 5 17592186044416 OrbitLevel2.orbits
        (entry node child strategy).row.orbitNumerator OrbitLevel2.middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices 5 2 (entry node child strategy).total (17592186044416*2) size
          (OrbitLevel2.orbits.expandedNumerator (entry node child strategy).row.orbitNumerator 2)) : ℝ) ∧
      ContextReduction.{v}
        (orient (zeroCanonicalOrder (zeroAxis (shape child)) (positiveAxis (shape child)))
          (sourceWindow (K := K) node child strategy size tolerance))
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices 5 2 (entry node child strategy).total (17592186044416*2) size
            (OrbitLevel2.orbits.expandedNumerator (entry node child strategy).row.orbitNumerator 2)) (L := PUnit)) 1 := by
  obtain ⟨threshold, extract⟩ := (entry node child strategy).eventual_extraction (K := K)
    (q := 5) (denominator := 17592186044416) (expansion := 2) (by decide)
    OrbitLevel2.orbits OrbitLevel2.totalAt OrbitLevel2.total OrbitLevel2.middle OrbitLevel2.totalAt_correct
    (checked node child strategy) OrbitLevel2.total_correct OrbitLevel2.middle_correct
    (by decide) (by decide) OrbitLevel2.sizes_divide errorPositive nonnegative
  refine ⟨threshold, ?_⟩
  intro size large divisible
  obtain ⟨dimension, reduction⟩ := extract size large divisible
  refine ⟨dimension, ?_⟩
  simpa only [Nat.one_mul] using (canonical_restriction (K := K) node child strategy size tolerance).trans reduction

end
end MatrixBounds.Numeric.SuppliedPhysicalZero2
