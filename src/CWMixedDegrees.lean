module

public import CWMixedGraph
public import CWWindowCollisionRates

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Global compatibility degrees factor across the parent types before any
minimum over axes is taken. These are degrees for a single global hash. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- A global fine word retains the distinct fine alphabet of every parent type. -/
abbrev FineWords (Positions : T → Type*) (length : T → ℕ) :=
  ∀ type, Positions type → Fin (length type+length type) → Fin 3

/-- Global fine compatibility is the conjunction of the actual local asymmetric compatibility tests. -/
def Compatible (data : ∀ type, SplitRestrictionData (length type)) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (edge : Edges Positions data) (fine : FineWords Positions length) : Prop :=
  ∀ type, compatibleFine (length type) (data type).parent (data type).balanced (axisClass type)
    (pooledProfile (profile type) (axisClass type)) (fun child => axis child.val) ((data type).word (edge type)) (fine type)

/-- The actual global prescribed compatibility degree is bounded by the product of the complete local exact-type degrees. -/
theorem compatible_degree_le (data : ∀ type, SplitRestrictionData (length type)) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (fine : FineWords Positions length) :
    Nat.card {edge : PrescribedEdges Positions data // Compatible data axis axisClass profile (forget data edge) fine} ≤
      ∏ type, Nat.card {word : TypedWord (P := Positions type) (data type).split //
        compatibleFine (length type) (data type).parent (data type).balanced (axisClass type)
          (pooledProfile (profile type) (axisClass type)) (fun child => axis child.val) word.val (fine type)} := by
  let mapping : {edge : PrescribedEdges Positions data // Compatible data axis axisClass profile (forget data edge) fine} →
      ∀ type, {word : TypedWord (P := Positions type) (data type).split //
        compatibleFine (length type) (data type).parent (data type).balanced (axisClass type)
          (pooledProfile (profile type) (axisClass type)) (fun child => axis child.val) word.val (fine type)} :=
    fun edge type => ⟨(data type).prescribedWord (edge.val type), edge.property type⟩
  have injective : Function.Injective mapping := by
    intro left right same
    apply Subtype.ext
    funext type
    apply (data type).prescribedWord_injective
    exact congrArg Subtype.val (congrFun same type)
  have bound := Nat.card_le_card_of_injective mapping injective
  simpa only [Nat.card_eq_fintype_card, Fintype.card_pi] using bound

/-- Inside all parent windows, the global fine degree is bounded by the product of their accepted-word maxima. -/
theorem window_degree_le (data : ∀ type, SplitRestrictionData (length type)) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (fine : FineWords Positions length) (accepted : ∀ type, accept type (fine type)) :
    Nat.card {edge : PrescribedEdges Positions data // Compatible data axis axisClass profile (forget data edge) fine} ≤
      ∏ type, (data type).windowDegree axis (axisClass type) (profile type) (accept type) := by
  apply (compatible_degree_le data axis axisClass profile fine).trans
  apply Finset.prod_le_prod₀ (fun _ _ => Nat.zero_le _)
  intro type _
  exact (data type).degree_le_windowDegree axis (axisClass type) (profile type) (accept type) (fine type) (accepted type)

/-- A global complete-graph X fiber has degree at most the product of the local complete-graph X degrees. -/
theorem coarse_degree_le (data : ∀ type, SplitRestrictionData (length type)) (reference : Edges Positions data) :
    Nat.card {other : Edges Positions data // (naturalEdge data other).x = (naturalEdge data reference).x} ≤
      ∏ type, (data type).coarseDegree (P := Positions type) := by
  let fiber := fun type => {other : (data type).Edges (P := Positions type) //
    marginalX splitXIndex splitYIndex splitZIndex (data type).coarseX (data type).coarseY (data type).coarseZ other =
      marginalX splitXIndex splitYIndex splitZIndex (data type).coarseX (data type).coarseY (data type).coarseZ (reference type)}
  let mapping : {other : Edges Positions data // (naturalEdge data other).x = (naturalEdge data reference).x} →
      ∀ type, fiber type := fun other type => ⟨other.val type, by
        apply Subtype.ext
        funext position
        exact Fin.ext (congrFun other.property ⟨type, position⟩)⟩
  have injective : Function.Injective mapping := by
    intro left right same
    apply Subtype.ext
    funext type
    exact congrArg Subtype.val (congrFun same type)
  have count : Nat.card {other : Edges Positions data // (naturalEdge data other).x = (naturalEdge data reference).x} ≤
      ∏ type, Nat.card (fiber type) := by
    simpa only [Nat.card_eq_fintype_card, Fintype.card_pi] using Nat.card_le_card_of_injective mapping injective
  apply count.trans
  apply Finset.prod_le_prod₀ (fun _ _ => Nat.zero_le _)
  intro type _
  unfold SplitRestrictionData.coarseDegree
  exact Finset.le_sup (f := fun ref => Nat.card {other : (data type).Edges (P := Positions type) //
    marginalX splitXIndex splitYIndex splitZIndex (data type).coarseX (data type).coarseY (data type).coarseZ other =
      marginalX splitXIndex splitYIndex splitZIndex (data type).coarseX (data type).coarseY (data type).coarseZ ref})
    (Finset.mem_univ (reference type))

end
end MatrixBounds.Tensor.CW.Mixed
