import CWRootTargetCoefficients
import ContextExtraction

/-! The unrestricted root supplies its whole selected damaged target batch
in every tensor context, preserving all original rank-budget factors. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K Selected : Type*} [Fintype P] [CommRing K] [Fintype Selected] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [NeZero (2 : ZMod prime)] in
/-- All root coarse, hash, and pooled masks preserve arbitrary waiting tensor factors. -/
theorem contextReduction_prepare (data : RootRestrictionData length) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) :
    ContextReduction.{v} (rootPower (K := K) (P := P) q length) (data.pooledRoot (K := K) q seed buckets) 1 := by
  have coarse : ContextReduction.{v} (rootPower (K := K) (P := P) q length) (data.coarseFiltered (K := K) q) 1 :=
    contextReduction_accepted _ _ _ _ _ _ _
  have hashed : ContextReduction.{v} (data.coarseFiltered (K := K) q) (data.hashedRoot (K := K) q seed buckets) 1 :=
    contextReduction_accepted _ _ _ _ _ _ _
  have pooled : ContextReduction.{v} (data.hashedRoot (K := K) q seed buckets) (data.pooledRoot (K := K) q seed buckets) 1 :=
    contextReduction_accepted _ _ _ _ _ _ _
  simpa only [one_mul] using (coarse.trans hashed).trans pooled

/-- Sequential owner restrictions turn the root source into independent physical pieces at unit contextual cost. -/
theorem contextReduction_pieces (data : RootRestrictionData length) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : 2*length < prime) :
    ContextReduction.{v} (rootPower (K := K) (P := P) q length) (data.extractedPieces (K := K) q seed buckets) 1 := by
  have owners : ContextReduction.{v} (data.pooledRoot (K := K) q seed buckets) (data.extractedPieces (K := K) q seed buckets) 1 :=
    contextReduction_owned _ _ _ _ (data.owners_disjoint q seed buckets free large)
  simpa only [one_mul] using (data.contextReduction_prepare q seed buckets).trans owners

/-- Selected root targets have intact X parts and precisely the actual Y/Z compatibility holes. -/
def damagedTargetBatch (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (selected : Selected → data.PrescribedEdges (P := P)) :=
  directSum (fun copy => acceptedTensor (data.target (K := K) q)
    (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
    (fun _ => ¬False)
    (fun parts => ¬data.targetHoles seed (selected copy) Shape.y yClass data.fineY parts)
    (fun parts => ¬data.targetHoles seed (selected copy) Shape.z zClass data.fineZ parts))

omit [Fintype Selected] [NeZero (2 : ZMod prime)] in
/-- The selected independent pieces are exactly copies of the common root target with their collision holes. -/
theorem contextReduction_identifyTargets (data : RootRestrictionData length) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (selected : Selected ↪ data.PrescribedEdges (P := P))
    (present : ∀ copy, data.active seed (selected copy).val)
    (member : ∀ copy, hashX seed.2.1 seed.1 (data.graphEdges prime (selected copy).val).x ∈ buckets)
    (unique : ∀ copy, ¬data.coarseCollision seed (selected copy).val) :
    ContextReduction.{v} (data.extractedPieces (K := K) q seed buckets)
      (data.damagedTargetBatch (K := K) q seed selected) 1 := by
  let embedding : Selected ↪ data.Edges (P := P) := selected.trans (Function.Embedding.subtype data.prescribed)
  refine contextReduction_selectedOwnedTargets embedding (data.pooledRoot (K := K) q seed buckets) (data.target (K := K) q)
    (data.ownerX q seed) (refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullType q data.fineY))
    (refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullType q data.fineZ))
    (fun copy => data.targetAxis (data.prescribedWordEquiv (selected copy)) q Shape.x data.fineX)
    (fun copy => data.targetAxis (data.prescribedWordEquiv (selected copy)) q Shape.y data.fineY)
    (fun copy => data.targetAxis (data.prescribedWordEquiv (selected copy)) q Shape.z data.fineZ)
    (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
    (fun _ _ => False) (fun copy => data.targetHoles seed (selected copy) Shape.y yClass data.fineY)
    (fun copy => data.targetHoles seed (selected copy) Shape.z zClass data.fineZ) ?_ ?_ ?_ ?_
  · intro copy x y z _ _ _
    exact data.mapped_target_coefficient (selected copy) q seed buckets (present copy) (member copy) x y z
  · intro copy x
    exact iff_of_true (data.target_ownerX (selected copy) q seed (present copy) (unique copy) x) (fun impossible => impossible)
  · intro copy y
    exact data.target_ownerY_iff (selected copy) q seed (present copy) y
  · intro copy z
    exact data.target_ownerZ_iff (selected copy) q seed (present copy) z

omit [Fintype Selected] in
/-- The unrestricted source supplies the entire selected damaged root batch while retaining every companion tensor. -/
theorem contextReduction_damagedTargets (data : RootRestrictionData length) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (selected : Selected ↪ data.PrescribedEdges (P := P))
    (present : ∀ copy, data.active seed (selected copy).val)
    (member : ∀ copy, hashX seed.2.1 seed.1 (data.graphEdges prime (selected copy).val).x ∈ buckets)
    (unique : ∀ copy, ¬data.coarseCollision seed (selected copy).val) :
    ContextReduction.{v} (rootPower (K := K) (P := P) q length) (data.damagedTargetBatch (K := K) q seed selected) 1 := by
  simpa only [one_mul] using (data.contextReduction_pieces q seed buckets free large).trans
    (data.contextReduction_identifyTargets q seed buckets selected present member unique)

end
end MatrixBounds.Tensor.CW.RootRestrictionData
