module

public import CWMixedTargetCoefficients
public import SelectedTargets

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The actual global restriction supplies independent copies of the common
heterogeneous target with exactly the proved parent and collision holes. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K Selected : Type*} [Fintype T] [CommRing K] [Fintype Selected]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The independently selected heterogeneous targets, masked by their exact global ownership holes. -/
def damagedTargetBatch (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (selected : Selected → PrescribedEdges Positions data)
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) :=
  directSum (fun copy => acceptedTensor (target (K := K) data q)
    (targetParts data q Shape.x (fun type => (data type).fineX))
    (targetParts data q Shape.y (fun type => (data type).fineY))
    (targetParts data q Shape.z (fun type => (data type).fineZ))
    (fun parts => ¬parentHole data symmetric (selected copy) (fun type => (data type).fineX) acceptX parts)
    (fun parts => ¬targetHoles data symmetric seed (selected copy) Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY parts)
    (fun parts => ¬targetHoles data symmetric seed (selected copy) Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ parts))

/-- A selected globally active coarse-unique family yields its entire actual damaged-target batch at the available parent budget. -/
def damagedTargetCertificate (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (selected : Selected ↪ PrescribedEdges Positions data)
    (present : ∀ copy, active data seed (forget data (selected copy)))
    (member : ∀ copy, hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data (forget data (selected copy)))).x ∈ buckets)
    (unique : ∀ copy, ¬coarseCollision data seed (forget data (selected copy)))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    {rank degree : ℕ} (certificate : Degeneration.Certificate
      (parentInterface (K := K) data q acceptX acceptY acceptZ) rank degree) :
    Degeneration.Certificate (damagedTargetBatch (K := K) data symmetric q seed selected acceptX acceptY acceptZ) rank degree := by
  let embedding : Selected ↪ Edges Positions data := selected.trans ⟨forget data, forget_injective data⟩
  refine selectedOwnedTargetCertificate embedding (pooledSource (K := K) data q seed buckets acceptX acceptY acceptZ)
    (target (K := K) data q) (windowOwnerX data q seed acceptX) (windowOwnerY data q seed acceptY) (windowOwnerZ data q seed acceptZ)
    (fun copy => targetAxis data symmetric (selected copy) q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX))
    (fun copy => targetAxis data symmetric (selected copy) q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY))
    (fun copy => targetAxis data symmetric (selected copy) q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ))
    (targetParts data q Shape.x (fun type => (data type).fineX))
    (targetParts data q Shape.y (fun type => (data type).fineY))
    (targetParts data q Shape.z (fun type => (data type).fineZ))
    (fun copy => parentHole data symmetric (selected copy) (fun type => (data type).fineX) acceptX)
    (fun copy => targetHoles data symmetric seed (selected copy) Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY)
    (fun copy => targetHoles data symmetric seed (selected copy) Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ)
    ?_ ?_ ?_ ?_ (windowedPiecesCertificate data q seed buckets free large acceptX acceptY acceptZ certificate)
  · intro copy x y z keptX keptY keptZ
    exact mapped_target_coefficient data symmetric (selected copy) q seed buckets (present copy) (member copy)
      acceptX acceptY acceptZ x y z
      ((target_window_iff data symmetric (selected copy) q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) acceptX x).mpr keptX)
      ((target_window_iff data symmetric (selected copy) q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) acceptY y).mpr (not_or.mp keptY).1)
      ((target_window_iff data symmetric (selected copy) q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) acceptZ z).mpr (not_or.mp keptZ).1)
  · intro copy x
    exact target_ownerX_iff data symmetric (selected copy) q seed (present copy) (unique copy) acceptX x
  · intro copy y
    exact target_ownerY_iff data symmetric (selected copy) q seed (present copy) acceptY y
  · intro copy z
    exact target_ownerZ_iff data symmetric (selected copy) q seed (present copy) acceptZ z

end
end MatrixBounds.Tensor.CW.Mixed
