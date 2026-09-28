import CWParentCompatibility
import CWCoarseOwnership

/-! The pooled tests are legitimate one-axis restrictions: their sector labels
are read directly from that axis's own coordinate word. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric HashCounting Extraction
noncomputable section
variable {P K : Type*} [Fintype P] [CommRing K]

/-- Complete parent fine words read from an actual axis variable. -/
def parentFine {q length total : ℕ} (entries : P → AxisVariable q (length+length) total) :
    P → Fin (length+length) → Fin 3 := fun position => fineWord (entries position).val

/-- The two child coarse indices of a parent variable are computed using only that one axis. -/
def axisChildIndex {q length total : ℕ} (entries : P → AxisVariable q (length+length) total) :
    P ⊕ P → Fin (2*length+1) :=
  Sum.elim (fun position => wordCoarseIndex (leftHalf (entries position).val))
    (fun position => wordCoarseIndex (rightHalf (entries position).val))

omit [Fintype P] [CommRing K] in
/-- Matching the left coarse word determines both child pooling labels, using the fixed parent total. -/
theorem axisChildIndex_eq {q length total : ℕ} (entries : P → AxisVariable q (length+length) total)
    (indices : P ⊕ P → Fin (2*length+1))
    (totals : ∀ position, (indices (Sum.inl position)).val + (indices (Sum.inr position)).val = total)
    (agrees : ∀ position, wordCoarse (leftHalf (entries position).val) = (indices (Sum.inl position)).val) :
    axisChildIndex entries = indices := by
  funext slot
  apply Fin.ext
  cases slot with
  | inl position => exact agrees position
  | inr position =>
    have combined := wordCoarse_halves (entries position).val
    rw [(entries position).property, agrees position] at combined
    have total := totals position
    change wordCoarse (rightHalf (entries position).val) = _
    omega

/-- The pooled empirical test uses only the variable's own child indices and fine words. -/
def pooledAxisType {q length total : ℕ}
    (profile : Fin (2*length+1) → (Fin length → Fin 3) → ℕ)
    (entries : P → AxisVariable q (length+length) total) : Prop :=
  SectorCompatible (axisChildIndex entries) profile (fineHalves length (parentFine entries))

/-- Full child types are imposed only after an edge has become the variable's unique owner. -/
def fullChildType {q length total : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (left : P → ShapeAlphabet (2*length)) (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : P → AxisVariable q (length+length) total) : Prop :=
  SectorCompatible (childLabels parent balanced left) profile (fineHalves length (parentFine entries))

omit [Fintype P] [CommRing K] in
/-- The variable-only Y pooling test becomes the edge-specific test once its coarse indices agree. -/
theorem pooled_y_of_agreement {q length : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (left : P → ShapeAlphabet (2*length)) (fits : ∀ position, (left position).val.Fits parent)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : P → AxisVariable q (length+length) parent.y)
    (agrees : ∀ position, wordCoarse (leftHalf (entries position).val) = (left position).val.y)
    (pooled : pooledAxisType (pooledProfile profile shapeYIndex) entries) :
    SectorCompatible (fun slot => shapeYIndex (childLabels parent balanced left slot))
      (pooledProfile profile shapeYIndex) (fineHalves length (parentFine entries)) := by
  have labels := axisChildIndex_eq entries (fun slot => shapeYIndex (childLabels parent balanced left slot))
    (fun position => congrArg Shape.y (childLabels_shape parent balanced left fits position)) agrees
  change SectorCompatible (axisChildIndex entries) _ _ at pooled
  rwa [labels] at pooled

omit [Fintype P] [CommRing K] in
/-- The same one-axis-to-edge identification holds for the Z pooling test. -/
theorem pooled_z_of_agreement {q length : ℕ} (parent : Shape) (balanced : parent.total = 2*(2*length))
    (left : P → ShapeAlphabet (2*length)) (fits : ∀ position, (left position).val.Fits parent)
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (entries : P → AxisVariable q (length+length) parent.z)
    (agrees : ∀ position, wordCoarse (leftHalf (entries position).val) = (left position).val.z)
    (pooled : pooledAxisType (pooledProfile profile shapeZIndex) entries) :
    SectorCompatible (fun slot => shapeZIndex (childLabels parent balanced left slot))
      (pooledProfile profile shapeZIndex) (fineHalves length (parentFine entries)) := by
  have labels := axisChildIndex_eq entries (fun slot => shapeZIndex (childLabels parent balanced left slot))
    (fun position => congrArg Shape.z (childLabels_shape parent balanced left fits position)) agrees
  change SectorCompatible (axisChildIndex entries) _ _ at pooled
  rwa [labels] at pooled

/-- A nonzero hashed parent coefficient has a nonzero physical constituent at every parent position. -/
theorem hashed_parent_factors {prime : ℕ} [Fact prime.Prime] [NeZero (2 : ZMod prime)]
    (q length : ℕ) (parent : Shape) (px py pz : Fin (2*length+1) → ℕ)
    (seed : Seed (ZMod prime) P) (buckets : Set (ZMod prime))
    (x : P → AxisVariable q (length+length) parent.x)
    (y : P → AxisVariable q (length+length) parent.y)
    (z : P → AxisVariable q (length+length) parent.z)
    (nonzero : hashedCoarseParent (K := K) q length parent px py pz seed buckets x y z ≠ 0) (position : P) :
    constituent (K := K) q (length+length) parent (x position) (y position) (z position) ≠ 0 := by
  have original := (hashed_nonzero _ _ _ _ _ _ _ x y z nonzero).1
  change coarseFiltered (K := K) q length parent px py pz x y z ≠ 0 at original
  have product := (accepted_nonzero _ _ _ _ _ _ _ x y z original).1
  intro zero
  exact product (Finset.prod_eq_zero (Finset.mem_univ position) zero)

end
end MatrixBounds.Tensor.CW
