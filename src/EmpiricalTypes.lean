import SymmetryCounts
import Mathlib.Logic.Equiv.Basic
import Mathlib.Data.Fintype.Perm

/-! Exact empirical types and their permutation symmetry. Counts are natural
numbers, so all type-integrality requirements are explicit. -/
namespace MatrixBounds.Empirical

noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P]

/-- Number of positions carrying a specified symbol. -/
def count (word : P → B) (symbol : B) : ℕ := Nat.card {p // word p = symbol}

/-- A word has an exact empirical profile when each symbol occurs the prescribed number of times. -/
def HasType (profile : B → ℕ) (word : P → B) : Prop := ∀ symbol, count word symbol = profile symbol

/-- Exact-type words, with the empirical constraint stored as a proof. -/
abbrev TypedWord (profile : B → ℕ) := {word : P → B // HasType profile word}

/-- Reorder positions by a permutation, using its inverse so composition is a left action. -/
def reorder (permutation : Equiv.Perm P) (word : P → B) : P → B :=
  fun p => word (permutation.symm p)

omit [Fintype P] in
/-- Reordering preserves every symbol count. -/
theorem count_reorder (permutation : Equiv.Perm P) (word : P → B) (symbol : B) :
    count (reorder permutation word) symbol = count word symbol := by
  let equiv : {p // reorder permutation word p = symbol} ≃ {p // word p = symbol} := {
    toFun p := ⟨permutation.symm p.val, p.property⟩
    invFun p := ⟨permutation p.val, by simpa [reorder] using p.property⟩
    left_inv p := by apply Subtype.ext; simp
    right_inv p := by apply Subtype.ext; simp }
  exact Nat.card_congr equiv

/-- Equal empirical profiles are sufficient for a permutation carrying one word to another. -/
theorem same_type_permutation (left right : P → B)
    (counts : ∀ symbol, count left symbol = count right symbol) :
    ∃ permutation : Equiv.Perm P, reorder permutation left = right := by
  classical
  let fibers : ∀ b, {p // left p = b} ≃ {p // right p = b} := fun b =>
    Fintype.equivOfCardEq (by simpa only [count, Nat.card_eq_fintype_card] using counts b)
  let permutation := Equiv.ofFiberEquiv fibers
  refine ⟨permutation, ?_⟩
  funext p
  have h := Equiv.ofFiberEquiv_map fibers (permutation.symm p)
  change right (permutation (permutation.symm p)) = left (permutation.symm p) at h
  simpa only [Equiv.apply_symm_apply] using h.symm

/-- Permuting positions acts on exact-type words without changing their profile. -/
instance typedWordAction (profile : B → ℕ) : MulAction (Equiv.Perm P) (TypedWord (P := P) profile) where
  smul permutation word := ⟨reorder permutation word.val, fun symbol =>
    (count_reorder permutation word.val symbol).trans (word.property symbol)⟩
  one_smul word := by apply Subtype.ext; rfl
  mul_smul left right word := by apply Subtype.ext; rfl

/-- The position-permutation action is transitive on every nonempty exact empirical type. -/
instance typedWordTransitive (profile : B → ℕ) :
    MulAction.IsPretransitive (Equiv.Perm P) (TypedWord (P := P) profile) where
  exists_smul_eq left right := by
    obtain ⟨permutation, h⟩ := same_type_permutation left.val right.val
      (fun symbol => (left.property symbol).trans (right.property symbol).symm)
    exact ⟨permutation, Subtype.ext h⟩

/-- Every exact profile uses precisely the available number of positions. -/
theorem profile_total [Fintype B] (profile : B → ℕ) (word : TypedWord (P := P) profile) :
    ∑ symbol, profile symbol = Fintype.card P := by
  classical
  calc
    _ = ∑ symbol, Fintype.card {p // word.val p = symbol} := by
      apply Finset.sum_congr rfl
      intro symbol _
      rw [← word.property symbol]
      exact Nat.card_eq_fintype_card
    _ = _ := Fintype.card_sigma.symm.trans (Fintype.card_congr (Equiv.sigmaFiberEquiv word.val))

end
end MatrixBounds.Empirical
