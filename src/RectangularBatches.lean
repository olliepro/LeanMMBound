import BatchPowers
import TensorCyclic

/-! Products and rotations of independent rectangular matrix multiplication
batches, with explicit coordinate maps for each operation. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul Tensor.Degeneration
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Independent copies of an i-by-j times j-by-l matrix multiplication. -/
abbrev rectangularBatch (K : Type*) [CommSemiring K] (copies rows inner columns : ℕ) :=
  directSum (fun _ : Fin copies => tensor (K := K) (I := Fin rows) (J := Fin inner) (L := Fin columns))

/-- Split copy indices and both coordinates of a rectangular product axis. -/
def rectangularProductMap {s t i i' j j' : ℕ}
    (copies : Fin (s*t) ≃ Fin s × Fin t) (rows : Fin (i*i') ≃ Fin i × Fin i')
    (columns : Fin (j*j') ≃ Fin j × Fin j')
    (entry : Fin (s*t) × (Fin (i*i') × Fin (j*j'))) :
    (Fin s × (Fin i × Fin j)) × (Fin t × (Fin i' × Fin j')) :=
  (((copies entry.1).1, (rows entry.2.1).1, (columns entry.2.2).1),
    ((copies entry.1).2, (rows entry.2.1).2, (columns entry.2.2).2))

/-- The product of two rectangular batches multiplies copies and all three dimensions. -/
theorem rectangularBatch_product_identity {s t i j l i' j' l' : ℕ}
    (copies : Fin (s*t) ≃ Fin s × Fin t) (rows : Fin (i*i') ≃ Fin i × Fin i')
    (inner : Fin (j*j') ≃ Fin j × Fin j') (columns : Fin (l*l') ≃ Fin l × Fin l') :
    (fun x y z => product (rectangularBatch K s i j l) (rectangularBatch K t i' j' l')
      (rectangularProductMap copies rows inner x) (rectangularProductMap copies inner columns y)
      (rectangularProductMap copies rows columns z)) = rectangularBatch K (s*t) (i*i') (j*j') (l*l') := by
  funext x y z
  have ec (a b : Fin (s*t)) : a = b ↔ copies a = copies b := copies.injective.eq_iff.symm
  have ei (a b : Fin (i*i')) : a = b ↔ rows a = rows b := rows.injective.eq_iff.symm
  have ej (a b : Fin (j*j')) : a = b ↔ inner a = inner b := inner.injective.eq_iff.symm
  have el (a b : Fin (l*l')) : a = b ↔ columns a = columns b := columns.injective.eq_iff.symm
  simp only [product, rectangularBatch, directSum, tensor, rectangularProductMap, ec, ei, ej, el, Prod.ext_iff]
  split_ifs <;> simp_all

/-- Rectangular matrix batch rank budgets multiply under the displayed coordinate regrouping. -/
theorem rectangularBatch_product {s t i j l i' j' l' r u : ℕ}
    (left : RankLE (rectangularBatch K s i j l) r)
    (right : RankLE (rectangularBatch K t i' j' l') u) :
    RankLE (rectangularBatch K (s*t) (i*i') (j*j') (l*l')) (r*u) := by
  rw [← rectangularBatch_product_identity
    (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp))
    (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp))]
  exact rankLE_pullback (rankLE_product left right) _ _ _

/-- Rectangular batch polynomial certificates multiply rank and add degree. -/
def rectangularCertificateProduct {s t i j l i' j' l' r u d e : ℕ}
    (left : Certificate (rectangularBatch K s i j l) r d)
    (right : Certificate (rectangularBatch K t i' j' l') u e) :
    Certificate (rectangularBatch K (s*t) (i*i') (j*j') (l*l')) (r*u) (d+e) := by
  rw [← rectangularBatch_product_identity
    (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp))
    (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp))]
  exact (left.product right).pullback _ _ _

/-- Cyclic axis permutation rotates the three matrix dimensions. -/
theorem rectangularBatch_cyclic_identity {copies i j l : ℕ} :
    (fun (x : Fin copies × (Fin j × Fin l)) (y : Fin copies × (Fin l × Fin i))
        (z : Fin copies × (Fin j × Fin i)) =>
      cyclic (rectangularBatch K copies i j l) x (y.1, y.2.2, y.2.1) (z.1, z.2.2, z.2.1)) =
        rectangularBatch K copies j l i := by
  funext x y z
  simp only [cyclic, rectangularBatch, directSum, tensor]
  split_ifs <;> simp_all

/-- A cyclically rotated rectangular batch has the same rank budget. -/
theorem rectangularBatch_cyclic {copies i j l rank : ℕ}
    (budget : RankLE (rectangularBatch K copies i j l) rank) :
    RankLE (rectangularBatch K copies j l i) rank := by
  rw [← rectangularBatch_cyclic_identity]
  exact rankLE_pullback (rankLE_cyclic budget) _ _ _

/-- A cyclically rotated rectangular batch has the same polynomial certificate budget. -/
def rectangularCertificateCyclic {copies i j l rank degree : ℕ}
    (certificate : Certificate (rectangularBatch K copies i j l) rank degree) :
    Certificate (rectangularBatch K copies j l i) rank degree := by
  rw [← rectangularBatch_cyclic_identity]
  exact certificate.cyclic.pullback _ _ _

end
end MatrixBounds.MatrixComplexity
