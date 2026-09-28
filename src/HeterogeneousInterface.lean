import ExactInterface
import Mathlib.Algebra.Group.Action.Pi

/-! Products of interfaces with different alphabets and position sets. This is
where factors of different recursion levels can be represented without identifying
their types or silently merging their empirical restrictions. -/
namespace MatrixBounds.Interface

open Tensor Empirical
open scoped BigOperators
noncomputable section
variable {T K : Type*} [Fintype T] [CommSemiring K]

/-- A finite heterogeneous product retains each factor's own axis alphabets. -/
def heterogeneous {X Y Z : T → Type*} (family : ∀ t, Coeff K (X t) (Y t) (Z t)) :
    Coeff K (∀ t, X t) (∀ t, Y t) (∀ t, Z t) :=
  fun x y z => ∏ t, family t (x t) (y t) (z t)

/-- Independent factor automorphisms preserve the heterogeneous tensor product. -/
theorem heterogeneous_invariant {G X Y Z : T → Type*}
    [∀ t, Group (G t)] [∀ t, MulAction (G t) (X t)]
    [∀ t, MulAction (G t) (Y t)] [∀ t, MulAction (G t) (Z t)]
    (family : ∀ t, Coeff K (X t) (Y t) (Z t))
    (preserves : ∀ t (g : G t) x y z, family t (g • x) (g • y) (g • z) = family t x y z)
    (g : ∀ t, G t) (x : ∀ t, X t) (y : ∀ t, Y t) (z : ∀ t, Z t) :
    heterogeneous family (g • x) (g • y) (g • z) = heterogeneous family x y z := by
  apply Finset.prod_congr rfl
  intro t _
  exact preserves t (g t) (x t) (y t) (z t)

omit [Fintype T] [CommSemiring K] in
/-- Independent transitive actions remain transitive on the product of their part sets. -/
theorem product_action_transitive {G B : T → Type*} [∀ t, Group (G t)]
    [∀ t, MulAction (G t) (B t)] [∀ t, MulAction.IsPretransitive (G t) (B t)] :
    MulAction.IsPretransitive (∀ t, G t) (∀ t, B t) := by
  constructor
  intro left right
  choose g hg using (fun t => MulAction.exists_smul_eq (G t) (left t) (right t))
  exact ⟨g, funext hg⟩

omit [Fintype T] [CommSemiring K] in
/-- Factorwise equivariant part maps give an equivariant part map for the whole product. -/
theorem product_parts_equivariant {G X B : T → Type*} [∀ t, Group (G t)]
    [∀ t, MulAction (G t) (X t)] [∀ t, MulAction (G t) (B t)]
    (part : ∀ t, X t → B t) (equivariant : ∀ t (g : G t) x, part t (g • x) = g • part t x)
    (g : ∀ t, G t) (x : ∀ t, X t) :
    (fun t => part t ((g • x) t)) = g • (fun t => part t (x t)) := by
  funext t
  exact equivariant t (g t) (x t)

end
end MatrixBounds.Interface
