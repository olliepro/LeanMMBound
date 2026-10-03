module

public import CWZeroRationalDimensions
public import OrbitRationalProfiles
public import OrbitExpectations
public import FineOrbitStatistics
public import TypeSampling

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The matrix-dimension rate of a zero-coordinate leaf equals the exact
compressed entropy and middle-symbol average of its verified fine-word orbits. -/
namespace MatrixBounds.Tensor.CW

open Empirical Entropy
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {length orbits : ℕ}

/-- Counting middle symbols is the corresponding additive statistic of the complete fine word. -/
theorem middle_count_statistic (word : Fin length → Fin 3) :
    count word 1 = fineStatistic (fun symbol => if symbol = 1 then 1 else 0) word := by
  rw [count_eq_sum]
  unfold fineStatistic
  apply Finset.sum_congr rfl
  intro position _
  by_cases same : word position = 1 <;> simp [same]

/-- The full integer profile's normalized middle multiplicity is its exact compressed orbit average. -/
theorem expanded_middle_average (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (numerator : Fin orbits → ℕ) (middle : Fin orbits → ℕ)
    (middleIdentity : ∀ word, count word 1 = middle (partition.label word))
    {denominator expansion : ℕ} (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion) :
    (middleMultiplicity (partition.expandedNumerator numerator expansion) : ℝ)/(denominator*expansion : ℕ) =
      ∑ orbit, ((numerator orbit : ℝ)/denominator)*middle orbit := by
  have probability := partition.expanded_probability numerator denominatorPositive expansionPositive divisible
  have expectation := partition.decode_expectation (fun orbit => (numerator orbit : ℝ)/denominator)
    (fun word => (count word 1 : ℝ)) (fun word => by
      rw [middleIdentity, middleIdentity, partition.representative_label])
  calc
    _ = ∑ word, ((partition.expandedNumerator numerator expansion word : ℝ)/(denominator*expansion : ℕ))*(count word 1 : ℝ) := by
      simp only [middleMultiplicity, Nat.cast_sum, Nat.cast_mul, Finset.sum_div]
      apply Finset.sum_congr rfl
      intro word _
      ring
    _ = ∑ word, partition.decode (fun orbit => (numerator orbit : ℝ)/denominator) word*(count word 1 : ℝ) := by
      simp only [congrFun probability]
    _ = _ := by simpa only [middleIdentity, partition.representative_label] using expectation

/-- The complete zero-leaf dimension rate, expressed solely in its supplied compressed orbit masses. -/
def orbitZeroDimensionRate (q denominator : ℕ) (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (numerator : Fin orbits → ℕ) (middle : Fin orbits → ℕ) : ℝ :=
  entropy (fun orbit => (numerator orbit : ℝ)/denominator) +
    (∑ orbit, ((numerator orbit : ℝ)/denominator)*Real.log (partition.size orbit)) +
    (∑ orbit, ((numerator orbit : ℝ)/denominator)*middle orbit)*Real.log q

/-- The actual rational zero-leaf tensor has exactly the dimension rate used by the compressed computation. -/
theorem zeroDimensionRate_orbits (q : ℕ) (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (numerator : Fin orbits → ℕ) (middle : Fin orbits → ℕ)
    (middleIdentity : ∀ word, count word 1 = middle (partition.label word))
    {denominator expansion : ℕ} (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion) :
    zeroDimensionRate q (denominator*expansion) (partition.expandedNumerator numerator expansion) =
      orbitZeroDimensionRate q denominator partition numerator middle := by
  unfold zeroDimensionRate orbitZeroDimensionRate
  rw [partition.expanded_probability numerator denominatorPositive expansionPositive divisible,
    OrbitMap.decode_entropy, expanded_middle_average partition numerator middle middleIdentity denominatorPositive expansionPositive divisible]

/-- A compressed coarse-total support check proves support of every expanded integer full-word profile. -/
theorem expanded_fine_support (partition : OrbitMap (Fin length → Fin 3) (Fin orbits))
    (numerator : Fin orbits → ℕ) (total : Fin orbits → ℕ)
    (totalIdentity : ∀ word, fineTotal word = total (partition.label word))
    (target expansion : ℕ) (supported : ∀ orbit, total orbit ≠ target → numerator orbit = 0)
    (word : Fin length → Fin 3) (outside : fineTotal word ≠ target) :
    partition.expandedNumerator numerator expansion word = 0 := by
  have zero := supported (partition.label word) (by simpa only [← totalIdentity word] using outside)
  simp only [OrbitMap.expandedNumerator, zero, zero_mul]

end
end MatrixBounds.Tensor.CW
