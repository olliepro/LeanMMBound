import CWCompatibilityNecessary
import CWCoarseHalves
import CWPooledDegrees

/-! Necessary asymmetric compatibility for actual parent tensor coefficients.
Splitting the physical coordinates produces the child variables to which the
zero-coordinate forcing lemmas apply. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
variable {P K : Type*} [CommRing K]

/-- Split actual parent axis coordinates into labelled children with the prescribed coarse totals. -/
def parentAxisChildren {q length parentTotal : ℕ} (childTotal : P ⊕ P → ℕ)
    (totals : ∀ parent, childTotal (Sum.inl parent) + childTotal (Sum.inr parent) = parentTotal)
    (entries : P → AxisVariable q (length+length) parentTotal)
    (agrees : ∀ parent, wordCoarse (leftHalf (entries parent).val) = childTotal (Sum.inl parent)) :
    ∀ slot, AxisVariable q length (childTotal slot)
  | Sum.inl parent => ⟨leftHalf (entries parent).val, agrees parent⟩
  | Sum.inr parent => ⟨rightHalf (entries parent).val, by
      have combined := wordCoarse_halves (entries parent).val
      rw [(entries parent).property, agrees parent] at combined
      have total := totals parent
      omega⟩

omit [CommRing K] in
/-- Splitting actual axis coordinates also splits exactly their complete fine words. -/
theorem parentAxisChildren_fine {q length parentTotal : ℕ} (childTotal : P ⊕ P → ℕ)
    (totals : ∀ parent, childTotal (Sum.inl parent) + childTotal (Sum.inr parent) = parentTotal)
    (entries : P → AxisVariable q (length+length) parentTotal)
    (agrees : ∀ parent, wordCoarse (leftHalf (entries parent).val) = childTotal (Sum.inl parent)) :
    (fun slot => fineWord (parentAxisChildren childTotal totals entries agrees slot).val) =
      fineHalves length (fun parent => fineWord (entries parent).val) := by
  funext slot
  cases slot <;> rfl

omit [CommRing K] in
/-- Each prescribed admissible split supplies the child-total identities on all three axes. -/
theorem childLabels_shape {total : ℕ} (parent : Shape) (balanced : parent.total = 2*total)
    (left : P → ShapeAlphabet total) (fits : ∀ position, (left position).val.Fits parent) (position : P) :
    addShape (childLabels parent balanced left (Sum.inl position)).val
      (childLabels parent balanced left (Sum.inr position)).val = parent := by
  change addShape (left position).val (complementEquiv parent total balanced (left position)).val = parent
  rw [complementEquiv_shape parent total balanced (left position) (fits position)]
  exact addShape_complement (fits position)

/-- Nonzero parent coefficients give nonzero coefficients in every labelled physical child. -/
theorem parent_children_nonzero {q length : ℕ} (parent : Shape) (children : P ⊕ P → Shape)
    (shapes : ∀ position, addShape (children (Sum.inl position)) (children (Sum.inr position)) = parent)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (agreesX : ∀ position, wordCoarse (leftHalf (x position).val) = (children (Sum.inl position)).x)
    (agreesY : ∀ position, wordCoarse (leftHalf (y position).val) = (children (Sum.inl position)).y)
    (agreesZ : ∀ position, wordCoarse (leftHalf (z position).val) = (children (Sum.inl position)).z)
    (nonzero : ∀ position, constituent (K := K) q (length+length) parent (x position) (y position) (z position) ≠ 0)
    (slot : P ⊕ P) :
    constituent (K := K) q length (children slot)
      (parentAxisChildren (fun slot => (children slot).x) (fun position => congrArg Shape.x (shapes position)) x agreesX slot)
      (parentAxisChildren (fun slot => (children slot).y) (fun position => congrArg Shape.y (shapes position)) y agreesY slot)
      (parentAxisChildren (fun slot => (children slot).z) (fun position => congrArg Shape.z (shapes position)) z agreesZ slot) ≠ 0 := by
  have products (position : P) := nonzero position
  simp only [constituent, wordPower_halves] at products
  cases slot with
  | inl position => exact left_ne_zero_of_mul (products position)
  | inr position => exact right_ne_zero_of_mul (products position)

variable [Fintype P]

/-- Actual parent support plus full X types forces the Y compatibility used in ownership. -/
theorem parent_y_compatibility {q length total : ℕ} (parent : Shape) (balanced : parent.total = 2*total)
    (left : P → ShapeAlphabet total) (fits : ∀ position, (left position).val.Fits parent)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (agreesX : ∀ position, wordCoarse (leftHalf (x position).val) = (left position).val.x)
    (agreesY : ∀ position, wordCoarse (leftHalf (y position).val) = (left position).val.y)
    (agreesZ : ∀ position, wordCoarse (leftHalf (z position).val) = (left position).val.z)
    (nonzero : ∀ position, constituent (K := K) q (length+length) parent (x position) (y position) (z position) ≠ 0)
    (profileX profileY : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible (childLabels parent balanced left) profileX
      (fineHalves length (fun position => fineWord (x position).val)))
    (complementary : ∀ child, child.val.z = 0 → ∀ symbol,
      profileY child symbol = profileX child ((fineComplement length).symm symbol))
    (pooledY : SectorCompatible (fun slot => shapeYIndex (childLabels parent balanced left slot))
      (pooledProfile profileY shapeYIndex) (fineHalves length (fun position => fineWord (y position).val))) :
    compatibleFine length parent balanced yClass (pooledProfile profileY yClass) (fun child => child.val.y)
      left (fun position => fineWord (y position).val) := by
  let children := childLabels parent balanced left
  have shapes := childLabels_shape parent balanced left fits
  let childX := parentAxisChildren (fun slot => (children slot).val.x)
    (fun position => congrArg Shape.x (shapes position)) x agreesX
  let childY := parentAxisChildren (fun slot => (children slot).val.y)
    (fun position => congrArg Shape.y (shapes position)) y agreesY
  let childZ := parentAxisChildren (fun slot => (children slot).val.z)
    (fun position => congrArg Shape.z (shapes position)) z agreesZ
  refine ⟨agreesY, ?_⟩
  have result := y_compatibility_necessary children childX childY childZ
    (parent_children_nonzero parent (fun slot => (children slot).val) shapes x y z agreesX agreesY agreesZ nonzero)
    profileX profileY (by simpa only [childX, parentAxisChildren_fine] using typedX) complementary
    (by simpa only [childY, parentAxisChildren_fine] using pooledY)
  simpa only [childY, parentAxisChildren_fine] using result

/-- Once full Y types are imposed, actual parent support forces Z's asymmetric compatibility. -/
theorem parent_z_compatibility {q length total : ℕ} (parent : Shape) (balanced : parent.total = 2*total)
    (left : P → ShapeAlphabet total) (fits : ∀ position, (left position).val.Fits parent)
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (agreesX : ∀ position, wordCoarse (leftHalf (x position).val) = (left position).val.x)
    (agreesY : ∀ position, wordCoarse (leftHalf (y position).val) = (left position).val.y)
    (agreesZ : ∀ position, wordCoarse (leftHalf (z position).val) = (left position).val.z)
    (nonzero : ∀ position, constituent (K := K) q (length+length) parent (x position) (y position) (z position) ≠ 0)
    (profileX profileY profileZ : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible (childLabels parent balanced left) profileX
      (fineHalves length (fun position => fineWord (x position).val)))
    (typedY : SectorCompatible (childLabels parent balanced left) profileY
      (fineHalves length (fun position => fineWord (y position).val)))
    (complementaryX : ∀ child, child.val.x = 0 → ∀ symbol,
      profileZ child symbol = profileY child ((fineComplement length).symm symbol))
    (complementaryY : ∀ child, child.val.y = 0 → ∀ symbol,
      profileZ child symbol = profileX child ((fineComplement length).symm symbol))
    (pooledZ : SectorCompatible (fun slot => shapeZIndex (childLabels parent balanced left slot))
      (pooledProfile profileZ shapeZIndex) (fineHalves length (fun position => fineWord (z position).val))) :
    compatibleFine length parent balanced zClass (pooledProfile profileZ zClass) (fun child => child.val.z)
      left (fun position => fineWord (z position).val) := by
  let children := childLabels parent balanced left
  have shapes := childLabels_shape parent balanced left fits
  let childX := parentAxisChildren (fun slot => (children slot).val.x)
    (fun position => congrArg Shape.x (shapes position)) x agreesX
  let childY := parentAxisChildren (fun slot => (children slot).val.y)
    (fun position => congrArg Shape.y (shapes position)) y agreesY
  let childZ := parentAxisChildren (fun slot => (children slot).val.z)
    (fun position => congrArg Shape.z (shapes position)) z agreesZ
  refine ⟨agreesZ, ?_⟩
  have result := z_compatibility_necessary children childX childY childZ
    (parent_children_nonzero parent (fun slot => (children slot).val) shapes x y z agreesX agreesY agreesZ nonzero)
    profileX profileY profileZ (by simpa only [childX, parentAxisChildren_fine] using typedX)
    (by simpa only [childY, parentAxisChildren_fine] using typedY) complementaryX complementaryY
    (by simpa only [childZ, parentAxisChildren_fine] using pooledZ)
  simpa only [childZ, parentAxisChildren_fine] using result

end
end MatrixBounds.Tensor.CW
