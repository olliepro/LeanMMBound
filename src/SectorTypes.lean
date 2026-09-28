import TypeEntropy

/-! Exact counting of pooled and separately prescribed child-type sectors.
The sectors remain labelled, and their position sets need not have equal sizes. -/
namespace MatrixBounds.Empirical

open scoped BigOperators
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
local instance (A : Type*) : DecidableEq A := Classical.decEq A
variable {Sector P B : Type*} {Positions : Sector → Type*}

/-- Words whose fixed, separately labelled position sectors have prescribed exact profiles. -/
abbrev SectorWords (positions : ((s : Sector) × Positions s) ≃ P) (profile : Sector → B → ℕ) :=
  {word : P → B // ∀ sector, HasType (profile sector) (fun p => word (positions ⟨sector, p⟩))}

/-- Restricting a word to all its sectors is a bijection with independently typed sector words. -/
def sectorWordsEquiv (positions : ((s : Sector) × Positions s) ≃ P) (profile : Sector → B → ℕ) :
    SectorWords positions profile ≃ (∀ sector, TypedWord (P := Positions sector) (profile sector)) where
  toFun word sector := ⟨fun p => word.val (positions ⟨sector, p⟩), word.property sector⟩
  invFun family := ⟨fun p => (family (positions.symm p).1).val (positions.symm p).2, by
    intro sector
    have same : (fun p => (family (positions.symm (positions ⟨sector, p⟩)).1).val
        (positions.symm (positions ⟨sector, p⟩)).2) = (family sector).val := by
      funext p
      exact congrArg (fun a : (s : Sector) × Positions s => (family a.1).val a.2)
        (positions.symm_apply_apply ⟨sector, p⟩)
    change HasType (profile sector) _
    rw [same]
    exact (family sector).property⟩
  left_inv word := by
    apply Subtype.ext
    funext p
    exact congrArg word.val (positions.apply_symm_apply p)
  right_inv family := by
    funext sector
    apply Subtype.ext
    funext p
    exact congrArg (fun a : (s : Sector) × Positions s => (family a.1).val a.2)
      (positions.symm_apply_apply ⟨sector, p⟩)

/-- Pooled exact-type compatibility constraints have exactly the product of their sector counts. -/
theorem sector_words_card [Fintype Sector] [Fintype B] [∀ s, Fintype (Positions s)]
    (positions : ((s : Sector) × Positions s) ≃ P) (profile : Sector → B → ℕ) :
    Nat.card (SectorWords positions profile) = ∏ sector, Fintype.card (TypedWord (P := Positions sector) (profile sector)) := by
  rw [Nat.card_congr (sectorWordsEquiv positions profile)]
  simp only [Nat.card_eq_fintype_card, Fintype.card_pi]

/-- Sector compatibility counts depend only on sector sizes and types, not on their placement. -/
theorem sector_card_independent_of_placement {Q : Type*}
    (left : ((s : Sector) × Positions s) ≃ P) (right : ((s : Sector) × Positions s) ≃ Q)
    (profile : Sector → B → ℕ) :
    Nat.card (SectorWords left profile) = Nat.card (SectorWords right profile) := by
  exact Nat.card_congr ((sectorWordsEquiv left profile).trans (sectorWordsEquiv right profile).symm)

/-- Ignoring any additional parent constraints can only increase the number of compatible words. -/
theorem restricted_sector_card_le [Fintype P] [Fintype B]
    (positions : ((s : Sector) × Positions s) ≃ P) (profile : Sector → B → ℕ)
    (parentAccepted : (P → B) → Prop) :
    Nat.card {word : SectorWords positions profile // parentAccepted word.val} ≤
      Nat.card (SectorWords positions profile) := by
  simp only [Nat.card_eq_fintype_card]
  exact Fintype.card_subtype_le _

/-- The compatibility sector count has its summed entropy bound with explicit logarithmic errors. -/
theorem sector_entropy_bounds [Fintype Sector] [Fintype B] [∀ s, Fintype (Positions s)]
    (positions : ((s : Sector) × Positions s) ≃ P) (profile : Sector → B → ℕ)
    (representative : ∀ sector, TypedWord (P := Positions sector) (profile sector))
    (positive : ∀ sector, 0 < Fintype.card (Positions sector)) :
    (∑ s, (Fintype.card (Positions s) : ℝ)*Entropy.entropy (fun b => (profile s b : ℝ)/Fintype.card (Positions s))) -
      ∑ s, (Fintype.card B : ℝ)*(Real.log ((Fintype.card (Positions s) : ℝ)+1)+1) ≤
        Real.log (Nat.card (SectorWords positions profile) : ℝ) ∧
    Real.log (Nat.card (SectorWords positions profile) : ℝ) ≤
      (∑ s, (Fintype.card (Positions s) : ℝ)*Entropy.entropy (fun b => (profile s b : ℝ)/Fintype.card (Positions s))) +
        ∑ s, (Real.log ((Fintype.card (Positions s) : ℝ)+1)+1) := by
  rw [Nat.card_congr (sectorWordsEquiv positions profile), Nat.card_eq_fintype_card]
  exact heterogeneous_type_entropy_bounds profile representative positive

end
end MatrixBounds.Empirical
