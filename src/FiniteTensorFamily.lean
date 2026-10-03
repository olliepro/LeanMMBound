module

public import HeterogeneousRegrouping
public import SixfoldExtraction

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite coordinate tensors packaged for dependent finite schedules. The
package only records existing axes and coefficients; it adds no assumptions. -/
namespace MatrixBounds.Tensor

open Interface
noncomputable section
local instance (A : Type*) : DecidableEq A := Classical.decEq A

/-- A finite tensor together with its three coordinate types and their actual finite enumerations. -/
structure FiniteTensor (K : Type) where
  Left : Type
  Middle : Type
  Right : Type
  finiteLeft : Fintype Left
  finiteMiddle : Fintype Middle
  finiteRight : Fintype Right
  coefficient : Coeff K Left Middle Right

attribute [instance] FiniteTensor.finiteLeft FiniteTensor.finiteMiddle FiniteTensor.finiteRight

variable {K : Type} [CommSemiring K]

/-- Package an existing finite coefficient tensor without changing its coordinates; for example `ofCoeff (completeMatrix K I J L)`. -/
def FiniteTensor.ofCoeff {X Y Z : Type} [Fintype X] [Fintype Y] [Fintype Z]
    (tensor : Coeff K X Y Z) : FiniteTensor K :=
  ⟨X, Y, Z, inferInstance, inferInstance, inferInstance, tensor⟩

/-- Package the product of two finite tensors, preserving both coordinate labels. -/
def FiniteTensor.product (first second : FiniteTensor K) : FiniteTensor K :=
  .ofCoeff (Tensor.product first.coefficient second.coefficient)

/-- Package a separately labelled finite product of finite tensors. -/
def FiniteTensor.heterogeneous {T : Type} [Fintype T] (family : T → FiniteTensor K) : FiniteTensor K :=
  .ofCoeff (Interface.heterogeneous (fun label => (family label).coefficient))

/-- Package all six physical orientations of an actual finite tensor. -/
def FiniteTensor.sixfold (tensor : FiniteTensor K) : FiniteTensor K :=
  .ofCoeff (Interface.heterogeneous (fun order : AxisOrder => orient order tensor.coefficient))

end
end MatrixBounds.Tensor
