module

public import CWPairing

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Construct the actual labelled child pairing from an exact split word.
Complementary symmetry gives two copies of every prescribed split count. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P]

/-- Counts add over separately labelled left and right position sets. -/
theorem count_sum {Q : Type*} [Fintype Q] (left : P → B) (right : Q → B) (symbol : B) :
    count (Sum.elim left right) symbol = count left symbol + count right symbol := by
  unfold count
  rw [Nat.card_congr Equiv.subtypeSum]
  simp only [Nat.card_eq_fintype_card, Fintype.card_sum, Sum.elim_inl, Sum.elim_inr]

/-- A symmetric split profile contains twice its multiplicity among the two child slots. -/
theorem complementary_child_count (complement : B ≃ B) (profile : B → ℕ)
    (symmetric : ∀ symbol, profile (complement.symm symbol) = profile symbol)
    (word : TypedWord (P := P) profile) (symbol : B) :
    count (Sum.elim word.val (fun parent => complement (word.val parent))) symbol = 2*profile symbol := by
  rw [count_sum, count_map_equiv, word.property, word.property, symmetric, two_mul]

/-- Enumerate every child slot bearing one specified type using its exact profile count. -/
def labelFiber (label : P ⊕ P → B) (profile : B → ℕ)
    (counts : ∀ symbol, count label symbol = profile symbol) (symbol : B) :
    Fin (profile symbol) ≃ {slot // label slot = symbol} :=
  Fintype.equivOfCardEq (by simpa only [Fintype.card_fin, count, Nat.card_eq_fintype_card] using (counts symbol).symm)

/-- Exact child counts supply a bijection between typed pools and all left/right parent positions. -/
def pairingOfCounts (label : P ⊕ P → B) (profile : B → ℕ)
    (counts : ∀ symbol, count label symbol = profile symbol) :
    Tensor.CW.Pairing (fun symbol => Fin (profile symbol)) P :=
  (Equiv.sigmaCongrRight (labelFiber label profile counts)).trans (Equiv.sigmaFiberEquiv label)

/-- The constructed pairing respects the label of every pool and loses no parent slots. -/
theorem pairingOfCounts_label (label : P ⊕ P → B) (profile : B → ℕ)
    (counts : ∀ symbol, count label symbol = profile symbol) (slot : (symbol : B) × Fin (profile symbol)) :
    label (pairingOfCounts label profile counts slot) = slot.1 := by
  exact (labelFiber label profile counts slot.1 slot.2).property

/-- A prescribed split word gives an explicit child regrouping with multiplicities twice its profile. -/
def complementaryPairing (complement : B ≃ B) (profile : B → ℕ)
    (symmetric : ∀ symbol, profile (complement.symm symbol) = profile symbol)
    (word : TypedWord (P := P) profile) : Tensor.CW.Pairing (fun symbol => Fin (2*profile symbol)) P :=
  pairingOfCounts (Sum.elim word.val (fun parent => complement (word.val parent)))
    (fun symbol => 2*profile symbol) (complementary_child_count complement profile symmetric word)

/-- The left child of each parent receives precisely the prescribed split label. -/
theorem complementaryPairing_left (complement : B ≃ B) (profile : B → ℕ)
    (symmetric : ∀ symbol, profile (complement.symm symbol) = profile symbol)
    (word : TypedWord (P := P) profile) (parent : P) :
    ((complementaryPairing complement profile symmetric word).left parent).1 = word.val parent := by
  have labels := pairingOfCounts_label
    (Sum.elim word.val (fun p => complement (word.val p))) (fun symbol => 2*profile symbol)
    (complementary_child_count complement profile symmetric word)
    ((complementaryPairing complement profile symmetric word).left parent)
  simpa only [complementaryPairing, Tensor.CW.Pairing.left, Equiv.apply_symm_apply, Sum.elim_inl] using labels.symm

/-- The right child receives the complementary split label, retaining its own pool position. -/
theorem complementaryPairing_right (complement : B ≃ B) (profile : B → ℕ)
    (symmetric : ∀ symbol, profile (complement.symm symbol) = profile symbol)
    (word : TypedWord (P := P) profile) (parent : P) :
    ((complementaryPairing complement profile symmetric word).right parent).1 = complement (word.val parent) := by
  have labels := pairingOfCounts_label
    (Sum.elim word.val (fun p => complement (word.val p))) (fun symbol => 2*profile symbol)
    (complementary_child_count complement profile symmetric word)
    ((complementaryPairing complement profile symmetric word).right parent)
  simpa only [complementaryPairing, Tensor.CW.Pairing.right, Equiv.apply_symm_apply, Sum.elim_inr] using labels.symm

end
end MatrixBounds.Empirical
