import CWMixedPrepared
import CWTargetSupport

/-! Every prescribed global edge realizes the same heterogeneous product of
exact child tensors, with componentwise physical coordinate maps. -/
namespace MatrixBounds.Tensor.CW.Mixed

open Empirical Numeric HashCounting Extraction
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {T K : Type*} [Fintype T] [CommRing K]
variable {Positions : T → Type*} [∀ type, Fintype (Positions type)] {length : T → ℕ}

/-- The common target keeps the exact child tensor for every parent type as its own factor. -/
def target (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) :=
  Interface.heterogeneous (fun type => (data type).target (K := K) q)

/-- A global target axis is a product of exact typed child-pool axes. -/
abbrev TargetAxis (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) (axis : Shape → ℕ)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ) :=
  ∀ type, (data type).TargetAxis q axis (profile type)

/-- Fine parts retain all child pools independently across all parent types. -/
abbrev TargetParts (data : ∀ type, SplitRestrictionData (length type))
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ) :=
  ∀ type, (data type).TargetParts (profile type)

/-- Project physical global target coordinates onto their complete labelled fine parts. -/
def targetParts (data : ∀ type, SplitRestrictionData (length type)) (q : ℕ) (axis : Shape → ℕ)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (entries : TargetAxis data q axis profile) : TargetParts data profile :=
  fun type => (data type).targetParts q axis (profile type) (entries type)

/-- Pair each type's target child pools into the actual positions of a prescribed global edge. -/
def targetAxis (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (entries : TargetAxis data q axis profile) : Axis Positions data q axis :=
  fun type => (data type).targetAxis (symmetric type) (edge type) q axis additive (profile type) (entries type)

/-- The physical product of parent coefficients pulls back to the common heterogeneous child target. -/
theorem target_identity (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) :
    (fun x y z => parentSource (K := K) data q
      (targetAxis data symmetric edge q Shape.x (fun _ _ => rfl) (fun type => (data type).fineX) x)
      (targetAxis data symmetric edge q Shape.y (fun _ _ => rfl) (fun type => (data type).fineY) y)
      (targetAxis data symmetric edge q Shape.z (fun _ _ => rfl) (fun type => (data type).fineZ) z)) = target (K := K) data q := by
  funext x y z
  apply Finset.prod_congr rfl
  intro type _
  exact congrFun (congrFun (congrFun ((data type).target_identity (symmetric type) (edge type) q) (x type)) (y type)) (z type)

/-- Read the parent fine words from global target parts using their actual component pairings. -/
def targetFine (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (parts : TargetParts data profile) : FineWords Positions length :=
  fun type => ((data type).targetPairing (symmetric type) (edge type)).parentFineWord (length type)
    (fun child => (parts type child).val)

omit [Fintype T] [CommRing K] in
/-- The global physical fine-word map depends only on the corresponding target parts. -/
theorem targetAxis_fine (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (entries : TargetAxis data q axis profile) :
    (fun type => parentFine (targetAxis data symmetric edge q axis additive profile entries type)) =
      targetFine data symmetric edge profile (targetParts data q axis profile entries) := by
  funext type
  exact (data type).targetAxis_fine (symmetric type) (edge type) q axis additive (profile type) (entries type)

omit [Fintype T] [CommRing K] in
/-- A mapped global target satisfies every full child type at its prescribed edge. -/
theorem targetAxis_full (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (entries : TargetAxis data q axis profile) :
    Full data profile (forget data edge) (targetAxis data symmetric edge q axis additive profile entries) :=
  fun type => (data type).targetAxis_full (symmetric type) (edge type) q axis additive (profile type) (entries type)

omit [Fintype T] [CommRing K] in
/-- The global target passes all physical fine compatibility tests of its prescribed edge. -/
theorem targetAxis_compatible (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (entries : TargetAxis data q axis profile) :
    Compatible data axis axisClass profile (forget data edge)
      (fun type => parentFine (targetAxis data symmetric edge q axis additive profile entries type)) :=
  fun type => (data type).targetAxis_compatible (symmetric type) (edge type) q axis additive
    (profile type) (axisClass type) (entries type)

omit [Fintype T] [CommRing K] in
/-- Every supported global fine part has the coarse labels needed for the shared collision bounds. -/
theorem targetParts_compatible (data : ∀ type, SplitRestrictionData (length type)) (symmetric : ∀ type, (data type).Symmetric)
    (edge : PrescribedEdges Positions data) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ∀ type, ShapeAlphabet (2*length type) → (Fin (length type) → Fin 3) → ℕ)
    (support : ∀ type child block, fineTotal block ≠ axis child.val → profile type child block = 0)
    (axisClass : ∀ type, ShapeAlphabet (2*length type) → CompatibilityClass (2*length type))
    (parts : TargetParts data profile) :
    Compatible data axis axisClass profile (forget data edge) (targetFine data symmetric edge profile parts) :=
  fun type => (data type).targetParts_compatible (symmetric type) (edge type) axis additive
    (profile type) (support type) (axisClass type) (parts type)

end
end MatrixBounds.Tensor.CW.Mixed
