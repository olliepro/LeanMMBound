module

public import MatrixBatching
public import PolynomialDegeneration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Tensor powers of independent matrix products, with explicit coordinate
regrouping shared by exact decompositions and polynomial degenerations. -/
namespace MatrixBounds.MatrixComplexity

open Tensor Tensor.MatrixMul Tensor.Degeneration
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Split both a copy index and its two matrix coordinates into their product factors. -/
def batchProductMap {s t b n : ℕ} (copies : Fin (s*t) ≃ Fin s × Fin t)
    (size : Fin (b*n) ≃ Fin b × Fin n) (entry : Fin (s*t) × (Fin (b*n) × Fin (b*n))) :
    (Fin s × (Fin b × Fin b)) × (Fin t × (Fin n × Fin n)) :=
  (((copies entry.1).1, (size entry.2.1).1, (size entry.2.2).1),
    ((copies entry.1).2, (size entry.2.1).2, (size entry.2.2).2))

/-- The product of two independent batches is the batch with multiplied counts and sizes. -/
theorem squareBatch_product_identity {s t b n : ℕ}
    (copies : Fin (s*t) ≃ Fin s × Fin t) (size : Fin (b*n) ≃ Fin b × Fin n) :
    (fun x y z => product (squareBatch K s b) (squareBatch K t n)
      (batchProductMap copies size x) (batchProductMap copies size y)
      (batchProductMap copies size z)) = squareBatch K (s*t) (b*n) := by
  funext x y z
  have ec (a b : Fin (s*t)) : a = b ↔ copies a = copies b := copies.injective.eq_iff.symm
  have es (a b : Fin (b*n)) : a = b ↔ size a = size b := size.injective.eq_iff.symm
  unfold product squareBatch directSum tensor batchProductMap
  simp only [ec, es, Prod.ext_iff]
  split_ifs <;> simp_all

/-- Exact batch algorithms combine with multiplied copy counts, dimensions, and ranks. -/
theorem squareBatch_product {s t b n r u : ℕ}
    (left : RankLE (squareBatch K s b) r) (right : RankLE (squareBatch K t n) u) :
    RankLE (squareBatch K (s*t) (b*n)) (r*u) := by
  let copies : Fin (s*t) ≃ Fin s × Fin t := Fintype.equivOfCardEq (by simp)
  let size : Fin (b*n) ≃ Fin b × Fin n := Fintype.equivOfCardEq (by simp)
  rw [← squareBatch_product_identity copies size]
  exact rankLE_pullback (rankLE_product left right) _ _ _

/-- Powering a batch algorithm multiplies both its independent outputs and matrix dimensions. -/
theorem squareBatch_power {copies base rank : ℕ}
    (algorithm : RankLE (squareBatch K copies base) rank) (power : ℕ) :
    RankLE (squareBatch K (copies ^ power) (base ^ power)) (rank ^ power) := by
  induction power with
  | zero =>
    have scalar : RankLE (tensor (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1)) 1 := by
      simpa using (schoolbook_rank (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1))
    simpa only [pow_zero, Nat.mul_one, Fintype.card_fin] using!
      rankLE_directSum (fun _ : Fin 1 => tensor (K := K) (I := Fin 1)
        (J := Fin 1) (L := Fin 1)) 1 (fun _ => scalar)
  | succ power ih =>
    rw [pow_succ, pow_succ, pow_succ]
    exact squareBatch_product ih algorithm

/-- Regroup two batch degeneration certificates using the same explicit coordinate maps. -/
def batchCertificateProduct {s t b n r u d e : ℕ}
    (left : Certificate (squareBatch K s b) r d) (right : Certificate (squareBatch K t n) u e) :
    Certificate (squareBatch K (s*t) (b*n)) (r*u) (d+e) := by
  let copies : Fin (s*t) ≃ Fin s × Fin t := Fintype.equivOfCardEq (by simp)
  let size : Fin (b*n) ≃ Fin b × Fin n := Fintype.equivOfCardEq (by simp)
  rw [← squareBatch_product_identity copies size]
  exact (left.product right).pullback _ _ _

/-- A batch degeneration at power k has rank r^k and leading degree d*k. -/
def batchCertificatePower {copies base rank degree : ℕ}
    (certificate : Certificate (squareBatch K copies base) rank degree) (power : ℕ) :
    Certificate (squareBatch K (copies ^ power) (base ^ power)) (rank ^ power) (degree * power) := by
  induction power with
  | zero =>
    have scalar : RankLE (squareBatch K 1 1) 1 := by
      simpa only [Fintype.card_fin, Nat.mul_one] using
        rankLE_directSum (fun _ : Fin 1 => tensor (K := K) (I := Fin 1)
          (J := Fin 1) (L := Fin 1)) 1 (fun _ => by simpa using
            (schoolbook_rank (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1)))
    simpa only [pow_zero, Nat.mul_zero] using! Certificate.ofDecomposition (Classical.choice scalar)
  | succ power ih =>
    rw [pow_succ, pow_succ, pow_succ, Nat.mul_succ]
    exact batchCertificateProduct ih certificate

end
end MatrixBounds.MatrixComplexity
