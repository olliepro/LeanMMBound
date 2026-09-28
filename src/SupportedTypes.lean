import ConstrainedCounting
import CWTypedInterfaces

/-! Removing zero-mass alphabet symbols preserves exact type words and their
coarse marginals. This identifies checked full shape tables with admissible support. -/
namespace MatrixBounds.Empirical

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {P A B : Type*} [Fintype P]

omit [Fintype P] in
/-- Erasing a symbol's support proof preserves its exact empirical count. -/
theorem count_subtype_val (supported : A → Prop) (word : P → {a // supported a}) (symbol : {a // supported a}) :
    count (fun position => (word position).val) symbol.val = count word symbol := by
  apply Nat.card_congr (Equiv.subtypeEquivRight ?_)
  intro position
  exact Subtype.ext_iff.symm

omit [Fintype P] in
/-- A word over a supported alphabet contains no unsupported symbol. -/
theorem count_subtype_outside (supported : A → Prop) (word : P → {a // supported a})
    (symbol : A) (outside : ¬supported symbol) : count (fun position => (word position).val) symbol = 0 := by
  letI : IsEmpty {position // (word position).val = symbol} := ⟨fun position =>
    outside (position.property ▸ (word position.val).property)⟩
  exact Nat.card_of_isEmpty

omit [Fintype P] in
/-- The restricted type extends to the full alphabet when every excluded profile entry is zero. -/
theorem hasType_subtype_val (supported : A → Prop) (profile : A → ℕ)
    (support : ∀ symbol, ¬supported symbol → profile symbol = 0)
    (word : TypedWord (P := P) (fun symbol : {a // supported a} => profile symbol.val)) :
    HasType profile (fun position => (word.val position).val) := by
  intro symbol
  by_cases present : supported symbol
  · rw [count_subtype_val supported word.val ⟨symbol, present⟩]
    exact word.property ⟨symbol, present⟩
  · rw [count_subtype_outside supported word.val symbol present, support symbol present]

/-- Supported exact words are in bijection before and after deleting zero-mass alphabet symbols. -/
def supportedTypeEquiv (supported : A → Prop) (profile : A → ℕ)
    (support : ∀ symbol, ¬supported symbol → profile symbol = 0) :
    TypedWord (P := P) profile ≃ TypedWord (P := P) (fun symbol : {a // supported a} => profile symbol.val) where
  toFun full := by
    let word : P → {a // supported a} := fun position => ⟨full.val position, by
      by_contra outside
      have positive := Tensor.CW.profile_positive_at profile full position
      rw [support _ outside] at positive
      omega⟩
    refine ⟨word, ?_⟩
    intro symbol
    rw [← count_subtype_val supported word symbol]
    exact full.property symbol.val
  invFun word := ⟨fun position => (word.val position).val, hasType_subtype_val supported profile support word⟩
  left_inv _ := rfl
  right_inv _ := rfl

/-- Every exact-type cardinality is unchanged by restricting to the supported alphabet. -/
theorem supported_type_card (supported : A → Prop) (profile : A → ℕ)
    (support : ∀ symbol, ¬supported symbol → profile symbol = 0) :
    Nat.card (TypedWord (P := P) profile) =
      Nat.card (TypedWord (P := P) (fun symbol : {a // supported a} => profile symbol.val)) :=
  Nat.card_congr (supportedTypeEquiv supported profile support)

/-- Feasible profiles have the same coarse marginals on the full and supported alphabets. -/
theorem supported_marginal [Fintype A] (supported : A → Prop) (profile : A → ℕ)
    (support : ∀ symbol, ¬supported symbol → profile symbol = 0)
    (representative : TypedWord (P := P) profile) (index : A → B) :
    marginalProfile (fun symbol : {a // supported a} => profile symbol.val) (fun symbol => index symbol.val) =
      marginalProfile profile index := by
  let restricted := supportedTypeEquiv supported profile support representative
  have first := hasType_projected _ (fun symbol : {a // supported a} => index symbol.val)
    restricted.val restricted.property
  have second := hasType_projected profile index representative.val representative.property
  funext symbol
  exact (first symbol).symm.trans (second symbol)

end
end MatrixBounds.Empirical
