import CWPrescribedGraph
import HashIntegerWords

/-! The actual product coarse graph for different parent types and recursion
levels, with all positions in one disjoint union for a single global hash. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} {Positions : T → Type*} {length : T → ℕ}

/-- A global edge chooses a complete admissible marginal word for every parent type. -/
abbrev Edges (Positions : T → Type*) (data : ∀ type, SplitRestrictionData (length type)) :=
  ∀ type, (data type).Edges (P := Positions type)

/-- Prescribed global edges keep each parent type's own exact joint split profile. -/
abbrev PrescribedEdges (Positions : T → Type*) (data : ∀ type, SplitRestrictionData (length type)) :=
  ∀ type, (data type).PrescribedEdges (P := Positions type)

/-- Read a prescribed product edge as an edge of the entire marginal graph. -/
def forget (data : ∀ type, SplitRestrictionData (length type))
    (edge : PrescribedEdges Positions data) : Edges Positions data := fun type => (edge type).val

/-- Prescribed global edges remain distinct in the complete global graph. -/
theorem forget_injective (data : ∀ type, SplitRestrictionData (length type)) :
    Function.Injective (forget (Positions := Positions) data) := by
  intro left right same
  funext type
  exact Subtype.ext (congrFun same type)

/-- Read all natural coarse coordinates on the common disjoint union of parent positions. -/
def naturalEdge (data : ∀ type, SplitRestrictionData (length type)) (edge : Edges Positions data) :
    CoarseEdge ℕ ((type : T) × Positions type) :=
  ⟨fun position => (splitWordEdge (edge position.1).val).x position.2,
    fun position => (splitWordEdge (edge position.1).val).y position.2,
    fun position => (splitWordEdge (edge position.1).val).z position.2⟩

/-- The coordinate total may vary with the parent type; it is fixed at each position. -/
def total (length : T → ℕ) (position : (type : T) × Positions type) : ℕ := 2*length position.1

/-- Every actual global edge satisfies the varying coordinate-sum equation. -/
theorem naturalEdge_valid (data : ∀ type, SplitRestrictionData (length type)) (edge : Edges Positions data)
    (position : (type : T) × Positions type) :
    (naturalEdge data edge).x position + (naturalEdge data edge).y position +
      (naturalEdge data edge).z position = total length position :=
  splitWordEdge_valid (edge position.1).val position.2

/-- The X and Y words uniquely specify a global edge, even across different child alphabets. -/
theorem naturalEdge_xy_injective (data : ∀ type, SplitRestrictionData (length type))
    {left right : Edges Positions data}
    (sameX : (naturalEdge data left).x = (naturalEdge data right).x)
    (sameY : (naturalEdge data left).y = (naturalEdge data right).y) : left = right := by
  funext type
  apply Subtype.ext
  apply splitWord_xy_injective
  · funext position
    exact congrFun sameX ⟨type, position⟩
  · funext position
    exact congrFun sameY ⟨type, position⟩

/-- X and Z also uniquely determine every component of the global edge. -/
theorem naturalEdge_xz_injective (data : ∀ type, SplitRestrictionData (length type))
    {left right : Edges Positions data}
    (sameX : (naturalEdge data left).x = (naturalEdge data right).x)
    (sameZ : (naturalEdge data left).z = (naturalEdge data right).z) : left = right := by
  funext type
  apply Subtype.ext
  apply splitWord_xz_injective
  · funext position
    exact congrFun sameX ⟨type, position⟩
  · funext position
    exact congrFun sameZ ⟨type, position⟩

/-- One modulus exceeding every child total prevents aliases at every global position. -/
theorem naturalEdge_small (data : ∀ type, SplitRestrictionData (length type)) (edge : Edges Positions data)
    {prime : ℕ} (large : ∀ type, 2*length type < prime) (position : (type : T) × Positions type) :
    (naturalEdge data edge).x position < prime ∧ (naturalEdge data edge).y position < prime ∧
      (naturalEdge data edge).z position < prime :=
  splitWord_small (edge position.1).val (large position.1) position.2

variable [Fintype T] [∀ type, Fintype (Positions type)]

/-- The prescribed global graph has the product of the component exact-type counts. -/
theorem prescribed_card (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) :
    Nat.card (PrescribedEdges Positions data) =
      ∏ type, Nat.card (TypedWord (P := Positions type) (data type).split) := by
  simp only [PrescribedEdges, Nat.card_eq_fintype_card, Fintype.card_pi]
  apply Finset.prod_congr rfl
  intro type _
  simpa only [Nat.card_eq_fintype_card] using (data type).prescribed_card (reference type)

end
end MatrixBounds.Tensor.CW.Mixed
