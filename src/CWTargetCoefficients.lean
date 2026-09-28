import CWTargetOwnership

/-! Actual mapped target coefficients pass the coarse, hash, pooled, and parent
window restrictions whenever the selected edge and its three parts are retained. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [CommRing K] [Fact prime.Prime] [NeZero (2 : ZMod prime)] in
/-- The mapped target also has the prescribed bounded coarse-index word used by marginal restrictions. -/
theorem targetAxis_index (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (entries : data.TargetAxis q axis profile)
    (indices : P → Fin (2*length+1)) (values : ∀ position, (indices position).val = axis (data.word edge.val position).val) :
    (fun position => wordCoarseIndex (leftHalf
      (data.targetAxis symmetric edge q axis additive profile entries position).val)) = indices := by
  funext position
  apply Fin.ext
  exact (data.targetAxis_coarse symmetric edge q axis additive profile entries position).trans (values position).symm

/-- On three accepted mapped parts, the full prepared parent coefficient is exactly the common child coefficient. -/
theorem mapped_target_coefficient (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (seed : Seed (ZMod prime) P)
    (buckets : Set (ZMod prime)) (active : data.active seed edge.val)
    (member : hashX seed.2.1 seed.1
      (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge.val).x ∈ buckets)
    (acceptX acceptY acceptZ : (P → Fin (length+length) → Fin 3) → Prop)
    (x : data.TargetAxis q Shape.x data.fineX) (y : data.TargetAxis q Shape.y data.fineY)
    (z : data.TargetAxis q Shape.z data.fineZ)
    (insideX : acceptX (parentFine (data.targetAxis symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x)))
    (insideY : acceptY (parentFine (data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y)))
    (insideZ : acceptZ (parentFine (data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z))) :
    data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ
      (data.targetAxis symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x)
      (data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y)
      (data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z) = data.target (K := K) q x y z := by
  let mapX := data.targetAxis symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x
  let mapY := data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y
  let mapZ := data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z
  let graph := coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge.val
  have modX : parentCoarseMod prime mapX = graph.x := data.targetAxis_mod symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x
  have modY : parentCoarseMod prime mapY = graph.y := data.targetAxis_mod symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y
  have modZ : parentCoarseMod prime mapZ = graph.z := data.targetAxis_mod symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z
  have typedX : HasType data.coarseX (fun position => wordCoarseIndex (leftHalf (mapX position).val)) := by
    rw [data.targetAxis_index symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x
      (fun position => splitXIndex (edge.val.val position)) (fun _ => rfl)]
    exact edge.val.property.1
  have typedY : HasType data.coarseY (fun position => wordCoarseIndex (leftHalf (mapY position).val)) := by
    rw [data.targetAxis_index symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y
      (fun position => splitYIndex (edge.val.val position)) (fun _ => rfl)]
    exact edge.val.property.2.1
  have typedZ : HasType data.coarseZ (fun position => wordCoarseIndex (leftHalf (mapZ position).val)) := by
    rw [data.targetAxis_index symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z
      (fun position => splitZIndex (edge.val.val position)) (fun _ => rfl)]
    exact edge.val.property.2.2
  have pooledY := data.targetAxis_pooled symmetric edge q Shape.y (fun _ _ => rfl) data.fineY shapeYIndex (fun _ => rfl) y
  have pooledZ := data.targetAxis_pooled symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ shapeZIndex (fun _ => rfl) z
  change data.pooledParent (K := K) q seed buckets acceptX acceptY acceptZ mapX mapY mapZ = _
  change acceptX (parentFine mapX) at insideX
  change acceptY (parentFine mapY) at insideY
  change acceptZ (parentFine mapZ) at insideZ
  change pooledAxisType _ mapY at pooledY
  change pooledAxisType _ mapZ at pooledZ
  change graph.InBucket (fun _ => ((2*length : ℕ) : ZMod prime)) seed (hashX seed.2.1 seed.1 graph.x) at active
  change hashX seed.2.1 seed.1 graph.x ∈ buckets at member
  simp only [pooledParent, acceptedTensor, id_eq, insideX, insideY, insideZ, pooledY, pooledZ,
    and_self, if_true, hashedCoarseParent, hashedTensor, modX, modY, modZ, active.2.1, active.2.2,
    member, coarseFiltered, typedX, typedY, typedZ]
  exact congrFun (congrFun (congrFun (data.target_identity symmetric edge q) x) y) z

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
