module

public import CWRootTargetSymmetry
public import ContextBatchRepair

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Sparse fine collision holes in the selected unrestricted-root targets
can be repaired simultaneously, with the original source and all contexts kept. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric HashCounting Extraction RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K Selected : Type*} [Fintype P] [CommRing K] [Fintype Selected] [Nonempty Selected]
variable {length prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The fixed binary coordinate-growth coefficient of a selected root target batch. -/
def repairGrowth (length edgeBits multiplier bits : ℕ) : ℕ :=
  3*(edgeBits*multiplier)+3*bits*(length*multiplier)

/-- Every sparse selected root batch repairs to complete exact child tensors with explicit contextual overhead. -/
theorem contextReduction_repairedTargets (data : RootRestrictionData length) (q : ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime)) (free : ProgressionFree buckets) (large : 2*length < prime)
    (selected : Selected ↪ data.PrescribedEdges (P := P))
    (present : ∀ copy, data.active seed (selected copy).val)
    (member : ∀ copy, hashX seed.2.1 seed.1 (data.graphEdges prime (selected copy).val).x ∈ buckets)
    (unique : ∀ copy, ¬data.coarseCollision seed (selected copy).val)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ) (k bits edgeBits multiplier : ℕ) (largeRepair : 3 ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale k)
    (smallY : ∀ copy, Nat.card {parts // data.targetHoles seed (selected copy) Shape.y yClass data.fineY parts}*scale k ≤
      Fintype.card (data.TargetParts data.fineY))
    (smallZ : ∀ copy, Nat.card {parts // data.targetHoles seed (selected copy) Shape.z zClass data.fineZ parts}*scale k ≤
      Fintype.card (data.TargetParts data.fineZ)) :
    ContextReduction.{v} (rootPower (K := K) (P := P) q length) (directSum (fun _ : Selected => data.target (K := K) q))
      (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  letI : Nonempty (data.TargetParts data.fineX) := ⟨representativeX⟩
  letI : Nonempty (data.TargetParts data.fineY) := ⟨representativeY⟩
  letI : Nonempty (data.TargetParts data.fineZ) := ⟨representativeZ⟩
  letI := data.targetParts_transitive data.fineX
  letI := data.targetParts_transitive data.fineY
  letI := data.targetParts_transitive data.fineZ
  have repair : ContextReduction.{v} (data.damagedTargetBatch (K := K) q seed selected)
      (directSum (fun _ : Selected => data.target (K := K) q))
      (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
    exact Symmetry.contextReduction_accepted_batch_repair (G := data.TargetGroup) (data.target (K := K) q)
      (data.targetParts q Shape.x data.fineX) (data.targetParts q Shape.y data.fineY) (data.targetParts q Shape.z data.fineZ)
      (data.targetParts_equivariant q Shape.x data.fineX) (data.targetParts_equivariant q Shape.y data.fineY)
      (data.targetParts_equivariant q Shape.z data.fineZ) (data.target_invariant q)
      (fun (_ : Selected) (_ : data.TargetParts data.fineX) => False)
      (fun copy => data.targetHoles seed (selected copy) Shape.y yClass data.fineY)
      (fun copy => data.targetHoles seed (selected copy) Shape.z zClass data.fineZ)
      (repairGrowth length edgeBits multiplier bits) k 1 (by omega) (by simpa only [mul_one] using largeRepair)
      (fun _ => by simp) (by simpa only [one_mul] using smallY) (by simpa only [one_mul] using smallZ)
      (data.target_batch_cube_bound selected q bits edgeBits multiplier (scale k) alphabet shapes population)
  simpa only [mul_one] using (data.contextReduction_damagedTargets q seed buckets free large selected present member unique).trans repair

end
end MatrixBounds.Tensor.CW.RootRestrictionData
