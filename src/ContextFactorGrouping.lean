import Level3TransitionRegrouping
import ContextProductReductions

/-! Explicit product grouping maps for the waiting and active factors of a
batch. Both directions preserve the complete coordinate triples. -/
namespace MatrixBounds.Tensor

open Interface
noncomputable section
variable {K : Type} [CommSemiring K]

/-- Reassociate three factors to expose the full waiting product on the left. -/
def associateLeftRestriction {X Y Z U V W A B C : Type}
    (first : Coeff K X Y Z) (second : Coeff K U V W) (third : Coeff K A B C) :
    CoordinateRestriction (product first (product second third)) (product (product first second) third) where
  left entry := (entry.1.1, entry.1.2, entry.2)
  middle entry := (entry.1.1, entry.1.2, entry.2)
  right entry := (entry.1.1, entry.1.2, entry.2)
  coefficient _ _ _ := (mul_assoc _ _ _).symm

/-- Restore the nested waiting and active factor grouping. -/
def associateRightRestriction {X Y Z U V W A B C : Type}
    (first : Coeff K X Y Z) (second : Coeff K U V W) (third : Coeff K A B C) :
    CoordinateRestriction (product (product first second) third) (product first (product second third)) where
  left entry := ((entry.1, entry.2.1), entry.2.2)
  middle entry := ((entry.1, entry.2.1), entry.2.2)
  right entry := ((entry.1, entry.2.1), entry.2.2)
  coefficient _ _ _ := mul_assoc _ _ _

/-- Six orientations of a product separate into the six orientations of each original factor. -/
def sixfoldProductRestriction {X Y Z U V W : Type}
    (first : Coeff K X Y Z) (second : Coeff K U V W) :
    CoordinateRestriction (heterogeneous (fun order : AxisOrder => orient order (product first second)))
      (product (heterogeneous (fun order : AxisOrder => orient order first))
        (heterogeneous (fun order : AxisOrder => orient order second))) :=
  (CoordinateRestriction.heterogeneous (fun order => level3OrientProductRestriction order first second)).trans
    (level3CollectProductsRestriction (fun order => orient order first) (fun order => orient order second))

end
end MatrixBounds.Tensor
