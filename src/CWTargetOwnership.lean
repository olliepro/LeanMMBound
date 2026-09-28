import CWTargetMaps
import CWWindowedOwners

/-! Exact ownership predicates on the common child target. Parent acceptance
depends only on fine parts, and competitor events are the actual active graph
edges passing the proved asymmetric compatibility tests. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P : Type*} [Fintype P] {length prime : ℕ}
variable [Fact prime.Prime] [NeZero (2 : ZMod prime)]

/-- A competing coarse edge has the same X word and survives in the reference edge's bucket. -/
def coarseCollision (data : SplitRestrictionData length) (seed : Seed (ZMod prime) P) (edge : data.Edges (P := P)) : Prop :=
  ∃ other : data.Edges (P := P), other ≠ edge ∧
    (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ other).x =
      (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).x ∧
    (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ other).InBucket
      (fun _ => ((2*length : ℕ) : ZMod prime)) seed
      (hashX seed.2.1 seed.1 (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).x)

/-- A fine block has an ownership collision when another prescribed active edge is compatible with it. -/
def fineCollision (data : SplitRestrictionData length) (seed : Seed (ZMod prime) P)
    (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (edge : data.Edges (P := P)) (fine : P → Fin (length+length) → Fin 3) : Prop :=
  ∃ other : data.Edges (P := P), other ≠ edge ∧ data.prescribed other ∧ data.active seed other ∧
    compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
      (fun child => axis child.val) (data.word other) fine

/-- Parent-interface holes on a target fine part, computed using its actual labelled pairing. -/
def parentHole (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (parts : data.TargetParts profile) : Prop :=
  ¬accept ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))

/-- All fine-axis holes are exactly the union of parent-window failures and active compatibility collisions. -/
def targetHoles (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (seed : Seed (ZMod prime) P) (edge : data.PrescribedEdges (P := P)) (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (parts : data.TargetParts profile) : Prop :=
  data.parentHole symmetric edge profile accept parts ∨
    data.fineCollision seed axis axisClass profile edge.val
      ((data.targetPairing symmetric edge).parentFineWord length (fun child => (parts child).val))

/-- Coarse uniqueness assigns a variable with the reference coarse word to its active reference edge. -/
theorem coarseOwner_of_no_collision (data : SplitRestrictionData length) (q : ℕ) (seed : Seed (ZMod prime) P)
    (edge : data.Edges (P := P)) (entries : P → AxisVariable q (length+length) data.parent.x)
    (coarse : parentCoarseMod prime entries =
      (coarseGraphEdges prime data.parent length data.coarseX data.coarseY data.coarseZ edge).x)
    (active : data.active seed edge) (unique : ¬data.coarseCollision seed edge) :
    parentCoarseOwner q length data.parent data.coarseX data.coarseY data.coarseZ seed entries = some edge := by
  unfold parentCoarseOwner coarseOwner
  apply uniqueOwner_eq
  · exact ⟨coarse.symm, by rw [coarse]; exact active⟩
  · intro other compatible
    by_contra different
    apply unique
    refine ⟨other, different, compatible.1.trans coarse, ?_⟩
    rw [coarse] at compatible
    exact compatible.2

omit [NeZero (2 : ZMod prime)] in
/-- A mapped target's modular coarse word is the prescribed edge coordinate, for any additive axis projection. -/
theorem targetAxis_mod (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (entries : data.TargetAxis q axis profile) :
    parentCoarseMod prime (data.targetAxis symmetric edge q axis additive profile entries) =
      fun position => ((axis (data.word edge.val position).val : ℕ) : ZMod prime) := by
  funext position
  exact congrArg (fun value : ℕ => (value : ZMod prime))
    (data.targetAxis_coarse symmetric edge q axis additive profile entries position)

/-- A coarse-unique target X variable is owned exactly when it satisfies the parent interface. -/
theorem target_ownerX_iff (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (seed : Seed (ZMod prime) P)
    (active : data.active seed edge.val) (unique : ¬data.coarseCollision seed edge.val)
    (accept : (P → Fin (length+length) → Fin 3) → Prop) (entries : data.TargetAxis q Shape.x data.fineX) :
    data.windowOwnerX q seed accept
      (data.targetAxis symmetric edge q Shape.x (fun _ _ => rfl) data.fineX entries) = some edge.val ↔
        ¬data.parentHole symmetric edge data.fineX accept (data.targetParts q Shape.x data.fineX entries) := by
  have owner := data.coarseOwner_of_no_collision q seed edge.val _
    (data.targetAxis_mod symmetric edge q Shape.x (fun _ _ => rfl) data.fineX entries) active unique
  have full := data.targetAxis_full symmetric edge q Shape.x (fun _ _ => rfl) data.fineX entries
  rw [windowOwnerX, refineOwner_eq_iff, ownerX, refineOwner_eq_iff]
  simp only [owner, edge.property, full, true_and, and_true, targetAxis_fine, parentHole, not_not]

omit [NeZero (2 : ZMod prime)] in
/-- The final Y owner deletes precisely the parent holes and the actual compatible competitors. -/
theorem target_ownerY_iff (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (seed : Seed (ZMod prime) P)
    (active : data.active seed edge.val) (accept : (P → Fin (length+length) → Fin 3) → Prop)
    (entries : data.TargetAxis q Shape.y data.fineY) :
    data.windowOwnerY q seed accept
      (data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY entries) = some edge.val ↔
        ¬data.targetHoles symmetric seed edge Shape.y yClass data.fineY accept
          (data.targetParts q Shape.y data.fineY entries) := by
  have present : data.compatibleY q seed edge.val
      (data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY entries) :=
    ⟨edge.property, active, data.targetAxis_compatible symmetric edge q Shape.y (fun _ _ => rfl) data.fineY yClass entries⟩
  have result := windowed_unique_owner_iff (data.compatibleY q seed) (data.fullY q)
    (fun entries => accept (parentFine entries)) edge.val _ present
    (data.targetAxis_full symmetric edge q Shape.y (fun _ _ => rfl) data.fineY entries)
  simpa only [windowOwnerY, compatibleY, targetHoles, parentHole, fineCollision, targetAxis_fine] using result

omit [NeZero (2 : ZMod prime)] in
/-- The final Z owner has the corresponding exact parent-or-collision hole predicate. -/
theorem target_ownerZ_iff (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (seed : Seed (ZMod prime) P)
    (active : data.active seed edge.val) (accept : (P → Fin (length+length) → Fin 3) → Prop)
    (entries : data.TargetAxis q Shape.z data.fineZ) :
    data.windowOwnerZ q seed accept
      (data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ entries) = some edge.val ↔
        ¬data.targetHoles symmetric seed edge Shape.z zClass data.fineZ accept
          (data.targetParts q Shape.z data.fineZ entries) := by
  have present : data.compatibleZ q seed edge.val
      (data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ entries) :=
    ⟨edge.property, active, data.targetAxis_compatible symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ zClass entries⟩
  have result := windowed_unique_owner_iff (data.compatibleZ q seed) (data.fullZ q)
    (fun entries => accept (parentFine entries)) edge.val _ present
    (data.targetAxis_full symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ entries)
  simpa only [windowOwnerZ, compatibleZ, targetHoles, parentHole, fineCollision, targetAxis_fine] using result

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
