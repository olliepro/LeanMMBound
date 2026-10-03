module

public import CWMixedActualCounts
public import CWMixedTargets
public import MixedSelection

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Quantitative selection with one seed across all parent types. The modulus
is compared with products of the local degrees, before selecting an axis. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Count fine collisions only when every component parent window accepts the target part. -/
def windowCollision (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (parts : TargetParts data profile) : Prop :=
  let fine := targetFine data symmetric edge profile parts
  (∀ type, accept type (fine type)) ∧ fineCollision data seed axis axisClass profile (forget data edge) fine

omit [NeZero (2 : ZMod prime)] in
/-- The accepted global collision event is bounded by the product of all local accepted-word degree maxima. -/
theorem window_collision_count (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (parts : TargetParts data profile)
    (bucket : ZMod prime)
    (counting : Nat.card {seed : Bucket data (forget data edge) bucket //
      fineCollision data seed.val axis axisClass profile (forget data edge) (targetFine data symmetric edge profile parts)} * prime ≤
      Nat.card {other : PrescribedEdges Positions data //
        Compatible data axis axisClass profile (forget data other) (targetFine data symmetric edge profile parts)} *
        Nat.card (Bucket data (forget data edge) bucket)) :
    Nat.card {seed : Bucket data (forget data edge) bucket //
      windowCollision data symmetric seed.val edge axis axisClass profile accept parts} * prime ≤
      (∏ type, (data type).windowDegree axis (axisClass type) (profile type) (accept type)) *
        Nat.card (Bucket data (forget data edge) bucket) := by
  let fine := targetFine data symmetric edge profile parts
  by_cases accepted : ∀ type, accept type (fine type)
  · have inclusion : Nat.card {seed : Bucket data (forget data edge) bucket //
        windowCollision data symmetric seed.val edge axis axisClass profile accept parts} ≤
        Nat.card {seed : Bucket data (forget data edge) bucket // fineCollision data seed.val axis axisClass profile (forget data edge) fine} :=
      Nat.card_mono (Set.toFinite _) (fun _ present => present.2)
    exact (Nat.mul_le_mul_right prime inclusion).trans (counting.trans
      (Nat.mul_le_mul_right _ (window_degree_le data axis axisClass profile accept fine accepted)))
  · have empty : IsEmpty {seed : Bucket data (forget data edge) bucket //
        windowCollision data symmetric seed.val edge axis axisClass profile accept parts} :=
      ⟨fun seed => accepted seed.property.1⟩
    simp only [Nat.card_of_isEmpty, zero_mul, Nat.zero_le]

/-- Global selected edges have one common retained bucket, coarse uniqueness, and sparse Y/Z window collisions. -/
def SelectedEdges (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Finset (ZMod prime))
    (acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (scale : ℕ) :=
  {edge : PrescribedEdges Positions data //
    hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data (forget data edge))).x ∈ buckets ∧
    active data seed (forget data edge) ∧
    GoodCollisionEdge (fun seed edge => coarseCollision data seed (forget data edge))
      (fun seed edge => windowCollision data symmetric seed edge Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY)
      (fun seed edge => windowCollision data symmetric seed edge Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ)
      scale seed edge}

/-- One common seed gives the mixed retention count with products of degrees on each axis.
Every collision premise is proved for the actual heterogeneous graph and the
supported target parts; no component-wise seed selection is assumed. -/
theorem exists_actual_selection (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (buckets : Finset (ZMod prime))
    (acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (supportY : ∀ type child block, fineTotal block ≠ child.val.y → (data type).fineY child block = 0)
    (supportZ : ∀ type child block, fineTotal block ≠ child.val.z → (data type).fineZ child block = 0)
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (scale : ℕ) (large : ∀ type, 2*length type < prime)
    (largeX : 6*(∏ type, (data type).coarseDegree (P := Positions type)) ≤ prime)
    (largeY : 6*(scale*∏ type, (data type).windowDegree Shape.y yClass (data type).fineY (acceptY type)) ≤ prime)
    (largeZ : 6*(scale*∏ type, (data type).windowDegree Shape.z zClass (data type).fineZ (acceptZ type)) ≤ prime) :
    ∃ seed : Seed (ZMod prime) ((type : T) × Positions type),
      Fintype.card (PrescribedEdges Positions data)*buckets.card ≤
        2*prime^2*Nat.card (SelectedEdges data symmetric seed buckets acceptY acceptZ scale) := by
  letI : Nonempty (TargetParts data (fun type => (data type).fineY)) := ⟨representativeY⟩
  letI : Nonempty (TargetParts data (fun type => (data type).fineZ)) := ⟨representativeZ⟩
  let edges := fun edge : PrescribedEdges Positions data => modularEdge prime (naturalEdge data (forget data edge))
  let badX := fun (seed : Seed (ZMod prime) ((type : T) × Positions type)) edge => coarseCollision data seed (forget data edge)
  let holesY := fun (seed : Seed (ZMod prime) ((type : T) × Positions type)) edge =>
    windowCollision data symmetric seed edge Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY
  let holesZ := fun (seed : Seed (ZMod prime) ((type : T) × Positions type)) edge =>
    windowCollision data symmetric seed edge Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ
  have boundY (edge : PrescribedEdges Positions data) (bucket : ZMod prime) (parts : TargetParts data (fun type => (data type).fineY)) :=
    window_collision_count data symmetric edge Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY parts bucket
      (actual_y_collision_count data edge _
        (targetParts_compatible data symmetric edge Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) supportY (fun _ => yClass) parts)
        large bucket)
  have boundZ (edge : PrescribedEdges Positions data) (bucket : ZMod prime) (parts : TargetParts data (fun type => (data type).fineZ)) :=
    window_collision_count data symmetric edge Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ parts bucket
      (actual_z_collision_count data edge _
        (targetParts_compatible data symmetric edge Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) supportZ (fun _ => zClass) parts)
        large bucket)
  obtain ⟨seed, retained⟩ := exists_mixed_selection (fun edge => (edges edge).x) (fun edge => (edges edge).y)
    buckets badX holesY holesZ (∏ type, (data type).coarseDegree (P := Positions type))
    (∏ type, (data type).windowDegree Shape.y yClass (data type).fineY (acceptY type))
    (∏ type, (data type).windowDegree Shape.z zClass (data type).fineZ (acceptZ type)) scale
    (fun edge bucket _ => by simpa only [ZMod.card] using actual_coarse_collision_count data (forget data edge) large bucket)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using boundY edge bucket parts)
    (fun edge bucket _ parts => by simpa only [ZMod.card] using boundZ edge bucket parts)
    (by simpa only [ZMod.card] using largeX) (by simpa only [ZMod.card] using largeY)
    (by simpa only [ZMod.card] using largeZ)
  have activeIff (edge : PrescribedEdges Positions data) : active data seed (forget data edge) ↔
      hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x := by
    rw [active, inBucket_iff_xy _ _ (modularEdge_valid _ _ (naturalEdge_valid data (forget data edge)))]
    exact and_iff_right rfl
  have same : Nat.card {edge // hashX seed.2.1 seed.1 (edges edge).x ∈ buckets ∧
        hashY seed.2.1 seed.2.2 seed.1 (edges edge).y = hashX seed.2.1 seed.1 (edges edge).x ∧
        GoodCollisionEdge badX holesY holesZ scale seed edge} =
      Nat.card (SelectedEdges data symmetric seed buckets acceptY acceptZ scale) := by
    apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
    intro edge
    rw [activeIff]
  exact ⟨seed, by simpa only [ZMod.card, same] using retained⟩

end
end MatrixBounds.Tensor.CW.Mixed
