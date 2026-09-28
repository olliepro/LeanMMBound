import PolynomialDegeneration
import RankAmplification

/-! Polynomial degeneration certificates for matrix multiplication compose with
multiplied dimensions and power to exact algorithms with polynomial overhead. -/
namespace MatrixBounds.Tensor.Degeneration

open MatrixMul
noncomputable section
variable {K : Type*} [CommSemiring K]

/-- Regroup the product of two matrix degeneration certificates into larger matrix dimensions. -/
def matrixProduct {I J L I' J' L' : Type*}
    [DecidableEq I] [DecidableEq J] [DecidableEq L]
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    {rl rr dl dr : ℕ}
    (cl : Certificate (tensor (K := K) (I := I) (J := J) (L := L)) rl dl)
    (cr : Certificate (tensor (K := K) (I := I') (J := J') (L := L')) rr dr) :
    Certificate (tensor (K := K) (I := I × I') (J := J × J') (L := L × L'))
      (rl * rr) (dl + dr) := by
  have combined := (cl.product cr).pullback
    (fun x => regroup x) (fun y => regroup y) (fun z => regroup z)
  have identity : (fun x y z => product (tensor (K := K) (I := I) (J := J) (L := L))
      (tensor (K := K) (I := I') (J := J') (L := L')) (regroup x) (regroup y) (regroup z)) =
      tensor (K := K) (I := I × I') (J := J × J') (L := L × L') := by
    funext x y z
    simp only [product, tensor, regroup, Equiv.coe_fn_mk, Prod.ext_iff]
    split_ifs <;> simp_all
  exact identity ▸ combined

/-- Relabel matrix indices in a degeneration certificate, retaining all source terms. -/
def matrixRelabel {I J L I' J' L' : Type*}
    [DecidableEq I] [DecidableEq J] [DecidableEq L]
    [DecidableEq I'] [DecidableEq J'] [DecidableEq L']
    (ei : I' ≃ I) (ej : J' ≃ J) (el : L' ≃ L) {rank degree : ℕ}
    (c : Certificate (tensor (K := K) (I := I) (J := J) (L := L)) rank degree) :
    Certificate (tensor (K := K) (I := I') (J := J') (L := L')) rank degree := by
  have pulled := c.pullback (fun x : I' × J' => (ei x.1, ej x.2))
    (fun y : J' × L' => (ej y.1, el y.2)) (fun z : I' × L' => (ei z.1, el z.2))
  have identity : (fun x y z => tensor (K := K) (ei x.1, ej x.2)
      (ej y.1, el y.2) (ei z.1, el z.2)) =
      tensor (K := K) (I := I') (J := J') (L := L') := by
    funext x y z
    simp only [tensor, Equiv.apply_eq_iff_eq]
  exact identity ▸ pulled

/-- Finite-size matrix certificates multiply their numeric dimensions and rank budgets. -/
def finMatrixProduct {a b r s d e : ℕ}
    (left : Certificate (tensor (K := K) (I := Fin a) (J := Fin a) (L := Fin a)) r d)
    (right : Certificate (tensor (K := K) (I := Fin b) (J := Fin b) (L := Fin b)) s e) :
    Certificate (tensor (K := K) (I := Fin (a*b)) (J := Fin (a*b)) (L := Fin (a*b)))
      (r*s) (d+e) :=
  matrixRelabel (Fintype.equivOfCardEq (by simp)) (Fintype.equivOfCardEq (by simp))
    (Fintype.equivOfCardEq (by simp)) (matrixProduct left right)

/-- Power a size-b degeneration k times: rank becomes r^k and leading degree becomes d*k. -/
def matrixPower {base rank degree : ℕ}
    (certificate : Certificate (tensor (K := K) (I := Fin base) (J := Fin base)
      (L := Fin base)) rank degree) (power : ℕ) :
    Certificate (tensor (K := K) (I := Fin (base ^ power)) (J := Fin (base ^ power))
      (L := Fin (base ^ power))) (rank ^ power) (degree * power) := by
  induction power with
  | zero =>
    have budget : RankLE (tensor (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1)) 1 := by
      simpa using (schoolbook_rank (K := K) (I := Fin 1) (J := Fin 1) (L := Fin 1))
    simpa using Certificate.ofDecomposition (Classical.choice budget)
  | succ power ih =>
    simpa only [pow_succ, Nat.mul_succ] using finMatrixProduct ih certificate

/-- One polynomial degeneration supplies exact algorithms at every power size.
The overhead (d*k+1)^2 is polynomial in k, rather than exponential in k. -/
theorem matrix_power_rank {base rank degree : ℕ}
    (certificate : Certificate (tensor (K := K) (I := Fin base) (J := Fin base)
      (L := Fin base)) rank degree) (power : ℕ) :
    RankLE (tensor (K := K) (I := Fin (base ^ power)) (J := Fin (base ^ power))
      (L := Fin (base ^ power))) (rank ^ power * (degree * power + 1) ^ 2) :=
  (matrixPower certificate power).exact_rank

end
end MatrixBounds.Tensor.Degeneration
