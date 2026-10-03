module

public import CWPermutedTerminalData

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Repeated original terminal counts agree exactly on every complete child
shape, including inadmissible and zero-population children. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Numeric Empirical
noncomputable section

/-- Multiplying both terminal counts multiplies the entire physically permuted split profile. -/
theorem permutedCounts_mul (axes : Equiv.Perm (Fin 3)) (extreme middle repetitions : ℕ) (child : ShapeAlphabet 2) :
    permutedCounts axes (repetitions*extreme) (repetitions*middle) child =
      repetitions*permutedCounts axes extreme middle child := by
  simp only [permutedCounts, Function.comp_apply, fullCounts_formula]
  split_ifs <;> simp

end
end MatrixBounds.Tensor.CW.Terminal
