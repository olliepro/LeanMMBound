import CWWindowedSource
import RefinedOwnership

/-! Include parent-interface membership in each final CW owner map, so its
holes are exactly the union of parent-window failures and ownership collisions. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The final X owner also requires the parent interface window. -/
def windowOwnerX (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) :=
  refineOwner (data.ownerX q seed) (fun _ entries => accept (parentFine entries))

/-- The final Y owner requires unique compatibility, full child types, and its parent window. -/
def windowOwnerY (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) :=
  refineOwner (refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullY q))
    (fun _ entries => accept (parentFine entries))

/-- The final Z owner has the corresponding unique, full-type, and window conditions. -/
def windowOwnerZ (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) :=
  refineOwner (refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullZ q))
    (fun _ entries => accept (parentFine entries))

/-- Independent owner pieces after recording all parent-window failures in their axis maps. -/
def windowedPieces (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  directSum (ownedPiece (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ)
    (data.windowOwnerX q seed acceptX) (data.windowOwnerY q seed acceptY) (data.windowOwnerZ q seed acceptZ))

/-- Refining the sequential owners preserves the original available interface certificate budget. -/
def windowedPiecesCertificate (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (data.parentInterface (K := K) q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (data.windowedPieces (K := K) q seed buckets acceptX acceptY acceptZ) rank degree :=
  refinedOwnershipCertificate _ (data.ownerX q seed)
    (refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullY q))
    (refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullZ q))
    (data.owners_disjoint q seed buckets free large acceptX acceptY acceptZ)
    (fun _ entries => acceptX (parentFine entries)) (fun _ entries => acceptY (parentFine entries))
    (fun _ entries => acceptZ (parentFine entries))
    (data.prepareInterfaceCertificate q seed buckets acceptX acceptY acceptZ certificate)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
