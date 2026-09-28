import CWRootOwnership
import CWRootTargetMaps

/-! Exact root ownership tests on the mapped target. Root X parts have no
parent-window holes, while Y and Z parts lose only actual compatible collisions. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A root coarse collision is a distinct active complete-graph edge sharing its X coordinate word. -/
def coarseCollision (data : RootRestrictionData length) (seed : Seed (ZMod prime) P) (edge : data.Edges (P := P)) : Prop :=
  ∃ other : data.Edges (P := P), other ≠ edge ∧ (data.graphEdges prime other).x = (data.graphEdges prime edge).x ∧
    (data.graphEdges prime other).InBucket (fun _ => ((2*length : ℕ) : ZMod prime)) seed
      (hashX seed.2.1 seed.1 (data.graphEdges prime edge).x)

/-- A root fine collision is another prescribed active edge compatible with the same complete fine word. -/
def fineCollision (data : RootRestrictionData length) (seed : Seed (ZMod prime) P)
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (edge : data.Edges (P := P)) (fine : P → Fin length → Fin 3) : Prop :=
  ∃ other : data.Edges (P := P), other ≠ edge ∧ data.prescribed other ∧ data.active seed other ∧
    compatibleFine axis axisClass profile (data.word other) fine

/-- Actual missing root target parts are precisely their mapped fine ownership collisions. -/
def targetHoles (data : RootRestrictionData length) (seed : Seed (ZMod prime) P)
    (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (parts : data.TargetParts profile) : Prop :=
  data.fineCollision seed axis axisClass profile edge.val
    (data.targetFine (data.prescribedWordEquiv edge) profile parts)

omit [NeZero (2 : ZMod prime)] in
/-- A mapped root target axis has exactly its edge's modular coarse word. -/
theorem targetAxis_mod (data : RootRestrictionData length) (edge : TypedWord (P := P) data.split)
    (q : ℕ) (axis : Shape → ℕ) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) :
    coarseMod prime (data.targetAxis edge q axis profile entries) =
      fun position => ((axis (edge.val position).val : ℕ) : ZMod prime) := by
  funext position
  exact congrArg (fun value : ℕ => (value : ZMod prime)) (data.targetAxis_coarse edge q axis profile entries position)

omit [NeZero (2 : ZMod prime)] in
/-- No complete-graph collision makes a variable with the prescribed coarse word owned by its active root edge. -/
theorem coarseOwner_of_no_collision (data : RootRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → Fin length → Fin (q+2))
    (coarse : coarseMod prime entries = (data.graphEdges prime edge).x)
    (active : data.active seed edge) (unique : ¬data.coarseCollision seed edge) :
    data.coarseOwner q seed entries = some edge := by
  unfold coarseOwner Extraction.coarseOwner
  apply uniqueOwner_eq
  · exact ⟨coarse.symm, by rw [coarse]; exact active⟩
  · intro other compatible
    by_contra different
    apply unique
    refine ⟨other, different, compatible.1.trans coarse, ?_⟩
    rw [coarse] at compatible
    exact compatible.2

omit [NeZero (2 : ZMod prime)] in
/-- Every mapped X coordinate is retained for a prescribed root edge with no coarse collision. -/
theorem target_ownerX (data : RootRestrictionData length) (edge : data.PrescribedEdges (P := P))
    (q : ℕ) (seed : Seed (ZMod prime) P) (active : data.active seed edge.val)
    (unique : ¬data.coarseCollision seed edge.val) (entries : data.TargetAxis q Shape.x data.fineX) :
    data.ownerX q seed (data.targetAxis (data.prescribedWordEquiv edge) q Shape.x data.fineX entries) = some edge.val := by
  apply (refineOwner_eq_iff _ _ _ _).mpr
  exact ⟨data.coarseOwner_of_no_collision q seed edge.val _
    (data.targetAxis_mod (data.prescribedWordEquiv edge) q Shape.x data.fineX entries) active unique,
    edge.property, data.targetAxis_full (data.prescribedWordEquiv edge) q Shape.x data.fineX entries⟩

omit [NeZero (2 : ZMod prime)] in
/-- A mapped Y coordinate survives exactly when its fine part has no actual root compatibility collision. -/
theorem target_ownerY_iff (data : RootRestrictionData length) (edge : data.PrescribedEdges (P := P))
    (q : ℕ) (seed : Seed (ZMod prime) P) (active : data.active seed edge.val)
    (entries : data.TargetAxis q Shape.y data.fineY) :
    refineOwner (uniqueOwner (data.compatibleY q seed)) (data.fullType q data.fineY)
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.y data.fineY entries) = some edge.val ↔
      ¬data.targetHoles seed edge Shape.y yClass data.fineY (data.targetParts q Shape.y data.fineY entries) := by
  have present : data.compatibleY q seed edge.val
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.y data.fineY entries) :=
    ⟨edge.property, active, data.targetAxis_compatible (data.prescribedWordEquiv edge) q Shape.y data.fineY entries yClass⟩
  rw [refineOwner_eq_iff, uniqueOwner_no_collision _ _ _ present]
  have full : data.fullType q data.fineY edge.val
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.y data.fineY entries) :=
    data.targetAxis_full (data.prescribedWordEquiv edge) q Shape.y data.fineY entries
  simp only [full, and_true, compatibleY, targetHoles, fineCollision, targetAxis_fine]

omit [NeZero (2 : ZMod prime)] in
/-- Z ownership has the corresponding exact collision-hole predicate. -/
theorem target_ownerZ_iff (data : RootRestrictionData length) (edge : data.PrescribedEdges (P := P))
    (q : ℕ) (seed : Seed (ZMod prime) P) (active : data.active seed edge.val)
    (entries : data.TargetAxis q Shape.z data.fineZ) :
    refineOwner (uniqueOwner (data.compatibleZ q seed)) (data.fullType q data.fineZ)
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.z data.fineZ entries) = some edge.val ↔
      ¬data.targetHoles seed edge Shape.z zClass data.fineZ (data.targetParts q Shape.z data.fineZ entries) := by
  have present : data.compatibleZ q seed edge.val
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.z data.fineZ entries) :=
    ⟨edge.property, active, data.targetAxis_compatible (data.prescribedWordEquiv edge) q Shape.z data.fineZ entries zClass⟩
  rw [refineOwner_eq_iff, uniqueOwner_no_collision _ _ _ present]
  have full : data.fullType q data.fineZ edge.val
      (data.targetAxis (data.prescribedWordEquiv edge) q Shape.z data.fineZ entries) :=
    data.targetAxis_full (data.prescribedWordEquiv edge) q Shape.z data.fineZ entries
  simp only [full, and_true, compatibleZ, targetHoles, fineCollision, targetAxis_fine]

end
end MatrixBounds.Tensor.CW.RootRestrictionData
