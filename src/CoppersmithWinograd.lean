module

public import PolynomialDegeneration
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.NormNum
public import Mathlib.Tactic.IntervalCases

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! A polynomial degeneration of the Coppersmith-Winograd tensor with q+2 terms.
The certificate records the leading degree and all polynomial rank-one factors. -/
namespace MatrixBounds.Tensor.CW

open scoped BigOperators
open Polynomial Degeneration
noncomputable section
variable {K : Type*} [CommRing K]

/-- Coefficient selector for a coordinate in the q+2 dimensional CW axis. -/
def delta {q : ℕ} (index coordinate : Fin (q+2)) : K := if index = coordinate then 1 else 0

/-- The CW tensor consists of three diagonal families plus three extreme terms. -/
def tensor (q : ℕ) : Coeff K (Fin (q+2)) (Fin (q+2)) (Fin (q+2)) := fun x y z =>
  (∑ i : Fin q,
    (delta ⟨i.val+1, by omega⟩ x * delta ⟨i.val+1, by omega⟩ y * delta 0 z +
    delta ⟨i.val+1, by omega⟩ x * delta 0 y * delta ⟨i.val+1, by omega⟩ z +
    delta 0 x * delta ⟨i.val+1, by omega⟩ y * delta ⟨i.val+1, by omega⟩ z)) +
  delta ⟨q+1, by omega⟩ x * delta 0 y * delta 0 z +
  delta 0 x * delta ⟨q+1, by omega⟩ y * delta 0 z +
  delta 0 x * delta 0 y * delta ⟨q+1, by omega⟩ z

/-- A polynomial linear form with a constant coordinate and one shifted coordinate. -/
def form (a b : K) (degree : ℕ) : Polynomial K := C a + X ^ degree * C b

/-- The coefficient of a shifted two-coordinate form is explicit. -/
theorem form_coeff (a b : K) (degree index : ℕ) :
    (form a b degree).coeff index =
      (if index = 0 then a else 0) + (if index = degree then b else 0) := by
  simp [form, Polynomial.coeff_C]

/-- Three constant-plus-linear forms have the expected low coefficients. -/
theorem linear_triple_two (a b c d e f : K) :
    (form a b 1 * form c d 1 * form e f 1).coeff 2 = b*d*e+b*c*f+a*d*f := by
  rw [coeff_triple, Fintype.sum_sigma]
  simp [Fin.sum_univ_succ, form_coeff]
  ring

/-- Every degree-three coefficient vanishes in products of forms shifted by two. -/
theorem even_triple_three (a b c d e f : K) :
    (form a b 2 * form c d 2 * form e f 2).coeff 3 = 0 := by
  rw [coeff_triple, Fintype.sum_sigma]
  simp [Fin.sum_univ_succ, form_coeff]

/-- Degree three selects exactly one shifted coordinate from forms shifted by three. -/
theorem tail_triple_three (a b c d e f : K) :
    (form a b 3 * form c d 3 * form e f 3).coeff 3 = b*c*e+a*d*e+a*c*f := by
  rw [coeff_triple, Fintype.sum_sigma]
  simp [Fin.sum_univ_succ, form_coeff]
  ring

/-- Linear form attached to one middle CW coordinate. -/
def middleForm (q : ℕ) (i : Fin q) (x : Fin (q+2)) : Polynomial K :=
  form (delta 0 x) (delta ⟨i.val+1, by omega⟩ x) 1

/-- Central correction form uses the sum of all middle coordinates at degree two. -/
def centerForm (q : ℕ) (x : Fin (q+2)) : Polynomial K :=
  form (delta 0 x) (∑ i : Fin q, delta ⟨i.val+1, by omega⟩ x) 2

/-- The final form introduces the extreme coordinate at degree three. -/
def tailForm (q : ℕ) (x : Fin (q+2)) : Polynomial K :=
  form (delta 0 x) (delta ⟨q+1, by omega⟩ x) 3

/-- Polynomial approximation whose first nonzero coefficient is the CW tensor at degree three. -/
def approximation (q : ℕ) : Coeff (Polynomial K) (Fin (q+2)) (Fin (q+2)) (Fin (q+2)) :=
  fun x y z => X * (∑ i : Fin q, middleForm q i x * middleForm q i y * middleForm q i z) -
    centerForm q x * centerForm q y * centerForm q z +
    tailForm q x * tailForm q y * tailForm q z -
    C (q : K) * (X * (tailForm q x * tailForm q y * tailForm q z))

/-- Coefficients below degree three cancel exactly in the polynomial approximation. -/
theorem approximation_lower (q : ℕ) (x y z : Fin (q+2)) (index : ℕ) (below : index < 3) :
    (approximation (K := K) q x y z).coeff index = 0 := by
  interval_cases index <;>
    simp [approximation, Polynomial.coeff_X_mul, middleForm, centerForm, tailForm,
      coeff_triple, Fintype.sum_sigma, Fin.sum_univ_succ, form_coeff,
      Finset.sum_add_distrib, Finset.sum_mul, Finset.mul_sum]

/-- The degree-three coefficient is exactly the CW tensor, including its extreme terms. -/
theorem approximation_leading (q : ℕ) : coefficient (approximation (K := K) q) 3 = tensor q := by
  funext x y z
  simp [coefficient, approximation, Polynomial.coeff_X_mul, middleForm, centerForm, tailForm,
    coeff_triple, Fintype.sum_sigma, Fin.sum_univ_succ, form_coeff, tensor,
    Finset.sum_add_distrib, Finset.sum_mul, Finset.mul_sum]
  ring

/-- The q middle terms and two correction terms form an explicit polynomial decomposition. -/
def approximationDecomposition (q : ℕ) : Decomposition (approximation (K := K) q) (Fin q ⊕ Fin 2) where
  left term x := match term with
    | .inl i => X * middleForm q i x
    | .inr i => if i.val = 0 then -centerForm q x else (1 - C (q : K) * X) * tailForm q x
  middle term y := match term with
    | .inl i => middleForm q i y
    | .inr i => if i.val = 0 then centerForm q y else tailForm q y
  right term z := match term with
    | .inl i => middleForm q i z
    | .inr i => if i.val = 0 then centerForm q z else tailForm q z
  reconstruct x y z := by
    simp only [Fintype.sum_sum_type, Fin.sum_univ_succ]
    simp only [Fin.val_zero, Fin.val_succ, zero_add, ↓reduceIte, Nat.one_ne_zero,
      Fin.sum_univ_zero, add_zero]
    simp only [approximation, Finset.mul_sum, mul_assoc]
    ring

/-- The CW tensor has a q+2-term polynomial degeneration of leading degree three. -/
def certificate (q : ℕ) : Certificate (tensor (K := K) q) (q+2) 3 where
  polynomialTensor := approximation q
  decomposition := (approximationDecomposition q).reindex (Fintype.equivOfCardEq (by simp))
  lower_zero := approximation_lower q
  leading := approximation_leading q

/-- The source used by the supplied numerical certificate has seven degeneration terms. -/
theorem q5_certificate : Nonempty (Certificate (tensor (K := K) 5) 7 3) := ⟨certificate 5⟩

end
end MatrixBounds.Tensor.CW
