module

public import ZeroOrbitLawData
public import CWZeroOrbitExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Accepted supplied orbit rows instantiate the actual zero-leaf matrix
extraction theorem with no numerical feasibility assumptions left to discharge. -/
namespace MatrixBounds.Numeric

universe v
open Tensor Tensor.CW Entropy
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K : Type*} [CommRing K] {length orbits : ℕ}

/-- A checked exact zero-leaf row yields actual matrices with its compressed dimension rate at every sufficiently large divisible population. -/
theorem ZeroOrbitRow.eventual_extraction {q denominator expansion : ℕ} (qPositive : 0 < q)
    (entry : ZeroOrbitRow) (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (statistic : ℕ → ℕ) (orbitTotal middle : Fin orbits → ℕ)
    (agrees : ∀ orbit, statistic orbit.val = orbitTotal orbit)
    (checked : entry.check orbits denominator statistic = true)
    (totalIdentity : ∀ word, fineTotal word = orbitTotal (partition.label word))
    (middleIdentity : ∀ word, Empirical.count word 1 = middle (partition.label word))
    (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion)
    {error tolerance : ℝ} (errorPositive : 0 < error) (nonnegative : 0 ≤ tolerance) :
    ∃ threshold : ℕ, ∀ size : ℕ, threshold ≤ size → denominator*expansion ∣ size →
      (size : ℝ)*(orbitZeroDimensionRate q denominator partition entry.row.orbitNumerator middle-error) ≤
        Real.log (Nat.card (RationalZeroIndices q length entry.total (denominator*expansion) size
          (partition.expandedNumerator entry.row.orbitNumerator expansion)) : ℝ) ∧
      ContextReduction.{v} (orbitZeroWindow (K := K) q entry.total denominator size partition entry.row.orbitNumerator tolerance)
        (MatrixMul.tensor (K := K) (I := PUnit)
          (J := RationalZeroIndices q length entry.total (denominator*expansion) size
            (partition.expandedNumerator entry.row.orbitNumerator expansion)) (L := PUnit)) 1 := by
  obtain ⟨normalized, supported⟩ := entry.check_sound statistic orbitTotal agrees checked
  exact eventual_orbit_zero_extraction qPositive partition entry.row.orbitNumerator normalized
    denominatorPositive expansionPositive divisible orbitTotal middle totalIdentity middleIdentity
    supported errorPositive nonnegative

end
end MatrixBounds.Numeric
