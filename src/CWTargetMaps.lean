module

public import CWPrescribedGraph
public import PairingConcentration

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Every prescribed edge maps the same labelled child target into the common
parent tensor. The maps preserve coefficients, child types, and coarse indices. -/
namespace MatrixBounds.Tensor.CW.SplitRestrictionData

open Empirical Numeric HashCounting Extraction
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

/-- The target retains two copies of every split count as a separate labelled child pool. -/
abbrev ChildPositions (data : SplitRestrictionData length) (child : ShapeAlphabet (2*length)) := Fin (2*data.split child)

/-- Complementary symmetry of the prescribed integer split profile. -/
def Symmetric (data : SplitRestrictionData length) : Prop :=
  ∀ child, data.split ((complementEquiv data.parent (2*length) data.balanced).symm child) = data.split child

/-- The exact labelled child pairing associated with one prescribed graph edge. -/
def targetPairing (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) : Pairing data.ChildPositions P :=
  complementaryPairing (complementEquiv data.parent (2*length) data.balanced) data.split symmetric (data.prescribedWord edge)

omit [CommRing K] in
/-- Each pool is sent to precisely the parent child slots carrying its shape label. -/
theorem targetPairing_labels (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (slot : (child : ShapeAlphabet (2*length)) × data.ChildPositions child) :
    childLabels data.parent data.balanced (data.word edge.val) (data.targetPairing symmetric edge slot) = slot.1 :=
  pairingOfCounts_label _ _ _ slot

omit [CommRing K] in
/-- The target pairing has the left shape named by its prescribed edge. -/
theorem targetPairing_left (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (position : P) :
    ((data.targetPairing symmetric edge).left position).1 = data.word edge.val position :=
  complementaryPairing_left _ data.split symmetric (data.prescribedWord edge) position

omit [CommRing K] in
/-- Complementary target children reconstruct the common parent shape at every position. -/
theorem targetPairing_shapes (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (position : P) :
    addShape ((data.targetPairing symmetric edge).left position).1.val
      ((data.targetPairing symmetric edge).right position).1.val = data.parent := by
  have left := complementaryPairing_left (complementEquiv data.parent (2*length) data.balanced)
    data.split symmetric (data.prescribedWord edge) position
  have right := complementaryPairing_right (complementEquiv data.parent (2*length) data.balanced)
    data.split symmetric (data.prescribedWord edge) position
  change addShape ((complementaryPairing _ data.split symmetric (data.prescribedWord edge)).left position).1.val
    ((complementaryPairing _ data.split symmetric (data.prescribedWord edge)).right position).1.val = data.parent
  rw [left, right]
  change addShape (edge.val.val position).val.val
    ((complementEquiv data.parent (2*length) data.balanced) (edge.val.val position).val).val = data.parent
  rw [complementEquiv_shape _ _ _ _ (edge.val.val position).property]
  exact addShape_complement (edge.val.val position).property

/-- The common exact child tensor does not depend on a selected coarse edge. -/
def target (data : SplitRestrictionData length) (q : ℕ) :=
  exactChildren (K := K) (Positions := data.ChildPositions) q (fun _ => length) Subtype.val
    data.fineX data.fineY data.fineZ

/-- An exact target axis keeps each child pool's complete empirical fine type. -/
abbrev TargetAxis (data : SplitRestrictionData length) (q : ℕ) (axis : Shape → ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :=
  ∀ child : ShapeAlphabet (2*length), Interface.Variable (P := data.ChildPositions child)
    (fun entry : AxisVariable q length (axis child.val) => fineWord entry.val) (profile child)

/-- The fine parts are the independently typed pool words used by concentration. -/
abbrev TargetParts (data : SplitRestrictionData length)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :=
  ∀ child, TypedWord (P := data.ChildPositions child) (profile child)

/-- Project a target axis variable to its tuple of labelled pool fine words. -/
def targetParts (data : SplitRestrictionData length) (q : ℕ) (axis : Shape → ℕ)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : data.TargetAxis q axis profile) : data.TargetParts profile :=
  fun child => Interface.partWord _ (profile child) (entries child)

/-- Map physical target coordinates into a prescribed copy of the common parent. -/
def targetAxis (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) :
    data.TargetAxis q axis profile → P → AxisVariable q (length+length) (axis data.parent) :=
  (data.targetPairing symmetric edge).uniformAxis q length (axis data.parent) (fun child => axis child.val)
    (fun position => (additive _ _).symm.trans (congrArg axis (data.targetPairing_shapes symmetric edge position))) profile

omit [CommRing K] in
/-- The mapped parent fine words depend only on the target's fine parts. -/
theorem targetAxis_fine (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (entries : data.TargetAxis q axis profile) :
    parentFine (data.targetAxis symmetric edge q axis additive profile entries) =
      (data.targetPairing symmetric edge).parentFineWord length
        (fun child => (data.targetParts q axis profile entries child).val) :=
  ((data.targetPairing symmetric edge).parentFineWord_uniformAxis q length (axis data.parent)
    (fun child => axis child.val) _ profile entries).symm

omit [CommRing K] in
/-- Mapped target axes satisfy the full child profiles imposed after ownership. -/
theorem targetAxis_full (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (entries : data.TargetAxis q axis profile) :
    fullChildType data.parent data.balanced (data.word edge.val) profile
      (data.targetAxis symmetric edge q axis additive profile entries) :=
  (data.targetPairing symmetric edge).uniformAxis_compatible q length (axis data.parent) (fun child => axis child.val)
    _ (childLabels data.parent data.balanced (data.word edge.val)) (data.targetPairing_labels symmetric edge) profile entries

omit [CommRing K] in
/-- The mapped target's left coarse index is the corresponding coordinate of its prescribed edge. -/
theorem targetAxis_coarse (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ) (entries : data.TargetAxis q axis profile)
    (position : P) :
    wordCoarse (leftHalf (data.targetAxis symmetric edge q axis additive profile entries position).val) =
      axis (data.word edge.val position).val := by
  have total := (data.targetPairing symmetric edge).uniformAxis_left_total q length (axis data.parent)
    (fun child => axis child.val)
    (fun position => (additive _ _).symm.trans (congrArg axis (data.targetPairing_shapes symmetric edge position)))
    profile entries position
  rw [data.targetPairing_left symmetric edge position] at total
  exact total

/-- Every prescribed coordinate map realizes exactly the same physical child tensor. -/
theorem target_identity (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) :
    (fun x y z => parentPower (K := K) (P := P) q length data.parent
      (data.targetAxis symmetric edge q Shape.x (fun _ _ => rfl) data.fineX x)
      (data.targetAxis symmetric edge q Shape.y (fun _ _ => rfl) data.fineY y)
      (data.targetAxis symmetric edge q Shape.z (fun _ _ => rfl) data.fineZ z)) = data.target (K := K) q :=
  uniform_pairing_identity (data.targetPairing symmetric edge) q length data.parent Subtype.val
    (data.targetPairing_shapes symmetric edge) data.fineX data.fineY data.fineZ

omit [CommRing K] in
/-- A mapped target block passes every coarsening of its owner's complete child profiles. -/
theorem targetAxis_compatible (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (entries : data.TargetAxis q axis profile) :
    compatibleFine length data.parent data.balanced axisClass (pooledProfile profile axisClass)
      (fun child => axis child.val) (data.word edge.val)
      (parentFine (data.targetAxis symmetric edge q axis additive profile entries)) := by
  refine ⟨data.targetAxis_coarse symmetric edge q axis additive profile entries, ?_⟩
  exact sectorCompatible_coarsen (childLabels data.parent data.balanced (data.word edge.val)) profile axisClass _
    (data.targetAxis_full symmetric edge q axis additive profile entries)

omit [CommRing K] in
/-- The mapped target also passes the pooled test computed solely from its own axis coordinates. -/
theorem targetAxis_pooled (data : SplitRestrictionData length) (symmetric : data.Symmetric)
    (edge : data.PrescribedEdges (P := P)) (q : ℕ) (axis : Shape → ℕ)
    (additive : ∀ left right, axis (addShape left right) = axis left + axis right)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (index : ShapeAlphabet (2*length) → Fin (2*length+1))
    (indexValue : ∀ child, (index child).val = axis child.val) (entries : data.TargetAxis q axis profile) :
    pooledAxisType (pooledProfile profile index) (data.targetAxis symmetric edge q axis additive profile entries) := by
  let labels := childLabels data.parent data.balanced (data.word edge.val)
  have totals (position : P) : (index (labels (Sum.inl position))).val +
      (index (labels (Sum.inr position))).val = axis data.parent := by
    rw [indexValue, indexValue, ← additive]
    exact congrArg axis (childLabels_shape data.parent data.balanced (data.word edge.val)
      (fun position => (edge.val.val position).property) position)
  have coarse := axisChildIndex_eq (data.targetAxis symmetric edge q axis additive profile entries)
    (fun slot => index (labels slot)) totals (fun position => by
      change wordCoarse (leftHalf (data.targetAxis symmetric edge q axis additive profile entries position).val) =
        (index (data.word edge.val position)).val
      rw [indexValue]
      exact data.targetAxis_coarse symmetric edge q axis additive profile entries position)
  change SectorCompatible (axisChildIndex _) _ _
  rw [coarse]
  exact sectorCompatible_coarsen labels profile index _
    (data.targetAxis_full symmetric edge q axis additive profile entries)

end
end MatrixBounds.Tensor.CW.SplitRestrictionData
