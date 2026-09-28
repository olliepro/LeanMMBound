import TensorOrientations
import HeterogeneousRegrouping

/-! Physical permutations commute with separately labelled tensor products
through explicit coordinate maps; no factor labels or laws are merged. -/
namespace MatrixBounds.Tensor

universe u
open Interface
noncomputable section
variable {K T : Type*} [CommSemiring K] [Fintype T] {X Y Z : T → Type u}

/-- Regroup factors sharing one physical order into the same order of their complete labelled product. -/
def orientHeterogeneousRestriction (order : AxisOrder) (family : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    CoordinateRestriction (heterogeneous (fun type => orient order (family type))) (orient order (heterogeneous family)) := by
  cases order <;> exact ⟨id, id, id, fun _ _ _ => rfl⟩

/-- Restore an oriented labelled product to its individually oriented factors. -/
def heterogeneousOrientRestriction (order : AxisOrder) (family : ∀ type, Coeff K (X type) (Y type) (Z type)) :
    CoordinateRestriction (orient order (heterogeneous family)) (heterogeneous (fun type => orient order (family type))) := by
  cases order <;> exact ⟨id, id, id, fun _ _ _ => rfl⟩

end
end MatrixBounds.Tensor
