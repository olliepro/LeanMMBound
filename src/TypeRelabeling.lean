module

public import EmpiricalTypes
public import TypePartition

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Exact empirical types are invariant under bijective alphabet relabeling.
The maps act on the actual words and preserve every multiplicity. -/
namespace MatrixBounds.Empirical

noncomputable section
variable {P A B : Type*}

/-- Relabeling a word transports its count to the corresponding original symbol. -/
theorem count_relabel (labels : A ≃ B) (word : P → A) (symbol : B) :
    count (labels ∘ word) symbol = count word (labels.symm symbol) := by
  unfold count
  exact Nat.card_congr (Equiv.subtypeEquivRight (fun position => labels.apply_eq_iff_eq_symm_apply))

/-- Every exact type is preserved when its profile is reindexed by the inverse alphabet bijection. -/
theorem hasType_relabel (labels : A ≃ B) (profile : A → ℕ) (word : P → A)
    (typed : HasType profile word) : HasType (profile ∘ labels.symm) (labels ∘ word) := by
  intro symbol
  exact (count_relabel labels word symbol).trans (typed (labels.symm symbol))

/-- A bijection of alphabets supplies a bijection of their complete exact-type word sets. -/
def typedWordRelabel (labels : A ≃ B) (profile : A → ℕ) :
    TypedWord (P := P) profile ≃ TypedWord (P := P) (profile ∘ labels.symm) where
  toFun word := ⟨labels ∘ word.val, hasType_relabel labels profile word.val word.property⟩
  invFun word := ⟨labels.symm ∘ word.val, by
    intro symbol
    rw [count_relabel]
    simpa only [Function.comp_apply, Equiv.symm_symm, Equiv.symm_apply_apply] using word.property (labels symbol)⟩
  left_inv word := by apply Subtype.ext; funext position; exact labels.symm_apply_apply (word.val position)
  right_inv word := by apply Subtype.ext; funext position; exact labels.apply_symm_apply (word.val position)

/-- The exact multinomial count is independent of a bijective alphabet renaming. -/
theorem type_count_relabel (labels : A ≃ B) (profile : A → ℕ) :
    Nat.card (TypedWord (P := P) profile) = Nat.card (TypedWord (P := P) (profile ∘ labels.symm)) :=
  Nat.card_congr (typedWordRelabel labels profile)

end
end MatrixBounds.Empirical
