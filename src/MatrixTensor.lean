import TensorProduct
import TensorSymmetry
import Mathlib.Data.Matrix.Mul

/-! The matrix multiplication tensor, its evaluation as actual matrix multiplication,
and its elementary decomposition. The output coordinates are (row, column). -/
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

/-- Evaluate a coefficient tensor on two input vectors to obtain its output vector. -/
def evaluate {X Y Z : Type*} [Fintype X] [Fintype Y]
    (t : Coeff K X Y Z) (a : X → K) (b : Y → K) (z : Z) : K :=
  ∑ x, ∑ y, t x y z * a x * b y

/-- The coefficient tensor computes Mathlib's matrix product, entry by entry. -/
theorem evaluate_eq_mul (a : Matrix I J K) (b : Matrix J L K) (i : I) (l : L) :
    evaluate tensor (fun x => a x.1 x.2) (fun y => b y.1 y.2) (i, l) = (a * b) i l := by
  simp [evaluate, tensor, Fintype.sum_prod_type, ite_and, Matrix.mul_apply, eq_comm]

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

/-- Regroup pairs of matrix coordinates into coordinates of the two factors. -/
def regroup {A B C D : Type*} : ((A × B) × (C × D)) ≃ ((A × C) × (B × D)) where
  toFun x := ((x.1.1, x.2.1), (x.1.2, x.2.2))
  invFun x := ((x.1.1, x.2.1), (x.1.2, x.2.2))
  left_inv _ := rfl
  right_inv _ := rfl

/-- Products of matrix multiplication tensors multiply all three dimensions.
The identification is implemented by three coordinate-selection matrices. -/
theorem product_restriction {I' J' L' : Type*}
    [Fintype I'] [Fintype J'] [Fintype L']
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L'] :
    restrict (fun x source => if source = regroup x then (1 : K) else 0)
      (fun y source => if source = regroup y then (1 : K) else 0)
      (fun z source => if source = regroup z then (1 : K) else 0)
      (product (tensor (K := K) (I := I) (J := J) (L := L))
        (tensor (I := I') (J := J') (L := L'))) =
    tensor (I := I × I') (J := J × J') (L := L × L') := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true]
  simp only [product, tensor, regroup, Equiv.coe_fn_mk, Prod.ext_iff]
  split_ifs <;> simp_all

/-- Rank budgets for two rectangular matrix products combine multiplicatively. -/
theorem product_rank {I' J' L' : Type*}
    [Fintype I'] [Fintype J'] [Fintype L']
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    {m n : ℕ}
    (left : RankLE (tensor (K := K) (I := I) (J := J) (L := L)) m)
    (right : RankLE (tensor (K := K) (I := I') (J := J') (L := L')) n) :
    RankLE (tensor (K := K) (I := I × I') (J := J × J') (L := L × L')) (m * n) := by
  rw [← product_restriction]
  exact rankLE_restrict (rankLE_product left right) _ _ _

/-- Relabeling matrix row, inner, and column indices is a genuine tensor restriction. -/
theorem relabel_restriction {I' J' L' : Type*}
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    (ei : I' ≃ I) (ej : J' ≃ J) (el : L' ≃ L) :
    restrict (fun x source => if source = (ei x.1, ej x.2) then (1 : K) else 0)
      (fun y source => if source = (ej y.1, el y.2) then (1 : K) else 0)
      (fun z source => if source = (ei z.1, el z.2) then (1 : K) else 0)
      (tensor (K := K) (I := I) (J := J) (L := L)) =
      tensor (I := I') (J := J') (L := L') := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true]
  simp only [tensor, Equiv.apply_eq_iff_eq]

/-- Equivalent matrix index sets have the same available rank budgets. -/
theorem relabel_rank {I' J' L' : Type*}
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    (ei : I' ≃ I) (ej : J' ≃ J) (el : L' ≃ L) {rank : ℕ}
    (budget : RankLE (tensor (K := K) (I := I) (J := J) (L := L)) rank) :
    RankLE (tensor (K := K) (I := I') (J := J') (L := L')) rank := by
  rw [← relabel_restriction ei ej el]
  exact rankLE_restrict budget _ _ _

/-- Multiplying finite numerical matrix dimensions multiplies their rank budgets. -/
theorem fin_product_rank {i j l i' j' l' m n : ℕ}
    (left : RankLE (tensor (K := K) (I := Fin i) (J := Fin j) (L := Fin l)) m)
    (right : RankLE (tensor (K := K) (I := Fin i') (J := Fin j') (L := Fin l')) n) :
    RankLE (tensor (K := K) (I := Fin (i * i')) (J := Fin (j * j'))
      (L := Fin (l * l'))) (m * n) := by
  let ei : Fin (i * i') ≃ Fin i × Fin i' := Fintype.equivOfCardEq (by simp)
  let ej : Fin (j * j') ≃ Fin j × Fin j' := Fintype.equivOfCardEq (by simp)
  let el : Fin (l * l') ≃ Fin l × Fin l' := Fintype.equivOfCardEq (by simp)
  exact relabel_rank ei ej el (product_rank left right)

/-- A decomposition of rank r evaluates using r products of input linear forms. -/
theorem evaluate_decomposition {X Y Z R : Type*} [Fintype X] [Fintype Y] [Fintype R]
    {t : Coeff K X Y Z} (d : Decomposition t R) (a : X → K) (b : Y → K) (z : Z) :
    evaluate t a b z = ∑ r, (∑ x, d.left r x * a x) *
      (∑ y, d.middle r y * b y) * d.right r z := by
  simp only [evaluate, d.reconstruct, Finset.sum_mul]
  conv_lhs =>
    arg 2
    ext x
    rw [Finset.sum_comm]
  rw [Finset.sum_comm]
  simp only [Finset.mul_sum, Finset.sum_mul]
  apply Finset.sum_congr rfl
  intro r _
  apply Finset.sum_congr rfl
  intro x _
  apply Finset.sum_congr rfl
  intro y _
  ring

/-- Selecting injectively indexed rows and columns restricts a larger matrix tensor. -/
theorem submatrix_restriction {I' J' L' : Type*}
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    (ei : I' ↪ I) (ej : J' ↪ J) (el : L' ↪ L) :
    restrict (fun x source => if source = (ei x.1, ej x.2) then (1 : K) else 0)
      (fun y source => if source = (ej y.1, el y.2) then (1 : K) else 0)
      (fun z source => if source = (ei z.1, el z.2) then (1 : K) else 0)
      (tensor (K := K) (I := I) (J := J) (L := L)) =
      tensor (I := I') (J := J') (L := L') := by
  funext x y z
  simp only [restrict, mapX, mapY, mapZ, ite_mul, one_mul, zero_mul,
    Finset.sum_ite_eq', Finset.mem_univ, if_true]
  simp only [tensor, EmbeddingLike.apply_eq_iff_eq]

/-- Padding smaller square matrices with zeros cannot increase their rank budget. -/
theorem fin_submatrix_rank {m n rank : ℕ} (size : m ≤ n)
    (budget : RankLE (tensor (K := K) (I := Fin n) (J := Fin n) (L := Fin n)) rank) :
    RankLE (tensor (K := K) (I := Fin m) (J := Fin m) (L := Fin m)) rank := by
  let embedding : Fin m ↪ Fin n := ⟨Fin.castLE size, Fin.castLE_injective size⟩
  rw [← submatrix_restriction embedding embedding embedding]
  exact rankLE_restrict budget _ _ _

end
end MatrixBounds.Tensor.MatrixMul
