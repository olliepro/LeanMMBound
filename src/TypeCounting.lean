import EmpiricalTypes
import Mathlib.GroupTheory.Perm.DomMulAct
import Mathlib.Data.Nat.Choose.Multinomial

/-! Exact multinomial counting of empirical-type words. The proof uses the
transitive permutation action and computes its stabilizer, rather than assuming
an entropy approximation. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P B : Type*} [Fintype P] [Fintype B] [DecidableEq P] [DecidableEq B]

/-- Permutations fixing one exact-type word are counted by the product of fiber factorials. -/
theorem fixed_word_count (profile : B → ℕ) (word : TypedWord (P := P) profile) :
    MatrixBounds.Symmetry.misses (G := Equiv.Perm P)
      (fun other : TypedWord (P := P) profile => other = word) word =
      ∏ b, (profile b).factorial := by
  let equiv : {g : Equiv.Perm P // g • word = word} ≃
      {g : Equiv.Perm P // word.val ∘ g = word.val} := {
    toFun g := ⟨g.val.symm, congrArg Subtype.val g.property⟩
    invFun g := ⟨g.val.symm, by
      apply Subtype.ext
      simpa [reorder] using g.property⟩
    left_inv g := by apply Subtype.ext; exact Equiv.symm_symm g.val
    right_inv g := by apply Subtype.ext; exact Equiv.symm_symm g.val }
  rw [MatrixBounds.Symmetry.misses, Nat.card_congr equiv, Nat.card_eq_fintype_card,
    DomMulAct.stabilizer_card]
  apply Finset.prod_congr rfl
  intro b _
  congr 1
  exact (Nat.card_eq_fintype_card.symm.trans (word.property b))

/-- The exact number of words times their stabilizer size equals the number of position permutations. -/
theorem type_count_identity (profile : B → ℕ) (word : TypedWord (P := P) profile) :
    Fintype.card (TypedWord (P := P) profile) * (∏ b, (profile b).factorial) =
      (Fintype.card P).factorial := by
  have identity := MatrixBounds.Symmetry.misses_identity (G := Equiv.Perm P)
    (fun other : TypedWord (P := P) profile => other = word) word
  rw [fixed_word_count] at identity
  simpa only [Nat.card_eq_fintype_card, Fintype.card_subtype_eq, mul_one,
    Fintype.card_perm] using identity

/-- A feasible exact profile has precisely its multinomial number of words. -/
theorem type_count_multinomial (profile : B → ℕ) (word : TypedWord (P := P) profile) :
    Fintype.card (TypedWord (P := P) profile) = Nat.multinomial Finset.univ profile := by
  have identity := type_count_identity profile word
  have positive : 0 < ∏ b, (profile b).factorial :=
    Finset.prod_pos (fun b _ => Nat.factorial_pos (profile b))
  rw [Nat.multinomial, profile_total profile word, ← identity, Nat.mul_div_cancel _ positive]

omit [Fintype P] [DecidableEq P] [DecidableEq B] in
/-- Every nonnegative integer profile is realized on a position set of its total size. -/
theorem profile_feasible (profile : B → ℕ) :
    Nonempty (TypedWord (P := Fin (∑ b, profile b)) profile) := by
  let positions : Fin (∑ b, profile b) ≃ (b : B) × Fin (profile b) :=
    Fintype.equivOfCardEq (by simp)
  refine ⟨⟨fun p => (positions p).1, ?_⟩⟩
  intro b
  let fibers : {p : Fin (∑ b, profile b) // (positions p).1 = b} ≃ Fin (profile b) :=
    (Equiv.subtypeEquiv positions (fun _ => Iff.rfl)).trans (Equiv.sigmaSubtype b)
  simpa only [count, Nat.card_fin] using Nat.card_congr fibers

end
end MatrixBounds.Empirical
