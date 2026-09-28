import HeterogeneousRegrouping

/-! Flat ordinary product labels and nested labelled tensor products carry
exactly the same complete coordinate variables and coefficient product. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {K T S : Type*} [CommSemiring K] [Fintype T] [Fintype S]
variable {X Y Z : T → S → Type*}

/-- Flatten two ordinary factor labels into their complete product label. -/
def flattenProductRestriction (family : ∀ first second, Coeff K (X first second) (Y first second) (Z first second)) :
    CoordinateRestriction (heterogeneous (fun first => heterogeneous (family first)))
      (heterogeneous (fun index : T × S => family index.1 index.2)) where
  left entries first second := entries (first, second)
  middle entries first second := entries (first, second)
  right entries first second := entries (first, second)
  coefficient _ _ _ := by simp only [heterogeneous, Fintype.prod_prod_type]

/-- Restore both ordinary factor labels as separate tensor-product levels. -/
def unflattenProductRestriction (family : ∀ first second, Coeff K (X first second) (Y first second) (Z first second)) :
    CoordinateRestriction (heterogeneous (fun index : T × S => family index.1 index.2))
      (heterogeneous (fun first => heterogeneous (family first))) where
  left entries index := entries index.1 index.2
  middle entries index := entries index.1 index.2
  right entries index := entries index.1 index.2
  coefficient _ _ _ := by simp only [heterogeneous, Fintype.prod_prod_type]

/-- Restore original factor labels after a bijective reindexing, with their dependent axis types unchanged. -/
def inverseReindexRestriction (labels : T ≃ S) {A B C : S → Type*}
    (family : ∀ index, Coeff K (A index) (B index) (C index)) :
    CoordinateRestriction (heterogeneous (fun index : T => family (labels index))) (heterogeneous family) where
  left entries index := entries (labels index)
  middle entries index := entries (labels index)
  right entries index := entries (labels index)
  coefficient x y z := Equiv.prod_comp labels (fun index => family index (x index) (y index) (z index))

end
end MatrixBounds.Interface
