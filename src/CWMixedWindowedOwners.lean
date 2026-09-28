import CWMixedPrepared
import RefinedOwnership

/-! Record the parent windows in the final global owner maps, so ownership
holes and missing parent-interface blocks are accounted for exactly. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The global X owner additionally requires all parent X windows. -/
def windowOwnerX (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  refineOwner (ownerX data q seed) (fun _ => windowTest data accept)

/-- The global Y owner is uniquely compatible, fully typed, and accepted by all parent Y windows. -/
def windowOwnerY (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  refineOwner (refineOwner (uniqueOwner (compatibleY data q seed)) (Full data (fun type => (data type).fineY)))
    (fun _ => windowTest data accept)

/-- The global Z owner imposes the corresponding unique compatibility, full types, and parent windows. -/
def windowOwnerZ (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  refineOwner (refineOwner (uniqueOwner (compatibleZ data q seed)) (Full data (fun type => (data type).fineZ)))
    (fun _ => windowTest data accept)

/-- The actual independent global pieces retain all parent windows in their owner maps. -/
def windowedPieces (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  directSum (ownedPiece (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ)
    (windowOwnerX data q seed acceptX) (windowOwnerY data q seed acceptY) (windowOwnerZ data q seed acceptZ))

/-- The available heterogeneous parent-interface certificate supplies all independent global pieces at the same budget. -/
def windowedPiecesCertificate (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (parentInterface (K := K) data q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (windowedPieces (K := K) data q seed buckets acceptX acceptY acceptZ) rank degree :=
  refinedOwnershipCertificate _ (ownerX data q seed)
    (refineOwner (uniqueOwner (compatibleY data q seed)) (Full data (fun type => (data type).fineY)))
    (refineOwner (uniqueOwner (compatibleZ data q seed)) (Full data (fun type => (data type).fineZ)))
    (owners_disjoint data q seed buckets free large acceptX acceptY acceptZ)
    (fun _ => windowTest data acceptX) (fun _ => windowTest data acceptY) (fun _ => windowTest data acceptZ)
    (prepareInterfaceCertificate data q seed buckets acceptX acceptY acceptZ certificate)

end
end MatrixBounds.Tensor.CW.Mixed
