import CWMixedEvents

/-! Integer bounds for the actual global coarse and fine ownership events. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The actual global coarse collision count is bounded by the product of complete local X degrees. -/
theorem actual_coarse_collision_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : Edges Positions data) (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data reference bucket // coarseCollision data seed.val reference} * prime ≤
      (∏ type, (data type).coarseDegree (P := Positions type)) * Nat.card (Bucket data reference bucket) := by
  let compatible := fun other : Edges Positions data => (naturalEdge data other).x = (naturalEdge data reference).x
  let Others := {other : Edges Positions data // other ≠ reference ∧ compatible other}
  have bound := shared_x_count data reference (fun other : Others => other.val)
    (fun other => other.property.2) (fun other => other.property.1) large bucket
  have inclusion : Nat.card {seed : Bucket data reference bucket // coarseCollision data seed.val reference} ≤
      Nat.card {seed : Bucket data reference bucket // ∃ other : Others, Collision data reference other.val bucket seed} := by
    apply Nat.card_mono (Set.toFinite _)
    intro seed collision
    obtain ⟨other, different, shared, present⟩ := collision
    have naturalSame := bounded_word_cast_injective
      (fun position => (naturalEdge_small data other large position).1)
      (fun position => (naturalEdge_small data reference large position).1) shared
    refine ⟨⟨other, different, naturalSame⟩, ?_⟩
    rwa [seed.property.1] at present
  have degree : Nat.card Others ≤ ∏ type, (data type).coarseDegree (P := Positions type) :=
    (other_compatible_count_le compatible reference).trans (coarse_degree_le data reference)
  have degree' : Fintype.card Others ≤ ∏ type, (data type).coarseDegree (P := Positions type) := by
    simpa only [Nat.card_eq_fintype_card] using degree
  exact (Nat.mul_le_mul_right prime inclusion).trans (bound.trans (Nat.mul_le_mul_right _ degree'))

/-- Fine competitors are distinct prescribed global edges satisfying the complete global compatibility test. -/
abbrev FineCompetitors (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (fine : FineWords Positions length) :=
  {other : PrescribedEdges Positions data // other ≠ reference ∧ Compatible data axis axisClass profile (forget data other) fine}

omit [NeZero (2 : ZMod prime)] in
/-- A conditional reference-bucket competitor count bounds the actual global fine-ownership event. -/
theorem fine_collision_transfer (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (fine : FineWords Positions length) (bucket : ZMod prime)
    (toBucket : ∀ other : FineCompetitors data reference axis axisClass profile fine,
      ∀ seed : Bucket data (forget data reference) bucket, active data seed.val (forget data other.val) →
        Collision data (forget data reference) (forget data other.val) bucket seed)
    (counting : Nat.card {seed : Bucket data (forget data reference) bucket //
      ∃ other : FineCompetitors data reference axis axisClass profile fine,
        Collision data (forget data reference) (forget data other.val) bucket seed} * prime ≤
      Nat.card (FineCompetitors data reference axis axisClass profile fine) * Nat.card (Bucket data (forget data reference) bucket)) :
    Nat.card {seed : Bucket data (forget data reference) bucket //
      fineCollision data seed.val axis axisClass profile (forget data reference) fine} * prime ≤
      Nat.card {other : PrescribedEdges Positions data // Compatible data axis axisClass profile (forget data other) fine} *
        Nat.card (Bucket data (forget data reference) bucket) := by
  have inclusion : Nat.card {seed : Bucket data (forget data reference) bucket //
      fineCollision data seed.val axis axisClass profile (forget data reference) fine} ≤
      Nat.card {seed : Bucket data (forget data reference) bucket //
        ∃ other : FineCompetitors data reference axis axisClass profile fine,
          Collision data (forget data reference) (forget data other.val) bucket seed} := by
    apply Nat.card_mono (Set.toFinite _)
    intro seed collision
    obtain ⟨other, different, prescribed, present, compatible⟩ := collision
    let prescribedOther : PrescribedEdges Positions data := fun type => ⟨other type, prescribed type⟩
    have otherDifferent : prescribedOther ≠ reference := fun same => different (congrArg (forget data) same)
    let competitor : FineCompetitors data reference axis axisClass profile fine :=
      ⟨prescribedOther, otherDifferent, compatible⟩
    exact ⟨competitor, toBucket competitor seed present⟩
  exact (Nat.mul_le_mul_right prime inclusion).trans (counting.trans
    (Nat.mul_le_mul_right _ (other_compatible_count_le _ reference)))

/-- Actual global Y collisions cost one modulus factor against the full product-graph compatibility degree. -/
theorem actual_y_collision_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (fine : FineWords Positions length)
    (compatible : Compatible data Shape.y (fun _ => yClass) (fun type => (data type).fineY) (forget data reference) fine)
    (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data (forget data reference) bucket //
      fineCollision data seed.val Shape.y (fun _ => yClass) (fun type => (data type).fineY) (forget data reference) fine} * prime ≤
      Nat.card {other : PrescribedEdges Positions data //
        Compatible data Shape.y (fun _ => yClass) (fun type => (data type).fineY) (forget data other) fine} *
        Nat.card (Bucket data (forget data reference) bucket) := by
  let Others := FineCompetitors data reference Shape.y (fun _ => yClass) (fun type => (data type).fineY) fine
  have shared (other : Others) :
      (naturalEdge data (forget data other.val)).y = (naturalEdge data (forget data reference)).y := by
    funext position
    exact ((other.property.2 position.1).1 position.2).symm.trans ((compatible position.1).1 position.2)
  apply fine_collision_transfer data reference Shape.y (fun _ => yClass) (fun type => (data type).fineY) fine bucket
    (fun other seed present => active_shared_y_bucket data _ _ bucket seed present (shared other))
  have bound := shared_y_count data (forget data reference) (fun other : Others => forget data other.val) shared
    (fun other same => other.property.1 (forget_injective data same)) large bucket
  simpa only [Nat.card_eq_fintype_card] using bound

/-- Global Z collisions obey the same one-modulus law, using all parent types together. -/
theorem actual_z_collision_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : PrescribedEdges Positions data) (fine : FineWords Positions length)
    (compatible : Compatible data Shape.z (fun _ => zClass) (fun type => (data type).fineZ) (forget data reference) fine)
    (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data (forget data reference) bucket //
      fineCollision data seed.val Shape.z (fun _ => zClass) (fun type => (data type).fineZ) (forget data reference) fine} * prime ≤
      Nat.card {other : PrescribedEdges Positions data //
        Compatible data Shape.z (fun _ => zClass) (fun type => (data type).fineZ) (forget data other) fine} *
        Nat.card (Bucket data (forget data reference) bucket) := by
  let Others := FineCompetitors data reference Shape.z (fun _ => zClass) (fun type => (data type).fineZ) fine
  have shared (other : Others) :
      (naturalEdge data (forget data other.val)).z = (naturalEdge data (forget data reference)).z := by
    funext position
    exact ((other.property.2 position.1).1 position.2).symm.trans ((compatible position.1).1 position.2)
  apply fine_collision_transfer data reference Shape.z (fun _ => zClass) (fun type => (data type).fineZ) fine bucket
    (fun other seed present => active_shared_z_bucket data _ _ bucket seed present (shared other))
  have bound := shared_z_count data (forget data reference) (fun other : Others => forget data other.val) shared
    (fun other same => other.property.1 (forget_injective data same)) large bucket
  simpa only [Nat.card_eq_fintype_card] using bound

end
end MatrixBounds.Tensor.CW.Mixed
