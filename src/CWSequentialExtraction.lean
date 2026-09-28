import CWSequentialData

/-! The complete three-stage ownership extraction for an actual CW parent
product. Necessary compatibility and disjointness are proved from the physical
tensor support and the one-axis restrictions defined in CWSequentialData. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [CommRing K] in
/-- A retained X variable has a prescribed active edge, full X types, and a unique owner in the complete graph. -/
theorem ownerX_facts (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (x : P → AxisVariable q (length+length) data.parent.x)
    (owned : data.ownerX q seed x = some edge) :
    parentCoarseOwner q length data.parent data.coarseX data.coarseY data.coarseZ seed x = some edge ∧
      data.prescribed edge ∧ fullChildType data.parent data.balanced (data.word edge) data.fineX x ∧
        data.active seed edge := by
  obtain ⟨owner, prescribed, full⟩ := (refineOwner_eq_iff _ _ _ _).mp owned
  refine ⟨owner, prescribed, full, ?_⟩
  unfold parentCoarseOwner coarseOwner at owner
  have specified := (uniqueOwner_spec _ x edge owner).1
  change (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).InBucket
    (fun _ => ((2*length : ℕ) : ZMod prime)) seed
    (hashX seed.2.1 seed.1 (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).x)
  rw [specified.1]
  exact specified.2

/-- Y's actual compatibility relation is necessary for every nonzero retained coefficient. -/
theorem necessaryY (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (edge : data.Edges (P := P)) (x : P → AxisVariable q (length+length) data.parent.x)
    (y : P → AxisVariable q (length+length) data.parent.y) (z : P → AxisVariable q (length+length) data.parent.z)
    (owned : data.ownerX q seed x = some edge)
    (nonzero : data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    data.compatibleY q seed edge y := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := data.ownerX_facts q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := parentCoarseOwner_forces q length data.parent
    data.coarseX data.coarseY data.coarseZ seed buckets free large edge x y z facts.1 retained.1
  refine ⟨facts.2.1, facts.2.2.2, ?_⟩
  exact parent_y_compatibility data.parent data.balanced (data.word edge)
    (fun position => (edge.val position).property) x y z agreesX agreesY agreesZ
    (hashed_parent_factors q length data.parent data.coarseX data.coarseY data.coarseZ seed buckets x y z retained.1)
    data.fineX data.fineY facts.2.2.1 data.zeroZ
    (pooled_y_of_agreement data.parent data.balanced (data.word edge)
      (fun position => (edge.val position).property) data.fineY y agreesY retained.2.2.1.2)

/-- After full Y types are imposed, Z's actual compatibility relation is likewise necessary. -/
theorem necessaryZ (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (edge : data.Edges (P := P)) (x : P → AxisVariable q (length+length) data.parent.x)
    (y : P → AxisVariable q (length+length) data.parent.y) (z : P → AxisVariable q (length+length) data.parent.z)
    (owned : data.ownerX q seed x = some edge) (fullY : data.fullY q edge y)
    (nonzero : data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    data.compatibleZ q seed edge z := by
  have retained := accepted_nonzero _ _ _ _ _ _ _ x y z nonzero
  have facts := data.ownerX_facts q seed edge x owned
  obtain ⟨agreesX, agreesY, agreesZ⟩ := parentCoarseOwner_forces q length data.parent
    data.coarseX data.coarseY data.coarseZ seed buckets free large edge x y z facts.1 retained.1
  refine ⟨facts.2.1, facts.2.2.2, ?_⟩
  exact parent_z_compatibility data.parent data.balanced (data.word edge)
    (fun position => (edge.val position).property) x y z agreesX agreesY agreesZ
    (hashed_parent_factors q length data.parent data.coarseX data.coarseY data.coarseZ seed buckets x y z retained.1)
    data.fineX data.fineY data.fineZ facts.2.2.1 fullY data.zeroX data.zeroY
    (pooled_z_of_agreement data.parent data.balanced (data.word edge)
      (fun position => (edge.val position).property) data.fineZ z agreesZ retained.2.2.2.2)

/-- All cross-copy coefficients vanish under the concrete CW ownership maps. -/
theorem owners_disjoint (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (edge other third : data.Edges (P := P)) (x : P → AxisVariable q (length+length) data.parent.x)
    (y : P → AxisVariable q (length+length) data.parent.y) (z : P → AxisVariable q (length+length) data.parent.z)
    (ownedX : data.ownerX q seed x = some edge)
    (ownedY : refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullY q) y = some other)
    (ownedZ : refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullZ q) z = some third)
    (nonzero : data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ x y z ≠ 0) :
    edge = other ∧ other = third :=
  sequential_owners_disjoint _ _ _ _ _ _
    (data.necessaryY q seed buckets free large acceptX acceptY acceptZ)
    (data.necessaryZ q seed buckets free large acceptX acceptY acceptZ)
    edge other third x y z ownedX ownedY ownedZ nonzero

/-- The concrete sequential CW extraction preserves the available source rank and degree budget. -/
def extractionCertificate (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) {rank degree : ℕ}
    (certificate : Degeneration.Certificate
      (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (data.extractedPieces (K := K) q seed buckets acceptX acceptY acceptZ) rank degree :=
  sequentialCompatibilityExtraction certificate (data.ownerX q seed) (data.compatibleY q seed) (data.fullY q)
    (data.compatibleZ q seed) (data.fullZ q)
    (data.necessaryY q seed buckets free large acceptX acceptY acceptZ)
    (data.necessaryZ q seed buckets free large acceptX acceptY acceptZ)

/-- All preliminary coarse, hash, and pooled tests are explicit variable restrictions of the common parent. -/
def pooledParentCertificate (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate (parentPower (K := K) (P := P) q length data.parent) rank degree) :
    Degeneration.Certificate (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ) rank degree :=
  acceptedCertificate _ id id id _ _ _
    (hashedCoarseParentCertificate q length data.parent data.coarseX data.coarseY data.coarseZ seed buckets certificate)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
