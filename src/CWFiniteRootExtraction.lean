import CWRootSelection
import CWRootRepair

/-! Complete finite extraction and repair starting from the unrestricted CW
source. The graph, ownership, collision, target, and repair proofs are supplied. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

universe v
open Empirical Numeric HashCounting Extraction RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- The unrestricted root produces the shared-hash number of complete exact child targets with explicit repair overhead. -/
theorem finite_root_extraction (data : RootRestrictionData length) (q : ℕ)
    (reference : data.PrescribedEdges (P := P)) (buckets : Finset (ZMod prime)) (bucketNonempty : buckets.Nonempty)
    (free : ProgressionFree (buckets : Set (ZMod prime))) (largePrime : 2*length < prime)
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ) (k bits edgeBits multiplier : ℕ) (largeRepair : 3 ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (population : Fintype.card P ≤ multiplier*scale k)
    (largeX : 6*data.coarseDegree (P := P) ≤ prime)
    (largeY : 6*(scale k*data.fineDegree (P := P) Shape.y yClass data.fineY) ≤ prime)
    (largeZ : 6*(scale k*data.fineDegree (P := P) Shape.z zClass data.fineZ) ≤ prime) :
    ∃ seed : Seed (ZMod prime) P,
      let Selected := data.SelectedEdges seed buckets (scale k)
      Nat.card (data.PrescribedEdges (P := P))*buckets.card ≤ 2*prime^2*Nat.card Selected ∧
      ContextReduction.{v} (rootPower (K := K) (P := P) q length) (directSum (fun _ : Selected => data.target (K := K) q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  obtain ⟨seed, retained⟩ := data.exists_actual_selection buckets supportY supportZ representativeY representativeZ
    (scale k) largePrime largeX largeY largeZ
  let Selected := data.SelectedEdges seed buckets (scale k)
  letI : Nonempty (data.PrescribedEdges (P := P)) := ⟨reference⟩
  have positiveCopies : 0 < Nat.card Selected := by
    have positiveProduct := Nat.mul_pos (Nat.card_pos (α := data.PrescribedEdges (P := P))) (Finset.card_pos.mpr bucketNonempty)
    by_contra zero
    have empty : Nat.card Selected = 0 := by omega
    change _ ≤ 2*prime^2*Nat.card Selected at retained
    rw [empty, mul_zero] at retained
    omega
  letI : Nonempty Selected := (Nat.card_pos_iff.mp positiveCopies).1
  letI : Fintype Selected := by unfold Selected SelectedEdges; infer_instance
  let selected : Selected ↪ data.PrescribedEdges (P := P) := Function.Embedding.subtype _
  refine ⟨seed, retained, ?_⟩
  exact data.contextReduction_repairedTargets q seed buckets free largePrime selected
    (fun copy => copy.property.2.1) (fun copy => copy.property.1) (fun copy => copy.property.2.2.1)
    representativeX representativeY representativeZ k bits edgeBits multiplier largeRepair alphabet shapes population
    (fun copy => copy.property.2.2.2.1.le) (fun copy => copy.property.2.2.2.2.le)

end
end MatrixBounds.Tensor.CW.RootRestrictionData
