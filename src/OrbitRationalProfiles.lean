module

public import FiniteOrbitData
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact rational orbit masses produce normalized integer full-word profiles
at a common expanded denominator, as required by actual zero-leaf extraction. -/
namespace MatrixBounds.Entropy.OrbitMap

open scoped BigOperators
noncomputable section
variable {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]

omit [Fintype Orbit] in
/-- Uniform expansion of nonnegative orbit masses is nonnegative on every complete word. -/
theorem decode_nonnegative (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (nonnegative : ∀ orbit, 0 ≤ mass orbit) (word : Word) : 0 ≤ partition.decode mass word :=
  div_nonneg (nonnegative _) (Nat.cast_nonneg _)

/-- A normalized orbit row expands to entries in the probability interval. -/
theorem decode_range (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (nonnegative : ∀ orbit, 0 ≤ mass orbit) (normalized : ∑ orbit, mass orbit = 1) (word : Word) :
    0 ≤ partition.decode mass word ∧ partition.decode mass word ≤ 1 := by
  have total := (partition.decode_total mass).trans normalized
  refine ⟨partition.decode_nonnegative mass nonnegative word, ?_⟩
  rw [← total]
  exact Finset.single_le_sum (fun value _ => partition.decode_nonnegative mass nonnegative value) (Finset.mem_univ word)

omit [Fintype Orbit] in
/-- An orbit-constant statistic transfers compressed support constraints to every actual word. -/
theorem decode_support {A : Type*} (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (statistic : Word → A) (target : A)
    (invariant : ∀ word, statistic word = statistic (partition.representative (partition.label word)))
    (supported : ∀ orbit, statistic (partition.representative orbit) ≠ target → mass orbit = 0)
    (word : Word) (outside : statistic word ≠ target) : partition.decode mass word = 0 := by
  have zero := supported (partition.label word) (by simpa only [← invariant word] using outside)
  simp only [decode, zero, zero_div]

/-- Integer full-word numerators at a common multiple of all actual orbit sizes. -/
def expandedNumerator (partition : OrbitMap Word Orbit) (numerator : Orbit → ℕ) (expansion : ℕ) (word : Word) : ℕ :=
  numerator (partition.label word)*(expansion/partition.size (partition.label word))

omit [Fintype Orbit] in
/-- The expanded integer profile represents exactly the complete decoded rational law. -/
theorem expanded_probability (partition : OrbitMap Word Orbit) (numerator : Orbit → ℕ)
    {denominator expansion : ℕ} (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion) :
    (fun word => (partition.expandedNumerator numerator expansion word : ℝ)/(denominator*expansion : ℕ)) =
      partition.decode (fun orbit => (numerator orbit : ℝ)/denominator) := by
  funext word
  have sizePositive : (0 : ℝ) < partition.size (partition.label word) := by
    exact_mod_cast partition.size_positive (partition.label word)
  have denominatorNonzero : (denominator : ℝ) ≠ 0 := by exact_mod_cast denominatorPositive.ne'
  have expansionNonzero : (expansion : ℝ) ≠ 0 := by exact_mod_cast expansionPositive.ne'
  have division : ((expansion/partition.size (partition.label word) : ℕ) : ℝ) =
      (expansion : ℝ)/partition.size (partition.label word) := by
    apply (eq_div_iff sizePositive.ne').mpr
    exact_mod_cast Nat.div_mul_cancel (divisible (partition.label word))
  simp only [expandedNumerator, decode, Nat.cast_mul, division]
  field_simp

/-- Exact normalized compressed masses expand to a full integer profile with the exact expanded denominator. -/
theorem expanded_normalized (partition : OrbitMap Word Orbit) (numerator : Orbit → ℕ)
    {denominator expansion : ℕ} (normalized : ∑ orbit, numerator orbit = denominator)
    (denominatorPositive : 0 < denominator) (expansionPositive : 0 < expansion)
    (divisible : ∀ orbit, partition.size orbit ∣ expansion) :
    (∑ word, partition.expandedNumerator numerator expansion word) = denominator*expansion := by
  have denominatorNonzero : (denominator : ℝ) ≠ 0 := by exact_mod_cast denominatorPositive.ne'
  have expansionNonzero : (expansion : ℝ) ≠ 0 := by exact_mod_cast expansionPositive.ne'
  have probability := partition.expanded_probability numerator denominatorPositive expansionPositive divisible
  have total : (∑ word, (partition.expandedNumerator numerator expansion word : ℝ)/(denominator*expansion : ℕ)) = 1 := by
    rw [show (fun word => (partition.expandedNumerator numerator expansion word : ℝ)/(denominator*expansion : ℕ)) = _ from probability,
      partition.decode_total, ← Finset.sum_div, ← Nat.cast_sum, normalized, div_self denominatorNonzero]
  rw [← Finset.sum_div, ← Nat.cast_sum] at total
  have equal := (div_eq_one_iff_eq (by simp only [Nat.cast_mul]; exact mul_ne_zero denominatorNonzero expansionNonzero)).mp total
  exact_mod_cast equal

end
end MatrixBounds.Entropy.OrbitMap
