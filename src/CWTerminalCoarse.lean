module

public import CWTerminalAlphabet
public import RegularFibers

@[expose] public section
set_option backward.isDefEq.respectTransparency false
set_option backward.isDefEq.respectTransparency.types false
set_option backward.dsimp.instances true

/-! The terminal full marginal graph has no extra joint types: its complete
edge count equals the prescribed multinomial count, even at endpoint laws. -/
namespace MatrixBounds.Tensor.CW.Terminal

open Empirical Numeric
noncomputable section
local instance (p : Prop) : Decidable p := Classical.propDecidable p
variable {P : Type*} [Fintype P]

/-- Every terminal word with the prescribed three marginals has exactly the prescribed joint type. -/
theorem terminal_marginals_force_type (profile : Symbol → ℕ)
    (word : CoarseWords (P := P) parent 2
      (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex)) :
    HasType profile word.val := by
  have joint := joint_of_marginals (count word.val) profile
    (fun value => by
      convert (projected_count word.val splitXIndex value).symm.trans (word.property.1 value) using 1 <;>
        unfold marginalProfile <;> apply Finset.sum_congr rfl <;> intro child _ <;> split_ifs <;> rfl)
    (fun value => by
      convert (projected_count word.val splitYIndex value).symm.trans (word.property.2.1 value) using 1 <;>
        unfold marginalProfile <;> apply Finset.sum_congr rfl <;> intro child _ <;> split_ifs <;> rfl)
    (fun value => by
      convert (projected_count word.val splitZIndex value).symm.trans (word.property.2.2 value) using 1 <;>
        unfold marginalProfile <;> apply Finset.sum_congr rfl <;> intro child _ <;> split_ifs <;> rfl)
  exact congrFun joint

/-- The complete terminal marginal graph is the actual exact joint type, by an explicit word-preserving equivalence. -/
def terminalGraphEquiv (profile : Symbol → ℕ) :
    CoarseWords (P := P) parent 2
      (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex) ≃
      TypedWord (P := P) profile where
  toFun word := ⟨word.val, terminal_marginals_force_type profile word⟩
  invFun word := ⟨word.val, hasType_projected profile splitXIndex word.val word.property,
    hasType_projected profile splitYIndex word.val word.property, hasType_projected profile splitZIndex word.val word.property⟩
  left_inv := fun _ => rfl
  right_inv := fun _ => rfl

/-- There is no terminal maximum-entropy competitor penalty: the two finite counts are exactly equal. -/
theorem terminal_graph_card (profile : Symbol → ℕ) :
    Nat.card (CoarseWords (P := P) parent 2
      (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex)) =
      Nat.card (TypedWord (P := P) profile) := Nat.card_congr (terminalGraphEquiv profile)

/-- Every coarse-X fiber has the exact terminal degree identity with the prescribed joint count. -/
theorem terminal_coarse_degree_identity (profile : Symbol → ℕ)
    (block : TypedWord (P := P) (marginalProfile profile splitXIndex)) :
    Nat.card (TypedWord (P := P) (marginalProfile profile splitXIndex)) *
      Nat.card {word : CoarseWords (P := P) parent 2
        (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex) //
        marginalX splitXIndex splitYIndex splitZIndex
          (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex) word = block} =
      Nat.card (TypedWord (P := P) profile) := by
  rw [← terminal_graph_card profile]
  simpa only [Nat.card_eq_fintype_card] using marginalX_degree_identity splitXIndex splitYIndex splitZIndex
    (marginalProfile profile splitXIndex) (marginalProfile profile splitYIndex) (marginalProfile profile splitZIndex) block

end
end MatrixBounds.Tensor.CW.Terminal
