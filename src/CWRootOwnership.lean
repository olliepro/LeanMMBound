import CWRootHashing
import CWRootCompatibility

/-! Sequential, variable-only root ownership. The source is the unrestricted
CW power; compatibility is forced by actual coefficients on single positions. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- An active root edge survives the shared hash in its own X bucket. -/
def active (data : RootRestrictionData length) (seed : Seed (ZMod prime) P) (edge : data.Edges (P := P)) : Prop :=
  (data.graphEdges prime edge).InBucket (fun _ => ((2*length : ℕ) : ZMod prime)) seed
    (hashX seed.2.1 seed.1 (data.graphEdges prime edge).x)

/-- Once a root edge owns an axis, its full fine profile is a legitimate variable test. -/
def fullType (data : RootRestrictionData length) (q : ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (edge : data.Edges (P := P)) (entries : P → Fin length → Fin (q+2)) : Prop :=
  SectorCompatible (data.word edge) profile (fineWords entries)

/-- Root X ownership requires a unique complete-graph edge with the prescribed joint and full X types. -/
def ownerX (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P) :=
  refineOwner (data.coarseOwner q seed) (fun edge entries => data.prescribed edge ∧ data.fullType q data.fineX edge entries)

/-- A Y variable is compatible with every prescribed active edge passing its necessary asymmetric test. -/
def compatibleY (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → Fin length → Fin (q+2)) : Prop :=
  data.prescribed edge ∧ data.active seed edge ∧
    compatibleFine Shape.y yClass data.fineY (data.word edge) (fineWords entries)

/-- The Z test uses the zero-X and zero-Y sectors forced by earlier complete axis types. -/
def compatibleZ (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → Fin length → Fin (q+2)) : Prop :=
  data.prescribed edge ∧ data.active seed edge ∧
    compatibleFine Shape.z zClass data.fineZ (data.word edge) (fineWords entries)

/-- Pooled root filtering uses only each variable's own coarse and complete fine word. -/
def pooledRoot (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) :=
  acceptedTensor (data.hashedRoot (K := K) q seed buckets) id id id (fun _ => True)
    (pooledAxis (pooledProfile data.fineY shapeYIndex)) (pooledAxis (pooledProfile data.fineZ shapeZIndex))

/-- Independent root pieces are defined by the three sequential physical owner maps. -/
def extractedPieces (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) :=
  directSum (ownedPiece (data.pooledRoot (K := K) q seed buckets) (data.ownerX q seed)
    (refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullType q data.fineY))
    (refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullType q data.fineZ)))

omit [CommRing K] [NeZero (2 : ZMod prime)] in
/-- The retained root X variable proves coarse uniqueness, prescribed multiplicities, full types, and shared-hash activity. -/
theorem ownerX_facts (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (x : P → Fin length → Fin (q+2))
    (owned : data.ownerX q seed x = some edge) :
    data.coarseOwner q seed x = some edge ∧ data.prescribed edge ∧
      data.fullType q data.fineX edge x ∧ data.active seed edge := by
  obtain ⟨owner, prescribed, full⟩ := (refineOwner_eq_iff _ _ _ _).mp owned
  refine ⟨owner, prescribed, full, ?_⟩
  unfold coarseOwner Extraction.coarseOwner at owner
  have specified := (uniqueOwner_spec _ x edge owner).1
  unfold active
  rw [specified.1]
  exact specified.2

/-- Every nonzero retained root coefficient forces Y's actual compatibility with its X owner. -/
theorem necessaryY (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (edge : data.Edges (P := P)) (x y z : P → Fin length → Fin (q+2))
    (owned : data.ownerX q seed x = some edge)
    (nonzero : data.pooledRoot (K := K) q seed buckets x y z ≠ 0) : data.compatibleY q seed edge y := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := data.ownerX_facts q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := data.coarseOwner_forces q seed buckets free large edge x y z facts.1 retained.1
  exact ⟨facts.2.1, facts.2.2.2, data.y_compatibility (data.word edge) x y z agreesX agreesY agreesZ
    (data.hashedRoot_factors q seed buckets x y z retained.1) facts.2.2.1 retained.2.2.1⟩

/-- After the Y owner imposes its complete types, every retained coefficient forces Z compatibility. -/
theorem necessaryZ (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (edge : data.Edges (P := P)) (x y z : P → Fin length → Fin (q+2))
    (owned : data.ownerX q seed x = some edge) (fullY : data.fullType q data.fineY edge y)
    (nonzero : data.pooledRoot (K := K) q seed buckets x y z ≠ 0) : data.compatibleZ q seed edge z := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := data.ownerX_facts q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := data.coarseOwner_forces q seed buckets free large edge x y z facts.1 retained.1
  exact ⟨facts.2.1, facts.2.2.2, data.z_compatibility (data.word edge) x y z agreesX agreesY agreesZ
    (data.hashedRoot_factors q seed buckets x y z retained.1) facts.2.2.1 fullY retained.2.2.2⟩

/-- The actual sequential root owner maps eliminate all coefficients between distinct pieces. -/
theorem owners_disjoint (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (edge other third : data.Edges (P := P)) (x y z : P → Fin length → Fin (q+2))
    (ownedX : data.ownerX q seed x = some edge)
    (ownedY : refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullType q data.fineY) y = some other)
    (ownedZ : refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullType q data.fineZ) z = some third)
    (nonzero : data.pooledRoot (K := K) q seed buckets x y z ≠ 0) : edge = other ∧ other = third :=
  sequential_owners_disjoint _ _ _ _ _ _ (data.necessaryY q seed buckets free large)
    (data.necessaryZ q seed buckets free large) edge other third x y z ownedX ownedY ownedZ nonzero

/-- All root pooling restrictions retain a supplied certificate of the unrestricted source. -/
def pooledRootCertificate (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (rootPower (K := K) (P := P) q length) rank degree) :
    Degeneration.Certificate (data.pooledRoot (K := K) q seed buckets) rank degree :=
  acceptedCertificate _ id id id _ _ _ (data.hashedRootCertificate q seed buckets certificate)

/-- The independent root pieces inherit exactly the original source rank and degree budgets. -/
def extractionCertificate (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    {rank degree : ℕ} (certificate : Degeneration.Certificate (rootPower (K := K) (P := P) q length) rank degree) :
    Degeneration.Certificate (data.extractedPieces (K := K) q seed buckets) rank degree :=
  sequentialCompatibilityExtraction (data.pooledRootCertificate q seed buckets certificate)
    (data.ownerX q seed) (data.compatibleY q seed) (data.fullType q data.fineY)
    (data.compatibleZ q seed) (data.fullType q data.fineZ)
    (data.necessaryY q seed buckets free large) (data.necessaryZ q seed buckets free large)

end
end MatrixBounds.Tensor.CW.RootRestrictionData
