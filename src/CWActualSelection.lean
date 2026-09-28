import CWWindowCollisionRates
import MixedSelection

/-! One common seed selects actual prescribed CW edges with unique coarse-X
owners and sparse fine-axis collision holes inside the parent windows. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The selected actual edges satisfy bucket membership, activity, coarse uniqueness, and both fine-hole bounds. -/
def SelectedEdges (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (seed : Seed (ZMod prime) P) (buckets : Finset (ZMod prime))
    (acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) (scale : ℕ) :=
  {edge : data.PrescribedEdges (P := P) //
    hashX seed.2.1 seed.1 (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge.val).x ∈ buckets ∧
    data.active seed edge.val ∧
    GoodCollisionEdge (fun seed edge => data.coarseCollision seed edge.val)
      (fun seed edge => data.windowCollision symmetric seed edge Shape.y yClass data.fineY acceptY)
      (fun seed edge => data.windowCollision symmetric seed edge Shape.z zClass data.fineZ acceptZ) scale seed edge}

/-- Actual coarse collision probabilities are uniformly controlled by the explicit complete-graph degree. -/
theorem uniform_coarse_collision_count (data : SplitRestrictionData length)
    (edge : data.PrescribedEdges (P := P)) (large : 2*length < prime) (bucket : ZMod prime) :
    Nat.card {seed : WordBucket edge.val.val bucket // data.coarseCollision seed.val edge.val} * prime ≤
      data.coarseDegree (P := P) * Nat.card (WordBucket edge.val.val bucket) := by
  apply (data.actual_coarse_collision_count edge.val large bucket).trans
  apply Nat.mul_le_mul_right
  unfold coarseDegree
  exact Finset.le_sup (f := fun reference : data.Edges (P := P) =>
    Nat.card {other : data.Edges (P := P) //
      marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ other =
        marginalX splitXIndex splitYIndex splitZIndex data.coarseX data.coarseY data.coarseZ reference})
    (Finset.mem_univ edge.val)

/-- The actual X/Y/Z restrictions have one seed retaining at least the finite mixed-selection count.
The degrees are explicit maxima over complete coarse fibers and accepted fine words. -/
theorem exists_actual_selection (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (buckets : Finset (ZMod prime)) (acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeY : data.TargetParts data.fineY) (representativeZ : data.TargetParts data.fineZ)
    (scale : ℕ) (large : 2*length < prime)
    (largeX : 6*data.coarseDegree (P := P) ≤ prime)
    (largeY : 6*(scale*data.windowDegree Shape.y yClass data.fineY acceptY) ≤ prime)
    (largeZ : 6*(scale*data.windowDegree Shape.z zClass data.fineZ acceptZ) ≤ prime) :
    ∃ seed : Seed (ZMod prime) P,
      Fintype.card (data.PrescribedEdges (P := P))*buckets.card ≤
        2*prime^2*Nat.card (data.SelectedEdges symmetric seed buckets acceptY acceptZ scale) := by
  letI : Nonempty (data.TargetParts data.fineY) := ⟨representativeY⟩
  letI : Nonempty (data.TargetParts data.fineZ) := ⟨representativeZ⟩
  let edges := fun edge : data.PrescribedEdges (P := P) =>
    coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge.val
  let badX := fun (seed : Seed (ZMod prime) P) (edge : data.PrescribedEdges (P := P)) => data.coarseCollision seed edge.val
  let holesY := fun (seed : Seed (ZMod prime) P) edge => data.windowCollision symmetric seed edge Shape.y yClass data.fineY acceptY
  let holesZ := fun (seed : Seed (ZMod prime) P) edge => data.windowCollision symmetric seed edge Shape.z zClass data.fineZ acceptZ
  have boundY (edge : data.PrescribedEdges (P := P)) (bucket : ZMod prime) (parts : data.TargetParts data.fineY) :=
    data.window_collision_count symmetric edge Shape.y yClass data.fineY acceptY parts bucket
      (data.actual_y_collision_count edge _
        (data.targetParts_coarse symmetric edge Shape.y (fun _ _ => rfl) data.fineY supportY parts) large bucket)
  have boundZ (edge : data.PrescribedEdges (P := P)) (bucket : ZMod prime) (parts : data.TargetParts data.fineZ) :=
    data.window_collision_count symmetric edge Shape.z zClass data.fineZ acceptZ parts bucket
      (data.actual_z_collision_count edge _
        (data.targetParts_coarse symmetric edge Shape.z (fun _ _ => rfl) data.fineZ supportZ parts) large bucket)
  obtain ⟨seed, retained⟩ := exists_mixed_selection (fun edge => (edges edge).x) (fun edge => (edges edge).y)
    buckets badX holesY holesZ (data.coarseDegree (P := P))
    (data.windowDegree Shape.y yClass data.fineY acceptY)
    (data.windowDegree Shape.z zClass data.fineZ acceptZ) scale
    (fun edge bucket _ => by simpa only [ZMod.card] using data.uniform_coarse_collision_count edge large bucket)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using boundY edge bucket parts)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using boundZ edge bucket parts)
    (by simpa only [ZMod.card] using largeX) (by simpa only [ZMod.card] using largeY)
    (by simpa only [ZMod.card] using largeZ)
  have activeIff (edge : data.PrescribedEdges (P := P)) : data.active seed edge.val ↔
      hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x := by
    rw [active, inBucket_iff_xy _ _ (data.graph_valid edge.val)]
    exact and_iff_right rfl
  have same : Nat.card {edge // hashX seed.2.1 seed.1 (edges edge).x ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x ∧
        GoodCollisionEdge badX holesY holesZ scale seed edge} =
      Nat.card (data.SelectedEdges symmetric seed buckets acceptY acceptZ scale) := by
    apply Nat.card_congr
    apply Equiv.subtypeEquivRight
    intro edge
    rw [activeIff]
  refine ⟨seed, ?_⟩
  simpa only [ZMod.card, same] using retained

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
