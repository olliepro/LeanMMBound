import ContextExtraction
import CWMixedWindowedOwners

/-! The actual CW preparatory masks and owner extraction preserve arbitrary
untouched factors and preexisting batches. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [NeZero (2 : ZMod prime)] in
/-- Coarse, hash, and pool masks are contextual restrictions of the available nominal parent interface. -/
theorem contextReduction_prepare (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :
    ContextReduction.{v} (parentInterface (K := K) data q acceptX acceptY acceptZ)
      (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ) 1 := by
  rw [← prepared_eq_pooled data q seed buckets acceptX acceptY acceptZ]
  let source := parentInterface (K := K) data q acceptX acceptY acceptZ
  let coarse := acceptedTensor source id id id
    (coarseTest data (fun type => (data type).coarseX)) (coarseTest data (fun type => (data type).coarseY))
    (coarseTest data (fun type => (data type).coarseZ))
  let hashed := hashedTensor coarse (axisCoarse prime data) (axisCoarse prime data) (axisCoarse prime data)
    (fun position => (total length position : ZMod prime)) seed buckets
  have coarseReduction : ContextReduction.{v} source coarse 1 := contextReduction_accepted _ _ _ _ _ _ _
  have hashReduction : ContextReduction.{v} coarse hashed 1 := contextReduction_accepted _ _ _ _ _ _ _
  have poolReduction : ContextReduction.{v} hashed (preparedSource (K := K) data q seed buckets acceptX acceptY acceptZ) 1 :=
    contextReduction_accepted _ _ _ _ _ _ _
  simpa only [one_mul] using (coarseReduction.trans hashReduction).trans poolReduction

/-- The complete global owner construction preserves every earlier copy and waiting factor. -/
theorem contextReduction_windowedPieces (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :
    ContextReduction.{v} (parentInterface (K := K) data q acceptX acceptY acceptZ)
      (windowedPieces (K := K) data q seed buckets acceptX acceptY acceptZ) 1 := by
  have owners : ContextReduction.{v} (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ)
      (windowedPieces (K := K) data q seed buckets acceptX acceptY acceptZ) 1 := by
    simpa only [windowedPieces, windowOwnerX, windowOwnerY, windowOwnerZ] using
      contextReduction_refined.{v} (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ) (ownerX data q seed)
      (refineOwner (uniqueOwner (compatibleY data q seed)) (Full data (fun type => (data type).fineY)))
      (refineOwner (uniqueOwner (compatibleZ data q seed)) (Full data (fun type => (data type).fineZ)))
      (owners_disjoint data q seed buckets free large acceptX acceptY acceptZ)
      (fun _ => windowTest data acceptX) (fun _ => windowTest data acceptY) (fun _ => windowTest data acceptZ)
  simpa only [one_mul] using (contextReduction_prepare data q seed buckets acceptX acceptY acceptZ).trans owners

end
end MatrixBounds.Tensor.CW.Mixed
