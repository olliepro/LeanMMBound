import CWRootTargetOwnership

/-! Mapped root coefficients pass every coarse, hash, and pooled restriction
of their selected edge, and equal the complete common child target. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [NeZero (2 : ZMod prime)] in
/-- An active root edge in the retained bucket set realizes the entire common target coefficient. -/
theorem mapped_target_coefficient (data : RootRestrictionData length) (edge : data.PrescribedEdges (P := P))
    (q : ℕ) (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (active : data.active seed edge.val)
    (member : hashX seed.2.1 seed.1 (data.graphEdges prime edge.val).x ∈ buckets)
    (x : data.TargetAxis q Shape.x data.fineX) (y : data.TargetAxis q Shape.y data.fineY)
    (z : data.TargetAxis q Shape.z data.fineZ) :
    data.pooledRoot (K := K) q seed buckets
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.x data.fineX x)
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.y data.fineY y)
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.z data.fineZ z) = data.target (K := K) q x y z := by
  let typed := data.prescribedWordEquiv edge
  let mapX := data.targetAxis typed q Shape.x data.fineX x
  let mapY := data.targetAxis typed q Shape.y data.fineY y
  let mapZ := data.targetAxis typed q Shape.z data.fineZ z
  let graph := data.graphEdges prime edge.val
  have modX : coarseMod prime mapX = graph.x := data.targetAxis_mod typed q Shape.x data.fineX x
  have modY : coarseMod prime mapY = graph.y := data.targetAxis_mod typed q Shape.y data.fineY y
  have modZ : coarseMod prime mapZ = graph.z := data.targetAxis_mod typed q Shape.z data.fineZ z
  have typedX : HasType (data.coarse 0) (fun position => wordCoarseIndex (mapX position)) := by
    rw [data.targetAxis_index typed q Shape.x data.fineX x shapeXIndex (fun _ => rfl)]
    exact edge.val.property.1
  have typedY : HasType (data.coarse 1) (fun position => wordCoarseIndex (mapY position)) := by
    rw [data.targetAxis_index typed q Shape.y data.fineY y shapeYIndex (fun _ => rfl)]
    exact edge.val.property.2.1
  have typedZ : HasType (data.coarse 2) (fun position => wordCoarseIndex (mapZ position)) := by
    rw [data.targetAxis_index typed q Shape.z data.fineZ z shapeZIndex (fun _ => rfl)]
    exact edge.val.property.2.2
  have pooledY := data.targetAxis_pooled typed q Shape.y data.fineY y shapeYIndex (fun _ => rfl)
  have pooledZ := data.targetAxis_pooled typed q Shape.z data.fineZ z shapeZIndex (fun _ => rfl)
  change data.pooledRoot (K := K) q seed buckets mapX mapY mapZ = _
  change pooledAxis _ mapY at pooledY
  change pooledAxis _ mapZ at pooledZ
  change graph.InBucket (fun _ => ((2*length : ℕ) : ZMod prime)) seed (hashX seed.2.1 seed.1 graph.x) at active
  change hashX seed.2.1 seed.1 graph.x ∈ buckets at member
  simp only [pooledRoot, acceptedTensor, id_eq, pooledY, pooledZ, and_self, if_true,
    hashedRoot, hashedTensor, modX, modY, modZ, active.2.1, active.2.2,
    member, coarseFiltered, typedX, typedY, typedZ]
  exact congrFun (congrFun (congrFun (data.target_identity typed q) x) y) z

end
end MatrixBounds.Tensor.CW.RootRestrictionData
