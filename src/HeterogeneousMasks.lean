module

public import HeterogeneousInterface
public import AcceptedRestrictions

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! Independent variable masks commute with finite heterogeneous products. -/
namespace MatrixBounds.Interface

open Tensor Empirical
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {T K : Type*} [Fintype T] [CommSemiring K] {X Y Z : T → Type*}

/-- Masking each factor is exactly the global mask requiring every factor's acceptance condition. -/
theorem heterogeneous_accepted (family : ∀ type, Coeff K (X type) (Y type) (Z type))
    (acceptX : ∀ type, X type → Prop) (acceptY : ∀ type, Y type → Prop) (acceptZ : ∀ type, Z type → Prop) :
    heterogeneous (fun type => acceptedTensor (family type) id id id (acceptX type) (acceptY type) (acceptZ type)) =
      acceptedTensor (heterogeneous family) id id id
        (fun entries => ∀ type, acceptX type (entries type))
        (fun entries => ∀ type, acceptY type (entries type))
        (fun entries => ∀ type, acceptZ type (entries type)) := by
  funext x y z
  simp only [heterogeneous, acceptedTensor, id_eq]
  by_cases accepted : (∀ type, acceptX type (x type)) ∧
      (∀ type, acceptY type (y type)) ∧ (∀ type, acceptZ type (z type))
  · rw [if_pos accepted]
    apply Finset.prod_congr rfl
    intro type _
    exact if_pos ⟨accepted.1 type, accepted.2.1 type, accepted.2.2 type⟩
  · rw [if_neg accepted]
    have excluded : ∃ type, ¬(acceptX type (x type) ∧ acceptY type (y type) ∧ acceptZ type (z type)) := by
      by_contra none
      simp only [not_exists, not_not] at none
      exact accepted ⟨fun type => (none type).1, fun type => (none type).2.1, fun type => (none type).2.2⟩
    obtain ⟨type, excluded⟩ := excluded
    exact Finset.prod_eq_zero (Finset.mem_univ type) (if_neg excluded)

end
end MatrixBounds.Interface
