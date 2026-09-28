import CWMixedOwnershipData
import CWMixedCollisionCounts

/-! Actual global ownership-collision events and their reference-bucket
interpretation, using one seed for every parent type and recursion level. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A competing complete global edge shares X and remains in the reference's global bucket. -/
def coarseCollision (data : ∀ type, SplitRestrictionData (length type))
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (reference : Edges Positions data) : Prop :=
  ∃ other : Edges Positions data, other ≠ reference ∧
    (modularEdge prime (naturalEdge data other)).x = (modularEdge prime (naturalEdge data reference)).x ∧
    (modularEdge prime (naturalEdge data other)).InBucket (fun position => (total length position : ZMod prime)) seed
      (hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data reference)).x)

/-- Fine ownership collides only with a different prescribed, globally active, compatible edge. -/
def fineCollision (data : ∀ type, SplitRestrictionData (length type))
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (reference : Edges Positions data) (fine : FineWords Positions length) : Prop :=
  ∃ other : Edges Positions data, other ≠ reference ∧ prescribed data other ∧ active data seed other ∧
    Compatible data axis axisClass profile other fine

/-- Every conditioned reference is globally active, including its Z hash. -/
theorem bucket_active (data : ∀ type, SplitRestrictionData (length type))
    (reference : Edges Positions data) (bucket : ZMod prime) (seed : Bucket data reference bucket) :
    active data seed.val reference := by
  unfold active
  rw [seed.property.1]
  exact (inBucket_iff_xy _ _ (modularEdge_valid _ _ (naturalEdge_valid data reference)) _ _).mpr seed.property

omit [NeZero (2 : ZMod prime)] in
/-- A globally active Y-sharing competitor must use the conditioned reference bucket. -/
theorem active_shared_y_bucket (data : ∀ type, SplitRestrictionData (length type))
    (reference other : Edges Positions data) (bucket : ZMod prime) (seed : Bucket data reference bucket)
    (present : active data seed.val other)
    (shared : (naturalEdge data other).y = (naturalEdge data reference).y) :
    Collision data reference other bucket seed := by
  have same : (modularEdge prime (naturalEdge data other)).y = (modularEdge prime (naturalEdge data reference)).y :=
    congrArg (fun word : ((type : T) × Positions type) → ℕ => fun position => (word position : ZMod prime)) shared
  have bucketSame := present.2.1
  rw [same, seed.property.2] at bucketSame
  exact ⟨present.1.trans bucketSame.symm, present.2.1.trans bucketSame.symm, present.2.2.trans bucketSame.symm⟩

/-- The same reference-bucket conclusion holds for globally Z-sharing active competitors. -/
theorem active_shared_z_bucket (data : ∀ type, SplitRestrictionData (length type))
    (reference other : Edges Positions data) (bucket : ZMod prime) (seed : Bucket data reference bucket)
    (present : active data seed.val other)
    (shared : (naturalEdge data other).z = (naturalEdge data reference).z) :
    Collision data reference other bucket seed := by
  have same : (modularEdge prime (naturalEdge data other)).z = (modularEdge prime (naturalEdge data reference)).z :=
    congrArg (fun word : ((type : T) × Positions type) → ℕ => fun position => (word position : ZMod prime)) shared
  have referenceZ := bucket_z_of_xy _ _ (modularEdge_valid _ _ (naturalEdge_valid data reference)) seed.val bucket
    seed.property.1 seed.property.2
  have bucketSame := present.2.2
  rw [same, referenceZ] at bucketSame
  exact ⟨present.1.trans bucketSame.symm, present.2.1.trans bucketSame.symm, present.2.2.trans bucketSame.symm⟩

omit [NeZero (2 : ZMod prime)] in
/-- Global coarse uniqueness assigns a physical variable with the reference word to that active edge. -/
theorem coarseOwner_of_no_collision (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : Edges Positions data)
    (entries : Axis Positions data q Shape.x)
    (coarse : axisCoarse prime data entries = (modularEdge prime (naturalEdge data edge)).x)
    (present : active data seed edge) (unique : ¬coarseCollision data seed edge) :
    globalOwner data q seed entries = some edge := by
  unfold globalOwner coarseOwner
  apply uniqueOwner_eq
  · exact ⟨coarse.symm, by rw [coarse]; exact present⟩
  · intro other compatible
    by_contra different
    apply unique
    refine ⟨other, different, compatible.1.trans coarse, ?_⟩
    rw [coarse] at compatible
    exact compatible.2

end
end MatrixBounds.Tensor.CW.Mixed
