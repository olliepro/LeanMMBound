import CWPrescribedGraph
import CWRootData

/-! Canonical coarse data for approximate extraction. Fine profiles are supplied
by the complete window gluing, so the initial record only needs its coarse law. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p

namespace SplitRestrictionData

/-- Construct a split record from coarse counts, computing all three marginals. -/
def fromCoarse {length : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (split : ShapeAlphabet (2*length) → ℕ) : SplitRestrictionData length where
  parent := parent
  balanced := balanced
  coarseX := marginalProfile split shapeXIndex
  coarseY := marginalProfile split shapeYIndex
  coarseZ := marginalProfile split shapeZIndex
  split := split
  fineX := fun _ _ => 0
  fineY := fun _ _ => 0
  fineZ := fun _ _ => 0
  zeroZ := by intros; rfl
  zeroX := by intros; rfl
  zeroY := by intros; rfl

/-- A supported word supplies all graph and marginal proofs for the canonical record. -/
def fromCoarseReference {P : Type*} [Fintype P] {length : ℕ}
    (parent : Shape) (balanced : parent.total = 2*(2*length))
    (split : ShapeAlphabet (2*length) → ℕ) (word : TypedWord (P := P) split)
    (supported : ∀ position, (word.val position).val.Fits parent) :
    (fromCoarse parent balanced split).PrescribedEdges (P := P) := by
  refine ⟨⟨fun position => ⟨word.val position, supported position⟩, ?_, ?_, ?_⟩, ?_⟩
  · exact hasType_projected split shapeXIndex word.val word.property
  · exact hasType_projected split shapeYIndex word.val word.property
  · exact hasType_projected split shapeZIndex word.val word.property
  · exact word.property

end SplitRestrictionData

namespace RootRestrictionData

/-- Construct unrestricted root data directly from its single coarse profile. -/
def fromCoarse {length : ℕ} (split : ShapeAlphabet (2*length) → ℕ) : RootRestrictionData length where
  split := split
  fineX := fun _ _ => 0
  fineY := fun _ _ => 0
  fineZ := fun _ _ => 0
  zeroZ := by intros; rfl
  zeroX := by intros; rfl
  zeroY := by intros; rfl

end RootRestrictionData
end
end MatrixBounds.Tensor.CW
