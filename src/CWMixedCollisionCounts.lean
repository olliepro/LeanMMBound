module

public import CWMixedGraph

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Conditional collision counts on the entire heterogeneous CW graph.
All factor types share one weight vector and the same two offsets. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T Competitor : Type*} [Fintype T] [Fintype Competitor]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Condition the two global hashes of a reference edge on one common bucket. -/
abbrev Bucket (data : ∀ type, SplitRestrictionData (length type)) (reference : Edges Positions data)
    (bucket : ZMod prime) :=
  BucketEvent (modularEdge prime (naturalEdge data reference)).x
    (modularEdge prime (naturalEdge data reference)).y bucket

/-- A global competitor survives when all three global hashes equal the reference bucket. -/
def Collision (data : ∀ type, SplitRestrictionData (length type)) (reference other : Edges Positions data)
    (bucket : ZMod prime) (seed : Bucket data reference bucket) : Prop :=
  (modularEdge prime (naturalEdge data other)).InBucket
    (fun position => (total length position : ZMod prime)) seed.val bucket

/-- Distinct global competitors sharing X have total conditional collision count at most their number divided by the modulus. -/
theorem shared_x_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : Edges Positions data) (others : Competitor → Edges Positions data)
    (shared : ∀ other, (naturalEdge data (others other)).x = (naturalEdge data reference).x)
    (different : ∀ other, others other ≠ reference) (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data reference bucket // ∃ other, Collision data reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (Bucket data reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (naturalEdge data reference)).x (modularEdge prime (naturalEdge data reference)).y bucket
    (fun other seed => Collision data reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_x_collision (naturalEdge data reference) (naturalEdge data (others other))
        (total length) (naturalEdge_valid data (others other)) (shared other)
        (fun sameY => different other (naturalEdge_xy_injective data (shared other) sameY))
        (fun position => (naturalEdge_small data reference large position).2.1)
        (fun position => (naturalEdge_small data (others other) large position).2.1) bucket
      simpa only [ZMod.card, Collision] using probability.le)
  simpa only [ZMod.card] using bound

/-- Sharing the entire global Y word gives the same one-modulus collision cost, regardless of the number of types. -/
theorem shared_y_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : Edges Positions data) (others : Competitor → Edges Positions data)
    (shared : ∀ other, (naturalEdge data (others other)).y = (naturalEdge data reference).y)
    (different : ∀ other, others other ≠ reference) (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data reference bucket // ∃ other, Collision data reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (Bucket data reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (naturalEdge data reference)).x (modularEdge prime (naturalEdge data reference)).y bucket
    (fun other seed => Collision data reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_y_collision (naturalEdge data reference) (naturalEdge data (others other))
        (total length) (naturalEdge_valid data (others other)) (shared other)
        (fun sameX => different other (naturalEdge_xy_injective data sameX (shared other)))
        (fun position => (naturalEdge_small data reference large position).1)
        (fun position => (naturalEdge_small data (others other) large position).1) bucket
      simpa only [ZMod.card, Collision] using probability.le)
  simpa only [ZMod.card] using bound

/-- Global Z sharing has the same conditional collision estimate under the varying support totals. -/
theorem shared_z_count (data : ∀ type, SplitRestrictionData (length type))
    (reference : Edges Positions data) (others : Competitor → Edges Positions data)
    (shared : ∀ other, (naturalEdge data (others other)).z = (naturalEdge data reference).z)
    (different : ∀ other, others other ≠ reference) (large : ∀ type, 2*length type < prime) (bucket : ZMod prime) :
    Nat.card {seed : Bucket data reference bucket // ∃ other, Collision data reference (others other) bucket seed} * prime ≤
      Fintype.card Competitor * Nat.card (Bucket data reference bucket) := by
  have bound := conditional_competitor_count
    (modularEdge prime (naturalEdge data reference)).x (modularEdge prime (naturalEdge data reference)).y bucket
    (fun other seed => Collision data reference (others other) bucket seed) (fun other => by
      have probability := natural_shared_z_collision (naturalEdge data reference) (naturalEdge data (others other))
        (total length) (naturalEdge_valid data reference) (naturalEdge_valid data (others other)) (shared other)
        (fun sameX => different other (naturalEdge_xz_injective data sameX (shared other)))
        (fun position => (naturalEdge_small data reference large position).1)
        (fun position => (naturalEdge_small data (others other) large position).1) bucket
      simpa only [ZMod.card, Collision] using probability.le)
  simpa only [ZMod.card] using bound

end
end MatrixBounds.Tensor.CW.Mixed
