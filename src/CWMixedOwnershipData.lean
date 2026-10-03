module

public import CWMixedSource
public import CWMixedDegrees

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Concrete global owners and variable-only acceptance tests for the
heterogeneous source. No component is required to have its own active hash. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A complete global edge is prescribed exactly when every component has its exact split type. -/
def prescribed (data : ∀ type, SplitRestrictionData (length type)) (edge : Edges Positions data) : Prop :=
  ∀ type, (data type).prescribed (edge type)

/-- Activity refers to one common bucket for the entire product edge. -/
def active (data : ∀ type, SplitRestrictionData (length type))
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : Edges Positions data) : Prop :=
  (modularEdge prime (naturalEdge data edge)).InBucket (fun position => (total length position : ZMod prime)) seed
    (hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data edge)).x)

/-- Full child types are imposed in all labelled pools of every parent type. -/
def Full (data : ∀ type, SplitRestrictionData (length type)) {q : ℕ} {axis : Shape → ℕ}
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (edge : Edges Positions data) (entries : Axis Positions data q axis) : Prop :=
  ∀ type, fullChildType (data type).parent (data type).balanced ((data type).word (edge type)) (profile type) (entries type)

/-- The global X owner retains only prescribed edges and their full X child profiles. -/
def ownerX (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) :=
  refineOwner (globalOwner data q seed)
    (fun edge entries => prescribed data edge ∧ Full data (fun type => (data type).fineX) edge entries)

/-- Global Y compatibility uses the same active global edge and every physical Y compatibility test. -/
def compatibleY (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : Edges Positions data)
    (entries : Axis Positions data q Shape.y) : Prop :=
  prescribed data edge ∧ active data seed edge ∧ Compatible data Shape.y (fun _ => yClass)
    (fun type => (data type).fineY) edge (fun type => parentFine (entries type))

/-- Z compatibility is global as well, after full Y types have been imposed. -/
def compatibleZ (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : Edges Positions data)
    (entries : Axis Positions data q Shape.z) : Prop :=
  prescribed data edge ∧ active data seed edge ∧ Compatible data Shape.z (fun _ => zClass)
    (fun type => (data type).fineZ) edge (fun type => parentFine (entries type))

/-- Impose the parent windows and each axis's own pooled child tests on the globally hashed source. -/
def pooledSource (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  acceptedTensor (hashedSource (K := K) data q seed buckets) id id id
    (fun entries => ∀ type, acceptX type (parentFine (entries type)))
    (fun entries => ∀ type, acceptY type (parentFine (entries type)) ∧
      pooledAxisType (pooledProfile (data type).fineY shapeYIndex) (entries type))
    (fun entries => ∀ type, acceptZ type (parentFine (entries type)) ∧
      pooledAxisType (pooledProfile (data type).fineZ shapeZIndex) (entries type))

omit [CommRing K] [NeZero (2 : ZMod prime)] in
/-- A retained X variable has a prescribed active global edge and every full X profile. -/
theorem ownerX_facts (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : Edges Positions data)
    (entries : Axis Positions data q Shape.x) (owned : ownerX data q seed entries = some edge) :
    globalOwner data q seed entries = some edge ∧ prescribed data edge ∧
      Full data (fun type => (data type).fineX) edge entries ∧ active data seed edge := by
  obtain ⟨owner, chosen, full⟩ := (refineOwner_eq_iff _ _ _ _).mp owned
  refine ⟨owner, chosen, full, ?_⟩
  unfold globalOwner coarseOwner at owner
  have facts := (uniqueOwner_spec _ entries edge owner).1
  unfold active
  rw [facts.1]
  exact facts.2

omit [NeZero (2 : ZMod prime)] in
/-- Nonzero globally hashed coefficients give the original physical CW coefficient at each position. -/
theorem hashedSource_factors (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (x : Axis Positions data q Shape.x) (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (nonzero : hashedSource (K := K) data q seed buckets x y z ≠ 0) (type : T) (position : Positions type) :
    constituent (K := K) q (length type+length type) (data type).parent
      (x type position) (y type position) (z type position) ≠ 0 := by
  have original := (hashed_nonzero _ _ _ _ _ seed buckets x y z nonzero).1
  have factor := coarseSource_factors data q x y z original type
  have unfiltered := (accepted_nonzero _ _ _ _ _ _ _ _ _ _ factor).1
  intro zero
  exact unfiltered (Finset.prod_eq_zero (Finset.mem_univ position) zero)

end
end MatrixBounds.Tensor.CW.Mixed
