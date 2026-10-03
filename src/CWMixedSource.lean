module

public import CWMixedGraph
public import CWWindowedSource
public import HeterogeneousProducts

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! One physical hash restriction on a heterogeneous product of CW parents.
Global coarse ownership recovers each type's actual natural child coordinates. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- Physical axis coordinates retain each parent type's own positions, shape, and length. -/
abbrev Axis (Positions : T → Type*) (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) (axis : Shape → ℕ) :=
  ∀ type, Positions type → AxisVariable q (length type+length type) (axis (data type).parent)

/-- Read a physical axis as one coarse field word on the disjoint union of all positions. -/
def axisCoarse (prime : ℕ) (data : ∀ type, SplitRestrictionData (length type)) {q : ℕ} {axis : Shape → ℕ}
    (entries : Axis Positions data q axis) : ((type : T) × Positions type) → ZMod prime :=
  fun position => parentCoarseMod prime (entries position.1) position.2

/-- Restrict every parent type to its prescribed marginal profiles before the global hash. -/
def coarseSource (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) :=
  Interface.heterogeneous (fun type => coarseFiltered (K := K) (P := Positions type) q (length type)
    (data type).parent (data type).coarseX (data type).coarseY (data type).coarseZ)

/-- A nonzero heterogeneous coefficient has a nonzero filtered coefficient at every type. -/
theorem coarseSource_factors (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (x : Axis Positions data q Shape.x) (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (nonzero : coarseSource (K := K) data q x y z ≠ 0) (type : T) :
    coarseFiltered (K := K) q (length type) (data type).parent (data type).coarseX
      (data type).coarseY (data type).coarseZ (x type) (y type) (z type) ≠ 0 := by
  intro zero
  exact nonzero (Finset.prod_eq_zero (Finset.mem_univ type) zero)

/-- The product marginal graph contains every nonzero physical coarse-source coefficient. -/
theorem coarseSource_complete (prime : ℕ) (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (x : Axis Positions data q Shape.x) (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (nonzero : coarseSource (K := K) data q x y z ≠ 0) :
    ∃ edge : Edges Positions data,
      (modularEdge prime (naturalEdge data edge)).x = axisCoarse prime data x ∧
      (modularEdge prime (naturalEdge data edge)).y = axisCoarse prime data y ∧
      (modularEdge prime (naturalEdge data edge)).z = axisCoarse prime data z := by
  choose edges coordinates using fun type => coarseFiltered_mod_complete prime q (length type)
    (data type).parent (data type).coarseX (data type).coarseY (data type).coarseZ
    (x type) (y type) (z type) (coarseSource_factors data q x y z nonzero type)
  refine ⟨edges, ?_, ?_, ?_⟩
  · funext position
    exact congrFun (coordinates position.1).1 position.2
  · funext position
    exact congrFun (coordinates position.1).2.1 position.2
  · funext position
    exact congrFun (coordinates position.1).2.2 position.2

/-- All nonzero coefficients obey the support equation with the type-dependent total. -/
theorem coarseSource_valid {prime : ℕ} [Fact prime.Prime]
    (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (x : Axis Positions data q Shape.x) (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (nonzero : coarseSource (K := K) data q x y z ≠ 0) (position : (type : T) × Positions type) :
    axisCoarse prime data x position + axisCoarse prime data y position + axisCoarse prime data z position =
      (total length position : ZMod prime) :=
  coarseFiltered_mod_valid q (length position.1) (data position.1).parent
    (data position.1).coarseX (data position.1).coarseY (data position.1).coarseZ
    (x position.1) (y position.1) (z position.1)
    (coarseSource_factors data q x y z nonzero position.1) position.2

variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Apply a single global hash restriction to the full heterogeneous coarse source. -/
def hashedSource (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime)) :=
  hashedTensor (coarseSource (K := K) data q) (axisCoarse prime data) (axisCoarse prime data) (axisCoarse prime data)
    (fun position => (total length position : ZMod prime)) seed buckets

/-- Coarse ownership considers every global product edge in one common bucket. -/
def globalOwner (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) : Axis Positions data q Shape.x → Option (Edges Positions data) :=
  coarseOwner (fun edge => modularEdge prime (naturalEdge data edge)) (axisCoarse prime data)
    (fun position => (total length position : ZMod prime)) seed

/-- A unique global coarse owner fixes the natural child labels of every type, without per-type hash activity. -/
theorem globalOwner_forces (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (edge : Edges Positions data) (x : Axis Positions data q Shape.x)
    (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (owned : globalOwner data q seed x = some edge)
    (nonzero : hashedSource (K := K) data q seed buckets x y z ≠ 0) :
    (∀ type position, wordCoarse (leftHalf (x type position).val) = ((edge type).val position).val.val.x) ∧
    (∀ type position, wordCoarse (leftHalf (y type position).val) = ((edge type).val position).val.val.y) ∧
    (∀ type position, wordCoarse (leftHalf (z type position).val) = ((edge type).val position).val.val.z) := by
  have forced := coarse_owner_forces (coarseSource (K := K) data q)
    (fun edge => modularEdge prime (naturalEdge data edge)) (axisCoarse prime data) (axisCoarse prime data)
    (axisCoarse prime data) (fun position => (total length position : ZMod prime))
    (coarseSource_valid data q) (coarseSource_complete prime data q) seed buckets free edge x y z owned nonzero
  have hx := bounded_word_cast_injective
    (fun position => (naturalEdge_small data edge large position).1)
    (fun position => (wordCoarse_le (leftHalf (x position.1 position.2).val)).trans_lt (large position.1)) forced.1
  have hy := bounded_word_cast_injective
    (fun position => (naturalEdge_small data edge large position).2.1)
    (fun position => (wordCoarse_le (leftHalf (y position.1 position.2).val)).trans_lt (large position.1)) forced.2.1
  have hz := bounded_word_cast_injective
    (fun position => (naturalEdge_small data edge large position).2.2)
    (fun position => (wordCoarse_le (leftHalf (z position.1 position.2).val)).trans_lt (large position.1)) forced.2.2
  exact ⟨fun type position => (congrFun hx ⟨type, position⟩).symm,
    fun type position => (congrFun hy ⟨type, position⟩).symm,
    fun type position => (congrFun hz ⟨type, position⟩).symm⟩

end
end MatrixBounds.Tensor.CW.Mixed
