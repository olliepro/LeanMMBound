module

public import CWRootGraph
public import CWCompatibilityNecessary

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Actual asymmetric compatibility at the unrestricted root. Fine words are
kept on single root positions; no parent pairing or concentration is required. -/
namespace MatrixBounds.Tensor.CW.RootRestrictionData

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P K : Type*} [Fintype P] [CommRing K] {length : ℕ}

/-- Complete fine words read independently from each unrestricted source coordinate. -/
def fineWords {q length : ℕ} (entries : P → Fin length → Fin (q+2)) : P → Fin length → Fin 3 :=
  fun position => fineWord (entries position)

/-- A pooled one-axis root test reads its position classes from that axis alone. -/
def pooledAxis {q : ℕ} (profile : Fin (2*length+1) → (Fin length → Fin 3) → ℕ)
    (entries : P → Fin length → Fin (q+2)) : Prop :=
  SectorCompatible (fun position => wordCoarseIndex (entries position)) profile (fineWords entries)

/-- Root compatibility combines its physical coarse word with its forced and pooled fine sectors. -/
def compatibleFine (axis : Shape → ℕ) (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (edge : P → ShapeAlphabet (2*length)) (fine : P → Fin length → Fin 3) : Prop :=
  (∀ position, fineTotal (fine position) = axis (edge position).val) ∧
    SectorCompatible (fun position => axisClass (edge position)) (pooledProfile profile axisClass) fine

omit [Fintype P] [CommRing K] in
/-- Coarse agreement converts the variable-only root pooling labels to the edge's labels. -/
theorem pooledAxis_of_agreement {q : ℕ} (edge : P → ShapeAlphabet (2*length))
    (index : ShapeAlphabet (2*length) → Fin (2*length+1))
    (profile : Fin (2*length+1) → (Fin length → Fin 3) → ℕ)
    (entries : P → Fin length → Fin (q+2))
    (agrees : ∀ position, wordCoarse (entries position) = (index (edge position)).val)
    (pooled : pooledAxis profile entries) :
    SectorCompatible (fun position => index (edge position)) profile (fineWords entries) := by
  have labels : (fun position => wordCoarseIndex (entries position)) = fun position => index (edge position) :=
    funext (fun position => Fin.ext (agrees position))
  change SectorCompatible (fun position => wordCoarseIndex (entries position)) _ _ at pooled
  rwa [labels] at pooled

/-- Physical root support and full X types force the additional Y sectors used by ownership. -/
theorem y_compatibility (data : RootRestrictionData length) {q : ℕ} (edge : P → ShapeAlphabet (2*length))
    (x y z : P → Fin length → Fin (q+2))
    (agreesX : ∀ position, wordCoarse (x position) = (edge position).val.x)
    (agreesY : ∀ position, wordCoarse (y position) = (edge position).val.y)
    (agreesZ : ∀ position, wordCoarse (z position) = (edge position).val.z)
    (nonzero : ∀ position, wordPower (tensor (K := K) q) length (x position) (y position) (z position) ≠ 0)
    (typedX : SectorCompatible edge data.fineX (fineWords x))
    (pooledY : pooledAxis (pooledProfile data.fineY shapeYIndex) y) :
    compatibleFine Shape.y yClass data.fineY edge (fineWords y) := by
  refine ⟨agreesY, ?_⟩
  exact y_compatibility_necessary edge
    (fun position => ⟨x position, agreesX position⟩) (fun position => ⟨y position, agreesY position⟩)
    (fun position => ⟨z position, agreesZ position⟩) nonzero data.fineX data.fineY typedX data.zeroZ
    (pooledAxis_of_agreement edge shapeYIndex _ y agreesY pooledY)

/-- Full X and Y types force Z's zero-coordinate sectors before assigning its unique owner. -/
theorem z_compatibility (data : RootRestrictionData length) {q : ℕ} (edge : P → ShapeAlphabet (2*length))
    (x y z : P → Fin length → Fin (q+2))
    (agreesX : ∀ position, wordCoarse (x position) = (edge position).val.x)
    (agreesY : ∀ position, wordCoarse (y position) = (edge position).val.y)
    (agreesZ : ∀ position, wordCoarse (z position) = (edge position).val.z)
    (nonzero : ∀ position, wordPower (tensor (K := K) q) length (x position) (y position) (z position) ≠ 0)
    (typedX : SectorCompatible edge data.fineX (fineWords x))
    (typedY : SectorCompatible edge data.fineY (fineWords y))
    (pooledZ : pooledAxis (pooledProfile data.fineZ shapeZIndex) z) :
    compatibleFine Shape.z zClass data.fineZ edge (fineWords z) := by
  refine ⟨agreesZ, ?_⟩
  exact z_compatibility_necessary edge
    (fun position => ⟨x position, agreesX position⟩) (fun position => ⟨y position, agreesY position⟩)
    (fun position => ⟨z position, agreesZ position⟩) nonzero data.fineX data.fineY data.fineZ typedX typedY
    data.zeroX data.zeroY (pooledAxis_of_agreement edge shapeZIndex _ z agreesZ pooledZ)

omit [Fintype P] [CommRing K] in
/-- Compatibility is invariant when root positions are permuted together in the coarse and fine words. -/
theorem compatibleFine_reorder (axis : Shape → ℕ)
    (axisClass : ShapeAlphabet (2*length) → CompatibilityClass (2*length))
    (profile : ShapeAlphabet (2*length) → (Fin length → Fin 3) → ℕ)
    (edge : P → ShapeAlphabet (2*length)) (fine : P → Fin length → Fin 3) (permutation : Equiv.Perm P) :
    compatibleFine axis axisClass profile (reorder permutation edge) (reorder permutation fine) ↔
      compatibleFine axis axisClass profile edge fine := by
  unfold compatibleFine
  rw [show (fun position => axisClass (reorder permutation edge position)) =
    reorder permutation (fun position => axisClass (edge position)) from rfl, sectorCompatible_reorder]
  constructor
  · rintro ⟨coarse, pooled⟩
    refine ⟨fun position => ?_, pooled⟩
    simpa only [reorder, Equiv.symm_apply_apply] using coarse (permutation position)
  · rintro ⟨coarse, pooled⟩
    exact ⟨fun position => coarse (permutation.symm position), pooled⟩

end
end MatrixBounds.Tensor.CW.RootRestrictionData
