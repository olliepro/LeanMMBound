module

public import CWMixedContextualTargets
public import CWMixedRepairedTargets
public import ContextBatchRepair

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Complete actual mixed-target repair is valid beside arbitrary waiting
factors and previously extracted batches, with no repeated charge for them. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric HashCounting Extraction RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K Selected : Type*} [Fintype T] [CommRing K] [Fintype Selected] [Nonempty Selected]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The actual mixed extraction and joint repair preserve every tensor context at the explicit repair cost. -/
theorem contextReduction_repairedTargets (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric) (q : ℕ)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (buckets : Set (ZMod prime))
    (free : ProgressionFree buckets) (large : ∀ type, 2*length type < prime)
    (selected : Selected ↪ PrescribedEdges Positions data)
    (present : ∀ copy, active data seed (forget data (selected copy)))
    (member : ∀ copy, hashX seed.2.1 seed.1 (modularEdge prime (naturalEdge data (forget data (selected copy)))).x ∈ buckets)
    (unique : ∀ copy, ¬coarseCollision data seed (forget data (selected copy)))
    (acceptX acceptY acceptZ : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (k constant bits : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k) (largeRepair : 3*constant ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (population : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (smallX : ∀ copy, Nat.card {parts // parentHole data symmetric (selected copy) (fun type => (data type).fineX) acceptX parts}*scale k ≤
      constant*Fintype.card (TargetParts data (fun type => (data type).fineX)))
    (smallY : ∀ copy, Nat.card {parts // targetHoles data symmetric seed (selected copy) Shape.y (fun _ => yClass)
      (fun type => (data type).fineY) acceptY parts}*scale k ≤ constant*Fintype.card (TargetParts data (fun type => (data type).fineY)))
    (smallZ : ∀ copy, Nat.card {parts // targetHoles data symmetric seed (selected copy) Shape.z (fun _ => zClass)
      (fun type => (data type).fineZ) acceptZ parts}*scale k ≤ constant*Fintype.card (TargetParts data (fun type => (data type).fineZ))) :
    ContextReduction.{v} (parentInterface (K := K) data q acceptX acceptY acceptZ)
      (directSum (fun _ : Selected => target (K := K) data q))
      (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  letI : Nonempty (TargetParts data (fun type => (data type).fineX)) := ⟨representativeX⟩
  letI : Nonempty (TargetParts data (fun type => (data type).fineY)) := ⟨representativeY⟩
  letI : Nonempty (TargetParts data (fun type => (data type).fineZ)) := ⟨representativeZ⟩
  letI := targetParts_transitive data (fun type => (data type).fineX)
  letI := targetParts_transitive data (fun type => (data type).fineY)
  letI := targetParts_transitive data (fun type => (data type).fineZ)
  have repair : ContextReduction.{v}
      (damagedTargetBatch (K := K) data symmetric q seed selected acceptX acceptY acceptZ)
      (directSum (fun _ : Selected => target (K := K) data q))
      (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
    exact Symmetry.contextReduction_accepted_batch_repair (G := TargetGroup data) (target (K := K) data q)
      (targetParts data q Shape.x (fun type => (data type).fineX))
      (targetParts data q Shape.y (fun type => (data type).fineY))
      (targetParts data q Shape.z (fun type => (data type).fineZ))
      (targetParts_equivariant data q Shape.x (fun type => (data type).fineX))
      (targetParts_equivariant data q Shape.y (fun type => (data type).fineY))
      (targetParts_equivariant data q Shape.z (fun type => (data type).fineZ)) (target_invariant data q)
      (fun copy => parentHole data symmetric (selected copy) (fun type => (data type).fineX) acceptX)
      (fun copy => targetHoles data symmetric seed (selected copy) Shape.y (fun _ => yClass) (fun type => (data type).fineY) acceptY)
      (fun copy => targetHoles data symmetric seed (selected copy) Shape.z (fun _ => zClass) (fun type => (data type).fineZ) acceptZ)
      (repairGrowth length edgeBits multiplier bits) k constant positive largeRepair smallX smallY smallZ
      (target_batch_cube_bound data selected q bits (scale k) edgeBits multiplier alphabet shapes population)
  have extraction := (contextReduction_windowedPieces.{v} (K := K) data q seed buckets free large acceptX acceptY acceptZ).trans
    (contextReduction_identifyTargets.{v} (K := K) data symmetric q seed buckets selected present member unique acceptX acceptY acceptZ)
  simpa only [mul_one, one_mul] using extraction.trans repair

end
end MatrixBounds.Tensor.CW.Mixed
