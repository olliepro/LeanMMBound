import PairingSectorTypes

/-! A single exact type partitions one position set into labelled pools.
This is the unpaired placement required by the unrestricted root extraction. -/
namespace MatrixBounds.Empirical

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P]

/-- Enumerate positions carrying a symbol using its exact multiplicity. -/
def typeFiber (profile : B → ℕ) (word : TypedWord (P := P) profile) (symbol : B) :
    Fin (profile symbol) ≃ {position // word.val position = symbol} :=
  Fintype.equivOfCardEq (by simpa only [Fintype.card_fin, count, Nat.card_eq_fintype_card] using
    (word.property symbol).symm)

/-- An exact word gives a bijection from its labelled symbol pools to the original positions. -/
def typePlacement (profile : B → ℕ) (word : TypedWord (P := P) profile) :
    ((symbol : B) × Fin (profile symbol)) ≃ P :=
  (Equiv.sigmaCongrRight (typeFiber profile word)).trans (Equiv.sigmaFiberEquiv word.val)

/-- The placement sends every labelled pool to exactly the positions bearing its symbol. -/
theorem typePlacement_label (profile : B → ℕ) (word : TypedWord (P := P) profile)
    (slot : (symbol : B) × Fin (profile symbol)) : word.val (typePlacement profile word slot) = slot.1 :=
  (typeFiber profile word slot.1 slot.2).property

/-- Reading the inverse placement recovers the original symbol at each position. -/
theorem typePlacement_inverse_label (profile : B → ℕ) (word : TypedWord (P := P) profile) (position : P) :
    ((typePlacement profile word).symm position).1 = word.val position := by
  simpa only [Equiv.apply_symm_apply] using
    (typePlacement_label profile word ((typePlacement profile word).symm position)).symm

/-- Regrouped exact pool words meet all complete fine-type constraints of the root word. -/
theorem typePlacement_compatible {A : Type*} (profile : B → ℕ) (word : TypedWord (P := P) profile)
    (fineProfile : B → A → ℕ) (parts : ∀ symbol, TypedWord (P := Fin (profile symbol)) (fineProfile symbol)) :
    SectorCompatible word.val fineProfile (regroupParts (typePlacement profile word) (fun symbol => (parts symbol).val)) :=
  regroupParts_compatible (typePlacement profile word) word.val (typePlacement_label profile word) fineProfile parts

end
end MatrixBounds.Empirical
