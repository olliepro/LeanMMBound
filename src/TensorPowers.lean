module

public import PolynomialDegeneration
public import CoppersmithWinograd
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Tensor powers in word bases, including explicit polynomial certificates for
the eightfold CW source used by the numerical parameter file. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
open Degeneration
noncomputable section
variable {K X Y Z : Type*} [CommSemiring K]

/-- The n-fold tensor power, with axis coordinates represented as length-n words. -/
def wordPower (tensor : Coeff K X Y Z) (length : ℕ) :
    Coeff K (Fin length → X) (Fin length → Y) (Fin length → Z) :=
  fun x y z => ∏ i, tensor (x i) (y i) (z i)

/-- Split off the last tensor factor by explicit coordinate maps. -/
theorem wordPower_succ (tensor : Coeff K X Y Z) (length : ℕ) :
    (fun x y z => product (wordPower tensor length) tensor
      ((fun i => x i.castSucc), x (Fin.last length))
      ((fun i => y i.castSucc), y (Fin.last length))
      ((fun i => z i.castSucc), z (Fin.last length))) = wordPower tensor (length+1) := by
  funext x y z
  simp only [product, wordPower, Fin.prod_univ_castSucc]

/-- Power a polynomial degeneration in word bases; ranks multiply and leading degrees add. -/
def Degeneration.Certificate.wordPower {tensor : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate tensor rank degree) (length : ℕ) :
    Certificate (Tensor.wordPower tensor length) (rank ^ length) (degree * length) := by
  induction length with
  | zero =>
    let exact : Decomposition (Tensor.wordPower tensor 0) (Fin 1) := {
      left _ _ := 1
      middle _ _ := 1
      right _ _ := 1
      reconstruct x y z := by simp [Tensor.wordPower] }
    simpa only [pow_zero, Nat.mul_zero] using Certificate.ofDecomposition exact
  | succ length ih =>
    have result := (ih.product certificate).pullback
      (fun x : Fin (length+1) → X => ((fun i => x i.castSucc), x (Fin.last length)))
      (fun y : Fin (length+1) → Y => ((fun i => y i.castSucc), y (Fin.last length)))
      (fun z : Fin (length+1) → Z => ((fun i => z i.castSucc), z (Fin.last length)))
    rw [wordPower_succ] at result
    simpa only [pow_succ, Nat.mul_succ] using result

/-- Exact coefficient extraction after powering a polynomial degeneration has only quadratic overhead. -/
theorem wordPower_rank {tensor : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate tensor rank degree) (length : ℕ) :
    RankLE (wordPower tensor length) (rank ^ length * (degree * length + 1) ^ 2) :=
  (certificate.wordPower length).exact_rank

/-- The q=5 level-four source has a 7^8-term polynomial degeneration of degree 24. -/
def cwLevelFourCertificate {K : Type*} [CommRing K] :
    Certificate (wordPower (CW.tensor (K := K) 5) 8) (7^8) 24 := by
  simpa using (CW.certificate (K := K) 5).wordPower 8

end
end MatrixBounds.Tensor
