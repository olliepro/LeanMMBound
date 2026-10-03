module

public import SuppliedZeroSupportData
public import CertifiedZeroOrbitExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Original higher zero-coordinate rows now instantiate actual matrix-factor
extraction, with their checked source totals and exact compressed dimension rates. -/
namespace MatrixBounds.Numeric.SuppliedZeroExtractions

universe v
open Tensor Tensor.CW Entropy SuppliedZeroSupport
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- Every source-indexed four-letter zero row passes its complete support check. -/
theorem checked3 (node : Fin 840) : (entry3 node).check 21 17592186044416 OrbitLevel3.totalAt = true :=
  complete3.complete node

/-- Every actual higher zero-row numerator is supported at its original first nonzero coordinate total. -/
theorem supported3 (node : Fin 840) (orbit : Fin 21)
    (outside : OrbitLevel3.total orbit ≠ (entry3 node).total) :
    (entry3 node).row.orbitNumerator orbit = 0 :=
  ((entry3 node).check_sound OrbitLevel3.totalAt OrbitLevel3.total OrbitLevel3.totalAt_correct
    (checked3 node)).2 orbit outside

/-- Every actual root zero-row numerator is supported at its original first nonzero coordinate total. -/
theorem supported4 (child : Fin 48) (orbit : Fin 231)
    (outside : OrbitLevel4.total orbit ≠ (entry4 child).total) :
    (entry4 child).row.orbitNumerator orbit = 0 :=
  ((entry4 child).check_sound OrbitLevel4.totalAt OrbitLevel4.total OrbitLevel4.totalAt_correct
    (checked4 child)).2 orbit outside

/-- An actual original four-letter zero row yields genuine matrix factors at its exact entropy-and-symbol dimension rate.
The source is written in canonical zero-Z orientation; physical reorientation is handled separately. -/
theorem extraction3 {K : Type*} [CommRing K] (node : Fin 840) {error tolerance : ℝ}
    (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → 17592186044416*8 ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate 5 17592186044416 OrbitLevel3.orbits
        (entry3 node).row.orbitNumerator OrbitLevel3.middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices 5 4 (entry3 node).total (17592186044416*8) size
          (OrbitLevel3.orbits.expandedNumerator (entry3 node).row.orbitNumerator 8)) : ℝ) ∧
      ContextReduction.{v} (orbitZeroWindow (K := K) 5 (entry3 node).total 17592186044416 size
        OrbitLevel3.orbits (entry3 node).row.orbitNumerator tolerance)
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices 5 4 (entry3 node).total (17592186044416*8) size
            (OrbitLevel3.orbits.expandedNumerator (entry3 node).row.orbitNumerator 8)) (L := PUnit)) 1 :=
  (entry3 node).eventual_extraction (q := 5) (denominator := 17592186044416) (expansion := 8) (by decide) OrbitLevel3.orbits OrbitLevel3.totalAt
    OrbitLevel3.total OrbitLevel3.middle OrbitLevel3.totalAt_correct (checked3 node)
    OrbitLevel3.total_correct OrbitLevel3.middle_correct (by decide) (by decide)
    OrbitLevel3.sizes_divide errorPositive nonnegative

/-- An actual original eight-letter zero row yields genuine matrix factors with the supplied exact dimension rate.
The source is written in canonical zero-Z orientation; physical reorientation is handled separately. -/
theorem extraction4 {K : Type*} [CommRing K] (child : Fin 48) {error tolerance : ℝ}
    (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → 17592186044416*128 ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate 5 17592186044416 OrbitLevel4.orbits
        (entry4 child).row.orbitNumerator OrbitLevel4.middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices 5 8 (entry4 child).total (17592186044416*128) size
          (OrbitLevel4.orbits.expandedNumerator (entry4 child).row.orbitNumerator 128)) : ℝ) ∧
      ContextReduction.{v} (orbitZeroWindow (K := K) 5 (entry4 child).total 17592186044416 size
        OrbitLevel4.orbits (entry4 child).row.orbitNumerator tolerance)
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices 5 8 (entry4 child).total (17592186044416*128) size
            (OrbitLevel4.orbits.expandedNumerator (entry4 child).row.orbitNumerator 128)) (L := PUnit)) 1 :=
  (entry4 child).eventual_extraction (q := 5) (denominator := 17592186044416) (expansion := 128) (by decide) OrbitLevel4.orbits OrbitLevel4.totalAt
    OrbitLevel4.total OrbitLevel4.middle OrbitLevel4.totalAt_correct (checked4 child)
    OrbitLevel4.total_correct OrbitLevel4.middle_correct (by decide) (by decide)
    OrbitLevel4.sizes_divide errorPositive nonnegative

end
end MatrixBounds.Numeric.SuppliedZeroExtractions
