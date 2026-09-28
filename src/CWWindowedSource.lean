import CWSequentialExtraction

/-! Start the actual extraction with an available approximate parent interface.
The preparatory masks commute, so no certificate for an unrestricted parent
is assumed when the pipeline supplies only a windowed interface. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The available parent interface accepts three independently specified fine-word windows. -/
def parentInterface (data : SplitRestrictionData length) (q : ℕ)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  acceptedTensor (parentPower (K := K) (P := P) q length data.parent)
    parentFine parentFine parentFine acceptX acceptY acceptZ

/-- First impose coarse marginals on the available parent interface, then hash, then pool. -/
def preparedParent (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  acceptedTensor
    (hashedTensor (acceptedTensor (data.parentInterface (K := K) q acceptX acceptY acceptZ)
      (fun x position => wordCoarseIndex (leftHalf (x position).val))
      (fun y position => wordCoarseIndex (leftHalf (y position).val))
      (fun z position => wordCoarseIndex (leftHalf (z position).val))
      (HasType data.coarseX) (HasType data.coarseY) (HasType data.coarseZ))
      (parentCoarseMod prime) (parentCoarseMod prime) (parentCoarseMod prime)
      (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets)
    id id id (fun _ => True) (pooledAxisType (pooledProfile data.fineY shapeYIndex))
      (pooledAxisType (pooledProfile data.fineZ shapeZIndex))

/-- Reordering the independent axis masks gives exactly the source used by the ownership construction. -/
theorem prepared_eq_pooled (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :
    data.preparedParent (K := K) q seed buckets acceptX acceptY acceptZ =
      data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ := by
  funext x y z
  simp only [preparedParent, pooledParent, parentInterface, hashedCoarseParent, hashedTensor,
    coarseFiltered, parentPower, Interface.heterogeneous, acceptedTensor, id_eq, true_and]
  split_ifs <;> simp_all

/-- Every preliminary test preserves the certificate of the available, already restricted parent interface. -/
def prepareInterfaceCertificate (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (data.parentInterface (K := K) q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ) rank degree := by
  rw [← data.prepared_eq_pooled q seed buckets acceptX acceptY acceptZ]
  exact acceptedCertificate _ id id id _ _ _
    (hashCertificate (acceptedCertificate _
      (fun x position => wordCoarseIndex (leftHalf (x position).val))
      (fun y position => wordCoarseIndex (leftHalf (y position).val))
      (fun z position => wordCoarseIndex (leftHalf (z position).val))
      (HasType data.coarseX) (HasType data.coarseY) (HasType data.coarseZ) certificate)
      (parentCoarseMod prime) (parentCoarseMod prime) (parentCoarseMod prime)
      (fun _ => ((2*length : ℕ) : ZMod prime)) seed buckets)

/-- The available approximate interface yields the actual independent owner pieces at its original budget. -/
def windowedExtractionCertificate (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (data.parentInterface (K := K) q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (data.extractedPieces (K := K) q seed buckets acceptX acceptY acceptZ) rank degree :=
  data.extractionCertificate q seed buckets free large acceptX acceptY acceptZ
    (data.prepareInterfaceCertificate q seed buckets acceptX acceptY acceptZ certificate)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
