module

public import PooledCompatibility
public import CWUniformPairing
public import CWPooledCompatibility
public import CoarsenedCompatibility

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Typed child pools really satisfy the sector predicates after their labelled
slots are regrouped into parents. This connects coordinate maps to compatibility. -/
namespace MatrixBounds.Empirical

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {Child Slot B : Type*} {Positions : Child → Type*}

/-- Reassemble the separately labelled pool words on the common slot set. -/
def regroupParts (pairing : ((child : Child) × Positions child) ≃ Slot)
    (words : ∀ child, Positions child → B) (slot : Slot) : B :=
  words (pairing.symm slot).1 (pairing.symm slot).2

/-- The slot count of a regrouped labelled sector is the original pool's empirical count. -/
theorem regroupParts_count (pairing : ((child : Child) × Positions child) ≃ Slot)
    (label : Slot → Child) (labels : ∀ slot, label (pairing slot) = slot.1)
    (words : ∀ child, Positions child → B) (child : Child) (symbol : B) :
    sectorCount label (regroupParts pairing words) child symbol = count (words child) symbol := by
  have inverseLabel (slot : Slot) : label slot = (pairing.symm slot).1 := by
    simpa only [Equiv.apply_symm_apply] using labels (pairing.symm slot)
  let counted : {slot : (child : Child) × Positions child //
      slot.1 = child ∧ words slot.1 slot.2 = symbol} ≃ {position : Positions child // words child position = symbol} := {
    toFun := fun slot => by
      rcases slot with ⟨⟨other, position⟩, same, present⟩
      dsimp at same present
      subst other
      exact ⟨position, present⟩
    invFun := fun position => ⟨⟨child, position.val⟩, rfl, position.property⟩
    left_inv := by
      rintro ⟨⟨other, position⟩, same, present⟩
      dsimp at same present
      subst other
      rfl
    right_inv := fun _ => rfl }
  apply Nat.card_congr
  refine (Equiv.subtypeEquiv pairing.symm ?_).trans counted
  intro slot
  simp only [regroupParts, inverseLabel]

/-- Regrouping fully typed pools preserves every labelled child empirical profile. -/
theorem regroupParts_compatible (pairing : ((child : Child) × Positions child) ≃ Slot)
    (label : Slot → Child) (labels : ∀ slot, label (pairing slot) = slot.1)
    (profile : Child → B → ℕ) (words : ∀ child, TypedWord (P := Positions child) (profile child)) :
    SectorCompatible label profile (regroupParts pairing (fun child => (words child).val)) := by
  intro child symbol
  rw [regroupParts_count pairing label labels]
  exact (words child).property symbol

end
end MatrixBounds.Empirical

namespace MatrixBounds.Tensor.CW

open Empirical
noncomputable section
variable {T P : Type*} {Positions : T → Type*}
variable [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)]

omit [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)] in
/-- Splitting the mapped parent fine words recovers precisely the reassembled labelled child words. -/
theorem Pairing.uniformAxis_fine_halves (pairing : Pairing Positions P) (q length parentTotal : ℕ) (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (profile : T → (Fin length → Fin 3) → ℕ)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q length (total t) => fineWord x.val) (profile t)) :
    fineHalves length (fun parent => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val) =
      regroupParts pairing (fun t position => fineWord ((entries t).val position).val) := by
  funext slot position
  cases slot with
  | inl parent =>
    change fineLabel (Fin.addCases _ _ (Fin.castAdd length position)) = _
    rw [Fin.addCases_left]
    rfl
  | inr parent =>
    change fineLabel (Fin.addCases _ _ (Fin.natAdd length position)) = _
    rw [Fin.addCases_right]
    rfl

omit [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)] in
/-- The mapped parent variable has exactly the left coarse index assigned by its labelled pairing. -/
theorem Pairing.uniformAxis_left_total (pairing : Pairing Positions P) (q length parentTotal : ℕ) (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (profile : T → (Fin length → Fin 3) → ℕ)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q length (total t) => fineWord x.val) (profile t)) (parent : P) :
    fineTotal (fun position => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val
      (Fin.castAdd length position)) = total (pairing.left parent).1 := by
  have same : (fun position => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val
      (Fin.castAdd length position)) =
      fineWord ((entries (pairing.left parent).1).val (pairing.left parent).2).val := by
    funext position
    change fineLabel (Fin.addCases _ _ (Fin.castAdd length position)) = _
    rw [Fin.addCases_left]
    rfl
  rw [same]
  exact fine_part_total _

omit [Fintype T] [Fintype P] [∀ t, Fintype (Positions t)] in
/-- The actual parent coordinate maps preserve the full labelled child-type predicates. -/
theorem Pairing.uniformAxis_compatible (pairing : Pairing Positions P) (q length parentTotal : ℕ) (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (label : P ⊕ P → T) (labels : ∀ slot, label (pairing slot) = slot.1)
    (profile : T → (Fin length → Fin 3) → ℕ)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q length (total t) => fineWord x.val) (profile t)) :
    SectorCompatible label profile (fineHalves length
      (fun parent => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val)) := by
  rw [pairing.uniformAxis_fine_halves]
  exact regroupParts_compatible pairing label labels profile
    (fun t => Interface.partWord _ (profile t) (entries t))

omit [∀ t, Fintype (Positions t)] in
/-- Every mapped target block also passes every coarsening of its child-type sectors. -/
theorem Pairing.uniformAxis_pooled {Sector : Type*} (pairing : Pairing Positions P)
    (q length parentTotal : ℕ) (total : T → ℕ)
    (totals : ∀ parent, total (pairing.left parent).1 + total (pairing.right parent).1 = parentTotal)
    (label : P ⊕ P → T) (labels : ∀ slot, label (pairing slot) = slot.1)
    (profile : T → (Fin length → Fin 3) → ℕ) (sector : T → Sector)
    (entries : ∀ t, Interface.Variable (P := Positions t)
      (fun x : AxisVariable q length (total t) => fineWord x.val) (profile t)) :
    SectorCompatible (fun slot => sector (label slot)) (pooledProfile profile sector) (fineHalves length
      (fun parent => fineWord (pairing.uniformAxis q length parentTotal total totals profile entries parent).val)) :=
  sectorCompatible_coarsen label profile sector _
    (pairing.uniformAxis_compatible q length parentTotal total totals label labels profile entries)

end
end MatrixBounds.Tensor.CW
