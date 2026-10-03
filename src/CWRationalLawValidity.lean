module

public import CWRationalOrbitParents
public import CWLawStability
public import TypedParameterRows

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Probability bounds for the recursively supplied fine laws follow from their
checked inputs and exact parent formulas, independent of floating-point values. -/
namespace MatrixBounds

open Numeric Entropy Tensor.CW
open scoped BigOperators
noncomputable section

namespace Numeric.TypedProbabilityRow

/-- Every accepted finite probability coordinate lies between zero and one. -/
theorem rational_range {width denominator : ℕ} (source : TypedProbabilityRow width denominator)
    (positive : 0 < denominator) (symbol : Fin width) :
    0 ≤ source.rational symbol ∧ source.rational symbol ≤ 1 := by
  obtain ⟨nonnegative, normalized⟩ := source.rational_valid positive
  refine ⟨nonnegative symbol, ?_⟩
  rw [← normalized]
  exact Finset.single_le_sum (fun index _ => nonnegative index) (Finset.mem_univ symbol)

/-- The real interpretation of every supplied finite probability coordinate lies in the same unit interval. -/
theorem real_range {width denominator : ℕ} (source : TypedProbabilityRow width denominator)
    (positive : 0 < denominator) (symbol : Fin width) :
    0 ≤ (source.rational symbol : ℝ) ∧ (source.rational symbol : ℝ) ≤ 1 := by
  obtain ⟨lower, upper⟩ := source.rational_range positive symbol
  exact ⟨by exact_mod_cast lower, by exact_mod_cast upper⟩

/-- The real interpretation of a supplied strategy row is exactly normalized. -/
theorem real_total {width denominator : ℕ} (source : TypedProbabilityRow width denominator)
    (positive : 0 < denominator) : (∑ symbol, (source.rational symbol : ℝ)) = 1 := by
  exact_mod_cast (source.rational_valid positive).2

end Numeric.TypedProbabilityRow

namespace Entropy.OrbitMap

/-- Expanding unit-interval orbit masses over nonempty actual fibers preserves the unit interval. -/
theorem decode_unit_range {Word Orbit : Type*} [Fintype Word] [Fintype Orbit]
    (partition : OrbitMap Word Orbit) (mass : Orbit → ℝ)
    (range : ∀ orbit, 0 ≤ mass orbit ∧ mass orbit ≤ 1) (word : Word) :
    0 ≤ partition.decode mass word ∧ partition.decode mass word ≤ 1 := by
  have sizePositive : (0 : ℝ) < partition.size (partition.label word) := by
    exact_mod_cast partition.size_positive (partition.label word)
  have sizeOne : (1 : ℝ) ≤ partition.size (partition.label word) := by
    exact_mod_cast partition.size_positive (partition.label word)
  constructor
  · exact div_nonneg (range _).1 sizePositive.le
  · apply (div_le_one sizePositive).mpr
    exact (range _).2.trans sizeOne

/-- An accepted supplied orbit probability row expands to a complete fine law in the unit interval. -/
theorem decode_supplied_range {Word : Type*} [Fintype Word] {orbits denominator : ℕ}
    (partition : OrbitMap Word (Fin orbits)) (source : TypedProbabilityRow orbits denominator)
    (positive : 0 < denominator) (word : Word) :
    0 ≤ partition.decode (fun orbit => (source.rational orbit : ℝ)) word ∧
      partition.decode (fun orbit => (source.rational orbit : ℝ)) word ≤ 1 :=
  partition.decode_unit_range _ (source.real_range positive) word

end Entropy.OrbitMap

namespace Tensor.CW.RationalSplit

/-- Actual complete rational parent laws preserve the unit interval for arbitrary supplied child laws. -/
theorem parentLaw_range {length denominator : ℕ} (split : RationalSplit length denominator)
    (positive : 0 < denominator)
    (law : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℝ)
    (range : ∀ child word, 0 ≤ law child word ∧ law child word ≤ 1)
    (word : Fin (length+length) → Fin 3) :
    0 ≤ split.parentLaw law word ∧ split.parentLaw law word ≤ 1 := by
  letI : Nonempty (Fin denominator) := ⟨⟨0, positive⟩⟩
  obtain ⟨reference⟩ := split.reference (dvd_refl denominator)
  rw [← split.data_parentLaw positive positive (dvd_refl denominator) law]
  exact (split.data denominator).parentLaw_range reference law range word

end Tensor.CW.RationalSplit

/-- Mixing complete fine laws by a supplied normalized strategy row preserves every coordinate bound. -/
theorem supplied_mixture_range {width denominator : ℕ} {Word : Type*}
    (source : TypedProbabilityRow width denominator) (positive : 0 < denominator)
    (law : Fin width → Word → ℝ) (range : ∀ strategy word, 0 ≤ law strategy word ∧ law strategy word ≤ 1)
    (word : Word) :
    0 ≤ (∑ strategy, (source.rational strategy : ℝ)*law strategy word) ∧
      (∑ strategy, (source.rational strategy : ℝ)*law strategy word) ≤ 1 := by
  constructor
  · exact Finset.sum_nonneg (fun strategy _ => mul_nonneg (source.real_range positive strategy).1 (range strategy word).1)
  · calc
      _ ≤ ∑ strategy, (source.rational strategy : ℝ) :=
        Finset.sum_le_sum (fun strategy _ => mul_le_of_le_one_right (source.real_range positive strategy).1 (range strategy word).2)
      _ = 1 := source.real_total positive

end
end MatrixBounds
