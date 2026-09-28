import HeterogeneousProductRegrouping
import HeterogeneousFiniteRegrouping
import TensorOrientations

/-! Finite factor regroupings used by the complete level-three transition. -/
namespace MatrixBounds.Interface

open Tensor
open scoped BigOperators
noncomputable section
variable {K T S : Type} [CommSemiring K] [Fintype T] [Fintype S]

/-- Split a dependent sum family into its two complete labelled tensor products. -/
def level3SumPartitionRestriction {X Y Z : T ⊕ S → Type}
    (family : ∀ index, Coeff K (X index) (Y index) (Z index)) :
    CoordinateRestriction (heterogeneous family)
      (product (heterogeneous (fun index : T => family (.inl index)))
        (heterogeneous (fun index : S => family (.inr index)))) where
  left entries := Sum.rec entries.1 entries.2
  middle entries := Sum.rec entries.1 entries.2
  right entries := Sum.rec entries.1 entries.2
  coefficient _ _ _ := by simp only [heterogeneous, Fintype.prod_sum_type, product]

/-- Collect the separately labelled first and second factors of every source sector. -/
def level3CollectProductsRestriction {X Y Z U V W : T → Type}
    (first : ∀ index, Coeff K (X index) (Y index) (Z index))
    (second : ∀ index, Coeff K (U index) (V index) (W index)) :
    CoordinateRestriction (heterogeneous (fun index => product (first index) (second index)))
      (product (heterogeneous first) (heterogeneous second)) where
  left entries index := (entries.1 index, entries.2 index)
  middle entries index := (entries.1 index, entries.2 index)
  right entries index := (entries.1 index, entries.2 index)
  coefficient _ _ _ := by simp only [heterogeneous, product, Finset.prod_mul_distrib]

/-- Separate both independent factors inside any physical orientation. -/
def level3OrientProductRestriction {X Y Z U V W : Type}
    (order : AxisOrder) (first : Coeff K X Y Z) (second : Coeff K U V W) :
    CoordinateRestriction (orient order (product first second))
      (product (orient order first) (orient order second)) := by
  cases order <;> exact ⟨id, id, id, fun _ _ _ => rfl⟩

end
end MatrixBounds.Interface
