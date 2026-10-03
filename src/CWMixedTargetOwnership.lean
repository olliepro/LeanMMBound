module

public import CWMixedSelection
public import CWMixedWindowedOwners

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The precise parent-window and global-competitor holes on the common
heterogeneous target agree with the actual variable owner maps. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T : Type*} [Fintype T] {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}
variable {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A global parent hole occurs when at least one component's parent window rejects the target part. -/
def parentHole (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (parts : TargetParts data profile) : Prop :=
  ¬∀ type, accept type (targetFine data symmetric edge profile parts type)

/-- Global fine-axis holes combine parent rejection with an actual active global compatibility competitor. -/
def targetHoles (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (seed : Seed (ZMod prime) ((type : T) × Positions type)) (edge : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop) (parts : TargetParts data profile) : Prop :=
  parentHole data symmetric edge profile accept parts ∨
    fineCollision data seed axis axisClass profile (forget data edge) (targetFine data symmetric edge profile parts)

omit [Fintype T] [NeZero (2 : ZMod prime)] in
/-- The global target map has precisely its prescribed natural coarse labels, cast into the one residue field. -/
theorem targetAxis_mod (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (entries : TargetAxis data q axis profile) :
    axisCoarse prime data (targetAxis data symmetric edge q axis additive profile entries) =
      fun position => ((axis ((data position.1).word (edge position.1).val position.2).val : ℕ) : ZMod prime) := by
  funext position
  exact congrArg (fun value : ℕ => (value : ZMod prime))
    ((data position.1).targetAxis_coarse (symmetric position.1) (edge position.1) q axis additive
      (profile position.1) (entries position.1) position.2)

omit [Fintype T] [Fact prime.Prime] [NeZero (2 : ZMod prime)] in
/-- The mapped global axis passes the actual parent windows exactly when its target part is not a parent hole. -/
theorem target_window_iff (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (entries : TargetAxis data q axis profile) :
    windowTest data accept (targetAxis data symmetric edge q axis additive profile entries) ↔
      ¬parentHole data symmetric edge profile accept (targetParts data q axis profile entries) := by
  simp only [windowTest, targetAxis, SplitRestrictionData.targetAxis_fine,
    parentHole, targetFine, targetParts, not_not]

omit [NeZero (2 : ZMod prime)] in
/-- Coarse-unique global target X variables survive exactly when all parent windows accept their parts. -/
theorem target_ownerX_iff (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (present : active data seed (forget data edge)) (unique : ¬coarseCollision data seed (forget data edge))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (entries : TargetAxis data q Shape.x (fun type => (data type).fineX)) :
    windowOwnerX data q seed accept
      (targetAxis data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) entries) = some (forget data edge) ↔
        ¬parentHole data symmetric edge (fun type => (data type).fineX) accept
          (targetParts data q Shape.x (fun type => (data type).fineX) entries) := by
  have owner := coarseOwner_of_no_collision data q seed (forget data edge) _
    (targetAxis_mod data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) entries) present unique
  have full := targetAxis_full data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) entries
  have prescribed : prescribed data (forget data edge) := fun type => (edge type).property
  rw [windowOwnerX, refineOwner_eq_iff, ownerX, refineOwner_eq_iff]
  simp only [owner, prescribed, full, true_and, and_true]
  exact target_window_iff data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) accept entries

omit [NeZero (2 : ZMod prime)] in
/-- Global Y ownership deletes exactly parent-window holes and active global compatibility collisions. -/
theorem target_ownerY_iff (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (present : active data seed (forget data edge))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (entries : TargetAxis data q Shape.y (fun type => (data type).fineY)) :
    windowOwnerY data q seed accept
      (targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) entries) = some (forget data edge) ↔
        ¬targetHoles data symmetric seed edge Shape.y (fun _ => yClass) (fun type => (data type).fineY) accept
          (targetParts data q Shape.y (fun type => (data type).fineY) entries) := by
  have compatible : compatibleY data q seed (forget data edge)
      (targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) entries) :=
    ⟨fun type => (edge type).property, present,
      targetAxis_compatible data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) (fun _ => yClass) entries⟩
  have result := windowed_unique_owner_iff (compatibleY data q seed) (Full data (fun type => (data type).fineY))
    (windowTest data accept) (forget data edge) _ compatible
    (targetAxis_full data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) entries)
  simpa only [windowOwnerY, compatibleY, targetHoles, parentHole, fineCollision, targetAxis_fine,
    windowTest, targetAxis,
    SplitRestrictionData.targetAxis_fine (axis := Shape.y) (additive := fun _ _ => rfl),
    targetFine, targetParts] using! result

omit [NeZero (2 : ZMod prime)] in
/-- Global Z ownership has the same exact parent-or-collision hole description after full Y typing. -/
theorem target_ownerZ_iff (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (seed : Seed (ZMod prime) ((type : T) × Positions type))
    (present : active data seed (forget data edge))
    (accept : ∀ type, (Positions type → Fin (length type+length type) → Fin 3) → Prop)
    (entries : TargetAxis data q Shape.z (fun type => (data type).fineZ)) :
    windowOwnerZ data q seed accept
      (targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) entries) = some (forget data edge) ↔
        ¬targetHoles data symmetric seed edge Shape.z (fun _ => zClass) (fun type => (data type).fineZ) accept
          (targetParts data q Shape.z (fun type => (data type).fineZ) entries) := by
  have compatible : compatibleZ data q seed (forget data edge)
      (targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) entries) :=
    ⟨fun type => (edge type).property, present,
      targetAxis_compatible data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) (fun _ => zClass) entries⟩
  have result := windowed_unique_owner_iff (compatibleZ data q seed) (Full data (fun type => (data type).fineZ))
    (windowTest data accept) (forget data edge) _ compatible
    (targetAxis_full data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) entries)
  simpa only [windowOwnerZ, compatibleZ, targetHoles, parentHole, fineCollision, targetAxis_fine,
    windowTest, targetAxis,
    SplitRestrictionData.targetAxis_fine (axis := Shape.z) (additive := fun _ _ => rfl),
    targetFine, targetParts] using! result

end
end MatrixBounds.Tensor.CW.Mixed
