module

public import CWActualSelection
public import CWRepairedTargets
public import CWTargetConcentration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Finite extraction of complete independent child tensors from one available
CW parent interface. Seed selection, physical restrictions, concentration, and
simultaneous repair are all instantiated by the actual construction. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction RepairRates
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length prime : ℕ}

/-- The parent interface window is centered at the independent child-pool mixture. -/
def parentWindow (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (tolerance : ℝ) :
    (P → Fin (length+length) → Fin 3) → Prop :=
  Within (data.parentCenter (P := P) profile) tolerance

/-- Explicit parent-concentration constant, independent of the population and prescribed edge. -/
def parentRepairConstant (length multiplier : ℕ) (tolerance : ℝ) : ℕ :=
  ⌈((Fintype.card (Fin (length+length) → Fin 3) : ℝ)*13*Fintype.card (ShapeAlphabet (2*length)))*multiplier/tolerance^2⌉₊

/-- Sparse window collisions add one unit to the parent-concentration repair constant. -/
theorem selected_holes_bound [Nonempty P] [Fact prime.Prime]
    (data : SplitRestrictionData length) (symmetric : data.Symmetric) (seed : Seed (ZMod prime) P)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (representative : data.TargetParts profile) {tolerance : ℝ} (positive : 0 < tolerance)
    (scale multiplier : ℕ) (population : scale ≤ multiplier*Fintype.card P)
    (collisions : Nat.card {parts // data.windowCollision symmetric seed edge axis axisClass profile
      (data.parentWindow (P := P) profile tolerance) parts}*scale < Fintype.card (data.TargetParts profile)) :
    Nat.card {parts // data.targetHoles symmetric seed edge axis axisClass profile
      (data.parentWindow (P := P) profile tolerance) parts}*scale ≤
        (parentRepairConstant length multiplier tolerance+1)*Fintype.card (data.TargetParts profile) := by
  apply data.targetHoles_windowed_bound symmetric seed edge axis axisClass profile _ scale
    (parentRepairConstant length multiplier tolerance)
    (data.parentHole_bound symmetric edge profile representative positive scale multiplier population)
  simpa only [parentHole, not_not, windowCollision] using! collisions.le

/-- A nonempty prescribed graph yields complete independent child copies with explicit finite retention and repair costs.
The source is the available parent-window tensor; the theorem does not assume
an extraction certificate or a repaired rank bound. -/
theorem finite_split_extraction [Nonempty P] [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (data : SplitRestrictionData length) (symmetric : data.Symmetric) (q : ℕ)
    (reference : data.PrescribedEdges (P := P)) (buckets : Finset (ZMod prime)) (bucketNonempty : buckets.Nonempty)
    (free : ProgressionFree (buckets : Set (ZMod prime))) (largePrime : 2*length < prime)
    (supportY : ∀ child block, fineTotal block ≠ child.val.y → data.fineY child block = 0)
    (supportZ : ∀ child block, fineTotal block ≠ child.val.z → data.fineZ child block = 0)
    (representativeX : data.TargetParts data.fineX) (representativeY : data.TargetParts data.fineY)
    (representativeZ : data.TargetParts data.fineZ) {tolerance : ℝ} (positiveTolerance : 0 < tolerance)
    (k bits edgeBits multiplier rank degree : ℕ) (positive : 0 < k)
    (largeRepair : 3*(parentRepairConstant length multiplier tolerance+1) ≤ k)
    (alphabet : q+2 ≤ 2^bits) (shapes : Fintype.card (ShapeAlphabet (2*length)) ≤ 2^edgeBits)
    (populationLower : scale k ≤ multiplier*Fintype.card P)
    (populationUpper : Fintype.card P ≤ multiplier*scale k)
    (largeX : 6*data.coarseDegree (P := P) ≤ prime)
    (largeY : 6*(scale k*data.windowDegree Shape.y yClass data.fineY (data.parentWindow (P := P) data.fineY tolerance)) ≤ prime)
    (largeZ : 6*(scale k*data.windowDegree Shape.z zClass data.fineZ (data.parentWindow (P := P) data.fineZ tolerance)) ≤ prime)
    (certificate : Degeneration.Certificate (data.parentInterface (K := K) q
      (data.parentWindow (P := P) data.fineX tolerance) (data.parentWindow (P := P) data.fineY tolerance)
      (data.parentWindow (P := P) data.fineZ tolerance)) rank degree) :
    ∃ seed : Seed (ZMod prime) P,
      let Selected := data.SelectedEdges symmetric seed buckets
        (data.parentWindow (P := P) data.fineY tolerance) (data.parentWindow (P := P) data.fineZ tolerance) (scale k)
      Fintype.card (data.PrescribedEdges (P := P))*buckets.card ≤ 2*prime^2*Nat.card Selected ∧
      RankLE (directSum (fun _ : Selected => data.target (K := K) q))
        (2^(3*coverLength (3*(edgeBits*multiplier)+3*bits*(2*length*multiplier)) k)*(rank*(degree+1)^2)) := by
  obtain ⟨seed, retained⟩ := data.exists_actual_selection symmetric buckets
    (data.parentWindow (P := P) data.fineY tolerance) (data.parentWindow (P := P) data.fineZ tolerance)
    supportY supportZ representativeY representativeZ (scale k) largePrime largeX largeY largeZ
  let Selected := data.SelectedEdges symmetric seed buckets
    (data.parentWindow (P := P) data.fineY tolerance) (data.parentWindow (P := P) data.fineZ tolerance) (scale k)
  letI : Nonempty (data.PrescribedEdges (P := P)) := ⟨reference⟩
  have positiveCopies : 0 < Nat.card Selected := by
    have positiveProduct := Nat.mul_pos (Fintype.card_pos (α := data.PrescribedEdges (P := P)))
      (Finset.card_pos.mpr bucketNonempty)
    by_contra zero
    have empty : Nat.card Selected = 0 := by omega
    change _ ≤ 2*prime^2*Nat.card Selected at retained
    rw [empty, mul_zero] at retained
    omega
  letI : Nonempty Selected := (Nat.card_pos_iff.mp positiveCopies).1
  letI : Fintype Selected := by
    unfold Selected SelectedEdges
    infer_instance
  let selected : Selected ↪ data.PrescribedEdges (P := P) := Function.Embedding.subtype _
  refine ⟨seed, retained, ?_⟩
  apply data.repairedTargets_rank symmetric q seed buckets free largePrime selected
    (fun copy => copy.property.2.1) (fun copy => copy.property.1) (fun copy => copy.property.2.2.1)
    (data.parentWindow (P := P) data.fineX tolerance) (data.parentWindow (P := P) data.fineY tolerance)
    (data.parentWindow (P := P) data.fineZ tolerance) representativeX representativeY representativeZ
    k (parentRepairConstant length multiplier tolerance+1) bits edgeBits multiplier rank degree
    positive largeRepair alphabet shapes populationUpper ?_ ?_ ?_ certificate
  · intro copy
    exact (data.parentHole_bound symmetric (selected copy) data.fineX representativeX positiveTolerance
      (scale k) multiplier populationLower).trans (Nat.mul_le_mul_right _ (Nat.le_succ _))
  · intro copy
    exact data.selected_holes_bound symmetric seed (selected copy) Shape.y yClass data.fineY representativeY
      positiveTolerance (scale k) multiplier populationLower copy.property.2.2.2.1
  · intro copy
    exact data.selected_holes_bound symmetric seed (selected copy) Shape.z zClass data.fineZ representativeZ
      positiveTolerance (scale k) multiplier populationLower copy.property.2.2.2.2

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
