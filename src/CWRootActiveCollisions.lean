module

public import CWRootTargetOwnership
public import CWCompatibleCollisions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Conditional collision counts for actual root active edges, using the same
shared hash throughout coarse and fine ownership. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Conditioning on the X and Y hashes makes the reference active in that bucket. -/
theorem bucket_active (data : RootRestrictionData length) (edge : data.Edges (P := P))
    (bucket : ZMod prime) (seed : WordBucket edge.val bucket) : data.active seed.val edge := by
  unfold active graphEdges
  rw [seed.property.1]
  exact (inBucket_iff_xy _ _ (data.graph_valid edge) _ _).mpr seed.property

omit [NeZero (2 : ZMod prime)] in
/-- An active competitor sharing Y must use the reference's bucket. -/
theorem active_shared_y_bucket (data : RootRestrictionData length)
    (reference other : data.Edges (P := P)) (bucket : ZMod prime)
    (seed : WordBucket reference.val bucket) (active : data.active seed.val other)
    (shared : (splitWordEdge other.val).y = (splitWordEdge reference.val).y) :
    wordCollision reference.val other.val bucket seed := by
  have same : (data.graphEdges prime other).y =
      (data.graphEdges prime reference).y :=
    congrArg (fun word : P → ℕ => fun position => (word position : ZMod prime)) shared
  have bucketSame := active.2.1
  rw [same] at bucketSame
  change hashY _ _ _ (modularEdge prime (splitWordEdge reference.val)).y = _ at bucketSame
  rw [seed.property.2] at bucketSame
  change (data.graphEdges prime other).InBucket _ _ _
  exact ⟨active.1.trans bucketSame.symm, active.2.1.trans bucketSame.symm,
    active.2.2.trans bucketSame.symm⟩

/-- Sharing Z likewise puts every active competitor into the reference bucket. -/
theorem active_shared_z_bucket (data : RootRestrictionData length)
    (reference other : data.Edges (P := P)) (bucket : ZMod prime)
    (seed : WordBucket reference.val bucket) (active : data.active seed.val other)
    (shared : (splitWordEdge other.val).z = (splitWordEdge reference.val).z) :
    wordCollision reference.val other.val bucket seed := by
  have same : (data.graphEdges prime other).z =
      (data.graphEdges prime reference).z :=
    congrArg (fun word : P → ℕ => fun position => (word position : ZMod prime)) shared
  have referenceZ := bucket_z_of_xy _ _ (data.graph_valid reference) seed.val bucket
    seed.property.1 seed.property.2
  have bucketSame := active.2.2
  rw [same, referenceZ] at bucketSame
  change (data.graphEdges prime other).InBucket _ _ _
  exact ⟨active.1.trans bucketSame.symm, active.2.1.trans bucketSame.symm,
    active.2.2.trans bucketSame.symm⟩

/-- The actual coarse-X collision event is bounded by the full marginal fiber degree. -/
theorem actual_coarse_collision_count (data : RootRestrictionData length)
    (reference : data.Edges (P := P)) (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket reference.val bucket // data.coarseCollision seed.val reference} * prime ≤
      Nat.card {other : data.Edges (P := P) //
        marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
          marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) reference} *
        Nat.card (WordBucket reference.val bucket) := by
  have bound := coarse_x_collision_count (rootBox (2*length)) (2*length) (data.coarse 0) (data.coarse 1) (data.coarse 2)
    reference large bucket
  apply le_trans (Nat.mul_le_mul_right prime ?_) bound
  apply Nat.card_mono (Set.toFinite _)
  intro seed collision
  obtain ⟨other, different, shared, present⟩ := collision
  have naturalSame := bounded_word_cast_injective
    (fun position => (splitWord_small other.val large position).1)
    (fun position => (splitWord_small reference.val large position).1) shared
  have marginalSame : marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) other =
      marginalX splitXIndex splitYIndex splitZIndex (data.coarse 0) (data.coarse 1) (data.coarse 2) reference := by
    apply Subtype.ext
    funext position
    exact Fin.ext (congrFun naturalSame position)
  refine ⟨⟨other, different, marginalSame⟩, ?_⟩
  change (data.graphEdges prime other).InBucket
    _ seed.val bucket
  change (modularEdge prime (splitWordEdge other.val)).InBucket _ seed.val
    (hashX seed.val.2.1 seed.val.1 (modularEdge prime (splitWordEdge reference.val)).x) at present
  rwa [seed.property.1] at present

end
end MatrixBounds.Tensor.CW.RootRestrictionData
