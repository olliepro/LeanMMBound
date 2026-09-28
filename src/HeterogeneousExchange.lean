import HeterogeneousRegrouping

/-! Exchange independent product axes by explicit complete coordinate maps. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {K A B : Type*} [CommSemiring K] [Fintype A] [Fintype B]

/-- Exchange the outer order of two finite tensor families without merging or deleting any factors. -/
def exchangeRestriction {X Y Z : A → B → Type*}
    (family : ∀ a b, Coeff K (X a b) (Y a b) (Z a b)) :
    CoordinateRestriction (heterogeneous (fun a => heterogeneous (family a)))
      (heterogeneous (fun b => heterogeneous (fun a => family a b))) where
  left entries a b := entries b a
  middle entries a b := entries b a
  right entries a b := entries b a
  coefficient x y z := by
    simp only [heterogeneous]
    exact Finset.prod_comm

end
end MatrixBounds.Interface
