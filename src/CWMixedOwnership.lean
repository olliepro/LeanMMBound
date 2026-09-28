import CWMixedOwnershipData

/-! Global sequential ownership is an actual tensor restriction for parents of
different types and lengths. The necessary compatibility follows from physical
CW support after the one global X owner has fixed all coarse coordinates. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- Every surviving physical coefficient passes the Y compatibility test of its global X owner. -/
theorem necessaryY (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (edge : Edges Positions data) (x : Axis Positions data q Shape.x)
    (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (owned : ownerX data q seed x = some edge)
    (nonzero : pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    compatibleY data q seed edge y := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := ownerX_facts data q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := globalOwner_forces data q seed buckets free large edge x y z facts.1 retained.1
  refine ⟨facts.2.1, facts.2.2.2, ?_⟩
  intro type
  exact parent_y_compatibility (data type).parent (data type).balanced ((data type).word (edge type))
    (fun position => ((edge type).val position).property) (x type) (y type) (z type)
    (agreesX type) (agreesY type) (agreesZ type)
    (hashedSource_factors data q seed buckets x y z retained.1 type)
    (data type).fineX (data type).fineY (facts.2.2.1 type) (data type).zeroZ
    (pooled_y_of_agreement (data type).parent (data type).balanced ((data type).word (edge type))
      (fun position => ((edge type).val position).property) (data type).fineY (y type)
      (agreesY type) (retained.2.2.1 type).2)

/-- After full Y profiles are imposed, every surviving coefficient passes its global owner's Z compatibility test. -/
theorem necessaryZ (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (edge : Edges Positions data) (x : Axis Positions data q Shape.x)
    (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (owned : ownerX data q seed x = some edge) (fullY : Full data (fun type => (data type).fineY) edge y)
    (nonzero : pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    compatibleZ data q seed edge z := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := ownerX_facts data q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := globalOwner_forces data q seed buckets free large edge x y z facts.1 retained.1
  refine ⟨facts.2.1, facts.2.2.2, ?_⟩
  intro type
  exact parent_z_compatibility (data type).parent (data type).balanced ((data type).word (edge type))
    (fun position => ((edge type).val position).property) (x type) (y type) (z type)
    (agreesX type) (agreesY type) (agreesZ type)
    (hashedSource_factors data q seed buckets x y z retained.1 type)
    (data type).fineX (data type).fineY (data type).fineZ (facts.2.2.1 type) (fullY type)
    (data type).zeroX (data type).zeroY
    (pooled_z_of_agreement (data type).parent (data type).balanced ((data type).word (edge type))
      (fun position => ((edge type).val position).property) (data type).fineZ (z type)
      (agreesZ type) (retained.2.2.2 type).2)

/-- No physical coefficient connects different global owners after the sequential axis restrictions. -/
theorem owners_disjoint (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (edge other third : Edges Positions data) (x : Axis Positions data q Shape.x)
    (y : Axis Positions data q Shape.y) (z : Axis Positions data q Shape.z)
    (ownedX : ownerX data q seed x = some edge)
    (ownedY : refineOwner (uniqueOwner (compatibleY data q seed)) (Full data (fun type => (data type).fineY)) y = some other)
    (ownedZ : refineOwner (uniqueOwner (compatibleZ data q seed)) (Full data (fun type => (data type).fineZ)) z = some third)
    (nonzero : pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    edge = other ∧ other = third :=
  sequential_owners_disjoint _ _ _ _ _ _
    (necessaryY data q seed buckets free large acceptX acceptY acceptZ)
    (necessaryZ data q seed buckets free large acceptX acceptY acceptZ)
    edge other third x y z ownedX ownedY ownedZ nonzero

/-- The global sequential restrictions yield independent actual pieces at the original source budget. -/
def extractionCertificate (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (directSum (ownedPiece (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ)
      (ownerX data q seed) (refineOwner (uniqueOwner (compatibleY data q seed)) (Full data (fun type => (data type).fineY)))
      (refineOwner (uniqueOwner (compatibleZ data q seed)) (Full data (fun type => (data type).fineZ))))) rank degree :=
  sequentialCompatibilityExtraction certificate (ownerX data q seed)
    (compatibleY data q seed) (Full data (fun type => (data type).fineY))
    (compatibleZ data q seed) (Full data (fun type => (data type).fineZ))
    (necessaryY data q seed buckets free large acceptX acceptY acceptZ)
    (necessaryZ data q seed buckets free large acceptX acceptY acceptZ)

end
end MatrixBounds.Tensor.CW.Mixed
