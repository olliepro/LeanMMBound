module

public import PolynomialDegeneration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Cyclic coordinate permutations preserve explicit rank and degeneration certificates. -/
namespace MatrixBounds.Tensor

open scoped BigOperators
noncomputable section
variable {K X Y Z R : Type*} [CommSemiring K]

/-- Rotate the three tensor axes from X,Y,Z to Y,Z,X. -/
def cyclic (tensor : Coeff K X Y Z) : Coeff K Y Z X := fun y z x => tensor x y z

/-- Rotating a decomposition preserves its number of scalar products. -/
def Decomposition.cyclic [Fintype R] {tensor : Coeff K X Y Z} (decomposition : Decomposition tensor R) :
    Decomposition (Tensor.cyclic tensor) R where
  left := decomposition.middle
  middle := decomposition.right
  right := decomposition.left
  reconstruct y z x := by
    rw [Tensor.cyclic, decomposition.reconstruct]
    apply Finset.sum_congr rfl
    intro term _
    ring

/-- Tensor rank budgets are unchanged by cyclic permutation. -/
theorem rankLE_cyclic {tensor : Coeff K X Y Z} {rank : ℕ} (budget : RankLE tensor rank) :
    RankLE (cyclic tensor) rank := by
  obtain ⟨decomposition⟩ := budget
  exact ⟨decomposition.cyclic⟩

/-- Polynomial degenerations rotate with the same rank and leading degree. -/
def Degeneration.Certificate.cyclic {tensor : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate tensor rank degree) : Certificate (Tensor.cyclic tensor) rank degree where
  polynomialTensor := Tensor.cyclic certificate.polynomialTensor
  decomposition := certificate.decomposition.cyclic
  lower_zero y z x := certificate.lower_zero x y z
  leading := by
    funext y z x
    exact congrFun (congrFun (congrFun certificate.leading x) y) z

end
end MatrixBounds.Tensor
