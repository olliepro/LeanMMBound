module

public import TensorProduct
public import Mathlib.Algebra.Polynomial.Coeff
public import Mathlib.Algebra.BigOperators.NatAntidiagonal
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Data.Fintype.Sum
public import Mathlib.Tactic.Linarith

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Polynomial rank approximations and exact coefficient extraction. A polynomial
approximation is represented by actual polynomial-valued rank factors. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
variable {K X Y Z R : Type*} [CommSemiring K]

/-- Extend a decomposition by zero summands, so rank budgets are monotone. -/
theorem rankLE_mono {tensor : Coeff K X Y Z} {m n : ℕ}
    (budget : RankLE tensor m) (size : m ≤ n) : RankLE tensor n := by
  obtain ⟨d⟩ := budget
  let padded : Decomposition tensor (Fin m ⊕ Fin (n - m)) := {
    left := Sum.elim d.left (fun _ _ => 0)
    middle := Sum.elim d.middle (fun _ _ => 0)
    right := Sum.elim d.right (fun _ _ => 0)
    reconstruct := by intro x y z; simpa using d.reconstruct x y z }
  have result : RankLE tensor (Fintype.card (Fin m ⊕ Fin (n - m))) :=
    ⟨padded.reindex (Fintype.equivFin _).symm⟩
  simpa [Nat.add_sub_of_le size] using result

namespace Degeneration

/-- Indices for splitting a degree d among three polynomial factors. -/
abbrev Splits (degree : ℕ) := (outer : Fin (degree + 1)) × Fin (outer.val + 1)

/-- The degree-split index set has at most (d+1) squared elements. -/
theorem splits_card_le (degree : ℕ) : Fintype.card (Splits degree) ≤ (degree + 1) ^ 2 := by
  rw [Fintype.card_sigma]
  calc
    _ ≤ (∑ _ : Fin (degree + 1), (degree + 1)) := by
      apply Finset.sum_le_sum
      intro i _
      simp only [Fintype.card_fin]
      omega
    _ = _ := by simp [pow_two]

/-- Polynomial product coefficients written as a finite sum over the possible first degree. -/
theorem coeff_mul_fin (left right : Polynomial K) (degree : ℕ) :
    (left * right).coeff degree = ∑ i : Fin (degree + 1),
      left.coeff i.val * right.coeff (degree - i.val) := by
  rw [Polynomial.coeff_mul, Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk]
  exact (Fin.sum_univ_eq_sum_range _ _).symm

/-- Coefficients of three factors split into two nested finite degree choices. -/
theorem coeff_triple (left middle right : Polynomial K) (degree : ℕ) :
    (left * middle * right).coeff degree = ∑ split : Splits degree,
      left.coeff split.2.val * middle.coeff (split.1.val - split.2.val) *
        right.coeff (degree - split.1.val) := by
  rw [coeff_mul_fin, Fintype.sum_sigma]
  apply Finset.sum_congr rfl
  intro i _
  rw [coeff_mul_fin, Finset.sum_mul]

/-- Extract one coefficient from every entry of a polynomial-valued tensor. -/
def coefficient (tensor : Coeff (Polynomial K) X Y Z) (degree : ℕ) : Coeff K X Y Z :=
  fun x y z => (tensor x y z).coeff degree

/-- Extract a coefficient decomposition, with one term per source term and degree split. -/
def coefficientDecomposition [Fintype R]
    {tensor : Coeff (Polynomial K) X Y Z} (d : Decomposition tensor R) (degree : ℕ) :
    Decomposition (coefficient tensor degree) (R × Splits degree) where
  left term x := (d.left term.1 x).coeff term.2.2.val
  middle term y := (d.middle term.1 y).coeff (term.2.1.val - term.2.2.val)
  right term z := (d.right term.1 z).coeff (degree - term.2.1.val)
  reconstruct x y z := by
    simp only [coefficient, d.reconstruct, Polynomial.finset_sum_coeff,
      coeff_triple, Fintype.sum_prod_type]

/-- Extracting degree d costs at most (d+1) squared times the polynomial rank budget. -/
theorem coefficient_rank {tensor : Coeff (Polynomial K) X Y Z} {rank : ℕ}
    (budget : RankLE tensor rank) (degree : ℕ) :
    RankLE (coefficient tensor degree) (rank * (degree + 1) ^ 2) := by
  obtain ⟨d⟩ := budget
  have result : RankLE (coefficient tensor degree) (Fintype.card (Fin rank × Splits degree)) :=
    ⟨(coefficientDecomposition d degree).reindex (Fintype.equivFin _).symm⟩
  apply rankLE_mono result
  simpa only [Fintype.card_prod, Fintype.card_fin] using
    Nat.mul_le_mul_left rank (splits_card_le degree)

/-- A polynomial degeneration has zero coefficients below the target leading degree,
and its coefficient at that degree is the target tensor. All rank factors are witnesses. -/
structure Certificate (target : Coeff K X Y Z) (rank degree : ℕ) where
  polynomialTensor : Coeff (Polynomial K) X Y Z
  decomposition : Decomposition polynomialTensor (Fin rank)
  lower_zero : ∀ x y z index, index < degree → (polynomialTensor x y z).coeff index = 0
  leading : coefficient polynomialTensor degree = target

/-- A polynomial degeneration yields an exact finite rank bound by coefficient extraction. -/
theorem Certificate.exact_rank {target : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate target rank degree) :
    RankLE target (rank * (degree + 1) ^ 2) := by
  rw [← certificate.leading]
  exact coefficient_rank ⟨certificate.decomposition⟩ degree

/-- A product has no coefficient below the sum of two known leading degrees. -/
theorem product_lower_zero (left right : Polynomial K) (dl dr : ℕ)
    (hl : ∀ i, i < dl → left.coeff i = 0)
    (hr : ∀ i, i < dr → right.coeff i = 0)
    (index : ℕ) (below : index < dl + dr) : (left * right).coeff index = 0 := by
  rw [coeff_mul_fin]
  apply Finset.sum_eq_zero
  intro i _
  by_cases hi : i.val < dl
  · rw [hl _ hi, zero_mul]
  · rw [hr (index - i.val) (by have := i.isLt; omega), mul_zero]

/-- The first possible coefficient of a product is the product of the two leading coefficients. -/
theorem product_leading (left right : Polynomial K) (dl dr : ℕ)
    (hl : ∀ i, i < dl → left.coeff i = 0)
    (hr : ∀ i, i < dr → right.coeff i = 0) :
    (left * right).coeff (dl + dr) = left.coeff dl * right.coeff dr := by
  rw [coeff_mul_fin]
  rw [Finset.sum_eq_single (⟨dl, by omega⟩ : Fin (dl + dr + 1))]
  · simp
  · intro i _ different
    have hne : i.val ≠ dl := by intro h; apply different; exact Fin.ext h
    by_cases hi : i.val < dl
    · rw [hl _ hi, zero_mul]
    · rw [hr (dl + dr - i.val) (by omega), mul_zero]
  · simp

/-- Polynomial degeneration certificates compose under tensor products.
Ranks multiply while leading degrees add; all polynomial factors are retained. -/
def Certificate.product {U V W : Type*}
    {left : Coeff K X Y Z} {right : Coeff K U V W} {rl rr dl dr : ℕ}
    (cl : Certificate left rl dl) (cr : Certificate right rr dr) :
    Certificate (Tensor.product left right) (rl * rr) (dl + dr) where
  polynomialTensor := Tensor.product cl.polynomialTensor cr.polynomialTensor
  decomposition := (cl.decomposition.product cr.decomposition).reindex
    (Fintype.equivOfCardEq (by simp))
  lower_zero x y z index below := product_lower_zero _ _ dl dr
    (cl.lower_zero x.1 y.1 z.1) (cr.lower_zero x.2 y.2 z.2) index below
  leading := by
    funext x y z
    change (cl.polynomialTensor x.1 y.1 z.1 * cr.polynomialTensor x.2 y.2 z.2).coeff _ = _
    rw [product_leading _ _ dl dr (cl.lower_zero x.1 y.1 z.1) (cr.lower_zero x.2 y.2 z.2)]
    change coefficient cl.polynomialTensor dl x.1 y.1 z.1 *
      coefficient cr.polynomialTensor dr x.2 y.2 z.2 = _
    rw [cl.leading, cr.leading]
    rfl

/-- A simultaneous coordinate substitution pulls back a certificate without extra terms. -/
def Certificate.pullback {U V W : Type*} {target : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate target rank degree)
    (fx : U → X) (fy : V → Y) (fz : W → Z) :
    Certificate (fun u v w => target (fx u) (fy v) (fz w)) rank degree where
  polynomialTensor u v w := certificate.polynomialTensor (fx u) (fy v) (fz w)
  decomposition := {
    left r u := certificate.decomposition.left r (fx u)
    middle r v := certificate.decomposition.middle r (fy v)
    right r w := certificate.decomposition.right r (fz w)
    reconstruct u v w := certificate.decomposition.reconstruct (fx u) (fy v) (fz w) }
  lower_zero u v w := certificate.lower_zero (fx u) (fy v) (fz w)
  leading := by
    funext u v w
    exact congrFun (congrFun (congrFun certificate.leading (fx u)) (fy v)) (fz w)

/-- An exact decomposition is a degree-zero polynomial degeneration. -/
def Certificate.ofDecomposition {target : Coeff K X Y Z} {rank : ℕ}
    (d : Decomposition target (Fin rank)) : Certificate target rank 0 where
  polynomialTensor x y z := Polynomial.C (target x y z)
  decomposition := {
    left r x := Polynomial.C (d.left r x)
    middle r y := Polynomial.C (d.middle r y)
    right r z := Polynomial.C (d.right r z)
    reconstruct x y z := by
      rw [d.reconstruct]
      simp only [map_sum, map_mul] }
  lower_zero _ _ _ _ below := by omega
  leading := by funext x y z; simp [coefficient]

/-- Coefficient extraction commutes with tensor restrictions whose matrices are constant. -/
theorem coefficient_restrict {U V W : Type*} [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff (Polynomial K) X Y Z) (degree : ℕ)
    (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    coefficient (restrict (fun u x => Polynomial.C (mx u x))
      (fun v y => Polynomial.C (my v y)) (fun w z => Polynomial.C (mz w z)) tensor) degree =
      restrict mx my mz (coefficient tensor degree) := by
  funext u v w
  simp only [coefficient, restrict, mapX, mapY, mapZ, Polynomial.finset_sum_coeff,
    Polynomial.coeff_C_mul]

/-- A valid tensor restriction transports a polynomial degeneration without increasing its rank. -/
def Certificate.restrict {U V W : Type*} [Fintype X] [Fintype Y] [Fintype Z]
    {target : Coeff K X Y Z} {rank degree : ℕ} (certificate : Certificate target rank degree)
    (mx : U → X → K) (my : V → Y → K) (mz : W → Z → K) :
    Certificate (Tensor.restrict mx my mz target) rank degree where
  polynomialTensor := Tensor.restrict (fun u x => Polynomial.C (mx u x))
    (fun v y => Polynomial.C (my v y)) (fun w z => Polynomial.C (mz w z))
    certificate.polynomialTensor
  decomposition := certificate.decomposition.restrict (fun u x => Polynomial.C (mx u x))
    (fun v y => Polynomial.C (my v y)) (fun w z => Polynomial.C (mz w z))
  lower_zero u v w index below := by
    simp only [Tensor.restrict, mapX, mapY, mapZ, Polynomial.finset_sum_coeff,
      Polynomial.coeff_C_mul, certificate.lower_zero _ _ _ index below,
      mul_zero, Finset.sum_const_zero]
  leading := by rw [coefficient_restrict, certificate.leading]

end Degeneration
end
end MatrixBounds.Tensor
