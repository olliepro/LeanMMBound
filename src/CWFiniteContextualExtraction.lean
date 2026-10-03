module

public import CWMixedContextualRepair
public import CWMixedConcentration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The complete finite mixed extraction constructs a context-preserving
transformation, independent of any particular incoming rank certificate. -/
namespace MatrixBounds.Tensor.CW.Mixed

universe v
open Empirical Numeric HashCounting Extraction RepairRates
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] [∀ type, Nonempty (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- One shared hash supplies complete independent child tensors in every tensor context, with proved finite retention and repair bounds. -/
theorem finite_contextual_mixed_extraction (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric) (q : ℕ)
    (reference : PrescribedEdges Positions data) (buckets : Finset (ZMod prime)) (bucketNonempty : buckets.Nonempty)
    (free : ProgressionFree (buckets : Set (ZMod prime))) (largePrime : ∀ type, 2*length type < prime)
    (supportY : ∀ type child block, fineTotal block ≠ child.val.y → (data type).fineY child block = 0)
    (supportZ : ∀ type child block, fineTotal block ≠ child.val.z → (data type).fineZ child block = 0)
    (representativeX : TargetParts data (fun type => (data type).fineX))
    (representativeY : TargetParts data (fun type => (data type).fineY))
    (representativeZ : TargetParts data (fun type => (data type).fineZ))
    (tolerance : T → ℝ) (positiveTolerance : ∀ type, 0 < tolerance type)
    (k bits : ℕ) (edgeBits multiplier : T → ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier tolerance+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : ∀ type, Fintype.card (ShapeAlphabet (2*length type)) ≤ 2^(edgeBits type))
    (populationLower : ∀ type, scale k ≤ multiplier type*Fintype.card (Positions type))
    (populationUpper : ∀ type, Fintype.card (Positions type) ≤ multiplier type*scale k)
    (largeX : 6*(∏ type, (data type).coarseDegree (P := Positions type)) ≤ prime)
    (largeY : 6*(scale k*∏ type, (data type).windowDegree Shape.y yClass (data type).fineY
      ((data type).parentWindow (P := Positions type) (data type).fineY (tolerance type))) ≤ prime)
    (largeZ : 6*(scale k*∏ type, (data type).windowDegree Shape.z zClass (data type).fineZ
      ((data type).parentWindow (P := Positions type) (data type).fineZ (tolerance type))) ≤ prime) :
    ∃ seed : Seed (ZMod prime) ((type : T) × Positions type),
      let Selected := SelectedEdges data symmetric seed buckets
        (parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance)
        (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance) (scale k)
      Fintype.card (PrescribedEdges Positions data)*buckets.card ≤ 2*prime^2*Nat.card Selected ∧
      ContextReduction.{v} (parentInterface (K := K) data q
      (parentWindows (Positions := Positions) data (fun type => (data type).fineX) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance)
      (parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance))
        (directSum (fun _ : Selected => target (K := K) data q))
        (2^(3*coverLength (repairGrowth length edgeBits multiplier bits) k)) := by
  let acceptX := parentWindows (Positions := Positions) data (fun type => (data type).fineX) tolerance
  let acceptY := parentWindows (Positions := Positions) data (fun type => (data type).fineY) tolerance
  let acceptZ := parentWindows (Positions := Positions) data (fun type => (data type).fineZ) tolerance
  obtain ⟨seed, retained⟩ := exists_actual_selection data symmetric buckets acceptY acceptZ
    supportY supportZ representativeY representativeZ (scale k) largePrime largeX largeY largeZ
  let Selected := SelectedEdges data symmetric seed buckets acceptY acceptZ (scale k)
  letI : Nonempty (PrescribedEdges Positions data) := ⟨reference⟩
  have positiveCopies : 0 < Nat.card Selected := by
    have positiveProduct := Nat.mul_pos (Fintype.card_pos (α := PrescribedEdges Positions data))
      (Finset.card_pos.mpr bucketNonempty)
    by_contra zero
    have empty : Nat.card Selected = 0 := by omega
    change _ ≤ 2*prime^2*Nat.card Selected at retained
    rw [empty, mul_zero] at retained
    omega
  letI : Nonempty Selected := (Nat.card_pos_iff.mp positiveCopies).1
  letI : Fintype Selected := by unfold Selected SelectedEdges; infer_instance
  let selected : Selected ↪ PrescribedEdges Positions data := Function.Embedding.subtype _
  have parentBoundX (copy : Selected) := parentHole_bound data symmetric (selected copy) (fun type => (data type).fineX)
    representativeX tolerance positiveTolerance (scale k) multiplier populationLower
  have parentBoundY (copy : Selected) := parentHole_bound data symmetric (selected copy) (fun type => (data type).fineY)
    representativeY tolerance positiveTolerance (scale k) multiplier populationLower
  have parentBoundZ (copy : Selected) := parentHole_bound data symmetric (selected copy) (fun type => (data type).fineZ)
    representativeZ tolerance positiveTolerance (scale k) multiplier populationLower
  refine ⟨seed, retained, ?_⟩
  apply contextReduction_repairedTargets data symmetric q seed buckets free largePrime selected
    (fun copy => copy.property.2.1) (fun copy => copy.property.1) (fun copy => copy.property.2.2.1)
    acceptX acceptY acceptZ representativeX representativeY representativeZ
    k (parentRepairConstant length multiplier tolerance+1) bits edgeBits multiplier
    positive largeRepair alphabet shapes populationUpper ?_ ?_ ?_
  · intro copy
    exact (parentBoundX copy).trans (Nat.mul_le_mul_right _ (Nat.le_succ _))
  · intro copy
    exact targetHoles_windowed_bound data symmetric seed (selected copy) Shape.y (fun _ => yClass)
      (fun type => (data type).fineY) acceptY (scale k) (parentRepairConstant length multiplier tolerance)
      (parentBoundY copy) copy.property.2.2.2.1.le
  · intro copy
    exact targetHoles_windowed_bound data symmetric seed (selected copy) Shape.z (fun _ => zClass)
      (fun type => (data type).fineZ) acceptZ (scale k) (parentRepairConstant length multiplier tolerance)
      (parentBoundZ copy) copy.property.2.2.2.2.le

end
end MatrixBounds.Tensor.CW.Mixed
