module

public import SuppliedRootFineFastArithmetic

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact integer leaf numerators share the original dyadic denominator.
Their rational interpretations are the complete supplied physical leaf laws. -/
namespace MatrixBounds.Numeric.SuppliedRootFineLeafIntegers

open Tensor.CW
noncomputable section

/-- Signed integer numerator of an actual terminal orbit mass at denominator 2^44. -/
def terminal (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 6) : ℤ :=
  if SuppliedTerminalLaws.childAxes child axis = 2 then
    if orbit = 2 then 2*(SuppliedRootFineTerminalLookup.numerator node child strategy : ℤ)
    else if orbit = 3 then 17592186044416-2*(SuppliedRootFineTerminalLookup.numerator node child strategy : ℤ)
    else 0
  else if orbit = 1 then 17592186044416 else 0

/-- Each terminal integer numerator has exactly its original complete rational orbit interpretation. -/
theorem terminal_value (node : Fin 945) (child : Fin 3) (strategy : Fin 6) (axis : Fin 3) (orbit : Fin 6) :
    (terminal node child strategy axis orbit : ℚ)/17592186044416 =
      SuppliedRootFineFastArithmetic.terminalMass node child strategy axis orbit := by
  simp only [terminal, SuppliedRootFineFastArithmetic.terminalMass, ite_apply,
    SuppliedTerminalLaws.ternaryMass, SuppliedTerminalLaws.binaryMass, SuppliedRootFineTerminalLookup.mu]
  split_ifs <;> push_cast <;> ring

/-- Signed integer numerator of every original physical zero-leaf orbit at denominator 2^44. -/
def zero (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (shape : Shape) (axis : Fin 3) (orbit : Fin 6) : ℤ :=
  if axis = SuppliedLeafLaws.zeroAxis shape then if orbit = 0 then 17592186044416 else 0
  else if axis = SuppliedLeafLaws.positiveAxis shape then
    (SuppliedTypedParameters.zero2 node child strategy).numerator orbit
  else (SuppliedTypedParameters.zero2 node child strategy).numerator (OrbitLevel2.complement orbit)

/-- Every integer zero-leaf numerator is exactly the corresponding supplied rational mass. -/
theorem zero_value (node : Fin 945) (child : Fin 12) (strategy : Fin 6) (shape : Shape) (axis : Fin 3) (orbit : Fin 6) :
    (zero node child strategy shape axis orbit : ℚ)/17592186044416 =
      SuppliedLeafLaws.zeroMass node child strategy shape axis orbit := by
  simp only [zero, SuppliedLeafLaws.zeroMass, ite_apply]
  split_ifs <;> simp only [TypedProbabilityRow.rational, Int.cast_natCast, Int.cast_ofNat,
    Int.cast_zero, Nat.cast_ofNat, div_self (by norm_num : (17592186044416 : ℚ) ≠ 0), zero_div]

/-- Complete original two-letter integer child masses, including positive and zero-coordinate children. -/
def leaf (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) (orbit : Fin 6) : ℤ :=
  match SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm child) with
  | Sum.inl selected => zero node selected strategy child.val axis orbit
  | Sum.inr selected => terminal node selected strategy axis orbit

/-- The complete integer leaf vector is exactly the original supplied rational law at the common denominator. -/
theorem leaf_value (node : Fin 945) (strategy : Fin 6) (child : ShapeAlphabet 4) (axis : Fin 3) (orbit : Fin 6) :
    (leaf node strategy child axis orbit : ℚ)/17592186044416 =
      SuppliedRootFineFastArithmetic.leafMass node strategy child axis orbit := by
  unfold leaf SuppliedRootFineFastArithmetic.leafMass
  cases selected : SuppliedChildKinds.kind2 ((shapeColumnEquiv 4).symm child) with
  | inl value => exact zero_value node value strategy child.val axis orbit
  | inr value => exact terminal_value node value strategy axis orbit

end
end MatrixBounds.Numeric.SuppliedRootFineLeafIntegers
