module

public import SuppliedTerminalRationalSplit
public import ShapePermutationComposition
public import CWRationalOrientedParents

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The supplied terminal records use precisely the same original-split plus
physical-role convention as the two higher shared extraction phases. -/
namespace MatrixBounds.Numeric.SuppliedTerminalRationalSplit

open Tensor Tensor.CW Terminal Empirical SuppliedTerminalScaling
noncomputable section

/-- The identity role preserves the original physical terminal child orientation. -/
theorem axes_identity (source : Source) : axes source .xyz = SuppliedTerminalLaws.childAxes source.child := by
  change _*1 = _
  exact mul_one _

/-- Every actual terminal role record is exactly the original physical terminal split transported to that role. -/
theorem split_eq_permute (source : Source) (role : AxisOrder) :
    split source role = (split source .xyz).permute role.permutation := by
  apply RationalSplit.ext_data
  · change Terminal.parent.permute (axes source role) =
      (Terminal.parent.permute (axes source .xyz)).permute role.permutation
    rw [Shape.permute_mul, axes_identity]
    rfl
  · funext child
    change permutedCounts (axes source role) (extreme source) (middle source) child =
      permutedCounts (axes source .xyz) (extreme source) (middle source)
        ((shapeAlphabetPermutation role.permutation 2).symm child)
    rw [axes_identity]
    simp only [axes, permutedCounts, Function.comp_apply, shapeAlphabetPermutation_mul_symm]

/-- The forced terminal one-letter laws transform exactly with the physical child shape. -/
theorem law_role (role : AxisOrder) (axis : Fin 3) (child : ShapeAlphabet 2) :
    law (role.permutation axis) ((shapeAlphabetPermutation role.permutation 2).symm child) = law axis child := by
  have coordinate := shapeCoordinate_permutation role.permutation 2
    ((shapeAlphabetPermutation role.permutation 2).symm child) axis
  rw [Equiv.apply_symm_apply] at coordinate
  unfold law
  rw [← coordinate]

/-- The generic physical child-law transformation agrees with the actual supplied terminal laws. -/
theorem roleLaw_eq {T : Type*} (role : T → AxisOrder) (axis : Fin 3) (type : T) :
    Mixed.roleLaw (length := fun _ => 1) role (fun _ => law) axis type = law axis := by
  funext child
  exact law_role (role type) axis child

end
end MatrixBounds.Numeric.SuppliedTerminalRationalSplit
