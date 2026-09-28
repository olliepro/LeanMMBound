import TensorTranspose
import Mathlib.Tactic.DeriveFintype

/-! All six orderings transport the actual axes, coefficients, and extraction
transformations. Their ordering agrees with the verifier's permutation table. -/
namespace MatrixBounds.Tensor

universe v u
noncomputable section

/-- The six physical orderings of the three tensor axes. -/
inductive AxisOrder where
  | xyz | xzy | yxz | yzx | zxy | zyx
  deriving DecidableEq, Fintype

namespace AxisOrder

/-- Left-axis type after the indicated physical permutation. -/
def left (X Y Z : Type u) : AxisOrder → Type u
  | xyz | xzy => X
  | yxz | yzx => Y
  | zxy | zyx => Z

/-- Middle-axis type after the indicated physical permutation. -/
def middle (X Y Z : Type u) : AxisOrder → Type u
  | xyz | zyx => Y
  | xzy | yzx => Z
  | yxz | zxy => X

/-- Right-axis type after the indicated physical permutation. -/
def right (X Y Z : Type u) : AxisOrder → Type u
  | xyz | yxz => Z
  | xzy | zxy => Y
  | yzx | zyx => X

end AxisOrder

variable {K : Type*} [CommSemiring K] {X Y Z U V W : Type u}

/-- A tensor in one of the six physical axis orders, with its permuted axis types recorded. -/
def orient (order : AxisOrder) (tensor : Coeff K X Y Z) :
    Coeff K (order.left X Y Z) (order.middle X Y Z) (order.right X Y Z) :=
  match order with
  | .xyz => tensor
  | .xzy => cyclic (transposeXY tensor)
  | .yxz => transposeXY tensor
  | .yzx => cyclic tensor
  | .zxy => cyclic (cyclic tensor)
  | .zyx => cyclic (cyclic (transposeXY tensor))

/-- Every physical ordering preserves an actual rank decomposition. -/
theorem rankLE_orient (order : AxisOrder) {tensor : Coeff K X Y Z} {rank : ℕ}
    (algorithm : RankLE tensor rank) : RankLE (orient order tensor) rank := by
  cases order with
  | xyz => exact algorithm
  | xzy => exact rankLE_cyclic (rankLE_transposeXY algorithm)
  | yxz => exact rankLE_transposeXY algorithm
  | yzx => exact rankLE_cyclic algorithm
  | zxy => exact rankLE_cyclic (rankLE_cyclic algorithm)
  | zyx => exact rankLE_cyclic (rankLE_cyclic (rankLE_transposeXY algorithm))

/-- Every physical ordering transports source and target together, preserving the companion-context guarantee. -/
theorem ContextReduction.orient (order : AxisOrder) {source : Coeff K X Y Z} {target : Coeff K U V W} {cost : ℕ}
    (reduction : ContextReduction.{v} source target cost) :
    ContextReduction.{v} (Tensor.orient order source) (Tensor.orient order target) cost := by
  cases order with
  | xyz => exact reduction
  | xzy => exact reduction.transposeXY.cyclic
  | yxz => exact reduction.transposeXY
  | yzx => exact reduction.cyclic
  | zxy => exact reduction.cyclic.cyclic
  | zyx => exact reduction.transposeXY.cyclic.cyclic

/-- All six orderings are present exactly once in the finite physical-order index. -/
theorem axisOrder_card : Fintype.card AxisOrder = 6 := by decide

end
end MatrixBounds.Tensor
