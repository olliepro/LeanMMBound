import RootFineIntegerParent
import SuppliedRootFineLeafIntegers

/-! Complete level-three parent orbit masses are exact integer convolutions
at denominator 2^134, ready for independent bounded kernel checks. -/
namespace MatrixBounds.Numeric.SuppliedRootFineParent3Integers

open Tensor.CW Entropy
open scoped BigOperators
noncomputable section

/-- Integer parent convolution omits only original zero-weight child positions. -/
def sparseIntegerParent {I C P : Type*} [Fintype I]
    (weight : I → ℕ) (complement : I → I) (parentSize : P → ℕ)
    (columns : P → C × C) (wordScale : C → ℕ) (mass : I → C → ℤ) (orbit : P) : ℤ :=
  parentSize orbit*∑ child, if weight child = 0 then 0 else (weight child : ℤ)*
    (mass child (columns orbit).1*wordScale (columns orbit).1)*
    (mass (complement child) (columns orbit).2*wordScale (columns orbit).2)

/-- Omitting zero coefficients preserves the complete integer convolution. -/
theorem sparseIntegerParent_eq {I C P : Type*} [Fintype I]
    (weight : I → ℕ) (complement : I → I) (parentSize : P → ℕ)
    (columns : P → C × C) (wordScale : C → ℕ) (mass : I → C → ℤ) (orbit : P) :
    sparseIntegerParent weight complement parentSize columns wordScale mass orbit =
      integerParentNumerator weight complement parentSize columns wordScale mass orbit := by
  unfold sparseIntegerParent integerParentNumerator
  congr 1
  apply Finset.sum_congr rfl
  intro child _
  split_ifs with zero
  · simp only [zero, Nat.cast_zero, zero_mul]
  · rfl

/-- The integer correction for the actual six child-orbit cardinalities. -/
def wordScale (orbit : Fin 6) : ℕ := 2/OrbitLevel2.sizes orbit

/-- Every integer correction is exactly the inverse orbit size at common expansion two. -/
theorem wordScale_checked (orbit : Fin 6) : wordScale orbit*OrbitLevel2.sizes orbit = 2 :=
  (by decide +kernel : ∀ orbit : Fin 6, wordScale orbit*OrbitLevel2.sizes orbit = 2) orbit

/-- Complete original level-three parent numerator, retaining all split and fine-child input coordinates. -/
def numerator (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) : ℤ :=
  let split := SuppliedTypedParameters.level3Split node strategy
  sparseIntegerParent split.numerator (complementEquiv split.parent 4 split.balanced)
    OrbitLevel3.sizes OrbitLevel3.encoding.columns wordScale
    (fun child label => SuppliedRootFineLeafIntegers.leaf node strategy child axis label) orbit

/-- The exact integer convolution is the actual supplied four-letter parent orbit law. -/
theorem numerator_value (node : Fin 945) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 21) :
    (numerator node strategy axis orbit : ℚ)/(2:ℚ)^134 =
      SuppliedRootFineFastArithmetic.parent3 node strategy axis orbit := by
  let split := SuppliedTypedParameters.level3Split node strategy
  have identity := integerParentNumerator_value split.numerator
    (complementEquiv split.parent 4 split.balanced) OrbitLevel2.sizes OrbitLevel3.sizes
    OrbitLevel3.encoding.columns wordScale
    (fun child label => SuppliedRootFineLeafIntegers.leaf node strategy child axis label)
    17592186044416 17592186044416 2 (by decide) (by decide) (by decide) wordScale_checked orbit
  have denominator : (17592186044416:ℚ)*((17592186044416:ℚ)*2)^2 = (2:ℚ)^134 := by norm_num
  simp only [Nat.cast_ofNat] at identity
  rw [denominator] at identity
  simp only [OrbitArithmetic.parentMass] at identity
  simp_rw [SuppliedRootFineLeafIntegers.leaf_value] at identity
  simpa only [numerator, sparseIntegerParent_eq, SuppliedRootFineFastArithmetic.parent3,
    SuppliedRootFineArithmetic.sparseParent_eq, OrbitArithmetic.parentMass, split] using identity

end
end MatrixBounds.Numeric.SuppliedRootFineParent3Integers
