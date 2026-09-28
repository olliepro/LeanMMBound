import SectorTypes
import CompatibilitySymmetry

/-! Pooled and separately labelled compatibility constraints as actual finite
word predicates. Their counts and permutation invariance are derived directly. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Slot Sector B : Type*} [Fintype Slot]

/-- Count a fine symbol only in slots carrying the specified sector label. -/
def sectorCount (label : Slot → Sector) (word : Slot → B) (sector : Sector) (symbol : B) : ℕ :=
  Nat.card {slot // label slot = sector ∧ word slot = symbol}

/-- A fine word satisfies the prescribed empirical profile in every separately labelled pooled sector. -/
def SectorCompatible (label : Slot → Sector) (profile : Sector → B → ℕ) (word : Slot → B) : Prop :=
  ∀ sector symbol, sectorCount label word sector symbol = profile sector symbol

omit [Fintype Slot] in
/-- Counting a labelled sector is ordinary empirical counting on that sector's position fiber. -/
theorem sectorCount_fiber (label : Slot → Sector) (word : Slot → B) (sector : Sector) (symbol : B) :
    sectorCount label word sector symbol = count (fun slot : {slot // label slot = sector} => word slot.val) symbol := by
  apply Nat.card_congr
  exact {
    toFun := fun slot => ⟨⟨slot.val, slot.property.1⟩, slot.property.2⟩
    invFun := fun slot => ⟨slot.val.val, slot.val.property, slot.property⟩
    left_inv := fun _ => rfl
    right_inv := fun _ => rfl }

omit [Fintype Slot] in
/-- The pooled predicate is exactly a tuple of exact-type constraints on the sector fibers. -/
theorem sectorCompatible_iff (label : Slot → Sector) (profile : Sector → B → ℕ) (word : Slot → B) :
    SectorCompatible label profile word ↔
      ∀ sector, HasType (profile sector) (fun slot : {slot // label slot = sector} => word slot.val) := by
  simp only [SectorCompatible, HasType, sectorCount_fiber]

/-- Compatibility words are canonically the independently typed words on all sector fibers. -/
def sectorCompatibleEquiv (label : Slot → Sector) (profile : Sector → B → ℕ) :
    {word : Slot → B // SectorCompatible label profile word} ≃
      (∀ sector, TypedWord (P := {slot // label slot = sector}) (profile sector)) :=
  (Equiv.subtypeEquivRight (fun word => sectorCompatible_iff label profile word)).trans
    (sectorWordsEquiv (Equiv.sigmaFiberEquiv label) profile)

/-- The exact compatibility count is a product of multinomial sector counts. -/
theorem sectorCompatible_card [Fintype Sector] [Fintype B]
    (label : Slot → Sector) (profile : Sector → B → ℕ) :
    Nat.card {word : Slot → B // SectorCompatible label profile word} =
      ∏ sector, Fintype.card (TypedWord (P := {slot // label slot = sector}) (profile sector)) := by
  rw [Nat.card_congr (sectorCompatibleEquiv label profile)]
  simp only [Nat.card_eq_fintype_card, Fintype.card_pi]

/-- Requiring a parent type or any other additional condition cannot increase the compatibility count. -/
theorem restricted_compatibility_card [Fintype Sector] [Fintype B]
    (label : Slot → Sector) (profile : Sector → B → ℕ) (accepted : (Slot → B) → Prop) :
    Nat.card {word : Slot → B // SectorCompatible label profile word ∧ accepted word} ≤
      ∏ sector, Fintype.card (TypedWord (P := {slot // label slot = sector}) (profile sector)) := by
  rw [← sectorCompatible_card label profile]
  apply Nat.card_le_card_of_injective
    (fun word : {word : Slot → B // SectorCompatible label profile word ∧ accepted word} =>
      (⟨word.val, word.property.1⟩ : {word : Slot → B // SectorCompatible label profile word}))
  intro left right same
  exact Subtype.ext (congrArg
    (fun word : {word : Slot → B // SectorCompatible label profile word} => word.val) same)

omit [Fintype Slot] in
/-- Simultaneously permuting sector labels and fine words preserves every compatibility count. -/
theorem sectorCount_reorder (permutation : Equiv.Perm Slot)
    (label : Slot → Sector) (word : Slot → B) (sector : Sector) (symbol : B) :
    sectorCount (reorder permutation label) (reorder permutation word) sector symbol =
      sectorCount label word sector symbol := by
  apply Nat.card_congr
  exact {
    toFun := fun slot => ⟨permutation.symm slot.val, slot.property⟩
    invFun := fun slot => ⟨permutation slot.val, by simpa only [reorder, Equiv.symm_apply_apply] using slot.property⟩
    left_inv := fun slot => Subtype.ext (permutation.apply_symm_apply slot.val)
    right_inv := fun slot => Subtype.ext (permutation.symm_apply_apply slot.val) }

omit [Fintype Slot] in
/-- The complete pooled compatibility relation is invariant under simultaneous position permutations. -/
theorem sectorCompatible_reorder (permutation : Equiv.Perm Slot)
    (label : Slot → Sector) (profile : Sector → B → ℕ) (word : Slot → B) :
    SectorCompatible (reorder permutation label) profile (reorder permutation word) ↔
      SectorCompatible label profile word := by
  simp only [SectorCompatible, sectorCount_reorder]

end
end MatrixBounds.Empirical
