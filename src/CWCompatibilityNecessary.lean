module

public import CWPooledDegrees
public import PartialSectorTypes

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Necessary asymmetric compatibility of actual nonzero CW coefficients.
The first pooled test depends only on its own axis, and zero sectors supply
the additional child types used to assign a unique owner. -/
namespace MatrixBounds.Tensor.CW

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {K Slot : Type*} [CommRing K] [Fintype Slot]

omit [CommRing K] [Fintype Slot] in
/-- A bijective relation between the fine words in one sector transports its complete type. -/
theorem sector_count_transport {Child B C : Type*} (label : Slot → Child)
    (left : Slot → B) (right : Slot → C) (equiv : B ≃ C) (child : Child)
    (related : ∀ slot, label slot = child → right slot = equiv (left slot)) (symbol : C) :
    sectorCount label right child symbol = sectorCount label left child (equiv.symm symbol) := by
  rw [sectorCount_fiber, sectorCount_fiber]
  have same : (fun slot : {slot // label slot = child} => right slot.val) =
      fun slot : {slot // label slot = child} => equiv (left slot.val) := by
    funext slot
    exact related slot.val slot.property
  rw [same, count_map_equiv]

omit [CommRing K] in
/-- The bounded Y-coordinate supplies the variable-only pooling index. -/
def shapeYIndex {total : ℕ} (child : ShapeAlphabet total) : Fin (total+1) :=
  ⟨child.val.y, by have := shapes_total child.property; unfold Shape.total at this; omega⟩

omit [CommRing K] in
/-- The bounded Z-coordinate supplies the variable-only pooling index. -/
def shapeZIndex {total : ℕ} (child : ShapeAlphabet total) : Fin (total+1) :=
  ⟨child.val.z, by have := shapes_total child.property; unfold Shape.total at this; omega⟩

omit [CommRing K] [Fintype Slot] in
/-- The Y class map is exactly the partial refinement by zero-Z child labels. -/
theorem yClass_partial {total : ℕ} :
    @yClass total = partialClass (fun child => child.val.z = 0) shapeYIndex := by
  funext child
  by_cases zero : child.val.z = 0 <;> simp [yClass, partialClass, shapeYIndex, zero]

omit [CommRing K] [Fintype Slot] in
/-- The Z class map is exactly the partial refinement by zero-X or zero-Y child labels. -/
theorem zClass_partial {total : ℕ} :
    @zClass total = partialClass (fun child => child.val.x = 0 ∨ child.val.y = 0) shapeZIndex := by
  funext child
  by_cases zero : child.val.x = 0 ∨ child.val.y = 0 <;> simp [zClass, partialClass, shapeZIndex, zero]

omit [Fintype Slot] in
/-- In each zero-Z child sector, a nonzero coefficient forces its full Y type from the X type. -/
theorem zero_z_sector_type {q length total : ℕ} (label : Slot → ShapeAlphabet total)
    (x : ∀ slot, AxisVariable q length (label slot).val.x)
    (y : ∀ slot, AxisVariable q length (label slot).val.y)
    (z : ∀ slot, AxisVariable q length (label slot).val.z)
    (nonzero : ∀ slot, constituent (K := K) q length (label slot).val (x slot) (y slot) (z slot) ≠ 0)
    (profileX : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible label profileX (fun slot => fineWord (x slot).val))
    (child : ShapeAlphabet total) (zero : child.val.z = 0) (symbol : Fin length → Fin 3) :
    sectorCount label (fun slot => fineWord (y slot).val) child symbol =
      profileX child ((fineComplement length).symm symbol) := by
  rw [sector_count_transport label (fun slot => fineWord (x slot).val)
    (fun slot => fineWord (y slot).val) (fineComplement length) child ?_ symbol]
  · exact typedX child _
  · intro slot belongs
    exact zero_z_fine_word (x slot).val (y slot).val (z slot).val (nonzero slot)
      (by rw [(z slot).property, belongs, zero])

/-- A pooled Y-only test and forced zero-Z types imply the full asymmetric Y compatibility test. -/
theorem y_compatibility_necessary {q length total : ℕ} (label : Slot → ShapeAlphabet total)
    (x : ∀ slot, AxisVariable q length (label slot).val.x)
    (y : ∀ slot, AxisVariable q length (label slot).val.y)
    (z : ∀ slot, AxisVariable q length (label slot).val.z)
    (nonzero : ∀ slot, constituent (K := K) q length (label slot).val (x slot) (y slot) (z slot) ≠ 0)
    (profileX profileY : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible label profileX (fun slot => fineWord (x slot).val))
    (complementary : ∀ child, child.val.z = 0 → ∀ symbol,
      profileY child symbol = profileX child ((fineComplement length).symm symbol))
    (pooledY : SectorCompatible (fun slot => shapeYIndex (label slot))
      (pooledProfile profileY shapeYIndex) (fun slot => fineWord (y slot).val)) :
    SectorCompatible (fun slot => yClass (label slot))
      (pooledProfile profileY yClass) (fun slot => fineWord (y slot).val) := by
  rw [yClass_partial]
  apply sectorCompatible_partial label profileY (fun child => child.val.z = 0) shapeYIndex
    (fun slot => fineWord (y slot).val) pooledY
  intro child zero symbol
  rw [zero_z_sector_type label x y z nonzero profileX typedX child zero symbol]
  exact (complementary child zero symbol).symm

omit [Fintype Slot] in
/-- In zero-X and zero-Y sectors, full X/Y child types force the Z types needed for compatibility. -/
theorem zero_xy_sector_type {q length total : ℕ} (label : Slot → ShapeAlphabet total)
    (x : ∀ slot, AxisVariable q length (label slot).val.x)
    (y : ∀ slot, AxisVariable q length (label slot).val.y)
    (z : ∀ slot, AxisVariable q length (label slot).val.z)
    (nonzero : ∀ slot, constituent (K := K) q length (label slot).val (x slot) (y slot) (z slot) ≠ 0)
    (profileX profileY profileZ : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible label profileX (fun slot => fineWord (x slot).val))
    (typedY : SectorCompatible label profileY (fun slot => fineWord (y slot).val))
    (complementaryX : ∀ child, child.val.x = 0 → ∀ symbol,
      profileZ child symbol = profileY child ((fineComplement length).symm symbol))
    (complementaryY : ∀ child, child.val.y = 0 → ∀ symbol,
      profileZ child symbol = profileX child ((fineComplement length).symm symbol))
    (child : ShapeAlphabet total) (zero : child.val.x = 0 ∨ child.val.y = 0) (symbol : Fin length → Fin 3) :
    sectorCount label (fun slot => fineWord (z slot).val) child symbol = profileZ child symbol := by
  rcases zero with zero | zero
  · rw [sector_count_transport label (fun slot => fineWord (y slot).val)
      (fun slot => fineWord (z slot).val) (fineComplement length) child ?_ symbol]
    · rw [typedY]
      exact (complementaryX child zero symbol).symm
    · intro slot belongs
      exact zero_z_fine_word (K := K) (y slot).val (z slot).val (x slot).val
        (by rw [← word_tensor_cyclic (K := K) (x slot).val (y slot).val (z slot).val]; exact nonzero slot)
        (by rw [(x slot).property, belongs, zero])
  · rw [sector_count_transport label (fun slot => fineWord (x slot).val)
      (fun slot => fineWord (z slot).val) (fineComplement length) child ?_ symbol]
    · rw [typedX]
      exact (complementaryY child zero symbol).symm
    · intro slot belongs
      have related := zero_z_fine_word (K := K) (z slot).val (x slot).val (y slot).val
        (by rw [word_tensor_cyclic (K := K) (z slot).val (x slot).val (y slot).val]; exact nonzero slot)
        (by rw [(y slot).property, belongs, zero])
      change fineWord (z slot).val = fineComplement length (fineWord (x slot).val)
      rw [related]
      exact ((fineComplement length).symm_apply_apply (fineWord (z slot).val)).symm

/-- After Y ownership fixes its full type, the pooled Z-only test implies the necessary Z compatibility. -/
theorem z_compatibility_necessary {q length total : ℕ} (label : Slot → ShapeAlphabet total)
    (x : ∀ slot, AxisVariable q length (label slot).val.x)
    (y : ∀ slot, AxisVariable q length (label slot).val.y)
    (z : ∀ slot, AxisVariable q length (label slot).val.z)
    (nonzero : ∀ slot, constituent (K := K) q length (label slot).val (x slot) (y slot) (z slot) ≠ 0)
    (profileX profileY profileZ : ShapeAlphabet total → (Fin length → Fin 3) → ℕ)
    (typedX : SectorCompatible label profileX (fun slot => fineWord (x slot).val))
    (typedY : SectorCompatible label profileY (fun slot => fineWord (y slot).val))
    (complementaryX : ∀ child, child.val.x = 0 → ∀ symbol,
      profileZ child symbol = profileY child ((fineComplement length).symm symbol))
    (complementaryY : ∀ child, child.val.y = 0 → ∀ symbol,
      profileZ child symbol = profileX child ((fineComplement length).symm symbol))
    (pooledZ : SectorCompatible (fun slot => shapeZIndex (label slot))
      (pooledProfile profileZ shapeZIndex) (fun slot => fineWord (z slot).val)) :
    SectorCompatible (fun slot => zClass (label slot))
      (pooledProfile profileZ zClass) (fun slot => fineWord (z slot).val) := by
  rw [zClass_partial]
  apply sectorCompatible_partial label profileZ (fun child => child.val.x = 0 ∨ child.val.y = 0) shapeZIndex
    (fun slot => fineWord (z slot).val) pooledZ
  exact zero_xy_sector_type label x y z nonzero profileX profileY profileZ typedX typedY complementaryX complementaryY

end
end MatrixBounds.Tensor.CW
