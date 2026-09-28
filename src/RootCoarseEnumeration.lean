import CoarseLogExpressions
import CWRootGraph

/-! Reindex the complete unrestricted root by executable source columns. -/
namespace MatrixBounds.Numeric

open Tensor.CW Entropy Empirical
open scoped BigOperators
noncomputable section

/-- A coordinate marginal can be evaluated in any complete finite column enumeration. -/
theorem rationalMarginal_enumeration {A B : Type*} [Fintype A] [DecidableEq B] {n : ℕ}
    (enumeration : Fin n ≃ A) (mass : A → ℚ) (coordinate : A → B) (value : B) :
    rationalMarginal mass coordinate value =
      ∑ column : Fin n, if coordinate (enumeration column) = value then mass (enumeration column) else 0 := by
  unfold rationalMarginal
  rw [← enumeration.sum_comp]
  apply Finset.sum_congr rfl
  intro column _
  split_ifs <;> rfl

/-- Every complete root shape is admissible in its enclosing box. -/
def rootSplitEquiv (total : ℕ) : ShapeAlphabet total ≃ SplitAlphabet (rootBox total) total where
  toFun child := ⟨child, shape_fits_rootBox child⟩
  invFun child := child.val
  left_inv _ := rfl
  right_inv _ := rfl

/-- The root Gibbs sum is exactly the sum over its complete original column alphabet. -/
theorem rationalGibbsNormalizer_root_enumeration {length n : ℕ}
    (enumeration : Fin n ≃ ShapeAlphabet (2*length))
    (ux uy uz : Fin (2*length+1) → ℚ) :
    rationalGibbsNormalizer (rootBox (2*length)) ux uy uz =
      ∑ column : Fin n, ux (shapeXIndex (enumeration column))*
        uy (shapeYIndex (enumeration column))*uz (shapeZIndex (enumeration column)) := by
  unfold rationalGibbsNormalizer
  exact ((enumeration.trans (rootSplitEquiv (2*length))).sum_comp _).symm

end
end MatrixBounds.Numeric
