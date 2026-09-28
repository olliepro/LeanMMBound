import MatrixTensor
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! A concrete algebraic matrix multiplication exponent, defined from minimal
ranks of square matrix multiplication tensors. No claimed improved bound is
built into the definition. Arithmetic-circuit equivalence and border rank are
separate obligations. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable (K : Type*) [CommSemiring K]

/-- At every size there is a finite rank decomposition, supplied by schoolbook multiplication. -/
theorem rank_exists (n : ℕ) :
    ∃ r, RankLE (tensor (K := K) (I := Fin n) (J := Fin n) (L := Fin n)) r :=
  ⟨n * n * n, by simpa only [Fintype.card_fin] using
    (schoolbook_rank (K := K) (I := Fin n) (J := Fin n) (L := Fin n))⟩

/-- Minimal number of terms in a decomposition of the n by n matrix multiplication tensor. -/
def matrixRank (n : ℕ) : ℕ := Nat.find (rank_exists K n)

/-- The minimum rank is witnessed by an actual decomposition. -/
theorem matrixRank_spec (n : ℕ) :
    RankLE (tensor (K := K) (I := Fin n) (J := Fin n) (L := Fin n)) (matrixRank K n) :=
  Nat.find_spec (rank_exists K n)

/-- Any supplied decomposition bounds the minimum rank. -/
theorem matrixRank_le {n r : ℕ}
    (budget : RankLE (tensor (K := K) (I := Fin n) (J := Fin n) (L := Fin n)) r) :
    matrixRank K n ≤ r := Nat.find_min' (rank_exists K n) budget

/-- The schoolbook algorithm bounds minimal square matrix rank by n cubed. -/
theorem matrixRank_le_cube (n : ℕ) : matrixRank K n ≤ n ^ 3 := by
  apply matrixRank_le
  simpa only [Fintype.card_fin, pow_succ, pow_zero, one_mul] using
    (schoolbook_rank (K := K) (I := Fin n) (J := Fin n) (L := Fin n))

/-- Minimal matrix ranks are submultiplicative in the matrix dimension. -/
theorem matrixRank_mul_le (m n : ℕ) :
    matrixRank K (m * n) ≤ matrixRank K m * matrixRank K n :=
  matrixRank_le K (fin_product_rank (matrixRank_spec K m) (matrixRank_spec K n))

/-- A nonnegative exponent is admissible when one constant bounds all positive sizes.
The constant is independent of n, and real powers give the usual polynomial rate. -/
def Admissible (exponent : ℝ) : Prop :=
  0 ≤ exponent ∧ ∃ constant : ℝ, 0 < constant ∧ ∀ n : ℕ, 1 ≤ n →
    (matrixRank K n : ℝ) ≤ constant * (n : ℝ) ^ exponent

/-- The algebraic exponent is the infimum of all uniform polynomial rank exponents. -/
def exponent : ℝ := sInf {rate : ℝ | Admissible K rate}

/-- Cubic time is admissible, establishing that the set defining the exponent is nonempty. -/
theorem three_admissible : Admissible K 3 := by
  refine ⟨by norm_num, 1, by norm_num, ?_⟩
  intro n _
  have bound := matrixRank_le_cube K n
  have casted : (matrixRank K n : ℝ) ≤ (n : ℝ) ^ 3 := by exact_mod_cast bound
  norm_num only [one_mul, Real.rpow_ofNat] at *
  exact casted

/-- Every proved uniform polynomial rank estimate bounds the defined exponent. -/
theorem exponent_le_of_admissible {rate : ℝ} (bound : Admissible K rate) :
    exponent K ≤ rate := by
  apply csInf_le
  · exact ⟨0, fun _ h => h.1⟩
  · exact bound

/-- The concrete exponent has the elementary bounds zero and three. -/
theorem exponent_bounds : 0 ≤ exponent K ∧ exponent K ≤ 3 := by
  constructor
  · apply le_csInf ⟨3, three_admissible K⟩
    intro rate admissible
    exact admissible.1
  · exact exponent_le_of_admissible K (three_admissible K)

end
end MatrixBounds.MatrixComplexity
