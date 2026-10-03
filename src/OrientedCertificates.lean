module

public import TensorOrientations

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual polynomial degeneration certificates preserve their original rank
and leading degree under every physical coordinate ordering. -/
namespace MatrixBounds.Tensor.Degeneration.Certificate

universe u
noncomputable section
variable {K : Type*} [CommSemiring K] {X Y Z : Type u}

/-- Rotate or transpose an explicit polynomial certificate without changing its rank or leading degree. -/
def orient (order : AxisOrder) {tensor : Coeff K X Y Z} {rank degree : ℕ}
    (certificate : Certificate tensor rank degree) : Certificate (Tensor.orient order tensor) rank degree := by
  cases order with
  | xyz => exact certificate
  | xzy => exact certificate.transposeXY.cyclic
  | yxz => exact certificate.transposeXY
  | yzx => exact certificate.cyclic
  | zxy => exact certificate.cyclic.cyclic
  | zyx => exact certificate.transposeXY.cyclic.cyclic

end
end MatrixBounds.Tensor.Degeneration.Certificate
