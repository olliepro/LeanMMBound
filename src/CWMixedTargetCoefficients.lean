module

public import CWMixedTargetOwnership
public import CWTargetCoefficients

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The actual globally prepared source coefficient equals the common child
target whenever its prescribed edge and all three parent parts are retained. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

omit [NeZero (2 : ZMod prime)] in
/-- Mapped accepted target coordinates pass all global hash, coarse, pooling, and parent tests with the exact target coefficient. -/
theorem mapped_target_coefficient (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (buckets : Set (ZMod prime)) (present : active data seed (forget data edge))
    (member : hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data (forget data edge))).x ∈ buckets)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (x : TargetAxis data q Shape.x (fun type => (data type).fineX))
    (y : TargetAxis data q Shape.y (fun type => (data type).fineY))
    (z : TargetAxis data q Shape.z (fun type => (data type).fineZ))
    (insideX : windowTest data acceptX (targetAxis data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) x))
    (insideY : windowTest data acceptY (targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) y))
    (insideZ : windowTest data acceptZ (targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) z)) :
    pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ
      (targetAxis data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) x)
      (targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) y)
      (targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) z) = target (K := K) data q x y z := by
  let mapX := targetAxis data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) x
  let mapY := targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) y
  let mapZ := targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) z
  let graph := modularEdge prime (naturalEdge data (forget data edge))
  have modX : axisCoarse prime data mapX = graph.x :=
    targetAxis_mod data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) x
  have modY : axisCoarse prime data mapY = graph.y :=
    targetAxis_mod data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) y
  have modZ : axisCoarse prime data mapZ = graph.z :=
    targetAxis_mod data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) z
  have typedX : coarseTest data (fun type => (data type).coarseX) mapX := by
    intro type
    change HasType (data type).coarseX (fun position => wordCoarseIndex (leftHalf
      ((data type).targetAxis (symmetric type) (edge type) q Shape.x (fun _ _ => rfl) (data type).fineX (x type) position).val))
    rw [(data type).targetAxis_index (symmetric type) (edge type) q Shape.x (fun _ _ => rfl) (data type).fineX (x type)
      (fun position => splitXIndex ((edge type).val.val position)) (fun _ => rfl)]
    exact (edge type).val.property.1
  have typedY : coarseTest data (fun type => (data type).coarseY) mapY := by
    intro type
    change HasType (data type).coarseY (fun position => wordCoarseIndex (leftHalf
      ((data type).targetAxis (symmetric type) (edge type) q Shape.y (fun _ _ => rfl) (data type).fineY (y type) position).val))
    rw [(data type).targetAxis_index (symmetric type) (edge type) q Shape.y (fun _ _ => rfl) (data type).fineY (y type)
      (fun position => splitYIndex ((edge type).val.val position)) (fun _ => rfl)]
    exact (edge type).val.property.2.1
  have typedZ : coarseTest data (fun type => (data type).coarseZ) mapZ := by
    intro type
    change HasType (data type).coarseZ (fun position => wordCoarseIndex (leftHalf
      ((data type).targetAxis (symmetric type) (edge type) q Shape.z (fun _ _ => rfl) (data type).fineZ (z type) position).val))
    rw [(data type).targetAxis_index (symmetric type) (edge type) q Shape.z (fun _ _ => rfl) (data type).fineZ (z type)
      (fun position => splitZIndex ((edge type).val.val position)) (fun _ => rfl)]
    exact (edge type).val.property.2.2
  have keptX : ∀ type, acceptX type (parentFine (mapX type)) := insideX
  have keptY : ∀ type, acceptY type (parentFine (mapY type)) ∧
      pooledAxisType (pooledProfile (data type).fineY shapeYIndex) (mapY type) := fun type =>
    ⟨insideY type, (data type).targetAxis_pooled (symmetric type) (edge type) q Shape.y (fun _ _ => rfl)
      (data type).fineY shapeYIndex (fun _ => rfl) (y type)⟩
  have keptZ : ∀ type, acceptZ type (parentFine (mapZ type)) ∧
      pooledAxisType (pooledProfile (data type).fineZ shapeZIndex) (mapZ type) := fun type =>
    ⟨insideZ type, (data type).targetAxis_pooled (symmetric type) (edge type) q Shape.z (fun _ _ => rfl)
      (data type).fineZ shapeZIndex (fun _ => rfl) (z type)⟩
  change pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ mapX mapY mapZ = _
  change graph.InBucket (fun position => (total length position : ZMod prime)) seed (hashX seed.2.1 seed.1 graph.x) at present
  change hashX seed.2.1 seed.1 graph.x ∈ buckets at member
  simp only [pooledSource, acceptedTensor, id_eq, keptX, keptY, keptZ, and_self, if_true,
    hashedSource, hashedTensor, modX, modY, modZ, present.2.1, present.2.2, member,
    coarseSource_eq, acceptedTensor, id_eq, typedX, typedY, typedZ]
  simp only [implies_true, if_true]
  exact congrFun (congrFun (congrFun (target_identity (K := K) data symmetric edge q) x) y) z

end
end MatrixBounds.Tensor.CW.Mixed
