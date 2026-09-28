import CWTargetCoefficients
import SelectedTargets

/-! A selected family of actual CW coarse edges supplies independent copies of
one common exact child target, with precisely the proved parent/collision holes. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K Selected : Type*} [Fintype P] [CommRing K] [Fintype Selected]
variable {length prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The selected common child targets with their actual parent-window and compatibility-collision holes. -/
def damagedTargetBatch (data : SplitRestrictionData length) (symmetric : data.Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) P) (selected : Selected → data.PrescribedEdges (P := P))
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) :=
  directSum (fun copy => acceptedTensor (data.target (K := K) q)
    (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
    (fun parts => ¬data.parentHole symmetric (selected copy) data.fineX acceptX parts)
    (fun parts => ¬data.targetHoles symmetric seed (selected copy) Shape.y yClass data.fineY acceptY parts)
    (fun parts => ¬data.targetHoles symmetric seed (selected copy) Shape.z zClass data.fineZ acceptZ parts))

/-- The complete CW variable restriction produces the whole damaged common-target batch at the input interface budget.
The selected edges must be active, belong to the bucket set, and be coarse-X unique;
all fine compatibility and coefficient conditions are supplied by the preceding proofs. -/
def damagedTargetCertificate (data : SplitRestrictionData length) (symmetric : data.Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (free : ProgressionFree buckets)
    (large : 2*length < prime) (selected : Selected ↪ data.PrescribedEdges (P := P))
    (active : ∀ copy, data.active seed (selected copy).val)
    (member : ∀ copy, hashX seed.2.1 seed.1
      (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ (selected copy).val).x ∈ buckets)
    (unique : ∀ copy, ¬data.coarseCollision seed (selected copy).val)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop) {rank degree : ℕ}
    (certificate : Degeneration.Certificate (data.parentInterface (K := K) q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (data.damagedTargetBatch (K := K) symmetric q seed selected acceptX acceptY acceptZ) rank degree := by
  let embedding : Selected ↪ data.Edges (P := P) :=
    selected.trans (Function.Embedding.subtype data.prescribed)
  refine selectedOwnedTargetCertificate embedding
    (data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ) (data.target (K := K) q)
    (data.windowOwnerX q seed acceptX) (data.windowOwnerY q seed acceptY) (data.windowOwnerZ q seed acceptZ)
    (fun copy => data.targetAxis symmetric (selected copy) q Shape.x (fun _ _ => rfl) data.fineX)
    (fun copy => data.targetAxis symmetric (selected copy) q Shape.y (fun _ _ => rfl) data.fineY)
    (fun copy => data.targetAxis symmetric (selected copy) q Shape.z (fun _ _ => rfl) data.fineZ)
    (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
    (fun copy => data.parentHole symmetric (selected copy) data.fineX acceptX)
    (fun copy => data.targetHoles symmetric seed (selected copy) Shape.y yClass data.fineY acceptY)
    (fun copy => data.targetHoles symmetric seed (selected copy) Shape.z zClass data.fineZ acceptZ)
    ?_ ?_ ?_ ?_ (data.windowedPiecesCertificate q seed buckets free large acceptX acceptY acceptZ certificate)
  · intro copy x y z keptX keptY keptZ
    apply data.mapped_target_coefficient symmetric (selected copy) q seed buckets (active copy) (member copy)
      acceptX acceptY acceptZ x y z
    · rw [data.targetAxis_fine]
      exact not_not.mp keptX
    · rw [data.targetAxis_fine]
      exact not_not.mp (not_or.mp keptY).1
    · rw [data.targetAxis_fine]
      exact not_not.mp (not_or.mp keptZ).1
  · intro copy x
    exact data.target_ownerX_iff symmetric (selected copy) q seed (active copy) (unique copy) acceptX x
  · intro copy y
    exact data.target_ownerY_iff symmetric (selected copy) q seed (active copy) acceptY y
  · intro copy z
    exact data.target_ownerZ_iff symmetric (selected copy) q seed (active copy) acceptZ z

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
