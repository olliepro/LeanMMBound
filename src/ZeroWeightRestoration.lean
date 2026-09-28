import WeightedPools

/-! Zero-population factors can also be restored after an extraction, since
their complete empirical windows are the scalar one on their empty axes. -/
namespace MatrixBounds.Interface

open Tensor
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K]
variable {X Y Z BX BY BZ : T → Type*}

/-- Restore all zero coefficient labels, with every positive factor and every empirical window unchanged. -/
def restoreZeroWeightRestriction (weight : T → ℕ) (size : ℕ)
    (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (partX : ∀ type, X type → BX type) (partY : ∀ type, Y type → BY type) (partZ : ∀ type, Z type → BZ type)
    (lawX : ∀ type, BX type → ℝ) (lawY : ∀ type, BY type → ℝ) (lawZ : ∀ type, BZ type → ℝ) (tolerance : T → ℝ) :
    CoordinateRestriction
      (heterogeneous (fun type : PositiveWeight weight => windowedPower (P := Fin (weight type.val*size)) (family type.val)
        (partX type.val) (partY type.val) (partZ type.val) (lawX type.val) (lawY type.val) (lawZ type.val) (tolerance type.val)))
      (heterogeneous (fun type => windowedPower (P := Fin (weight type*size)) (family type) (partX type) (partY type) (partZ type)
        (lawX type) (lawY type) (lawZ type) (tolerance type))) where
  left entries type := entries type.val
  middle entries type := entries type.val
  right entries type := entries type.val
  coefficient x y z :=
    (positive_weight_identity weight size family partX partY partZ lawX lawY lawZ tolerance
      (fun type => x type.val) (fun type => y type.val) (fun type => z type.val)).symm

end
end MatrixBounds.Interface
