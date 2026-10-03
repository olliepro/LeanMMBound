module

public import HeterogeneousInterface
public import PolynomialDegeneration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Explicit rank and polynomial certificates for products of differently typed
interfaces. Products multiply rank budgets and add leading degrees. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Index K : Type*} [Fintype Index] [CommSemiring K]
variable {X Y Z R : Index → Type*} [∀ i, Fintype (R i)]

/-- Multiply independently indexed rank decompositions of heterogeneous factors. -/
def heterogeneousDecomposition (family : ∀ i, Coeff K (X i) (Y i) (Z i))
    (decomposition : ∀ i, Decomposition (family i) (R i)) :
    Decomposition (heterogeneous family) (∀ i, R i) where
  left term x := ∏ i, (decomposition i).left (term i) (x i)
  middle term y := ∏ i, (decomposition i).middle (term i) (y i)
  right term z := ∏ i, (decomposition i).right (term i) (z i)
  reconstruct x y z := by
    simp only [heterogeneous, fun i => (decomposition i).reconstruct (x i) (y i) (z i),
      Fintype.prod_sum, Finset.prod_mul_distrib]

/-- Rank budgets multiply for finite products with arbitrary factor alphabets. -/
theorem heterogeneous_rank (family : ∀ i, Coeff K (X i) (Y i) (Z i)) (rank : Index → ℕ)
    (budget : ∀ i, RankLE (family i) (rank i)) : RankLE (heterogeneous family) (∏ i, rank i) := by
  let decomposition : ∀ i, Decomposition (family i) (Fin (rank i)) := fun i => Classical.choice (budget i)
  have result : RankLE (heterogeneous family) (Fintype.card (∀ i, Fin (rank i))) :=
    ⟨(heterogeneousDecomposition family decomposition).reindex (Fintype.equivFin _).symm⟩
  simpa only [Fintype.card_pi, Fintype.card_fin] using result

end
end MatrixBounds.Interface

namespace MatrixBounds.Tensor.Degeneration

open scoped BigOperators
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Index K : Type*} [CommSemiring K]

/-- The product of polynomial factors vanishes below the sum of their leading degrees. -/
theorem finite_product_lower (indices : Finset Index) (polynomials : Index → Polynomial K)
    (degree : Index → ℕ)
    (lower : ∀ i ∈ indices, ∀ n, n < degree i → (polynomials i).coeff n = 0)
    (n : ℕ) (below : n < ∑ i ∈ indices, degree i) :
    (∏ i ∈ indices, polynomials i).coeff n = 0 := by
  classical
  induction indices using Finset.induction_on generalizing n with
  | empty => simp at below
  | @insert i rest absent induction =>
    rw [Finset.prod_insert absent]
    rw [Finset.sum_insert absent] at below
    exact product_lower_zero _ _ (degree i) (∑ j ∈ rest, degree j)
      (lower i (Finset.mem_insert_self _ _))
      (fun n hn => induction (fun j hj => lower j (Finset.mem_insert_of_mem hj)) n hn) n below

/-- The leading product coefficient is the product of the leading coefficients. -/
theorem finite_product_leading (indices : Finset Index) (polynomials : Index → Polynomial K)
    (degree : Index → ℕ)
    (lower : ∀ i ∈ indices, ∀ n, n < degree i → (polynomials i).coeff n = 0) :
    (∏ i ∈ indices, polynomials i).coeff (∑ i ∈ indices, degree i) =
      ∏ i ∈ indices, (polynomials i).coeff (degree i) := by
  classical
  induction indices using Finset.induction_on with
  | empty => simp
  | @insert i rest absent induction =>
    rw [Finset.prod_insert absent, Finset.sum_insert absent, Finset.prod_insert absent]
    have remaining := fun j hj => lower j (Finset.mem_insert_of_mem hj)
    rw [product_leading _ _ (degree i) (∑ j ∈ rest, degree j)
      (lower i (Finset.mem_insert_self _ _)) (finite_product_lower rest polynomials degree remaining)]
    rw [induction remaining]

/-- Heterogeneous polynomial degenerations combine into one explicit product certificate. -/
def heterogeneousCertificate [Fintype Index] {X Y Z : Index → Type*}
    (family : ∀ i, Coeff K (X i) (Y i) (Z i)) (rank degree : Index → ℕ)
    (certificate : ∀ i, Certificate (family i) (rank i) (degree i)) :
    Certificate (Interface.heterogeneous family) (∏ i, rank i) (∑ i, degree i) where
  polynomialTensor := Interface.heterogeneous (fun i => (certificate i).polynomialTensor)
  decomposition := (Interface.heterogeneousDecomposition _ (fun i => (certificate i).decomposition)).reindex
    (Fintype.equivOfCardEq (by simp))
  lower_zero x y z := finite_product_lower Finset.univ _ degree
    (fun i _ => (certificate i).lower_zero (x i) (y i) (z i))
  leading := by
    funext x y z
    change (∏ i, (certificate i).polynomialTensor (x i) (y i) (z i)).coeff (∑ i, degree i) = _
    rw [finite_product_leading Finset.univ _ degree
      (fun i _ => (certificate i).lower_zero (x i) (y i) (z i))]
    apply Finset.prod_congr rfl
    intro i _
    exact congrFun (congrFun (congrFun (certificate i).leading (x i)) (y i)) (z i)

end
end MatrixBounds.Tensor.Degeneration
