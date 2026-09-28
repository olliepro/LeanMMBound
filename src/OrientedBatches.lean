import TensorOrientations

/-! Axis permutations preserve the entire newly extracted direct sum. Copy
indices stay aligned on all three physical axes. -/
namespace MatrixBounds.Tensor

universe v u
noncomputable section
variable {K : Type*} [CommSemiring K]
variable {X Y Z : Type*} {I : Type} [DecidableEq I]

/-- Cycling a uniform batch cycles each tensor and retains its independent copy labels. -/
theorem cyclic_batch (target : Coeff K X Y Z) :
    cyclic (directSum (fun _ : I => target)) = directSum (fun _ : I => cyclic target) := by
  funext x y z
  simp only [cyclic, directSum]
  split_ifs <;> simp_all

/-- Swapping a uniform batch's first two axes retains the same independent copy labels. -/
theorem transposeXY_batch (target : Coeff K X Y Z) :
    transposeXY (directSum (fun _ : I => target)) = directSum (fun _ : I => transposeXY target) := by
  funext x y z
  simp only [transposeXY, directSum]
  split_ifs <;> simp_all

/-- Cycling a contextual extraction rotates every complete output copy. -/
theorem ContextReduction.cyclic_extraction {U V W : Type*}
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source (directSum (fun _ : I => target)) cost) :
    ContextReduction.{v} (Tensor.cyclic source) (directSum (fun _ : I => Tensor.cyclic target)) cost := by
  rw [← cyclic_batch]
  exact reduction.cyclic

/-- Swapping a contextual extraction rotates every complete output copy. -/
theorem ContextReduction.transposeXY_extraction {U V W : Type*}
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source (directSum (fun _ : I => target)) cost) :
    ContextReduction.{v} (Tensor.transposeXY source) (directSum (fun _ : I => Tensor.transposeXY target)) cost := by
  rw [← transposeXY_batch]
  exact reduction.transposeXY

/-- All six physical orderings preserve the proved number of output copies and the contextual overhead. -/
theorem ContextReduction.orient_extraction {X Y Z U V W : Type u} (order : AxisOrder)
    {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source (directSum (fun _ : I => target)) cost) :
    ContextReduction.{v} (Tensor.orient order source) (directSum (fun _ : I => Tensor.orient order target)) cost := by
  cases order with
  | xyz => exact reduction
  | xzy => exact reduction.transposeXY_extraction.cyclic_extraction
  | yxz => exact reduction.transposeXY_extraction
  | yzx => exact reduction.cyclic_extraction
  | zxy => exact reduction.cyclic_extraction.cyclic_extraction
  | zyx => exact reduction.transposeXY_extraction.cyclic_extraction.cyclic_extraction

end
end MatrixBounds.Tensor
