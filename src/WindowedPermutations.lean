import WindowedInterface
import TensorTranspose

/-! Axis permutations move the actual empirical windows with their axes. -/
namespace MatrixBounds.Interface

open Tensor Empirical
noncomputable section
variable {K P X Y Z BX BY BZ : Type*} [CommSemiring K] [Fintype P]

/-- Cycling an approximate power cycles its coefficient tensor, part maps, and nominal laws together. -/
theorem cyclic_windowedPower (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) :
    cyclic (windowedPower (P := P) tensor partX partY partZ lawX lawY lawZ tolerance) =
      windowedPower (P := P) (cyclic tensor) partY partZ partX lawY lawZ lawX tolerance := by
  funext x y z
  simp only [cyclic, windowedPower, acceptedTensor, heterogeneous]
  congr 1
  apply propext
  tauto

/-- Swapping an approximate power's first two axes also swaps its complete fine-law constraints. -/
theorem transposeXY_windowedPower (tensor : Coeff K X Y Z) (partX : X → BX) (partY : Y → BY) (partZ : Z → BZ)
    (lawX : BX → ℝ) (lawY : BY → ℝ) (lawZ : BZ → ℝ) (tolerance : ℝ) :
    transposeXY (windowedPower (P := P) tensor partX partY partZ lawX lawY lawZ tolerance) =
      windowedPower (P := P) (transposeXY tensor) partY partX partZ lawY lawX lawZ tolerance := by
  funext x y z
  simp only [transposeXY, windowedPower, acceptedTensor, heterogeneous]
  congr 1
  apply propext
  tauto

end
end MatrixBounds.Interface
