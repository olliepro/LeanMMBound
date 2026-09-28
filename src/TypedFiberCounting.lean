import ExactInterface

/-! Count actual coordinates inside exact empirical interfaces. The result
includes unequal fine-block sizes, which contribute to zero-leaf matrix dimensions. -/
namespace MatrixBounds.Interface

open Empirical
open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P X B : Type*} [Fintype P]

/-- A typed coordinate word is its typed part word plus one coordinate in each specified part. -/
def variableFiberEquiv (part : X → B) (profile : B → ℕ) :
    Variable (P := P) part profile ≃
      ((word : TypedWord (P := P) profile) × (∀ p, {entry : X // part entry = word.val p})) where
  toFun entry := ⟨partWord part profile entry, fun p => ⟨entry.val p, rfl⟩⟩
  invFun family := ⟨fun p => (family.2 p).val, by
    have labels : (fun p => part (family.2 p).val) = family.1.val :=
      funext (fun p => (family.2 p).property)
    rw [labels]
    exact family.1.property⟩
  left_inv _ := rfl
  right_inv family := by
    obtain ⟨word, entries⟩ := family
    have word_eq : (⟨fun p => part (entries p).val, by
        intro symbol
        convert word.property symbol using 1
        congr 1
        exact funext (fun p => (entries p).property)⟩ : TypedWord (P := P) profile) = word := by
      apply Subtype.ext
      exact funext (fun p => (entries p).property)
    apply Sigma.ext word_eq
    apply Function.hfunext rfl
    intro p p' same
    have equal : p = p' := eq_of_heq same
    subst p'
    change (⟨(entries p).val, rfl⟩ : {entry : X // part entry = part (entries p).val}) ≍ entries p
    refine (Subtype.heq_iff_coe_eq ?_).mpr ?_
    · intro entry
      change part entry = part (entries p).val ↔ part entry = word.val p
      rw [(entries p).property]
    · rfl

/-- Multiplicative coordinate weights group by the empirical count of each symbol. -/
theorem product_by_type [Fintype B] {M : Type*} [CommMonoid M]
    (weight : B → M) (word : P → B) :
    (∏ p, weight (word p)) = ∏ symbol, weight symbol ^ count word symbol := by
  have reindexed := Equiv.prod_comp (Equiv.sigmaFiberEquiv word) (fun p => weight (word p))
  rw [Fintype.prod_sigma] at reindexed
  calc
    _ = ∏ symbol, ∏ p : {p // word p = symbol}, weight (word p.val) := reindexed.symm
    _ = _ := by
      apply Finset.prod_congr rfl
      intro symbol _
      have label (p : {p // word p = symbol}) : word p.val = symbol := p.property
      simp only [label, Finset.prod_const, Finset.card_univ, count, Nat.card_eq_fintype_card]

/-- The exact number of typed coordinates is the part-word count times the product of block sizes. -/
theorem variable_card [Fintype X] [Fintype B] (part : X → B) (profile : B → ℕ) :
    Fintype.card (Variable (P := P) part profile) =
      Fintype.card (TypedWord (P := P) profile) *
        ∏ symbol, (Fintype.card {entry : X // part entry = symbol}) ^ profile symbol := by
  rw [Fintype.card_congr (variableFiberEquiv part profile), Fintype.card_sigma]
  have sizes (word : TypedWord (P := P) profile) :
      Fintype.card (∀ p, {entry : X // part entry = word.val p}) =
        ∏ symbol, (Fintype.card {entry : X // part entry = symbol}) ^ profile symbol := by
    rw [Fintype.card_pi]
    have typed (symbol : B) : count word.val symbol = profile symbol := word.property symbol
    simpa only [typed] using
      product_by_type (fun symbol => Fintype.card {entry : X // part entry = symbol}) word.val
  simp only [sizes, Finset.sum_const, Finset.card_univ, smul_eq_mul]

end
end MatrixBounds.Interface
