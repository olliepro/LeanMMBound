module

public import CWRootDegrees
public import MixedSelection

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One shared root hash retains many prescribed edges with no coarse
collisions and sparse actual fine-part holes on both later axes. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Selected root edges lie in the bucket set, are active, and have the three proved collision guarantees. -/
def SelectedEdges (data : RootRestrictionData length) (seed : Seed (ZMod prime) P)
    (buckets : Finset (ZMod prime)) (scale : ℕ) :=
  {edge : data.PrescribedEdges (P := P) //
    hashX seed.2.1 seed.1 (data.graphEdges prime edge.val).x ∈ buckets ∧ data.active seed edge.val ∧
    GoodCollisionEdge (fun seed edge => data.coarseCollision seed edge.val)
      (fun seed edge => data.targetHoles seed edge Shape.y yClass data.fineY)
      (fun seed edge => data.targetHoles seed edge Shape.z zClass data.fineZ) scale seed edge}

/-- The actual unpaired root graph admits the shared-hash selection bound with its computed coarse and fine degrees. -/
theorem exists_actual_selection (data : RootRestrictionData length) (buckets : Finset (ZMod prime))
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeY : data.TargetParts data.fineY) (representativeZ : data.TargetParts data.fineZ)
    (scale : ℕ) (large : 2*length < prime)
    (largeX : 6*data.coarseDegree (P := P) ≤ prime)
    (largeY : 6*(scale*data.fineDegree (P := P) Shape.y yClass data.fineY) ≤ prime)
    (largeZ : 6*(scale*data.fineDegree (P := P) Shape.z zClass data.fineZ) ≤ prime) :
    ∃ seed : Seed (ZMod prime) P,
      Nat.card (data.PrescribedEdges (P := P))*buckets.card ≤
        2*prime^2*Nat.card (data.SelectedEdges seed buckets scale) := by
  letI : Nonempty (data.TargetParts data.fineY) := ⟨representativeY⟩
  letI : Nonempty (data.TargetParts data.fineZ) := ⟨representativeZ⟩
  let edges := fun edge : data.PrescribedEdges (P := P) => data.graphEdges prime edge.val
  let badX := fun (seed : Seed (ZMod prime) P) (edge : data.PrescribedEdges (P := P)) => data.coarseCollision seed edge.val
  let holesY := fun (seed : Seed (ZMod prime) P) edge => data.targetHoles seed edge Shape.y yClass data.fineY
  let holesZ := fun (seed : Seed (ZMod prime) P) edge => data.targetHoles seed edge Shape.z zClass data.fineZ
  obtain ⟨seed, retained⟩ := exists_mixed_selection (fun edge => (edges edge).x) (fun edge => (edges edge).y)
    buckets badX holesY holesZ (data.coarseDegree (P := P))
    (data.fineDegree (P := P) Shape.y yClass data.fineY) (data.fineDegree (P := P) Shape.z zClass data.fineZ) scale
    (fun edge bucket _ => by simpa only [ZMod.card] using! data.uniform_coarse_collision_count edge large bucket)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using! data.uniform_y_collision_count edge supportY parts large bucket)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using! data.uniform_z_collision_count edge supportZ parts large bucket)
    (by simpa only [ZMod.card] using largeX) (by simpa only [ZMod.card] using largeY)
    (by simpa only [ZMod.card] using largeZ)
  have activeIff (edge : data.PrescribedEdges (P := P)) : data.active seed edge.val ↔
      hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x := by
    rw [active, inBucket_iff_xy _ _ (data.graph_valid edge.val)]
    exact and_iff_right rfl
  have same : Nat.card {edge // hashX seed.2.1 seed.1 (edges edge).x ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x ∧
        GoodCollisionEdge badX holesY holesZ scale seed edge} = Nat.card (data.SelectedEdges seed buckets scale) := by
    apply Nat.card_congr
    apply Equiv.subtypeEquivRight
    intro edge
    rw [activeIff]
  refine ⟨seed, ?_⟩
  simpa only [same, ← Nat.card_eq_fintype_card, Nat.card_zmod] using retained

end
end MatrixBounds.Tensor.CW.RootRestrictionData
