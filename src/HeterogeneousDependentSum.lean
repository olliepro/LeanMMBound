import HeterogeneousRegrouping

/-! Split a dependent tensor family on a sum of labels without requiring its
coordinate types to be syntactically expressed through Sum.elim. -/
namespace MatrixBounds.Interface

open Tensor
noncomputable section
variable {K A B : Type*} [CommSemiring K] [Fintype A] [Fintype B]

/-- Separate the two exact classes of a dependent sum-labelled tensor family. -/
def splitSumRestriction {X Y Z : A ⊕ B → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (heterogeneous family)
      (product (heterogeneous (fun a => family (.inl a))) (heterogeneous (fun b => family (.inr b)))) where
  left entries index := by cases index with | inl a => exact entries.1 a | inr b => exact entries.2 b
  middle entries index := by cases index with | inl a => exact entries.1 a | inr b => exact entries.2 b
  right entries index := by cases index with | inl a => exact entries.1 a | inr b => exact entries.2 b
  coefficient x y z := by simp only [heterogeneous, Fintype.prod_sum_type, product]

/-- Restore both exact classes into their original dependent sum-labelled tensor family. -/
def restoreSumRestriction {X Y Z : A ⊕ B → Type*}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction
      (product (heterogeneous (fun a => family (.inl a))) (heterogeneous (fun b => family (.inr b))))
      (heterogeneous family) where
  left entries := (fun a => entries (.inl a), fun b => entries (.inr b))
  middle entries := (fun a => entries (.inl a), fun b => entries (.inr b))
  right entries := (fun a => entries (.inl a), fun b => entries (.inr b))
  coefficient x y z := by simp only [heterogeneous, Fintype.prod_sum_type, product]

end
end MatrixBounds.Interface
