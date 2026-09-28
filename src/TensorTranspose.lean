import TensorCyclic
import ContextComposition

/-! Swapping two axes and cycling axes preserve actual tensor transformations,
so extraction roles can be transported to all six physical orderings. -/
namespace MatrixBounds.Tensor

universe v
open scoped BigOperators
noncomputable section
variable {K X Y Z U V W R : Type*} [CommSemiring K]

/-- Exchange the first two tensor axes. -/
def transposeXY (tensor : Coeff K X Y Z) : Coeff K Y X Z := fun y x z => tensor x y z

/-- A transposed rank decomposition uses the original factors in exchanged order. -/
def Decomposition.transposeXY [Fintype R] {tensor : Coeff K X Y Z} (algorithm : Decomposition tensor R) :
    Decomposition (Tensor.transposeXY tensor) R where
  left := algorithm.middle
  middle := algorithm.left
  right := algorithm.right
  reconstruct y x z := by
    rw [Tensor.transposeXY, algorithm.reconstruct]
    apply Finset.sum_congr rfl
    intro term _
    ring

/-- Exchanging two axes preserves the rank budget. -/
theorem rankLE_transposeXY {tensor : Coeff K X Y Z} {rank : ℕ} (algorithm : RankLE tensor rank) :
    RankLE (transposeXY tensor) rank := by
  obtain ⟨decomposition⟩ := algorithm
  exact ⟨decomposition.transposeXY⟩

/-- Exchanging axes preserves an explicit polynomial degeneration and its leading degree. -/
def Degeneration.Certificate.transposeXY {tensor : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate tensor rank degree) : Certificate (Tensor.transposeXY tensor) rank degree where
  polynomialTensor := Tensor.transposeXY certificate.polynomialTensor
  decomposition := certificate.decomposition.transposeXY
  lower_zero y x z := certificate.lower_zero x y z
  leading := by
    funext y x z
    exact congrFun (congrFun (congrFun certificate.leading x) y) z

/-- Cycling source and target axes transports an extraction while preserving arbitrary companion tensors. -/
theorem ContextReduction.cyclic {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) :
    ContextReduction.{v} (Tensor.cyclic source) (Tensor.cyclic target) cost := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  have input : RankLE (product (Tensor.cyclic (Tensor.cyclic companion)) source) rank :=
    rankLE_cyclic (rankLE_cyclic algorithm)
  exact rankLE_cyclic (reduction C A B (Tensor.cyclic (Tensor.cyclic companion)) rank input)

/-- Exchanging source and target axes transports an extraction while preserving arbitrary companion tensors. -/
theorem ContextReduction.transposeXY {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) :
    ContextReduction.{v} (Tensor.transposeXY source) (Tensor.transposeXY target) cost := by
  intro A B C finiteA finiteB finiteC companion rank algorithm
  have input : RankLE (product (Tensor.transposeXY companion) source) rank := rankLE_transposeXY algorithm
  exact rankLE_transposeXY (reduction B A C (Tensor.transposeXY companion) rank input)

end
end MatrixBounds.Tensor
