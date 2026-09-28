import Mathlib.Algebra.BigOperators.Field
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.Ring
import Mathlib.Data.Matrix.Mul
import Mathlib.Analysis.SpecialFunctions.Pow.Real

/-! Challenge file for olliepro/matrix-bounds-lean (commit bd86c756).
Every declaration below is copied VERBATIM from the project sources (TensorCore, MatrixTensor,
MatrixExponent); nothing from the project is imported — only Mathlib. It restates what is being
claimed: the definition of tensor rank, the n×n matrix multiplication tensor, the exponent ω, and
the final theorem with its proof replaced by `sorry`. Comparator checks that the project's
`exponent_lt` proves exactly this statement about exactly these definitions. -/

-- ===== from TensorCore.lean =====
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section

variable {K X Y Z U V W R : Type*} [CommSemiring K]

/-- Coefficients of a three-way tensor in fixed bases X, Y, and Z. -/
abbrev Coeff (K X Y Z : Type*) := X → Y → Z → K

/-- An explicit rank decomposition indexed by R, with its reconstruction proof.
For example, R = Fin 7 represents seven scalar multiplications. -/
structure Decomposition (tensor : Coeff K X Y Z) (R : Type*) [Fintype R] where
  left : R → X → K
  middle : R → Y → K
  right : R → Z → K
  reconstruct : ∀ x y z, tensor x y z = ∑ r, left r x * middle r y * right r z

/-- Rank at most n means an actual decomposition with n terms, allowing zero terms. -/
def RankLE (tensor : Coeff K X Y Z) (n : ℕ) : Prop :=
  Nonempty (Decomposition tensor (Fin n))

/-- Relabel decomposition terms by a finite equivalence without changing the tensor. -/
def Decomposition.reindex {S : Type*} [Fintype R] [Fintype S]
    {tensor : Coeff K X Y Z} (d : Decomposition tensor R) (equiv : S ≃ R) :
    Decomposition tensor S where
  left s := d.left (equiv s)
  middle s := d.middle (equiv s)
  right s := d.right (equiv s)
  reconstruct x y z := (d.reconstruct x y z).trans
    (Equiv.sum_comp equiv (fun r => d.left r x * d.middle r y * d.right r z)).symm

end
end MatrixBounds.Tensor

-- ===== from MatrixTensor.lean =====
namespace MatrixBounds.Tensor.MatrixMul

open scoped BigOperators
noncomputable section
variable {K I J L : Type*} [CommSemiring K]
variable [Fintype I] [Fintype J] [Fintype L]
variable [DecidableEq I] [DecidableEq J] [DecidableEq L]

/-- Coefficient of A(i,j) B(j,l) in output entry (i,l).
For I = J = L = Fin n this is the n by n matrix multiplication tensor. -/
def tensor : Coeff K (I × J) (J × L) (I × L) :=
  fun x y z => if x.1 = z.1 ∧ x.2 = y.1 ∧ y.2 = z.2 then 1 else 0

/-- The schoolbook algorithm as an explicit decomposition with one term per (i,j,l). -/
def schoolbook : Decomposition (tensor (K := K) (I := I) (J := J) (L := L)) (I × J × L) where
  left term x := if x = (term.1, term.2.1) then 1 else 0
  middle term y := if y = (term.2.1, term.2.2) then 1 else 0
  right term z := if z = (term.1, term.2.2) then 1 else 0
  reconstruct x y z := by
    by_cases hx : x.1 = z.1 <;> by_cases hy : x.2 = y.1 <;>
      by_cases hz : y.2 = z.2 <;>
      simp_all [tensor, Fintype.sum_prod_type, Prod.ext_iff, ite_and, eq_comm]

/-- Multiplying I by J and J by L matrices uses at most |I|*|J|*|L| scalar products. -/
theorem schoolbook_rank : RankLE (tensor (K := K) (I := I) (J := J) (L := L))
    (Fintype.card I * Fintype.card J * Fintype.card L) := by
  have result : RankLE (tensor (K := K) (I := I) (J := J) (L := L))
      (Fintype.card (I × J × L)) :=
    ⟨schoolbook.reindex (Fintype.equivFin (I × J × L)).symm⟩
  simpa only [Fintype.card_prod, Nat.mul_assoc] using result

end
end MatrixBounds.Tensor.MatrixMul

-- ===== from MatrixExponent.lean =====
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul
noncomputable section
-- NOTE (only deviation from verbatim copying): the project declares this instance anonymously, and Lean
-- then names it after the *module* (`instDecidable_matrixExponent` there, `instDecidable_challenge` here).
-- Comparator requires every constant used by the statement to be identical by name, so we give it the
-- project's auto-generated name explicitly. Its type and value are unchanged.
local instance instDecidable_matrixExponent (p : Prop) : Decidable p := Classical.propDecidable p
variable (K : Type*) [CommSemiring K]

/-- At every size there is a finite rank decomposition, supplied by schoolbook multiplication. -/
theorem rank_exists (n : ℕ) :
    ∃ r, RankLE (tensor (K := K) (I := Fin n) (J := Fin n) (L := Fin n)) r :=
  ⟨n * n * n, by simpa only [Fintype.card_fin] using
    (schoolbook_rank (K := K) (I := Fin n) (J := Fin n) (L := Fin n))⟩

/-- Minimal number of terms in a decomposition of the n by n matrix multiplication tensor. -/
def matrixRank (n : ℕ) : ℕ := Nat.find (rank_exists K n)

/-- A nonnegative exponent is admissible when one constant bounds all positive sizes.
The constant is independent of n, and real powers give the usual polynomial rate. -/
def Admissible (exponent : ℝ) : Prop :=
  0 ≤ exponent ∧ ∃ constant : ℝ, 0 < constant ∧ ∀ n : ℕ, 1 ≤ n →
    (matrixRank K n : ℝ) ≤ constant * (n : ℝ) ^ exponent

/-- The algebraic exponent is the infimum of all uniform polynomial rank exponents. -/
def exponent : ℝ := sInf {rate : ℝ | Admissible K rate}

end
end MatrixBounds.MatrixComplexity

-- ===== the claim (statement copied from SuppliedCertifiedPipeline.lean) =====
namespace MatrixBounds.Numeric.SuppliedCertifiedPipeline

theorem exponent_lt {K : Type} [CommRing K] : MatrixComplexity.exponent K < (23710449 : ℝ)/10000000 :=
  sorry

end MatrixBounds.Numeric.SuppliedCertifiedPipeline
