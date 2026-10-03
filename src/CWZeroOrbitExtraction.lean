module

public import CWZeroOrbitDimensions
public import CWZeroRationalExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A normalized supported orbit row gives an actual zero-coordinate matrix
extraction, with the exact compressed entropy and symbol-count rate. -/
namespace MatrixBounds.Tensor.CW

universe v
open Entropy Empirical
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K] {length orbits : ℕ}

/-- The actual zero-Z window centered at a decoded supplied orbit probability row. -/
def orbitZeroWindow (q total denominator size : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits)) (numerator : Fin orbits → ℕ)
    (tolerance : ℝ) :=
  Interface.windowedPower (P := Fin size) (constituent (K := K) q length ⟨total, 2*length-total, 0⟩)
    (fun x => fineWord x.val) (fun y => fineWord y.val) (fun z => fineWord z.val)
    (partition.decode (fun orbit => (numerator orbit : ℝ)/denominator))
    (fun word => partition.decode (fun orbit => (numerator orbit : ℝ)/denominator)
      ((fineComplement length).symm word)) (zeroFineLaw length) tolerance

/-- Expanding orbit masses into integer word counts preserves the entire actual zero-leaf window. -/
theorem expanded_zero_window (q total size : ℕ)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits)) (numerator : Fin orbits → ℕ)
    {denominator expansion : ℕ} (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion) (tolerance : ℝ) :
    rationalZeroWindow (K := K) q length total (denominator*expansion) size
      (partition.expandedNumerator numerator expansion) tolerance =
      orbitZeroWindow q total denominator size partition numerator tolerance := by
  have probability := partition.expanded_probability numerator denominatorPositive expansionPositive divisible
  unfold rationalZeroWindow orbitZeroWindow
  rw [probability]
  congr 1
  funext word
  exact congrFun probability ((fineComplement length).symm word)

/-- Every sufficiently large divisible orbit window supplies its claimed matrix size with unit contextual cost. -/
theorem eventual_orbit_zero_extraction {q total denominator expansion : ℕ} (qPositive : 0 < q)
    (partition : OrbitMap (Fin length → Fin 3) (Fin orbits)) (numerator : Fin orbits → ℕ)
    (normalized : ∑ orbit, numerator orbit = denominator)
    (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion)
    (orbitTotal middle : Fin orbits → ℕ)
    (totalIdentity : ∀ word, fineTotal word = orbitTotal (partition.label word))
    (middleIdentity : ∀ word, count word 1 = middle (partition.label word))
    (supported : ∀ orbit, orbitTotal orbit ≠ total → numerator orbit = 0)
    {error tolerance : ℝ} (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → denominator*expansion ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate q denominator partition numerator middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices q length total (denominator*expansion) size
          (partition.expandedNumerator numerator expansion)) : ℝ) ∧
      ContextReduction.{v} (orbitZeroWindow (K := K) q total denominator size partition numerator tolerance)
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices q length total (denominator*expansion) size
            (partition.expandedNumerator numerator expansion)) (L := PUnit)) 1 := by
  have expandedNormalized := partition.expanded_normalized numerator normalized denominatorPositive expansionPositive divisible
  have expandedSupported := expanded_fine_support partition numerator orbitTotal totalIdentity total expansion supported
  obtain ⟨threshold, extract⟩ := eventual_rational_zero_extraction (K := K) qPositive
    (partition.expandedNumerator numerator expansion) expandedNormalized (Nat.mul_pos denominatorPositive expansionPositive)
    expandedSupported errorPositive nonnegative
  refine ⟨threshold, ?_⟩
  intro size large multiple
  have result := extract size large multiple
  rw [zeroDimensionRate_orbits q partition numerator middle middleIdentity denominatorPositive expansionPositive divisible,
    expanded_zero_window q total size partition numerator denominatorPositive expansionPositive divisible tolerance] at result
  exact result

end
end MatrixBounds.Tensor.CW
